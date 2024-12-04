package mx.collections
{
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.xml.XMLNode;
   import mx.collections.errors.ItemPendingError;
   import mx.core.mx_internal;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.utils.UIDUtil;
   
   use namespace mx_internal;
   
   public class GroupingCollection2 extends HierarchicalData implements IGroupingCollection2
   {
      mx_internal static const VERSION:String = "4.0.0.14159";
      
      private var async:Boolean = false;
      
      private var dispatchCollectionEvents:Boolean = false;
      
      private var newCollection:ArrayCollection;
      
      private var _sourceCol:ICollectionView;
      
      private var objectSummaryMap:Dictionary;
      
      private var oldSort:Sort;
      
      private var prepared:Boolean = false;
      
      private var flatView:ICollectionView;
      
      private var flatCursor:IViewCursor;
      
      private var hView:ICollectionView;
      
      private var currentPosition:CursorBookmark = CursorBookmark.FIRST;
      
      private var gf:Array;
      
      private var fieldCount:int;
      
      private var currentData:Object;
      
      private var currentGroups:Array;
      
      private var currentGroupLabels:Array;
      
      private var currentIndices:Array;
      
      private var itemIndex:int;
      
      private var childrenArray:Array;
      
      private var summaryPresent:Boolean;
      
      protected var timer:Timer;
      
      protected var parentMap:Object;
      
      private var summariesTracker:Dictionary;
      
      private var summaryFields:Array;
      
      private var _grouping:Grouping;
      
      public var summaries:Array;
      
      public function GroupingCollection2()
      {
         super();
         this.newCollection = new ArrayCollection();
         super.source = this.newCollection;
         this.objectSummaryMap = new Dictionary(false);
         this.parentMap = {};
      }
      
      public function get grouping() : Grouping
      {
         return this._grouping;
      }
      
      public function set grouping(param1:Grouping) : void
      {
         this._grouping = param1;
      }
      
      override public function get source() : Object
      {
         return this._sourceCol;
      }
      
      override public function set source(param1:Object) : void
      {
         if(this._sourceCol)
         {
            this._sourceCol.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this.collectionChangeHandler);
         }
         if(!param1)
         {
            this._sourceCol = null;
            return;
         }
         this._sourceCol = this.getCollection(param1);
         if(this._sourceCol is ICollectionView)
         {
            this._sourceCol.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.collectionChangeHandler);
         }
      }
      
      override public function getChildren(param1:Object) : Object
      {
         var _loc3_:String = null;
         var _loc4_:IViewCursor = null;
         var _loc2_:Object = super.getChildren(param1);
         if(_loc2_ != null)
         {
            if(!(_loc2_ is ICollectionView))
            {
               return null;
            }
            _loc4_ = ICollectionView(_loc2_).createCursor();
            while(!_loc4_.afterLast)
            {
               _loc3_ = UIDUtil.getUID(_loc4_.current);
               this.parentMap[_loc3_] = param1;
               _loc4_.moveNext();
            }
         }
         return _loc2_;
      }
      
      override public function getRoot() : Object
      {
         return super.source;
      }
      
      public function refresh(param1:Boolean = false, param2:Boolean = false) : Boolean
      {
         var _loc3_:CollectionEvent = null;
         var _loc4_:Boolean = false;
         this.async = param1;
         this.dispatchCollectionEvents = param1 ? true : param2;
         if(!this.grouping || this.grouping.fields.length < 1)
         {
            super.source = this.source;
            _loc3_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
            _loc3_.kind = CollectionEventKind.RESET;
            dispatchEvent(_loc3_);
            return true;
         }
         super.source = this.newCollection;
         _loc3_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
         _loc3_.kind = CollectionEventKind.RESET;
         dispatchEvent(_loc3_);
         this.parentMap = {};
         this.objectSummaryMap = new Dictionary(false);
         this.summariesTracker = null;
         this.summaryPresent = false;
         this.prepareSummaryFields();
         if(Boolean(this.source) && Boolean(this.grouping))
         {
            _loc4_ = this.makeGroupedCollection();
         }
         return _loc4_;
      }
      
      public function cancelRefresh() : void
      {
         if(this.timer)
         {
            this.timer.stop();
            this.timer = null;
            this.cleanUp();
         }
      }
      
      private function addItem(param1:Object, param2:int = 0) : void
      {
         var _loc6_:Object = null;
         var _loc3_:ICollectionView = super.source as ICollectionView;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         while(_loc5_ < this.grouping.fields.length)
         {
            _loc6_ = this.checkForParentExistence(_loc3_,param1,_loc5_);
            if(!_loc6_)
            {
               break;
            }
            _loc4_ = _loc6_;
            if(_loc4_)
            {
               _loc3_ = this.getChildren(_loc4_) as ICollectionView;
               _loc5_++;
            }
         }
         if(_loc4_)
         {
            _loc3_ = this.getChildren(_loc4_) as ICollectionView;
            if(_loc5_ <= this.grouping.fields.length - 1)
            {
               this.createGroupsAndInsertItem(_loc3_,param1,_loc5_);
               this.updateSummary(param1);
               return;
            }
            if(_loc3_ is IList)
            {
               IList(_loc3_).addItem(param1);
               this.updateParentMap(_loc4_,param1);
               this.updateSummary(param1);
            }
         }
         else
         {
            this.createGroupsAndInsertItem(super.source as ICollectionView,param1);
            this.updateSummary(param1);
         }
      }
      
      private function checkForParentExistence(param1:ICollectionView, param2:Object, param3:int) : Object
      {
         var _loc6_:Object = null;
         var _loc4_:IViewCursor = param1.createCursor();
         var _loc5_:String = this.getDataLabel(param2,this.grouping.fields[param3]);
         while(!_loc4_.afterLast)
         {
            _loc6_ = _loc4_.current;
            if(Boolean(_loc6_.hasOwnProperty(this.grouping.label)) && _loc6_[this.grouping.label] == _loc5_)
            {
               return _loc6_;
            }
            _loc4_.moveNext();
         }
         return null;
      }
      
      private function createGroupsAndInsertItem(param1:ICollectionView, param2:Object, param3:int = 0) : void
      {
         var _loc4_:Object = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:Object = null;
         var _loc5_:int = int(this.grouping.fields.length);
         var _loc6_:int = param3;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = this.grouping.fields[_loc6_].name;
            _loc8_ = this.getDataLabel(param2,this.grouping.fields[_loc6_]);
            if(!_loc8_)
            {
               return;
            }
            if(this.grouping.fields[_loc6_].groupingObjectFunction != null)
            {
               _loc9_ = this.grouping.fields[_loc6_].groupingObjectFunction(_loc8_);
            }
            else if(this.grouping.groupingObjectFunction != null)
            {
               _loc9_ = this.grouping.groupingObjectFunction(_loc8_);
            }
            else
            {
               _loc9_ = {};
            }
            _loc9_[childrenField] = new ArrayCollection();
            _loc9_[this.grouping.label] = _loc8_;
            if(param1 is IList)
            {
               IList(param1).addItem(_loc9_);
               _loc4_ = _loc4_ != null ? _loc4_ : this.getParent(param1.createCursor().current);
               this.updateParentMap(_loc4_,_loc9_);
               param1 = this.getChildren(_loc9_) as ICollectionView;
               _loc4_ = _loc9_;
               if(_loc6_ == _loc5_ - 1)
               {
                  IList(param1).addItem(param2);
                  this.updateParentMap(_loc9_,param2);
                  break;
               }
            }
            _loc6_++;
         }
      }
      
      private function getCollection(param1:Object) : ICollectionView
      {
         var _loc2_:XMLList = null;
         var _loc3_:Array = null;
         if(typeof param1 == "string")
         {
            param1 = new XML(param1);
         }
         else if(param1 is XMLNode)
         {
            param1 = new XML(XMLNode(param1).toString());
         }
         else if(param1 is XMLList)
         {
            param1 = new XMLListCollection(param1 as XMLList);
         }
         if(param1 is XML)
         {
            _loc2_ = new XMLList();
            _loc2_ += param1;
            return new XMLListCollection(_loc2_);
         }
         if(param1 is ICollectionView)
         {
            return ICollectionView(param1);
         }
         if(param1 is Array)
         {
            return new ArrayCollection(param1 as Array);
         }
         if(param1 is Object)
         {
            _loc3_ = [];
            _loc3_.push(param1);
            return new ArrayCollection(_loc3_);
         }
         return new ArrayCollection();
      }
      
      private function getDataLabel(param1:Object, param2:GroupingField) : String
      {
         if(param2.groupingFunction != null)
         {
            return param2.groupingFunction(param1,param2);
         }
         return !!param1.hasOwnProperty(param2.name) ? param1[param2.name] : "Not Available";
      }
      
      protected function getParent(param1:Object) : *
      {
         var _loc2_:String = UIDUtil.getUID(param1);
         if(this.parentMap.hasOwnProperty(_loc2_))
         {
            return this.parentMap[_loc2_];
         }
         return undefined;
      }
      
      private function generateRootSummaries(param1:Boolean = false) : void
      {
         var _loc2_:ICollectionView = super.source as ICollectionView;
         this.getSummaries(_loc2_,-1);
      }
      
      private function getSummariesForRow(param1:Object, param2:ICollectionView, param3:int) : void
      {
         var _loc11_:SummaryField2 = null;
         var _loc12_:ISummaryCalculator = null;
         var _loc13_:Number = NaN;
         var _loc4_:HierarchicalData = new HierarchicalData(param2);
         _loc4_.childrenField = this.childrenField;
         var _loc5_:ICollectionView = new HierarchicalCollectionView(_loc4_,{});
         var _loc6_:IViewCursor = new LeafNodeCursor(HierarchicalCollectionView(_loc5_),_loc5_,_loc4_);
         var _loc7_:int = int(this.summaryFields.length);
         var _loc8_:int = 0;
         var _loc9_:DefaultSummaryCalculator = new DefaultSummaryCalculator();
         var _loc10_:Dictionary = new Dictionary(false);
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc11_ = this.summaryFields[_loc8_];
            if(!(_loc11_.summaryOperation is String) && _loc11_.summaryOperation is ISummaryCalculator)
            {
               _loc12_ = ISummaryCalculator(_loc11_.summaryOperation);
            }
            else
            {
               _loc12_ = _loc9_;
            }
            _loc10_[_loc11_] = _loc12_.summaryCalculationBegin(_loc11_);
            _loc8_++;
         }
         while(!_loc6_.afterLast)
         {
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc11_ = this.summaryFields[_loc8_];
               if(!(_loc11_.summaryOperation is String) && _loc11_.summaryOperation is ISummaryCalculator)
               {
                  _loc12_ = ISummaryCalculator(_loc11_.summaryOperation);
               }
               else
               {
                  _loc12_ = _loc9_;
               }
               _loc12_.calculateSummary(_loc10_[_loc11_],_loc11_,_loc6_.current);
               _loc8_++;
            }
            _loc6_.moveNext();
         }
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc13_ = 0;
            _loc11_ = this.summaryFields[_loc8_];
            if(!(_loc11_.summaryOperation is String) && _loc11_.summaryOperation is ISummaryCalculator)
            {
               _loc12_ = ISummaryCalculator(_loc11_.summaryOperation);
            }
            else
            {
               _loc12_ = _loc9_;
            }
            _loc13_ = _loc12_.returnSummary(_loc10_[_loc11_],_loc11_);
            this.populateSummary(param1,_loc11_,_loc10_[_loc11_],_loc13_);
            _loc8_++;
         }
      }
      
      private function populateSummary(param1:Object, param2:SummaryField2, param3:Object, param4:Number) : void
      {
         var _loc5_:String = param2.summaryOperation.toString();
         if(this.summariesTracker == null)
         {
            this.summariesTracker = new Dictionary(false);
         }
         if(this.summariesTracker[param1] == undefined)
         {
            this.summariesTracker[param1] = new Dictionary(false);
         }
         if(this.summariesTracker[param1][_loc5_] == undefined)
         {
            this.summariesTracker[param1][_loc5_] = new Dictionary(false);
         }
         if(this.summariesTracker[param1][_loc5_][param2.dataField] == undefined)
         {
            this.summariesTracker[param1][_loc5_][param2.dataField] = new Dictionary(false);
         }
         this.summariesTracker[param1][_loc5_][param2.dataField] = {
            "summaryObject":param3,
            "value":param4
         };
      }
      
      private function getSummary(param1:Object, param2:SummaryField2) : Object
      {
         var _loc3_:String = param2.summaryOperation.toString();
         if(this.summariesTracker == null || this.summariesTracker[param1] == undefined || this.summariesTracker[param1][_loc3_] == undefined || this.summariesTracker[param1][_loc3_][param2.dataField] == undefined)
         {
            return null;
         }
         return this.summariesTracker[param1][_loc3_][param2.dataField];
      }
      
      private function getSummaries(param1:Object, param2:int) : void
      {
         var _loc4_:IViewCursor = null;
         var _loc5_:Boolean = false;
         var _loc6_:DefaultSummaryCalculator = null;
         var _loc7_:SummaryField2 = null;
         var _loc8_:Dictionary = null;
         var _loc9_:ISummaryCalculator = null;
         var _loc10_:Object = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Object = null;
         var _loc14_:Number = NaN;
         if(param2 > this.grouping.fields.length - 1)
         {
            return;
         }
         var _loc3_:ICollectionView = this.getChildren(param1) as ArrayCollection;
         if(param1 == super.source)
         {
            _loc3_ = param1 as ICollectionView;
         }
         if(!_loc3_ || _loc3_.length == 0)
         {
            return;
         }
         if(param2 == this.grouping.fields.length - 1)
         {
            this.getSummariesForRow(param1,_loc3_,param2);
         }
         else
         {
            _loc4_ = _loc3_.createCursor();
            _loc5_ = true;
            _loc6_ = new DefaultSummaryCalculator();
            _loc8_ = new Dictionary(false);
            while(!_loc4_.afterLast)
            {
               _loc10_ = _loc4_.current;
               if(!(_loc10_ is SummaryObject))
               {
                  _loc11_ = int(this.summaryFields.length);
                  _loc12_ = 0;
                  _loc12_ = 0;
                  while(_loc12_ < _loc11_)
                  {
                     _loc7_ = this.summaryFields[_loc12_];
                     if(!(_loc7_.summaryOperation is String) && _loc7_.summaryOperation is ISummaryCalculator)
                     {
                        _loc9_ = ISummaryCalculator(_loc7_.summaryOperation);
                     }
                     else
                     {
                        _loc9_ = _loc6_;
                     }
                     _loc13_ = this.getSummary(_loc10_,_loc7_);
                     if(_loc5_)
                     {
                        _loc8_[_loc7_] = _loc9_.summaryOfSummaryCalculationBegin(_loc13_["summaryObject"],_loc7_);
                     }
                     else
                     {
                        _loc9_.calculateSummaryOfSummary(_loc8_[_loc7_],_loc13_["summaryObject"],_loc7_);
                     }
                     _loc12_++;
                  }
               }
               _loc5_ = false;
               _loc4_.moveNext();
            }
            if(!_loc5_)
            {
               _loc12_ = 0;
               while(_loc12_ < _loc11_)
               {
                  _loc7_ = this.summaryFields[_loc12_];
                  if(!(_loc7_.summaryOperation is String) && _loc7_.summaryOperation is ISummaryCalculator)
                  {
                     _loc9_ = ISummaryCalculator(_loc7_.summaryOperation);
                  }
                  else
                  {
                     _loc9_ = _loc6_;
                  }
                  _loc14_ = _loc9_.returnSummaryOfSummary(_loc8_[_loc7_],_loc7_);
                  this.populateSummary(param1,_loc7_,_loc8_[_loc7_],_loc14_);
                  _loc12_++;
               }
            }
         }
         if(param2 == -1)
         {
            this.insertSummaries(super.source as ICollectionView,-1,true);
         }
         else
         {
            this.insertSummaries(param1,param2);
         }
      }
      
      private function insertSummaries(param1:Object, param2:int, param3:Boolean = false) : void
      {
         var _loc8_:SummaryRow = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:SummaryField2 = null;
         var _loc12_:Number = NaN;
         var _loc13_:String = null;
         var _loc14_:Object = null;
         var _loc4_:Array = this.summaries;
         if(!param3)
         {
            _loc4_ = this.grouping.fields[param2].summaries;
         }
         if(!_loc4_)
         {
            return;
         }
         var _loc5_:Array = [];
         var _loc6_:int = int(_loc4_.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc8_ = _loc4_[_loc7_];
            _loc5_[_loc7_] = _loc8_.summaryObjectFunction != null ? _loc8_.summaryObjectFunction() : new SummaryObject();
            _loc9_ = int(_loc8_.fields.length);
            _loc10_ = 0;
            while(_loc10_ < _loc9_)
            {
               _loc11_ = _loc8_.fields[_loc10_];
               _loc12_ = 0;
               _loc13_ = !!_loc11_.label ? _loc11_.label : _loc11_.dataField;
               _loc14_ = this.getSummary(param1,_loc11_);
               if(_loc14_ != null)
               {
                  _loc12_ = Number(_loc14_["value"]);
                  _loc5_[_loc7_][_loc13_] = _loc12_;
               }
               _loc10_++;
            }
            if(this.objectSummaryMap[param1] == undefined)
            {
               this.objectSummaryMap[param1] = [];
            }
            this.objectSummaryMap[param1].push(_loc5_[_loc7_]);
            _loc7_++;
         }
         if(param3)
         {
            this.insertRootSummary(_loc5_);
         }
         else
         {
            this.insertSummary(param1,_loc5_,_loc4_);
         }
      }
      
      private function initialize() : void
      {
         this.currentData = null;
         this.currentGroups = [];
         this.currentGroupLabels = [];
         this.currentIndices = [];
         this.childrenArray = null;
      }
      
      private function insertRootSummary(param1:Array) : void
      {
         var _loc5_:SummaryRow = null;
         var _loc2_:ICollectionView = super.source as ICollectionView;
         if(!(_loc2_ is IList))
         {
            return;
         }
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = this.summaries[_loc4_];
            if(_loc5_.summaryPlacement.indexOf("first") != -1)
            {
               IList(_loc2_).addItemAt(param1[_loc4_],0);
            }
            if(_loc5_.summaryPlacement.indexOf("last") != -1)
            {
               IList(_loc2_).addItem(param1[_loc4_]);
            }
            _loc4_++;
         }
      }
      
      private function insertSummary(param1:Object, param2:Array, param3:Array) : void
      {
         var _loc6_:SummaryRow = null;
         var _loc7_:IList = null;
         var _loc8_:String = null;
         var _loc4_:int = int(param3.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param3[_loc5_];
            if(_loc6_.summaryPlacement.indexOf("group") != -1)
            {
               for(_loc8_ in param2[_loc5_])
               {
                  param1[_loc8_] = param2[_loc5_][_loc8_];
               }
            }
            if(_loc6_.summaryPlacement.indexOf("first") != -1)
            {
               _loc7_ = this.getChildren(param1) as ArrayCollection;
               if(_loc7_)
               {
                  _loc7_.addItemAt(param2[_loc5_],0);
               }
            }
            if(_loc6_.summaryPlacement.indexOf("last") != -1)
            {
               _loc7_ = this.getChildren(param1) as ArrayCollection;
               if(_loc7_)
               {
                  _loc7_.addItem(param2[_loc5_]);
               }
            }
            _loc5_++;
         }
      }
      
      private function makeGroupedCollection() : Boolean
      {
         var _loc5_:GroupingField = null;
         var _loc6_:SortField = null;
         var _loc1_:Array = [];
         var _loc2_:int = int(this.grouping.fields.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = this.grouping.fields[_loc3_];
            _loc6_ = new SortField(_loc5_.name,_loc5_.caseInsensitive,_loc5_.descending,_loc5_.numeric);
            _loc6_.compareFunction = _loc5_.compareFunction;
            _loc1_.push(_loc6_);
            _loc3_++;
         }
         this.oldSort = this.source.sort;
         this.source.sort = new Sort();
         if(this.grouping.compareFunction != null)
         {
            this.source.sort.compareFunction = this.grouping.compareFunction;
         }
         this.source.sort.fields = _loc1_;
         var _loc4_:Boolean = Boolean(this.source.refresh());
         if(!_loc4_)
         {
            return _loc4_;
         }
         if(this.async)
         {
            this.timer = new Timer(1);
            this.timer.addEventListener(TimerEvent.TIMER,this.timerHandler);
            this.timer.start();
            return true;
         }
         return this.buildGroups();
      }
      
      private function timerHandler(param1:TimerEvent) : void
      {
         if(this.buildGroups())
         {
            this.timer.stop();
            this.timer = null;
         }
      }
      
      private function buildGroups() : Boolean
      {
         var _openItems:Object = null;
         var hierarchicalData:IHierarchicalData = null;
         var n:int = 0;
         var i:int = 0;
         var groupingField:String = null;
         var label:String = null;
         var refreshEvent:CollectionEvent = null;
         if(!this.prepared)
         {
            _openItems = {};
            this.initialize();
            this.newCollection.removeAll();
            if((this.source as ICollectionView).length == 0)
            {
               return false;
            }
            if(this.dispatchCollectionEvents)
            {
               hierarchicalData = new HierarchicalData(this.newCollection);
               HierarchicalData(hierarchicalData).childrenField = childrenField;
               this.hView = new HierarchicalCollectionView(hierarchicalData,_openItems);
            }
            this.flatView = this.source as ICollectionView;
            this.flatCursor = this.flatView.createCursor();
            this.gf = this.grouping.fields;
            this.fieldCount = this.gf.length;
            if(this.gf)
            {
               this.prepared = true;
               if(this.async)
               {
                  return false;
               }
            }
            if(this.async)
            {
               return true;
            }
         }
         this.flatCursor.seek(this.currentPosition);
         while(!this.flatCursor.afterLast && this.currentPosition != CursorBookmark.LAST)
         {
            this.currentData = this.flatCursor.current;
            n = 0;
            i = 0;
            while(i < this.fieldCount)
            {
               groupingField = this.gf[i].name;
               label = this.getDataLabel(this.currentData,this.gf[i]);
               if(label != this.currentGroupLabels[i])
               {
                  if(Boolean(this.childrenArray) && Boolean(this.childrenArray.length))
                  {
                     ArrayCollection(this.currentGroups[this.fieldCount - 1][childrenField]).source = this.childrenArray;
                     this.childrenArray = [];
                  }
                  if(this.summaryPresent)
                  {
                     n = int(this.currentGroups.length - 1);
                     while(n >= i)
                     {
                        this.getSummaries(this.currentGroups[n],n);
                        n--;
                     }
                  }
                  this.currentGroupLabels.splice(i + 1);
                  this.currentGroups.splice(i + 1);
                  this.currentIndices.splice(i + 1);
                  this.currentGroupLabels[i] = label;
                  if(this.gf[i].groupingObjectFunction != null)
                  {
                     this.currentGroups[i] = this.gf[i].groupingObjectFunction(label);
                  }
                  else if(this.grouping.groupingObjectFunction != null)
                  {
                     this.currentGroups[i] = this.grouping.groupingObjectFunction(label);
                  }
                  else
                  {
                     this.currentGroups[i] = {};
                  }
                  this.currentGroups[i][childrenField] = new ArrayCollection();
                  this.currentGroups[i][this.grouping.label] = this.currentGroupLabels[i];
                  this.itemIndex = this.currentIndices[i - 1];
                  if(this.dispatchCollectionEvents)
                  {
                     IHierarchicalCollectionView(this.hView).addChild(this.currentGroups[i - 1],this.currentGroups[i]);
                  }
                  else if(i > 0)
                  {
                     this.currentGroups[i - 1][childrenField].source.push(this.currentGroups[i]);
                  }
                  else
                  {
                     this.newCollection.source.push(this.currentGroups[i]);
                  }
                  this.currentIndices[i - 1] = ++this.itemIndex;
               }
               if(i == this.fieldCount - 1)
               {
                  this.itemIndex = this.currentIndices[i];
                  if(!this.childrenArray)
                  {
                     this.childrenArray = [];
                  }
                  this.childrenArray.push(this.currentData);
                  this.currentIndices[i] = ++this.itemIndex;
               }
               i++;
            }
            try
            {
               this.flatCursor.moveNext();
               this.currentPosition = this.flatCursor.bookmark;
               if(this.async)
               {
                  return false;
               }
            }
            catch(e:ItemPendingError)
            {
               cleanUp();
               e.addResponder(new ItemResponder(function(param1:Object, param2:Object = null):void
               {
                  makeGroupedCollection();
               },function(param1:Object, param2:Object = null):void
               {
               }));
            }
         }
         if(this.currentPosition == CursorBookmark.LAST)
         {
            if(Boolean(this.childrenArray) && Boolean(this.childrenArray.length))
            {
               ArrayCollection(this.currentGroups[this.fieldCount - 1][childrenField]).source = this.childrenArray;
               if(this.summaryPresent)
               {
                  n = this.fieldCount - 1;
                  while(n >= 0)
                  {
                     this.getSummaries(this.currentGroups[n],n);
                     n--;
                  }
               }
            }
            if(Boolean(this.source) && Boolean(this.summaries))
            {
               if(!super.source)
               {
                  super.source = new ArrayCollection([this.source]) as Object;
               }
               this.generateRootSummaries(this.grouping == null);
            }
            this.newCollection.refresh();
            refreshEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
            refreshEvent.kind = CollectionEventKind.REFRESH;
            dispatchEvent(refreshEvent);
            this.cleanUp();
         }
         return true;
      }
      
      private function prepareSummaryFields() : void
      {
         var _loc1_:SummaryRow = null;
         var _loc2_:int = 0;
         var _loc3_:GroupingField = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.summaryFields = [];
         if(this.grouping.fields != null)
         {
            _loc2_ = 0;
            while(_loc2_ < this.grouping.fields.length)
            {
               _loc3_ = this.grouping.fields[_loc2_];
               if(_loc3_.summaries != null)
               {
                  _loc4_ = 0;
                  while(_loc4_ < _loc3_.summaries.length)
                  {
                     _loc1_ = _loc3_.summaries[_loc4_];
                     if(_loc1_.fields != null)
                     {
                        _loc5_ = 0;
                        while(_loc5_ < _loc1_.fields.length)
                        {
                           this.summaryPresent = true;
                           this.summaryFields.push(_loc1_.fields[_loc5_]);
                           _loc5_++;
                        }
                     }
                     _loc4_++;
                  }
               }
               _loc2_++;
            }
         }
         if(this.summaries != null)
         {
            _loc2_ = 0;
            while(_loc2_ < this.summaries.length)
            {
               _loc1_ = this.summaries[_loc2_];
               if(_loc1_.fields != null)
               {
                  _loc4_ = 0;
                  while(_loc4_ < _loc1_.fields.length)
                  {
                     this.summaryPresent = true;
                     this.summaryFields.push(_loc1_.fields[_loc4_]);
                     _loc4_++;
                  }
               }
               _loc2_++;
            }
         }
      }
      
      private function cleanUp() : void
      {
         this.source.sort = this.oldSort;
         this.source.refresh();
         this.prepared = false;
         this.currentPosition = CursorBookmark.FIRST;
         this.oldSort = null;
         this.flatCursor = null;
      }
      
      private function applyFunctionForParentNodes(param1:ICollectionView, param2:Function, param3:int = 0) : void
      {
         var _loc4_:IViewCursor = null;
         var _loc5_:Object = null;
         var _loc6_:IViewCursor = null;
         var _loc7_:Object = null;
         if(param1.length > 0)
         {
            _loc4_ = param1.createCursor();
            while(!_loc4_.afterLast)
            {
               _loc5_ = this.getChildren(_loc4_.current);
               if(_loc5_ is ArrayCollection)
               {
                  _loc6_ = ArrayCollection(_loc5_).createCursor();
                  while(!_loc6_.afterLast)
                  {
                     _loc7_ = _loc6_.current;
                     if(this.hasChildren(_loc7_))
                     {
                        this.applyFunctionForParentNodes(_loc5_ as ArrayCollection,param2,param3 + 1);
                        break;
                     }
                     _loc6_.moveNext();
                  }
               }
               param2(_loc4_.current,param3);
               _loc4_.moveNext();
            }
         }
      }
      
      private function regenerateRootSummaries() : void
      {
         var _loc5_:int = 0;
         if(!this.summaries)
         {
            return;
         }
         var _loc1_:ICollectionView = super.source as ICollectionView;
         if(!this.grouping)
         {
            _loc1_ = _loc1_.createCursor().current as ICollectionView;
         }
         var _loc2_:Array = this.objectSummaryMap[_loc1_];
         if(!_loc2_ || !(_loc1_ is IList))
         {
            return;
         }
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = int(IList(_loc1_).getItemIndex(_loc2_[_loc4_]));
            if(_loc5_ != -1)
            {
               IList(_loc1_).removeItemAt(_loc5_);
            }
            _loc4_++;
         }
         delete this.objectSummaryMap[_loc1_];
         this.generateRootSummaries(this.grouping == null);
      }
      
      private function removeAllSummaries() : void
      {
         this.applyFunctionForParentNodes(super.source as ICollectionView,this.removeSummary);
      }
      
      private function removeItemAndSummaries(param1:ICollectionView, param2:Object, param3:Boolean = false) : Array
      {
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:ICollectionView = null;
         var _loc9_:String = null;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc4_:Array = [];
         var _loc5_:Object = this.getParent(param2);
         while(_loc5_ != null)
         {
            _loc7_ = true;
            _loc8_ = this.getChildren(_loc5_) as ArrayCollection;
            if(_loc8_)
            {
               if(_loc8_.contains(param2))
               {
                  if(_loc8_ is IList)
                  {
                     if(param3)
                     {
                        _loc6_ = int(IList(_loc8_).getItemIndex(param2));
                        if(_loc6_ != -1)
                        {
                           IList(_loc8_).removeItemAt(_loc6_);
                           _loc9_ = UIDUtil.getUID(param2);
                           if(this.parentMap[_loc9_])
                           {
                              delete this.parentMap[_loc9_];
                           }
                        }
                     }
                     if(this.objectSummaryMap[_loc5_])
                     {
                        _loc10_ = this.objectSummaryMap[_loc5_];
                        _loc11_ = int(_loc10_.length);
                        _loc12_ = 0;
                        while(_loc12_ < _loc11_)
                        {
                           _loc6_ = int(IList(_loc8_).getItemIndex(_loc10_[_loc12_]));
                           if(_loc6_ != -1)
                           {
                              IList(_loc8_).removeItemAt(_loc6_);
                           }
                           _loc12_++;
                        }
                        delete this.objectSummaryMap[_loc5_];
                     }
                     if(this.summariesTracker != null && Boolean(this.summariesTracker[_loc5_]))
                     {
                        this.summariesTracker[_loc5_] = new Dictionary(false);
                     }
                     if(param3)
                     {
                        if(_loc8_.length == 0 && this.getParent(_loc5_) != null)
                        {
                           _loc7_ = false;
                        }
                        else
                        {
                           param3 = false;
                        }
                     }
                  }
               }
               if(_loc7_)
               {
                  _loc4_.push(_loc5_);
               }
               param2 = _loc5_;
               _loc5_ = this.getParent(_loc5_);
               if(!_loc5_)
               {
                  if(_loc4_.length == 1)
                  {
                     if((this.getChildren(_loc4_[0]) as ICollectionView).length == 0 && param1 is IList)
                     {
                        _loc6_ = int(IList(param1).getItemIndex(param2));
                        if(_loc6_ != -1)
                        {
                           IList(param1).removeItemAt(_loc6_);
                           return null;
                        }
                     }
                  }
                  return _loc4_.reverse();
               }
            }
         }
         return null;
      }
      
      private function removeSummary(param1:Object, param2:int) : void
      {
         var _loc3_:ICollectionView = this.getChildren(param1) as ArrayCollection;
         if(!_loc3_)
         {
            return;
         }
         this.removeItemAndSummaries(super.source as ICollectionView,_loc3_.createCursor().current);
      }
      
      private function updateParentMap(param1:Object, param2:Object) : void
      {
         var _loc3_:String = UIDUtil.getUID(param2);
         this.parentMap[_loc3_] = param1;
      }
      
      private function updateSummary(param1:Object, param2:Boolean = false) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:ICollectionView = super.source as ICollectionView;
         if(this.summaryPresent || param2)
         {
            _loc4_ = this.removeItemAndSummaries(_loc3_,param1,param2);
         }
         if(this.summaryPresent && Boolean(_loc4_))
         {
            _loc5_ = int(_loc4_.length);
            _loc6_ = _loc5_ - 1;
            while(_loc6_ >= 0)
            {
               this.getSummaries(_loc4_[_loc6_],_loc6_);
               _loc6_--;
            }
         }
      }
      
      private function collectionChangeHandler(param1:CollectionEvent) : void
      {
         var _loc6_:Object = null;
         var _loc7_:Boolean = false;
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         if(!this.grouping)
         {
            return;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1.kind == CollectionEventKind.UPDATE)
         {
            _loc4_ = int(param1.items.length);
            _loc2_ = 0;
            while(_loc2_ < _loc4_)
            {
               _loc6_ = param1.items[_loc2_].source;
               if(_loc6_)
               {
                  _loc5_ = int(this.grouping.fields.length);
                  _loc3_ = 0;
                  while(_loc3_ < _loc5_)
                  {
                     if(param1.items[_loc2_].property == this.grouping.fields[_loc3_].name)
                     {
                        _loc7_ = true;
                        this.updateSummary(_loc6_,true);
                        this.addItem(_loc6_);
                        break;
                     }
                     _loc3_++;
                  }
                  if(!_loc7_)
                  {
                     this.updateSummary(_loc6_);
                  }
               }
               _loc2_++;
            }
         }
         if(param1.kind == CollectionEventKind.ADD)
         {
            _loc4_ = int(param1.items.length);
            _loc2_ = 0;
            while(_loc2_ < _loc4_)
            {
               _loc6_ = param1.items[_loc2_];
               this.addItem(_loc6_);
               _loc2_++;
            }
         }
         if(param1.kind == CollectionEventKind.REMOVE)
         {
            _loc4_ = int(param1.items.length);
            _loc2_ = 0;
            while(_loc2_ < _loc4_)
            {
               _loc6_ = param1.items[_loc2_];
               this.updateSummary(_loc6_,true);
               _loc2_++;
            }
         }
         if(param1.kind == CollectionEventKind.REPLACE)
         {
            _loc4_ = int(param1.items.length);
            _loc2_ = 0;
            while(_loc2_ < _loc4_)
            {
               _loc8_ = param1.items[_loc2_].oldValue;
               _loc9_ = param1.items[_loc2_].newValue;
               this.updateSummary(_loc8_,true);
               this.addItem(_loc9_);
               _loc2_++;
            }
         }
         this.regenerateRootSummaries();
      }
   }
}

