package fr.kapit.tree
{
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.utils.getTimer;
   import fr.kapit.controls.kTree;
   import fr.kapit.utils.StringUtils;
   import mx.controls.Tree;
   import mx.events.DragEvent;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   
   public class KapDebugTree extends kTree
   {
      private var _779851479autoExpand:Boolean = true;
      
      private var _1140369053expandOnData:Boolean = false;
      
      private var _396705909autoSelect:Boolean = true;
      
      private var _1767934855keepSelection:Boolean = true;
      
      private var _724182626keepOpenState:Boolean = false;
      
      private var _777297799initialOpenedLevelsDepth:int = 1;
      
      private var _249086986initialIdToSelect:String = "";
      
      public var referenceAttribute:String = "";
      
      public var initialIdSelected:Boolean = false;
      
      private var _1058557653countField:String;
      
      private var _multipleSelection:Boolean = false;
      
      protected var rdefaultLeafIcon:Class = KapDebugTree_rdefaultLeafIcon;
      
      protected var disclosureClosedIcon:Class = KapDebugTree_disclosureClosedIcon;
      
      protected var disclosureOpenIcon:Class = KapDebugTree_disclosureOpenIcon;
      
      protected var folderClosedIcon:Class = KapDebugTree_folderClosedIcon;
      
      protected var folderOpenedIcon:Class = KapDebugTree_folderOpenedIcon;
      
      public var noAutoExpand:Boolean = false;
      
      private var treeHelper:TreeHelper;
      
      private var _lastClickTime:Number = 0;
      
      private var _doubleClickTimeout:Number = 300;
      
      private var _isKeyFocusChanging:Boolean;
      
      public function KapDebugTree()
      {
         super();
         showDataTips = true;
         allowMultipleSelection = this._multipleSelection;
         addEventListener(FlexEvent.INITIALIZE,this.this_initializeHandler);
         addEventListener(Event.CHANGE,this.this_changeHandler);
         addEventListener(DragEvent.DRAG_COMPLETE,this.this_dragCompleteHandler);
      }
      
      public function get multipleSelection() : Boolean
      {
         return this._multipleSelection;
      }
      
      public function set multipleSelection(param1:Boolean) : void
      {
         if(this._multipleSelection == param1)
         {
            return;
         }
         this._multipleSelection = param1;
         allowMultipleSelection = param1;
      }
      
      private function _onItemEditBeginning(param1:ListEvent) : void
      {
         if(!this._isKeyFocusChanging && getTimer() - this._lastClickTime > this._doubleClickTimeout)
         {
            param1.preventDefault();
         }
         this._isKeyFocusChanging = false;
         this._lastClickTime = getTimer();
      }
      
      private function _onKeyFocusChange(param1:FocusEvent) : void
      {
         this._isKeyFocusChanging = true;
      }
      
      public function get doubleClickTimeout() : Number
      {
         return this._doubleClickTimeout;
      }
      
      public function set doubleClickTimeout(param1:Number) : void
      {
         this._doubleClickTimeout = param1;
      }
      
      private function this_initializeHandler(param1:FlexEvent) : void
      {
         removeEventListener(FlexEvent.INITIALIZE,this.this_initializeHandler);
         this.treeHelper = new TreeHelper(this);
         addEventListener(ListEvent.ITEM_EDIT_BEGINNING,this._onItemEditBeginning);
         addEventListener(FocusEvent.KEY_FOCUS_CHANGE,this._onKeyFocusChange,false,1000);
      }
      
      private function getNodeCount(param1:Object) : String
      {
         var _loc3_:String = null;
         var _loc2_:String = "";
         if(this.countField != null && this.countField.length != 0)
         {
            _loc3_ = param1[this.countField];
         }
         if(_loc3_ != null && _loc3_.length != 0 && _loc3_ != "0")
         {
            _loc2_ += " (" + _loc3_ + ")";
         }
         return _loc2_;
      }
      
      private function getTooltip() : String
      {
         return "";
      }
      
      private function this_changeHandler(param1:Event) : void
      {
         if(selectedItem == null)
         {
            return;
         }
         if(Boolean(dataDescriptor.isBranch(selectedItem)) && this.autoExpand)
         {
            if(this.noAutoExpand)
            {
               this.noAutoExpand = false;
            }
            else
            {
               expandItem(selectedItem,true,true);
            }
         }
         this.treeHelper.itemSelected(itemToUID(selectedItem));
      }
      
      override public function set dataProvider(param1:Object) : void
      {
         super.dataProvider = param1;
         if(param1 == null)
         {
            return;
         }
         this.treeHelper.setOpenItems(openItems as Array);
         callLater(this.setTreeState);
      }
      
      public function setTreeState() : void
      {
         try
         {
            if(this.keepOpenState)
            {
               this.treeHelper.restoreOpenState(dataProvider[0]);
            }
            if(this.expandOnData)
            {
               callLater(this.treeHelper.openLevels,[this.initialOpenedLevelsDepth]);
            }
            if(this.autoSelect)
            {
               callLater(this.treeHelper.autoSelectItem);
            }
            else if(this.keepSelection)
            {
               callLater(this.treeHelper.restoreSelection);
            }
            if(!StringUtils.isEmpty(this.initialIdToSelect) && !StringUtils.isEmpty(this.referenceAttribute))
            {
               callLater(this.treeHelper.selectItemById,[this.initialIdToSelect,this.referenceAttribute]);
               this.initialIdToSelect = "";
            }
         }
         catch(e:Error)
         {
         }
      }
      
      public function selectIndex(param1:Number) : void
      {
         selectedIndex = param1;
         dispatchEvent(new Event("change"));
      }
      
      public function getSelectedObject() : Object
      {
         return selectedItem;
      }
      
      protected function getDefaultIcon(param1:Object) : Class
      {
         var _loc2_:Number = NaN;
         var _loc3_:Object = null;
         if(dataDescriptor.isBranch(param1))
         {
            _loc2_ = 0;
            while(_loc2_ < (openItems as Array).length)
            {
               _loc3_ = (openItems as Array)[_loc2_];
               if(_loc3_ == param1)
               {
                  return this.folderOpenedIcon;
               }
               _loc2_++;
            }
            return this.folderClosedIcon;
         }
         return null;
      }
      
      public function getUID(param1:Object) : String
      {
         return super.itemToUID(param1);
      }
      
      protected function this_dragCompleteHandler(param1:DragEvent) : void
      {
         Tree(param1.currentTarget).hideDropFeedback(param1);
      }
      
      public function selectItemById(param1:String, param2:String, param3:Boolean = true) : void
      {
         this.treeHelper.selectItemById(param1,param2,param3);
         callLater(this.scrollToSelected);
      }
      
      public function scrollToSelected() : void
      {
         scrollToIndex(selectedIndex);
      }
      
      [Bindable(event="propertyChange")]
      public function get autoExpand() : Boolean
      {
         return this._779851479autoExpand;
      }
      
      public function set autoExpand(param1:Boolean) : void
      {
         var _loc2_:Object = this._779851479autoExpand;
         if(_loc2_ !== param1)
         {
            this._779851479autoExpand = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"autoExpand",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get expandOnData() : Boolean
      {
         return this._1140369053expandOnData;
      }
      
      public function set expandOnData(param1:Boolean) : void
      {
         var _loc2_:Object = this._1140369053expandOnData;
         if(_loc2_ !== param1)
         {
            this._1140369053expandOnData = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"expandOnData",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get autoSelect() : Boolean
      {
         return this._396705909autoSelect;
      }
      
      public function set autoSelect(param1:Boolean) : void
      {
         var _loc2_:Object = this._396705909autoSelect;
         if(_loc2_ !== param1)
         {
            this._396705909autoSelect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"autoSelect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get keepSelection() : Boolean
      {
         return this._1767934855keepSelection;
      }
      
      public function set keepSelection(param1:Boolean) : void
      {
         var _loc2_:Object = this._1767934855keepSelection;
         if(_loc2_ !== param1)
         {
            this._1767934855keepSelection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"keepSelection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get keepOpenState() : Boolean
      {
         return this._724182626keepOpenState;
      }
      
      public function set keepOpenState(param1:Boolean) : void
      {
         var _loc2_:Object = this._724182626keepOpenState;
         if(_loc2_ !== param1)
         {
            this._724182626keepOpenState = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"keepOpenState",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get initialOpenedLevelsDepth() : int
      {
         return this._777297799initialOpenedLevelsDepth;
      }
      
      public function set initialOpenedLevelsDepth(param1:int) : void
      {
         var _loc2_:Object = this._777297799initialOpenedLevelsDepth;
         if(_loc2_ !== param1)
         {
            this._777297799initialOpenedLevelsDepth = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"initialOpenedLevelsDepth",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get initialIdToSelect() : String
      {
         return this._249086986initialIdToSelect;
      }
      
      public function set initialIdToSelect(param1:String) : void
      {
         var _loc2_:Object = this._249086986initialIdToSelect;
         if(_loc2_ !== param1)
         {
            this._249086986initialIdToSelect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"initialIdToSelect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get countField() : String
      {
         return this._1058557653countField;
      }
      
      public function set countField(param1:String) : void
      {
         var _loc2_:Object = this._1058557653countField;
         if(_loc2_ !== param1)
         {
            this._1058557653countField = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"countField",_loc2_,param1));
            }
         }
      }
   }
}

