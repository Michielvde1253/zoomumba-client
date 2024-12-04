package mx.controls
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import mx.collections.ArrayCollection;
   import mx.collections.CursorBookmark;
   import mx.collections.HierarchicalCollectionView;
   import mx.collections.HierarchicalCollectionViewCursor;
   import mx.collections.HierarchicalData;
   import mx.collections.ICollectionView;
   import mx.collections.IGroupingCollection;
   import mx.collections.IGroupingCollection2;
   import mx.collections.IHierarchicalCollectionView;
   import mx.collections.IHierarchicalData;
   import mx.collections.IViewCursor;
   import mx.collections.ItemResponder;
   import mx.collections.Sort;
   import mx.collections.SortField;
   import mx.collections.SummaryObject;
   import mx.collections.errors.ItemPendingError;
   import mx.controls.advancedDataGridClasses.AdvancedDataGridBaseSelectionData;
   import mx.controls.advancedDataGridClasses.AdvancedDataGridBaseSelectionPending;
   import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
   import mx.controls.advancedDataGridClasses.AdvancedDataGridColumnGroup;
   import mx.controls.advancedDataGridClasses.AdvancedDataGridGroupItemRenderer;
   import mx.controls.advancedDataGridClasses.AdvancedDataGridHeaderInfo;
   import mx.controls.advancedDataGridClasses.AdvancedDataGridListData;
   import mx.controls.advancedDataGridClasses.AdvancedDataGridRendererDescription;
   import mx.controls.advancedDataGridClasses.IAdvancedDataGridRendererProvider;
   import mx.controls.advancedDataGridClasses.SortInfo;
   import mx.controls.listClasses.BaseListData;
   import mx.controls.listClasses.IDropInListItemRenderer;
   import mx.controls.listClasses.IListItemRenderer;
   import mx.controls.listClasses.ListBaseSeekPending;
   import mx.controls.listClasses.ListRowInfo;
   import mx.core.ClassFactory;
   import mx.core.EdgeMetrics;
   import mx.core.EventPriority;
   import mx.core.FlexShape;
   import mx.core.FlexSprite;
   import mx.core.IDataRenderer;
   import mx.core.IFactory;
   import mx.core.IFlexDisplayObject;
   import mx.core.IInvalidating;
   import mx.core.IUITextField;
   import mx.core.ScrollPolicy;
   import mx.core.SpriteAsset;
   import mx.core.UIComponent;
   import mx.core.UIComponentGlobals;
   import mx.core.mx_internal;
   import mx.effects.Tween;
   import mx.events.AdvancedDataGridEvent;
   import mx.events.AdvancedDataGridEventReason;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.DragEvent;
   import mx.events.FlexEvent;
   import mx.events.IndexChangedEvent;
   import mx.events.ListEvent;
   import mx.events.ListEventReason;
   import mx.events.ScrollEvent;
   import mx.events.ScrollEventDetail;
   import mx.events.ScrollEventDirection;
   import mx.events.TweenEvent;
   import mx.managers.DragManager;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   import mx.styles.ISimpleStyleClient;
   import mx.styles.IStyleClient;
   import mx.utils.UIDUtil;
   
   use namespace mx_internal;
   
   public class AdvancedDataGrid extends AdvancedDataGridBaseEx
   {
      mx_internal static var createAccessibilityImplementation:Function;
      
      mx_internal static const VERSION:String = "4.0.0.14159";
      
      public static const HEADER_TEXT_PART:String = "headerTextPart";
      
      public static const HEADER_ICON_PART:String = "headerIconPart";
      
      private static var resourceManager:IResourceManager = ResourceManager.getInstance();
      
      private var rendererDescriptionMap:Dictionary;
      
      private var isMeasuringHeader:Boolean;
      
      private var oldStyles:Dictionary;
      
      mx_internal var firstCellSelectionData:AdvancedDataGridBaseSelectionData;
      
      mx_internal var cellSelectionData:Object = {};
      
      mx_internal var cellSelections:Object = {};
      
      mx_internal var cellSelectionIndicators:Object = {};
      
      protected var visibleCellRenderers:Object = {};
      
      protected var selectedColumnIndex:int = -1;
      
      protected var highlightColumnIndex:int = -1;
      
      protected var caretColumnIndex:int = -1;
      
      protected var anchorColumnIndex:int = -1;
      
      protected var cellSelectionTweens:Object = {};
      
      private var selectedCellsChanged:Boolean = false;
      
      private var _temporary_selectedCells:Array = null;
      
      private var visualSortInfo:Dictionary = new Dictionary();
      
      private var designViewDataFlag:Boolean = false;
      
      private var lastColumnWidth:Number = NaN;
      
      protected var movingSelectionLayer:Sprite;
      
      private var headerSelected:Boolean = true;
      
      private var _lockedColumnCountVal:int;
      
      private var lockedColumnCountChanged:Boolean = false;
      
      private var headerItemsList:Array;
      
      private var headerDraggedOutside:Boolean = false;
      
      private var dropInfo:AdvancedDataGridEvent;
      
      private var lastHeaderInfos:Array;
      
      private var horizontalSeparators:Array;
      
      private var horizontalLockedSeparators:Array;
      
      private var numSeparators:int = 0;
      
      private var groupedColumnsChanged:Boolean = false;
      
      private var columnsChanged:Boolean = false;
      
      private var designViewDataFlatType:String = "flat";
      
      private var designViewDataTreeType:String = "tree";
      
      private var designViewDataTypeChanged:Boolean = false;
      
      mx_internal var columnsToInfo:Dictionary = new Dictionary();
      
      mx_internal var columnGrouping:Boolean = false;
      
      private var opening:Boolean;
      
      protected var tween:Object;
      
      private var maskList:Array;
      
      private var _userMaxHorizontalScrollPosition:Number = 0;
      
      private var eventAfterTween:Object;
      
      private var eventItemRenderer:IListItemRenderer;
      
      private var oldLength:int = -1;
      
      private var expandedItem:Object;
      
      private var bSelectedItemRemoved:Boolean = false;
      
      private var groupLabelField:String;
      
      private var lastUserInteraction:Event;
      
      mx_internal var _dropData:Object;
      
      mx_internal var isOpening:Boolean = false;
      
      private var rowIndex:int;
      
      private var rowsTweened:int;
      
      private var rowList:Array;
      
      private var hierarchicalCollectionInstance:IHierarchicalCollectionView;
      
      mx_internal var collectionLength:int;
      
      private var dataProviderChanged:Boolean = false;
      
      mx_internal var _rootModel:IHierarchicalData;
      
      private var displayItemsExpandedChanged:Boolean = false;
      
      private var _columnsValue:Array;
      
      private var _groupedColumns:Array;
      
      protected var _selectedCells:Array = [];
      
      private var _designViewDataType:String = this.designViewDataTreeType;
      
      private var _groupIconFunction:Function;
      
      private var _groupItemRenderer:IFactory;
      
      private var _groupLabelFunction:Function;
      
      private var _groupRowHeight:Number = -1;
      
      private var _rendererProviders:Array = [];
      
      public var itemIcons:Object;
      
      private var _hierarchicalCollectionView:IHierarchicalCollectionView = new HierarchicalCollectionView();
      
      private var _displayDisclosureIcon:Boolean = true;
      
      private var _displayItemsExpanded:Boolean = false;
      
      private var _treeColumn:AdvancedDataGridColumn = null;
      
      private var _movingColumnIndex:int;
      
      public function AdvancedDataGrid()
      {
         super();
         this.rendererDescriptionMap = new Dictionary(true);
         this.groupItemRenderer = new ClassFactory(AdvancedDataGridGroupItemRenderer);
         addEventListener(AdvancedDataGridEvent.ITEM_OPENING,this.mx_internal::expandItemHandler,false,EventPriority.DEFAULT_HANDLER);
         addEventListener(FlexEvent.UPDATE_COMPLETE,this.updateCompleteHandler);
      }
      
      [Bindable("collectionChange")]
      override public function get dataProvider() : Object
      {
         if(super.dataProvider)
         {
            return super.dataProvider;
         }
         return null;
      }
      
      override public function set dataProvider(param1:Object) : void
      {
         if(itemEditorInstance)
         {
            endEdit(AdvancedDataGridEventReason.OTHER);
         }
         if(isCellSelectionMode())
         {
            this.clearCellSelectionData();
         }
         if(this.mx_internal::_rootModel)
         {
            this.mx_internal::_rootModel.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this.collectionChangeHandler);
         }
         if(param1 is IHierarchicalData)
         {
            this.mx_internal::_rootModel = param1 as IHierarchicalData;
         }
         else if(param1 is IHierarchicalCollectionView)
         {
            this.mx_internal::_rootModel = IHierarchicalCollectionView(param1).source;
            this.hierarchicalCollectionInstance = IHierarchicalCollectionView(param1);
         }
         else
         {
            this.mx_internal::_rootModel = null;
            this.hierarchicalCollectionInstance = null;
            super.dataProvider = param1;
         }
         if(this.mx_internal::_rootModel)
         {
            this.mx_internal::_rootModel.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.collectionChangeHandler);
         }
         this.dataProviderChanged = true;
         invalidateProperties();
      }
      
      override public function get lockedRowCount() : int
      {
         if(this.mx_internal::_rootModel is IHierarchicalData)
         {
            return 0;
         }
         return super.lockedRowCount;
      }
      
      override public function set lockedColumnCount(param1:int) : void
      {
         this._lockedColumnCountVal = param1;
         this.lockedColumnCountChanged = true;
         invalidateProperties();
      }
      
      override public function set columns(param1:Array) : void
      {
         this._columnsValue = param1;
         this.columnsChanged = true;
         generatedColumns = false;
         invalidateProperties();
      }
      
      override public function set verticalScrollPosition(param1:Number) : void
      {
         var _loc2_:int = 0;
         _loc2_ = this.anchorColumnIndex;
         var _loc3_:int = this.caretColumnIndex;
         var _loc4_:int = this.selectedColumnIndex;
         super.verticalScrollPosition = param1;
         this.anchorColumnIndex = _loc2_;
         this.caretColumnIndex = _loc3_;
         this.selectedColumnIndex = _loc4_;
         if(this.rendererProviders.length != 0)
         {
            drawVerticalSeparators();
         }
         if(!variableRowHeight && this.groupRowHeight != -1 && this.groupRowHeight != rowHeight)
         {
            drawHorizontalSeparators();
         }
         if(cellsWaitingToBeDisplayed)
         {
            this.processCellsWaitingToBeDisplayed();
         }
      }
      
      override public function set horizontalScrollPosition(param1:Number) : void
      {
         var _loc2_:int = this.anchorColumnIndex;
         var _loc3_:int = this.caretColumnIndex;
         var _loc4_:int = this.selectedColumnIndex;
         super.horizontalScrollPosition = param1;
         this.anchorColumnIndex = _loc2_;
         this.caretColumnIndex = _loc3_;
         this.selectedColumnIndex = _loc4_;
         if(cellsWaitingToBeDisplayed)
         {
            this.processCellsWaitingToBeDisplayed();
         }
      }
      
      public function get groupedColumns() : Array
      {
         return this._groupedColumns;
      }
      
      public function set groupedColumns(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.validateGroupedColumns(param1))
         {
            if(this._groupedColumns)
            {
               _loc2_ = int(this._groupedColumns.length);
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  if(this._groupedColumns[_loc3_] is AdvancedDataGridColumnGroup)
                  {
                     this.columnGroupRendererChanged(AdvancedDataGridColumnGroup(this._groupedColumns[_loc3_]));
                  }
                  _loc3_++;
               }
            }
            this._groupedColumns = param1;
            this.groupedColumnsChanged = true;
            invalidateProperties();
         }
      }
      
      public function get selectedCells() : Array
      {
         if(this._selectedCells)
         {
            return this._selectedCells.slice();
         }
         return null;
      }
      
      public function set selectedCells(param1:Array) : void
      {
         this.clearSelectedCells();
         this._temporary_selectedCells = param1;
         this.syncCellSelections(param1);
         this.clearPendingCells();
         this.selectedCellsChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      public function get designViewDataType() : String
      {
         return this._designViewDataType;
      }
      
      public function set designViewDataType(param1:String) : void
      {
         this._designViewDataType = param1;
         this.designViewDataTypeChanged = true;
      }
      
      mx_internal function get dataType() : String
      {
         if(this.dataProvider)
         {
            return this.dataProvider is IHierarchicalCollectionView ? this.designViewDataTreeType : this.designViewDataFlatType;
         }
         return this.designViewDataTreeType;
      }
      
      [Bindable("groupIconFunctionChanged")]
      public function get groupIconFunction() : Function
      {
         return this._groupIconFunction;
      }
      
      public function set groupIconFunction(param1:Function) : void
      {
         this._groupIconFunction = param1;
         itemsSizeChanged = true;
         invalidateDisplayList();
         dispatchEvent(new Event("groupIconFunctionChanged"));
      }
      
      public function get groupItemRenderer() : IFactory
      {
         return this._groupItemRenderer;
      }
      
      public function set groupItemRenderer(param1:IFactory) : void
      {
         this._groupItemRenderer = param1;
         invalidateSize();
         invalidateDisplayList();
         itemsSizeChanged = true;
         rendererChanged = true;
         dispatchEvent(new Event("itemRendererChanged"));
      }
      
      [Bindable("groupLabelFunctionChanged")]
      public function get groupLabelFunction() : Function
      {
         return this._groupLabelFunction;
      }
      
      public function set groupLabelFunction(param1:Function) : void
      {
         this._groupLabelFunction = param1;
         itemsSizeChanged = true;
         invalidateDisplayList();
         dispatchEvent(new Event("groupLabelFunctionChanged"));
      }
      
      public function get groupRowHeight() : Number
      {
         return this._groupRowHeight;
      }
      
      public function set groupRowHeight(param1:Number) : void
      {
         this._groupRowHeight = param1;
         invalidateSize();
         invalidateDisplayList();
         itemsSizeChanged = true;
      }
      
      public function get rendererProviders() : Array
      {
         return this._rendererProviders;
      }
      
      public function set rendererProviders(param1:Array) : void
      {
         this._rendererProviders = param1;
         invalidateSize();
         invalidateDisplayList();
         itemsSizeChanged = true;
         rendererChanged = true;
      }
      
      [Bindable("firstVisibleItemChanged")]
      public function get firstVisibleItem() : Object
      {
         return listItems[0][0].data;
      }
      
      public function set firstVisibleItem(param1:Object) : void
      {
         var _loc2_:int = this.getItemIndex(param1);
         if(_loc2_ < 0)
         {
            return;
         }
         this.verticalScrollPosition = Math.min(maxVerticalScrollPosition,_loc2_);
         dispatchEvent(new Event("firstVisibleItemChanged"));
      }
      
      public function set hierarchicalCollectionView(param1:IHierarchicalCollectionView) : void
      {
         this._hierarchicalCollectionView = param1;
         this.dataProviderChanged = true;
         invalidateProperties();
      }
      
      public function get hierarchicalCollectionView() : IHierarchicalCollectionView
      {
         return IHierarchicalCollectionView(this._hierarchicalCollectionView);
      }
      
      public function get displayDisclosureIcon() : Boolean
      {
         return this._displayDisclosureIcon;
      }
      
      public function set displayDisclosureIcon(param1:Boolean) : void
      {
         if(param1 != this._displayDisclosureIcon)
         {
            this._displayDisclosureIcon = param1;
            itemsSizeChanged = true;
            invalidateDisplayList();
         }
      }
      
      public function get displayItemsExpanded() : Boolean
      {
         return this._displayItemsExpanded;
      }
      
      public function set displayItemsExpanded(param1:Boolean) : void
      {
         if(param1 != this._displayItemsExpanded)
         {
            this._displayItemsExpanded = param1;
            if(this._displayItemsExpanded)
            {
               this.displayItemsExpandedChanged = true;
               invalidateProperties();
            }
         }
      }
      
      public function get treeColumn() : AdvancedDataGridColumn
      {
         if(this._treeColumn)
         {
            return this._treeColumn;
         }
         return null;
      }
      
      public function set treeColumn(param1:AdvancedDataGridColumn) : void
      {
         if(param1 != this._treeColumn)
         {
            this._treeColumn = param1;
            purgeItemRenderers();
            freeItemRenderersTable = new Dictionary(false);
            itemsSizeChanged = true;
            invalidateDisplayList();
         }
      }
      
      protected function get treeColumnIndex() : int
      {
         if(this._treeColumn)
         {
            return this._treeColumn.mx_internal::colNum;
         }
         return 0;
      }
      
      mx_internal function get movingColumnIndex() : int
      {
         return this._movingColumnIndex;
      }
      
      mx_internal function set movingColumnIndex(param1:int) : void
      {
         this._movingColumnIndex = param1;
         if(param1 >= 0 && orderedHeadersList && param1 < orderedHeadersList.length && Boolean(orderedHeadersList[param1]))
         {
            movingColumn = orderedHeadersList[param1].column;
         }
      }
      
      override protected function initializeAccessibility() : void
      {
         if(AdvancedDataGrid.mx_internal::createAccessibilityImplementation != null)
         {
            AdvancedDataGrid.mx_internal::createAccessibilityImplementation(this);
         }
      }
      
      override protected function makeRowsAndColumns(param1:Number, param2:Number, param3:Number, param4:Number, param5:int, param6:int, param7:Boolean = false, param8:uint = 0) : Point
      {
         if(!mx_internal::visibleColumns || mx_internal::visibleColumns.length == 0)
         {
            this.visibleCellRenderers = {};
         }
         return super.makeRowsAndColumns(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      override protected function finishKeySelection() : void
      {
         if(isCellSelectionMode())
         {
            this.finishCellKeySelection();
         }
         else
         {
            super.finishKeySelection();
         }
      }
      
      override protected function selectItem(param1:IListItemRenderer, param2:Boolean, param3:Boolean, param4:Boolean = true) : Boolean
      {
         if(isCellSelectionMode() && !mx_internal::selectedHeaderInfo)
         {
            return this.selectCellItem(param1,param2,param3,param4);
         }
         return super.selectItem(param1,param2,param3,param4);
      }
      
      override protected function drawVisibleItem(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         if(isCellSelectionMode())
         {
            if(this.visibleCellRenderers[param1])
            {
               _loc6_ = int(_columns.length);
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  _loc8_ = Boolean(this.mx_internal::cellSelectionData) && Boolean(this.mx_internal::cellSelectionData[param1]) && Boolean(this.mx_internal::cellSelectionData[param1][_loc7_.toString()]);
                  _loc9_ = highlightUID == param1 && this.highlightColumnIndex == _loc7_;
                  _loc10_ = caretUID == param1 && this.caretColumnIndex == _loc7_;
                  this.drawCellItem(this.visibleCellRenderers[param1][_loc7_.toString()],_loc8_,_loc9_,_loc10_);
                  _loc7_++;
               }
            }
         }
         super.drawVisibleItem(param1,param2,param3,param4,param5);
      }
      
      override protected function setVisibleDataItem(param1:String, param2:IListItemRenderer) : void
      {
         if(isCellSelectionMode())
         {
            if(param1)
            {
               if(!this.visibleCellRenderers[param1])
               {
                  this.visibleCellRenderers[param1] = {};
               }
               this.visibleCellRenderers[param1][indexToColNum(currentColNum).toString()] = param2;
            }
         }
         super.setVisibleDataItem(param1,param2);
      }
      
      override protected function addRendererToContentArea(param1:IListItemRenderer, param2:AdvancedDataGridColumn) : void
      {
         var _loc3_:AdvancedDataGridHeaderInfo = null;
         if(this.mx_internal::columnGrouping && param1.data is AdvancedDataGridColumn)
         {
            _loc3_ = this.mx_internal::getHeaderInfo(param1.data as AdvancedDataGridColumn);
            if(Boolean(_loc3_) && _loc3_.columnSpan + _loc3_.actualColNum <= lockedColumnCount)
            {
               listContent.addChild(DisplayObject(param1));
            }
            else
            {
               mx_internal::listSubContent.addChild(DisplayObject(param1));
            }
         }
         else
         {
            super.addRendererToContentArea(param1,param2);
         }
      }
      
      override protected function mouseEventToItemRenderer(param1:MouseEvent) : IListItemRenderer
      {
         var _loc2_:IListItemRenderer = null;
         var _loc3_:Point = null;
         var _loc4_:Number = NaN;
         if(!this.mx_internal::columnGrouping)
         {
            return super.mouseEventToItemRenderer(param1);
         }
         if(param1.target == highlightIndicator || param1.target == listContent)
         {
            _loc3_ = new Point(param1.stageX,param1.stageY);
            _loc3_ = listContent.globalToLocal(_loc3_);
            _loc4_ = 0;
            _loc2_ = this.findHeaderRenderer(_loc3_);
         }
         if(!_loc2_)
         {
            _loc2_ = super.mouseEventToItemRenderer(param1);
         }
         if(param1.target == listContent && isHeaderItemRenderer(_loc2_))
         {
            return null;
         }
         return _loc2_ == itemEditorInstance ? null : _loc2_;
      }
      
      override protected function hasHeaderItemsCreated(param1:int = -1) : Boolean
      {
         if(!this.mx_internal::columnGrouping)
         {
            return super.hasHeaderItemsCreated(param1);
         }
         if(param1 == -1)
         {
            return Boolean(visibleHeaderInfos) && Boolean(visibleHeaderInfos[0].headerItem);
         }
         var _loc2_:AdvancedDataGridHeaderInfo = this.mx_internal::getHeaderInfo(this.getOptimumColumns()[param1]);
         return Boolean(_loc2_) && Boolean(_loc2_.headerItem);
      }
      
      override protected function purgeHeaderRenderers() : void
      {
         var _loc1_:IListItemRenderer = null;
         if(!this.mx_internal::columnGrouping)
         {
            super.purgeHeaderRenderers();
         }
         else if(Boolean(this.headerItemsList) && Boolean(this.headerItemsList.length))
         {
            while(this.headerItemsList.length)
            {
               _loc1_ = this.headerItemsList.pop();
               addHeaderToFreeItemRenderers(_loc1_,_loc1_.data as AdvancedDataGridColumn);
            }
         }
      }
      
      override protected function createHeaders(param1:Number, param2:Number) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:AdvancedDataGridColumn = null;
         var _loc7_:Number = NaN;
         var _loc8_:IListItemRenderer = null;
         var _loc9_:AdvancedDataGridHeaderInfo = null;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         if(!this.mx_internal::columnGrouping)
         {
            _loc3_ = false;
            if(horizontalScrollPolicy != ScrollPolicy.OFF && this.getOptimumColumns() != mx_internal::visibleColumns)
            {
               if(!headerItems[0] || !headerItems[0][0] || param2 < headerItems[0][0].y + headerItems[0][0].height)
               {
                  _loc3_ = true;
               }
            }
            super.createHeaders(param1,param2);
            if(_loc3_)
            {
               _loc3_ = false;
               _loc4_ = this.getLastColumnResidualWidth();
               _loc5_ = int(displayableColumns.length - 1);
               _loc6_ = displayableColumns[_loc5_];
               _loc7_ = isNaN(_loc6_.mx_internal::explicitWidth) ? _loc6_.mx_internal::preferredWidth : _loc6_.mx_internal::explicitWidth;
               _loc8_ = headerItems[0][_loc5_];
               if(_loc8_)
               {
                  _loc8_.explicitWidth = _loc7_ + _loc4_;
                  UIComponentGlobals.mx_internal::layoutManager.validateClient(_loc8_,true);
                  _loc8_.setActualSize(_loc7_ + _loc4_,_loc8_.height);
               }
            }
         }
         else if(Boolean(visibleHeaderInfos) && (!visibleHeaderInfos[0].headerItem || param2 < visibleHeaderInfos[0].headerItem.y + visibleHeaderInfos[0].headerItem.height))
         {
            this.purgeHeaderRenderers();
            this.headerItemsList = [];
            this.lastColumnWidth = NaN;
            this.createHeaderItems(visibleHeaderInfos);
            headerRowInfo = [];
            this.measureHeaderHeights(visibleHeaderInfos,0);
            _loc10_ = mx_internal::cachedPaddingTop + mx_internal::cachedPaddingBottom;
            _loc11_ = 0;
            _loc12_ = int(orderedHeadersList.length);
            _loc13_ = 0;
            while(_loc13_ < _loc12_)
            {
               _loc9_ = orderedHeadersList[_loc13_];
               if(_loc9_.visible)
               {
                  _loc11_ = headerRowInfo[_loc9_.depth].height - _loc10_;
                  if(_loc9_.visibleChildren)
                  {
                     _loc11_ -= headerRowInfo[_loc9_.depth + 1].height;
                  }
                  if(horizontalScrollPolicy != ScrollPolicy.OFF && !isNaN(this.lastColumnWidth) && _loc9_.column == displayableColumns[displayableColumns.length - 1])
                  {
                     _loc9_.headerItem.setActualSize(this.lastColumnWidth,_loc11_);
                  }
                  else
                  {
                     _loc9_.headerItem.setActualSize(_loc9_.column.width,_loc11_);
                  }
                  _loc9_.headerItem.visible = mx_internal::headerVisible;
               }
               _loc13_++;
            }
            this.lastColumnWidth = NaN;
            this.layoutHeaders(visibleHeaderInfos,param1,param2,0);
            currentItemTop = !!mx_internal::headerVisible ? Number(headerRowInfo[0].height) : 0;
            mx_internal::_headerHeight = !mx_internal::_explicitHeaderHeight ? Number(headerRowInfo[0].height) : Number(mx_internal::_headerHeight);
         }
      }
      
      override mx_internal function getRenderer(param1:AdvancedDataGridColumn, param2:Object, param3:Boolean = false) : IListItemRenderer
      {
         var _loc4_:IListItemRenderer = null;
         var _loc5_:IFactory = null;
         var _loc6_:AdvancedDataGridRendererDescription = null;
         if(this.rendererProviders.length != 0)
         {
            _loc6_ = this.mx_internal::getRendererDescription(param2,param1,param3);
         }
         if(Boolean(_loc6_) && Boolean(_loc6_.renderer))
         {
            if(Boolean(freeItemRenderersTable[param1]) && Boolean(freeItemRenderersTable[param1][_loc6_.renderer]) && Boolean(freeItemRenderersTable[param1][_loc6_.renderer].length))
            {
               _loc4_ = freeItemRenderersTable[param1][_loc6_.renderer].pop();
            }
            else
            {
               _loc4_ = _loc6_.renderer.newInstance();
               itemRendererToFactoryMap[_loc4_] = _loc6_.renderer;
            }
            this.rendererDescriptionMap[_loc4_] = _loc6_;
            return _loc4_;
         }
         return super.mx_internal::getRenderer(param1,param2,param3);
      }
      
      override mx_internal function getWidthOfItem(param1:IListItemRenderer, param2:AdvancedDataGridColumn, param3:int) : Number
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Array = null;
         var _loc11_:Number = NaN;
         var _loc12_:AdvancedDataGridColumn = null;
         var _loc4_:Number = 0;
         var _loc5_:AdvancedDataGridRendererDescription = this.rendererDescriptionMap[param1] as AdvancedDataGridRendererDescription;
         if((Boolean(_loc5_)) && Boolean(_loc5_.renderer))
         {
            if(_loc5_.columnSpan == 0)
            {
               _loc7_ = int(_columns.length);
               if(param3 < lockedColumnCount)
               {
                  _loc7_ = lockedColumnCount;
               }
               _loc9_ = 0;
               _loc6_ = param3;
               while(_loc6_ < _loc7_)
               {
                  _loc9_ += AdvancedDataGridColumn(_columns[_loc6_]).width;
                  _loc6_++;
               }
               _loc4_ = _loc9_;
            }
            else
            {
               _loc4_ = 0;
               _loc7_ = param3 + _loc5_.columnSpan;
               if(param3 < lockedColumnCount && _loc7_ > lockedColumnCount)
               {
                  _loc7_ = lockedColumnCount;
               }
               if(_loc7_ > displayableColumns.length)
               {
                  _loc7_ = int(displayableColumns.length);
               }
               _loc10_ = this.getOptimumColumns();
               _loc6_ = param3;
               while(_loc6_ < _loc7_)
               {
                  _loc4_ += super.mx_internal::getWidthOfItem(param1,_loc10_[_loc6_],param3);
                  _loc6_++;
               }
            }
            _loc8_ = int(displayableColumns.length - 1);
            if(horizontalScrollPolicy != ScrollPolicy.OFF && _loc8_ >= param3 && _loc8_ < _loc7_)
            {
               _loc11_ = this.getLastColumnResidualWidth();
               _loc12_ = displayableColumns[_loc8_];
               _loc4_ -= _loc12_.width;
               _loc4_ = _loc4_ + ((isNaN(_loc12_.mx_internal::explicitWidth) ? _loc12_.mx_internal::preferredWidth : _loc12_.mx_internal::explicitWidth) + this.getLastColumnResidualWidth());
            }
            return _loc4_;
         }
         if(horizontalScrollPolicy != ScrollPolicy.OFF && param2 == displayableColumns[displayableColumns.length - 1])
         {
            return (isNaN(param2.mx_internal::explicitWidth) ? param2.mx_internal::preferredWidth : param2.mx_internal::explicitWidth) + this.getLastColumnResidualWidth();
         }
         return super.mx_internal::getWidthOfItem(param1,param2,param3);
      }
      
      override protected function createHeaderSeparators(param1:int, param2:Array, param3:UIComponent) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:UIComponent = null;
         var _loc10_:IFlexDisplayObject = null;
         var _loc11_:AdvancedDataGridHeaderInfo = null;
         var _loc12_:IListItemRenderer = null;
         var _loc13_:Number = NaN;
         var _loc14_:AdvancedDataGridHeaderInfo = null;
         var _loc15_:Number = NaN;
         var _loc16_:AdvancedDataGridHeaderInfo = null;
         var _loc17_:AdvancedDataGridHeaderInfo = null;
         var _loc18_:int = 0;
         if(!this.mx_internal::columnGrouping)
         {
            super.createHeaderSeparators(param1,param2,param3);
         }
         else
         {
            _loc4_ = 3;
            _loc5_ = this.getOptimumColumns();
            _loc6_ = lockedColumnCount > 0 && param2 != lockedSeparators ? lockedColumnCount - 1 : 0;
            _loc7_ = 0;
            while(_loc7_ < param1)
            {
               _loc8_ = _loc7_ + _loc6_;
               _loc9_ = getSeparator(_loc7_,param2,param3);
               _loc10_ = IFlexDisplayObject(_loc9_.getChildAt(0));
               _loc11_ = this.mx_internal::getHeaderInfo(_loc5_[_loc8_]);
               _loc12_ = _loc11_.headerItem;
               if(!_loc11_ || !_loc11_.visible || !_loc12_)
               {
                  _loc9_.visible = false;
               }
               else
               {
                  _loc9_.visible = true;
                  _loc13_ = _loc12_.x + _loc5_[_loc8_].width - Math.round(_loc9_.measuredWidth / 2 + 0.5);
                  if(_loc7_ > 0)
                  {
                     _loc13_ = Math.max(_loc13_,param2[_loc7_ - 1].x + Math.round(_loc9_.measuredWidth / 2 + 0.5));
                  }
                  _loc9_.x = _loc13_;
                  _loc14_ = this.mx_internal::getHeaderInfo(_loc5_[_loc8_ + 1]);
                  _loc16_ = _loc11_;
                  _loc17_ = _loc14_;
                  _loc18_ = mx_internal::cachedPaddingBottom + mx_internal::cachedPaddingTop;
                  while(_loc16_ != _loc17_ && _loc16_.parent != null && _loc17_.parent != null)
                  {
                     if(_loc16_.depth > _loc17_.depth)
                     {
                        _loc16_ = _loc16_.parent;
                     }
                     else if(_loc16_.depth < _loc17_.depth)
                     {
                        _loc17_ = _loc17_.parent;
                     }
                     else
                     {
                        _loc16_ = _loc16_.parent;
                        _loc17_ = _loc17_.parent;
                     }
                  }
                  _loc9_.y = 0;
                  _loc15_ = _loc12_.y + _loc12_.height + _loc18_;
                  if(_loc16_ == _loc17_ && Boolean(_loc16_))
                  {
                     _loc9_.y = _loc16_.headerItem.y + _loc16_.headerItem.height + mx_internal::cachedPaddingBottom;
                     _loc15_ = _loc12_.y + _loc12_.height - _loc16_.headerItem.y - _loc16_.headerItem.height;
                  }
                  _loc10_.setActualSize(_loc10_.measuredWidth,_loc15_);
                  _loc9_.graphics.clear();
                  _loc9_.graphics.beginFill(16777215,0);
                  _loc9_.graphics.drawRect(-_loc4_,0,_loc10_.measuredWidth + _loc4_,_loc15_);
                  _loc9_.graphics.endFill();
               }
               _loc7_++;
            }
         }
      }
      
      override protected function setupRenderer(param1:Object, param2:String, param3:Boolean = false) : void
      {
         var _loc9_:IListItemRenderer = null;
         var _loc10_:AdvancedDataGridRendererDescription = null;
         var _loc4_:int = currentColNum;
         super.setupRenderer(param1,param2,param3);
         if(this.rendererProviders.length == 0)
         {
            return;
         }
         var _loc5_:int = int(listItems[currentRowNum].length);
         var _loc6_:int = 0;
         var _loc7_:Array = this.getOptimumColumns();
         var _loc8_:int = 0;
         while(_loc8_ < _loc5_)
         {
            _loc9_ = listItems[currentRowNum][_loc8_];
            _loc10_ = this.rendererDescriptionMap[_loc9_];
            if((Boolean(_loc10_)) && Boolean(_loc10_.renderer))
            {
               if(_loc10_.columnSpan == 0)
               {
                  _loc6_ = Math.max(_loc6_ - 1,_loc7_.length - _loc8_);
               }
               else
               {
                  _loc6_ = Math.max(_loc6_ - 1,_loc10_.columnSpan - 1);
               }
            }
            else if(_loc6_ > 0)
            {
               _loc9_.visible = false;
               _loc6_--;
            }
            _loc8_++;
         }
      }
      
      override protected function updateDisplayOfItemRenderer(param1:IListItemRenderer) : void
      {
         this.applyUserStylesForItemRenderer(param1);
         super.updateDisplayOfItemRenderer(param1);
      }
      
      override protected function drawVerticalLine(param1:Sprite, param2:int, param3:uint, param4:Number) : void
      {
         var _loc7_:IListItemRenderer = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc5_:Graphics = param1.graphics;
         if(lockedColumnCount > 0 && param2 == lockedColumnCount - 1)
         {
            _loc5_.lineStyle(1,0,100);
         }
         else
         {
            _loc5_.lineStyle(1,param3,100);
         }
         var _loc6_:Number = 0;
         if(mx_internal::headerVisible)
         {
            _loc6_ = Number(headerRowInfo[0].height);
         }
         if(this.rendererProviders.length != 0)
         {
            _loc8_ = int(listItems.length);
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               if(listItems[_loc9_].length != 0)
               {
                  _loc7_ = listItems[_loc9_][param2] as IListItemRenderer;
                  _loc6_ = rowInfo[_loc9_].y + rowInfo[_loc9_].height;
                  if(_loc7_.visible)
                  {
                     if(_loc7_.x + _loc7_.width <= param4)
                     {
                        _loc5_.moveTo(param4,rowInfo[_loc9_].y);
                        _loc5_.lineTo(param4,_loc6_);
                     }
                  }
                  else
                  {
                     _loc10_ = param2 - 1;
                     while(_loc10_ >= 0)
                     {
                        _loc7_ = listItems[_loc9_][_loc10_] as IListItemRenderer;
                        if(_loc7_.visible)
                        {
                           if(_loc7_.x + _loc7_.width <= param4)
                           {
                              _loc5_.moveTo(param4,rowInfo[_loc9_].y);
                              _loc5_.lineTo(param4,_loc6_);
                           }
                           break;
                        }
                        _loc10_--;
                     }
                  }
               }
               _loc9_++;
            }
         }
         _loc5_.moveTo(param4,_loc6_);
         _loc5_.lineTo(param4,listContent.height);
      }
      
      override mx_internal function columnItemRendererFactory(param1:AdvancedDataGridColumn, param2:Boolean, param3:Object) : IFactory
      {
         var _loc4_:IFactory = null;
         if(!param2)
         {
            if(this.mx_internal::_rootModel is IHierarchicalData && param1.mx_internal::colNum == this.treeColumnIndex)
            {
               if(!this.isBranch(param3) && Boolean(param1.itemRenderer))
               {
                  _loc4_ = param1.itemRenderer;
               }
               else if(this.groupItemRenderer)
               {
                  _loc4_ = this.groupItemRenderer;
               }
            }
         }
         if(!_loc4_)
         {
            _loc4_ = super.mx_internal::columnItemRendererFactory(param1,param2,param3);
         }
         return _loc4_;
      }
      
      override protected function getNumColumns() : int
      {
         var _loc1_:Array = null;
         if(this.mx_internal::columnGrouping)
         {
            _loc1_ = this.getOptimumColumns();
            if(!_loc1_)
            {
               return 0;
            }
            return _loc1_.length;
         }
         return super.getNumColumns();
      }
      
      override protected function getPossibleDropPositions(param1:AdvancedDataGridColumn) : Array
      {
         var _loc2_:AdvancedDataGridHeaderInfo = null;
         if(this.mx_internal::columnGrouping && param1 != null)
         {
            _loc2_ = this.mx_internal::getHeaderInfo(param1);
            if(_loc2_ && _loc2_.parent && _loc2_.parent.visibleChildren && _loc2_.parent.visibleChildren.length > 0)
            {
               return _loc2_.parent.visibleChildren;
            }
            return visibleHeaderInfos;
         }
         return super.getPossibleDropPositions(param1);
      }
      
      override mx_internal function getHeaderInfo(param1:AdvancedDataGridColumn) : AdvancedDataGridHeaderInfo
      {
         if(this.mx_internal::columnGrouping)
         {
            return this.mx_internal::columnsToInfo[itemToUID(param1)];
         }
         return super.mx_internal::getHeaderInfo(param1);
      }
      
      override mx_internal function getHeaderInfoAt(param1:int) : AdvancedDataGridHeaderInfo
      {
         if(this.mx_internal::columnGrouping)
         {
            return this.mx_internal::columnsToInfo[itemToUID(columns[param1])];
         }
         return super.mx_internal::getHeaderInfoAt(param1);
      }
      
      override protected function createChildren() : void
      {
         var _loc1_:Graphics = null;
         super.createChildren();
         if(!this.movingSelectionLayer)
         {
            this.movingSelectionLayer = new FlexSprite();
            this.movingSelectionLayer.name = "movingSelectionLayer";
            this.movingSelectionLayer.mouseEnabled = false;
            mx_internal::listSubContent.addChild(this.movingSelectionLayer);
            _loc1_ = this.movingSelectionLayer.graphics;
            _loc1_.beginFill(0,0);
            _loc1_.drawRect(0,0,10,10);
            _loc1_.endFill();
         }
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:Object = null;
         if(this.dataProviderChanged)
         {
            this.dataProviderChanged = false;
            if(this.hierarchicalCollectionInstance)
            {
               super.dataProvider = this.hierarchicalCollectionInstance;
            }
            else if(this.mx_internal::_rootModel is IHierarchicalData)
            {
               this.hierarchicalCollectionView.source = this.mx_internal::_rootModel;
               super.dataProvider = this.hierarchicalCollectionView;
            }
         }
         if(this.mx_internal::_rootModel is IGroupingCollection && Boolean(IGroupingCollection(this.mx_internal::_rootModel).grouping))
         {
            this.groupLabelField = IGroupingCollection(this.mx_internal::_rootModel).grouping.label;
         }
         if(this.mx_internal::_rootModel is IGroupingCollection2 && Boolean(IGroupingCollection2(this.mx_internal::_rootModel).grouping))
         {
            this.groupLabelField = IGroupingCollection2(this.mx_internal::_rootModel).grouping.label;
         }
         if(this.groupedColumnsChanged || this.columnsChanged)
         {
            this.anchorColumnIndex = -1;
            this.highlightColumnIndex = -1;
            this.selectedColumnIndex = -1;
         }
         if(this.groupedColumnsChanged)
         {
            this.mx_internal::columnGrouping = true;
            this.columnsChanged = false;
            this.removeOldHeaders();
            this.mx_internal::columnsToInfo = new Dictionary();
            headerInfos = this.initializeHeaderInfo(this._groupedColumns);
            headerInfoInitialized = true;
            if(lockedColumnCount > 0)
            {
               this.lockedColumnCountChanged = true;
            }
            super.columns = this.getLeafColumns(this._groupedColumns.slice(0));
         }
         else if(this.columnsChanged)
         {
            this.mx_internal::columnGrouping = false;
            this.columnsChanged = false;
            this.removeOldHeaders();
            super.columns = this._columnsValue;
         }
         if(this.displayItemsExpandedChanged)
         {
            this.displayItemsExpandedChanged = false;
            if(this.displayItemsExpanded)
            {
               this.expandAll();
            }
         }
         super.commitProperties();
         if(this.lockedColumnCountChanged)
         {
            if(this.mx_internal::columnGrouping)
            {
               super.lockedColumnCount = this.getAdjustedLockedCount(this._lockedColumnCountVal);
            }
            else
            {
               super.lockedColumnCount = this._lockedColumnCountVal;
            }
         }
         if(this.groupedColumnsChanged)
         {
            this.groupedColumnsChanged = false;
            headerInfoInitialized = false;
         }
         if(this.selectedCellsChanged)
         {
            this.mx_internal::setSelectedCells(this._temporary_selectedCells);
            this.selectedCellsChanged = false;
            this._temporary_selectedCells = null;
         }
         if(this.anchorColumnIndex != -1 && columns[this.anchorColumnIndex].visible == false)
         {
            this.anchorColumnIndex = -1;
         }
         if(this.highlightColumnIndex != -1 && columns[this.highlightColumnIndex].visible == false)
         {
            this.highlightColumnIndex = -1;
         }
         if(this.selectedColumnIndex != -1 && columns[this.selectedColumnIndex].visible == false)
         {
            this.selectedColumnIndex = -1;
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         if(this.tween)
         {
            this.tween.endTween();
         }
         if(cellsWaitingToBeDisplayed)
         {
            this.processCellsWaitingToBeDisplayed();
         }
         super.updateDisplayList(param1,param2);
         if(Boolean(mx_internal::headerVisible) && this.mx_internal::columnGrouping)
         {
            this.drawHeaderHorizontalSeparators();
         }
         else
         {
            this.clearHeaderHorizontalSeparators();
         }
         if(collection)
         {
            this.mx_internal::collectionLength = collection.length;
         }
         if(this.mx_internal::columnGrouping && Boolean(mx_internal::selectedHeaderInfo))
         {
            this.selectColumnGroupHeader(mx_internal::selectedHeaderInfo);
         }
         else if(!this.mx_internal::columnGrouping && mx_internal::headerIndex != -1)
         {
            mx_internal::selectedHeaderInfo = this.mx_internal::getHeaderInfo(columns[mx_internal::headerIndex]);
            this.selectColumnHeader(mx_internal::headerIndex);
         }
      }
      
      override public function calculateDropIndex(param1:DragEvent = null) : int
      {
         if(param1)
         {
            if(this.mx_internal::_rootModel is IHierarchicalData)
            {
               if(param1)
               {
                  this.updateDropData(param1);
               }
               return this.mx_internal::_dropData.rowIndex;
            }
         }
         return super.calculateDropIndex(param1);
      }
      
      override protected function drawRowBackgrounds() : void
      {
         var rowBGs:Sprite;
         var depthColors:Boolean;
         var n:int;
         var curRow:int;
         var i:int;
         var actualRow:int;
         var colors:Array = null;
         var color:* = undefined;
         var d:int = 0;
         colors = getStyle("depthColors");
         if(!(this.mx_internal::_rootModel is IHierarchicalData) || !colors)
         {
            super.drawRowBackgrounds();
            return;
         }
         rowBGs = Sprite(listContent.getChildByName("rowBGs"));
         if(!rowBGs)
         {
            rowBGs = new FlexSprite();
            rowBGs.mouseEnabled = false;
            rowBGs.name = "rowBGs";
            listContent.addChildAt(rowBGs,0);
         }
         depthColors = false;
         n = int(listItems.length);
         if(colors)
         {
            depthColors = true;
         }
         else
         {
            colors = getStyle("alternatingItemColors");
         }
         color = getStyle("backgroundColor");
         if(color === undefined)
         {
            color = 16777215;
         }
         if(!colors || colors.length == 0)
         {
            while(rowBGs.numChildren > n)
            {
               rowBGs.removeChildAt(rowBGs.numChildren - 1);
            }
            return;
         }
         styleManager.getColorNames(colors);
         curRow = 0;
         i = 0;
         actualRow = verticalScrollPosition;
         while(curRow < n)
         {
            if(depthColors)
            {
               try
               {
                  if(listItems[curRow][0])
                  {
                     d = this.mx_internal::getItemDepth(listItems[curRow][0].data,curRow);
                     drawRowBackground(rowBGs,i++,rowInfo[curRow].y,rowInfo[curRow].height,colors[d - 1],curRow);
                  }
                  else
                  {
                     drawRowBackground(rowBGs,i++,rowInfo[curRow].y,rowInfo[curRow].height,uint(color),curRow);
                  }
               }
               catch(e:Error)
               {
               }
            }
            else
            {
               drawRowBackground(rowBGs,i++,rowInfo[curRow].y,rowInfo[curRow].height,colors[actualRow % colors.length],actualRow);
            }
            curRow++;
            actualRow++;
         }
         while(rowBGs.numChildren > i)
         {
            rowBGs.removeChildAt(rowBGs.numChildren - 1);
         }
      }
      
      override protected function isDraggingAllowed(param1:AdvancedDataGridColumn) : Boolean
      {
         var _loc2_:AdvancedDataGridHeaderInfo = null;
         if(!param1.draggable)
         {
            return false;
         }
         if(this.mx_internal::columnGrouping)
         {
            _loc2_ = this.mx_internal::getHeaderInfo(param1).parent;
            if(Boolean(_loc2_) && (_loc2_.column as AdvancedDataGridColumnGroup).childrenDragEnabled == false)
            {
               return false;
            }
         }
         return true;
      }
      
      override protected function columnDraggingMouseUpHandler(param1:Event) : void
      {
         if(!this.mx_internal::columnGrouping)
         {
            super.columnDraggingMouseUpHandler(param1);
            return;
         }
         if(!movingColumn)
         {
            return;
         }
         var _loc2_:AdvancedDataGridHeaderInfo = this.mx_internal::getHeaderInfo(movingColumn);
         var _loc3_:int = _loc2_.index;
         var _loc4_:Array = this.getPossibleDropPositions(movingColumn);
         var _loc5_:int = int(_loc4_.length);
         if(dropColumnIndex >= 0)
         {
            if(dropColumnIndex >= _loc5_)
            {
               dropColumnIndex = _loc5_ - 1;
            }
            else if(_loc3_ < dropColumnIndex)
            {
               --dropColumnIndex;
            }
            dropColumnIndex = _loc4_[dropColumnIndex].index;
         }
         this.mx_internal::shiftColumns(_loc3_,dropColumnIndex,param1);
         unsetColumnDragParameters();
      }
      
      override protected function dragEnterHandler(param1:DragEvent) : void
      {
         if(isCellSelectionMode())
         {
            return;
         }
         if(!(this.mx_internal::_rootModel is IHierarchicalData) && (Boolean(param1.dragSource.hasFormat("items")) || Boolean(param1.dragSource.hasFormat("itemsByIndex"))))
         {
            super.dragEnterHandler(param1);
            return;
         }
         if(param1.isDefaultPrevented())
         {
            return;
         }
         mx_internal::lastDragEvent = param1;
         if((!this.mx_internal::_rootModel || this.mx_internal::_rootModel is IHierarchicalData) && Boolean(param1.dragSource.hasFormat("treeDataGridItems")))
         {
            DragManager.acceptDragDrop(this);
            DragManager.showFeedback(!!param1.ctrlKey ? DragManager.COPY : DragManager.MOVE);
            this.showDropFeedback(param1);
            return;
         }
         hideDropFeedback(param1);
         DragManager.showFeedback(DragManager.NONE);
      }
      
      override protected function dragOverHandler(param1:DragEvent) : void
      {
         if(isCellSelectionMode())
         {
            return;
         }
         if(!(this.mx_internal::_rootModel is IHierarchicalData) && (Boolean(param1.dragSource.hasFormat("items")) || Boolean(param1.dragSource.hasFormat("itemsByIndex"))))
         {
            super.dragOverHandler(param1);
            return;
         }
         if(param1.isDefaultPrevented())
         {
            return;
         }
         mx_internal::lastDragEvent = param1;
         if((!this.mx_internal::_rootModel || this.mx_internal::_rootModel is IHierarchicalData) && Boolean(param1.dragSource.hasFormat("treeDataGridItems")))
         {
            DragManager.showFeedback(!!param1.ctrlKey ? DragManager.COPY : DragManager.MOVE);
            this.showDropFeedback(param1);
            return;
         }
         hideDropFeedback(param1);
         DragManager.showFeedback(DragManager.NONE);
      }
      
      override protected function dragDropHandler(param1:DragEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(isCellSelectionMode())
         {
            return;
         }
         if(!(this.mx_internal::_rootModel is IHierarchicalData) && (Boolean(param1.dragSource.hasFormat("items")) || Boolean(param1.dragSource.hasFormat("itemsByIndex"))))
         {
            super.dragDropHandler(param1);
            return;
         }
         if(param1.isDefaultPrevented())
         {
            return;
         }
         hideDropFeedback(param1);
         if((!this.mx_internal::_rootModel || this.mx_internal::_rootModel is IHierarchicalData) && Boolean(param1.dragSource.hasFormat("treeDataGridItems")))
         {
            if(param1.action == DragManager.MOVE && dragMoveEnabled)
            {
               _loc2_ = param1.dragSource.dataForFormat("treeDataGridItems") as Array;
               if(param1.dragInitiator == this)
               {
                  this.calculateDropIndex(param1);
                  _loc6_ = this.getParentStack(this.mx_internal::_dropData.parent);
                  _loc6_.unshift(this.mx_internal::_dropData.parent);
                  _loc7_ = int(_loc2_.length);
                  _loc8_ = 0;
                  while(_loc8_ < _loc7_)
                  {
                     _loc4_ = this.getParentItem(_loc2_[_loc8_]);
                     _loc3_ = this.getChildIndexInParent(_loc4_,_loc2_[_loc8_]);
                     for each(_loc5_ in _loc6_)
                     {
                        if(_loc2_[_loc8_] == _loc5_)
                        {
                           return;
                        }
                     }
                     this.mx_internal::removeChildItem(_loc4_,_loc2_[_loc8_],_loc3_);
                     if(_loc4_ == this.mx_internal::_dropData.parent && _loc3_ < this.mx_internal::_dropData.index)
                     {
                        this.mx_internal::addChildItem(this.mx_internal::_dropData.parent,_loc2_[_loc8_],this.mx_internal::_dropData.index - _loc8_ - 1);
                     }
                     else
                     {
                        this.mx_internal::addChildItem(this.mx_internal::_dropData.parent,_loc2_[_loc8_],this.mx_internal::_dropData.index);
                     }
                     _loc8_++;
                  }
               }
            }
         }
         mx_internal::lastDragEvent = null;
      }
      
      override protected function dragCompleteHandler(param1:DragEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(isCellSelectionMode())
         {
            return;
         }
         if(!(this.mx_internal::_rootModel is IHierarchicalData) && (Boolean(param1.dragSource.hasFormat("items")) || Boolean(param1.dragSource.hasFormat("itemsByIndex"))))
         {
            super.dragCompleteHandler(param1);
            return;
         }
         mx_internal::isPressed = false;
         if(param1.isDefaultPrevented())
         {
            return;
         }
         mx_internal::resetDragScrolling();
         if((!this.mx_internal::_rootModel || this.mx_internal::_rootModel is IHierarchicalData) && Boolean(param1.dragSource.hasFormat("treeDataGridItems")))
         {
            if(param1.action == DragManager.MOVE && dragMoveEnabled)
            {
               if(param1.relatedObject != this)
               {
                  _loc2_ = param1.dragSource.dataForFormat("treeDataGridItems") as Array;
                  _loc5_ = int(_loc2_.length);
                  _loc6_ = 0;
                  while(_loc6_ < _loc5_)
                  {
                     _loc3_ = this.getParentItem(_loc2_[_loc6_]);
                     _loc4_ = this.getChildIndexInParent(_loc3_,_loc2_[_loc6_]);
                     this.mx_internal::removeChildItem(_loc3_,_loc2_[_loc6_],_loc4_);
                     _loc6_++;
                  }
                  this.addItemsToTarget(param1,_loc2_);
               }
               clearSelected(false);
            }
            else if(param1.action == DragManager.COPY)
            {
               if(param1.relatedObject != this)
               {
                  _loc2_ = param1.dragSource.dataForFormat("treeDataGridItems") as Array;
                  this.addItemsToTarget(param1,_loc2_);
               }
               clearSelected(false);
            }
         }
         mx_internal::lastDragEvent = null;
      }
      
      override protected function initializeHeaderInfo(param1:Array) : Array
      {
         if(!this.mx_internal::columnGrouping)
         {
            return super.initializeHeaderInfo(param1);
         }
         return this.initializeGroupedHeaderInfo(param1,null,0,null);
      }
      
      override protected function createDisplayableColumns() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(!this.mx_internal::columnGrouping)
         {
            super.createDisplayableColumns();
         }
         else
         {
            displayableColumns = [];
            _loc2_ = int(_columns.length);
            _loc1_ = 0;
            while(_loc1_ < _loc2_)
            {
               if(this.mx_internal::getHeaderInfo(_columns[_loc1_]).visible)
               {
                  displayableColumns.push(_columns[_loc1_]);
               }
               _loc1_++;
            }
         }
      }
      
      override protected function updateVisibleHeaders() : Array
      {
         if(!this.mx_internal::columnGrouping)
         {
            return super.updateVisibleHeaders();
         }
         return this.updateVisibleHeaderInfos(headerInfos).infos;
      }
      
      override protected function updateHeaderSearchList() : void
      {
         orderedHeadersList = [];
         this.updateHeadersList(visibleHeaderInfos);
      }
      
      override protected function calculateHeaderHeight() : Number
      {
         if(!this.mx_internal::columnGrouping)
         {
            return super.calculateHeaderHeight();
         }
         this.isMeasuringHeader = true;
         this.createHeaders(0,0);
         this.isMeasuringHeader = false;
         return headerHeight;
      }
      
      override public function showDropFeedback(param1:DragEvent) : void
      {
         var _loc5_:int = 0;
         if(!(this.mx_internal::_rootModel is IHierarchicalData))
         {
            super.showDropFeedback(param1);
            return;
         }
         super.showDropFeedback(param1);
         var _loc2_:EdgeMetrics = viewMetrics;
         var _loc3_:int = 0;
         this.updateDropData(param1);
         var _loc4_:int = 0;
         if(this.mx_internal::_dropData.parent)
         {
            _loc3_ = this.getItemIndex(iterator.current);
            _loc5_ = this.mx_internal::getItemDepth(this.mx_internal::_dropData.parent,Math.abs(_loc3_ - this.getItemIndex(this.mx_internal::_dropData.parent)));
            _loc4_ = (_loc5_ + 1) * getStyle("indentation");
         }
         else
         {
            _loc4_ = int(getStyle("indentation"));
         }
         if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
         mx_internal::dropIndicator.width = listContent.width - _loc4_;
         mx_internal::dropIndicator.x = _loc4_ + _loc2_.left + 2;
         if(this.mx_internal::_dropData.emptyFolder)
         {
            mx_internal::dropIndicator.y += this.mx_internal::_dropData.rowHeight / 2;
         }
      }
      
      override protected function addDragData(param1:Object) : void
      {
         if(this.mx_internal::_rootModel is IHierarchicalData)
         {
            param1.addHandler(this.collapseSelectedItems,"treeDataGridItems");
         }
         else
         {
            super.addDragData(param1);
         }
      }
      
      override protected function layoutItemEditor() : void
      {
         var _loc1_:int = 0;
         if(this.mx_internal::_rootModel is IHierarchicalData)
         {
            _loc1_ = int(rowMap[editedItemRenderer.name].indent);
            itemEditorInstance.move(itemEditorInstance.x + _loc1_,itemEditorInstance.y);
            itemEditorInstance.setActualSize(itemEditorInstance.width - _loc1_,itemEditorInstance.height);
         }
      }
      
      override protected function selectColumnHeader(param1:int) : void
      {
         if(!this.mx_internal::columnGrouping || mx_internal::selectedHeaderInfo == null)
         {
            super.selectColumnHeader(param1);
         }
         else
         {
            this.selectColumnGroupHeader(mx_internal::selectedHeaderInfo);
         }
      }
      
      override public function createItemEditor(param1:int, param2:int) : void
      {
         var _loc3_:AdvancedDataGridColumn = null;
         if(this.mx_internal::_rootModel is IHierarchicalData && param1 == this.treeColumnIndex)
         {
            _loc3_ = displayableColumns[param1];
            if(_loc3_.editorXOffset == 0 || _loc3_.editorWidthOffset == 0)
            {
               _loc3_.editorXOffset = 12;
               _loc3_.editorWidthOffset = -12;
            }
         }
         super.createItemEditor(param1,param2);
      }
      
      override protected function adjustAfterRemove(param1:Array, param2:int, param3:Boolean) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc4_:Boolean = param3;
         if(isCellSelectionMode())
         {
            _loc5_ = int(param1.length);
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc7_ = UIDUtil.getUID(param1[_loc6_]);
               if(this.mx_internal::cellSelectionData[_loc7_])
               {
                  for(_loc8_ in this.mx_internal::cellSelectionData[_loc7_])
                  {
                     this.removeCellIndicators(_loc7_,int(_loc8_));
                     this.removeCellSelectionData(_loc7_,int(_loc8_));
                     _loc4_ = true;
                  }
               }
               _loc6_++;
            }
         }
         else
         {
            _loc9_ = int(selectedItems.length);
            _loc10_ = int(param1.length);
            if(mx_internal::_selectedIndex > param2)
            {
               mx_internal::_selectedIndex -= _loc10_;
               _loc4_ = true;
            }
            if(this.bSelectedItemRemoved && _loc9_ < 1)
            {
               mx_internal::_selectedIndex = this.getItemIndex(this.expandedItem);
               _loc4_ = true;
               mx_internal::bSelectionChanged = true;
               mx_internal::bSelectedIndexChanged = true;
               invalidateDisplayList();
            }
         }
         return _loc4_;
      }
      
      override protected function makeListData(param1:Object, param2:String, param3:int, param4:int, param5:AdvancedDataGridColumn) : BaseListData
      {
         var _loc6_:String = null;
         var _loc7_:AdvancedDataGridListData = null;
         if(param1 is AdvancedDataGridColumnGroup)
         {
            return new AdvancedDataGridListData(param5.headerText != null ? param5.headerText : "",param1.dataField,-1,param2,this,param3);
         }
         if(!(param1 is AdvancedDataGridColumn))
         {
            if(this.groupItemRenderer && this.isBranch(param1) && param5.mx_internal::colNum == this.treeColumnIndex)
            {
               if(this.groupLabelFunction != null)
               {
                  _loc6_ = this.groupLabelFunction(param1,param5);
               }
               else if(this.groupLabelField != null && Boolean(param1.hasOwnProperty(this.groupLabelField)))
               {
                  _loc6_ = param1[this.groupLabelField];
               }
               if(_loc6_)
               {
                  _loc7_ = new AdvancedDataGridListData(_loc6_,param5.dataField,param4,param2,this,param3);
               }
            }
         }
         if(!_loc7_)
         {
            _loc7_ = super.makeListData(param1,param2,param3,param4,param5) as AdvancedDataGridListData;
         }
         if(iterator && iterator is HierarchicalCollectionViewCursor && param4 == this.treeColumnIndex && !(param1 is AdvancedDataGridColumn))
         {
            this.initListData(param1,_loc7_);
         }
         else
         {
            _loc7_.item = param1;
         }
         return _loc7_;
      }
      
      override public function itemToIcon(param1:Object) : Class
      {
         var open:Boolean;
         var branch:Boolean;
         var uid:String;
         var iconClass:Class;
         var icon:* = undefined;
         var item:Object = param1;
         if(item == null)
         {
            return null;
         }
         open = this.isItemOpen(item);
         branch = this.isBranch(item);
         uid = itemToUID(item);
         iconClass = Boolean(this.itemIcons) && Boolean(this.itemIcons[uid]) ? this.itemIcons[uid][open ? "iconID2" : "iconID"] : null;
         if(iconClass)
         {
            return iconClass;
         }
         if(iconFunction != null)
         {
            return iconFunction(item);
         }
         if(branch)
         {
            return getStyle(open ? "folderOpenIcon" : "folderClosedIcon");
         }
         if(item is XML)
         {
            try
            {
               if(item[iconField].length() != 0)
               {
                  icon = String(item[iconField]);
               }
            }
            catch(e:Error)
            {
            }
         }
         else if(item is Object)
         {
            try
            {
               if(Boolean(iconField) && Boolean(item[iconField]))
               {
                  icon = item[iconField];
               }
               else if(item.icon)
               {
                  icon = item.icon;
               }
            }
            catch(e:Error)
            {
            }
         }
         if(icon == null)
         {
            icon = getStyle("defaultLeafIcon");
         }
         if(icon is Class)
         {
            return icon;
         }
         if(icon is String)
         {
            iconClass = Class(systemManager.getDefinitionByName(String(icon)));
            if(iconClass)
            {
               return iconClass;
            }
            return document[icon];
         }
         return Class(icon);
      }
      
      override public function isItemVisible(param1:Object) : Boolean
      {
         var _loc3_:String = null;
         if(visibleData[itemToUID(param1)])
         {
            return true;
         }
         var _loc2_:Object = this.getParentItem(param1);
         if(_loc2_)
         {
            _loc3_ = itemToUID(_loc2_);
            if(Boolean(visibleData[_loc3_]) && Boolean(IHierarchicalCollectionView(collection).openNodes[_loc3_]))
            {
               return true;
            }
         }
         return false;
      }
      
      override protected function isDataEditable(param1:Object) : Boolean
      {
         if(Boolean(this.mx_internal::_rootModel) && (this.mx_internal::_rootModel is IGroupingCollection || this.mx_internal::_rootModel is IGroupingCollection2))
         {
            if(this.mx_internal::_rootModel.hasChildren(param1))
            {
               return editable.indexOf("group") != -1;
            }
            if(param1 is SummaryObject)
            {
               return editable.indexOf("summary") != -1;
            }
         }
         return editable.indexOf("item") != -1;
      }
      
      override mx_internal function addClipMask(param1:Boolean) : void
      {
         var _loc3_:Boolean = false;
         var _loc2_:EdgeMetrics = viewMetrics;
         if(Boolean(horizontalScrollBar) && Boolean(horizontalScrollBar.visible))
         {
            _loc2_.bottom -= horizontalScrollBar.minHeight;
         }
         if(Boolean(verticalScrollBar) && Boolean(verticalScrollBar.visible))
         {
            _loc2_.right -= verticalScrollBar.minWidth;
         }
         if(verticalScrollBar && verticalScrollBar.visible && horizontalScrollBar && Boolean(horizontalScrollBar.visible))
         {
            _loc2_.right += verticalScrollBar.minWidth;
         }
         listContent.scrollRect = new Rectangle(0,0,unscaledWidth - _loc2_.left - _loc2_.right,listContent.height);
      }
      
      override mx_internal function shiftColumns(param1:int, param2:int, param3:Event = null) : void
      {
         var _loc4_:AdvancedDataGridHeaderInfo = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Array = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:IndexChangedEvent = null;
         var _loc17_:int = 0;
         var _loc18_:AdvancedDataGridColumn = null;
         var _loc19_:AdvancedDataGridHeaderInfo = null;
         if(param2 >= 0 && param1 != param2)
         {
            if(!this.mx_internal::columnGrouping)
            {
               super.mx_internal::shiftColumns(param1,param2,param3);
            }
            else
            {
               _loc4_ = this.mx_internal::getHeaderInfo(movingColumn);
               this.updateMovingColumnIndex();
               _loc5_ = !!_loc4_.parent ? _loc4_.parent.children : headerInfos;
               _loc6_ = _loc4_.parent == null ? this.groupedColumns : (_loc4_.parent.column as AdvancedDataGridColumnGroup).children;
               _loc8_ = [];
               _loc9_ = 0;
               if(param2 >= 0 && param1 != param2)
               {
                  _loc12_ = param1 < param2 ? 1 : -1;
                  _loc10_ = param1;
                  while(_loc10_ != param2)
                  {
                     _loc17_ = _loc10_ + _loc12_;
                     _loc18_ = _loc6_[_loc10_];
                     _loc6_[_loc10_] = _loc6_[_loc17_];
                     _loc6_[_loc17_] = _loc18_;
                     _loc5_[_loc10_].actualColNum += _loc5_[_loc17_].columnSpan * _loc12_;
                     _loc5_[_loc17_].actualColNum -= _loc5_[_loc10_].columnSpan * _loc12_;
                     if(Boolean(_loc5_[_loc10_].children) && _loc5_[_loc10_].children.length > 0)
                     {
                        _loc11_ = _loc5_[_loc17_].columnSpan * _loc12_;
                        _loc7_ = 0;
                        while(_loc7_ < _loc5_[_loc10_].children.length)
                        {
                           _loc8_.push(_loc5_[_loc10_].children[_loc7_]);
                           _loc7_++;
                        }
                        while(_loc8_[_loc9_])
                        {
                           _loc4_ = _loc8_[_loc9_++];
                           _loc4_.actualColNum += _loc11_;
                           if(Boolean(_loc4_) && Boolean(_loc4_.children))
                           {
                              _loc7_ = 0;
                              while(_loc7_ < _loc4_.children.length)
                              {
                                 _loc8_.push(_loc4_.children[_loc7_]);
                                 _loc7_++;
                              }
                           }
                        }
                     }
                     if(Boolean(_loc5_[_loc17_].children) && _loc5_[_loc17_].children.length > 0)
                     {
                        _loc8_ = [];
                        _loc9_ = 0;
                        _loc11_ = _loc5_[_loc10_].columnSpan * _loc12_;
                        _loc7_ = 0;
                        while(_loc7_ < _loc5_[_loc17_].children.length)
                        {
                           _loc8_.push(_loc5_[_loc17_].children[_loc7_]);
                           _loc7_++;
                        }
                        while(_loc8_[_loc9_])
                        {
                           _loc4_ = _loc8_[_loc9_++];
                           _loc4_.actualColNum -= _loc11_;
                           if(Boolean(_loc4_) && Boolean(_loc4_.children))
                           {
                              _loc7_ = 0;
                              while(_loc7_ < _loc4_.children.length)
                              {
                                 _loc8_.push(_loc4_.children[_loc7_]);
                                 _loc7_++;
                              }
                           }
                        }
                     }
                     _loc19_ = _loc5_[_loc10_];
                     _loc5_[_loc10_] = _loc5_[_loc17_];
                     _loc5_[_loc17_] = _loc19_;
                     _loc5_[_loc10_].index -= _loc12_;
                     _loc5_[_loc17_].index += _loc12_;
                     _loc10_ += _loc12_;
                  }
                  _loc13_ = this.getLeafColumns(this.groupedColumns);
                  _columns = [];
                  _loc14_ = int(_loc13_.length);
                  _loc10_ = 0;
                  while(_loc10_ < _loc14_)
                  {
                     _columns[_loc10_] = _loc13_[_loc10_];
                     _columns[_loc10_].colNum = _loc10_;
                     _loc10_++;
                  }
                  visibleHeaderInfos = this.updateVisibleHeaders();
                  this.updateHeaderSearchList();
                  this.createDisplayableColumns();
                  _loc15_ = this.getAdjustedLockedCount(this._lockedColumnCountVal);
                  if(lockedColumnCount != _loc15_)
                  {
                     this.lockedColumnCountChanged = true;
                     super.lockedColumnCount = _loc15_;
                  }
                  mx_internal::columnsInvalid = true;
                  itemsSizeChanged = true;
                  invalidateDisplayList();
                  _loc16_ = new IndexChangedEvent(IndexChangedEvent.HEADER_SHIFT);
                  _loc16_.oldIndex = param1;
                  _loc16_.newIndex = param2;
                  _loc16_.triggerEvent = param3;
                  dispatchEvent(_loc16_);
               }
            }
            if(isCellSelectionMode())
            {
               this.clearSelectedCells();
            }
         }
      }
      
      override public function getFieldSortInfo(param1:AdvancedDataGridColumn) : SortInfo
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         if(!sortExpertMode && Boolean(this.visualSortInfo[param1.mx_internal::colNum]))
         {
            return this.visualSortInfo[param1.mx_internal::colNum];
         }
         var _loc2_:AdvancedDataGridHeaderInfo = this.mx_internal::getHeaderInfo(param1);
         if(this.mx_internal::columnGrouping && param1 && collection && collection.sort && _loc2_.internalLabelFunction != null)
         {
            _loc3_ = int(collection.sort.fields.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = itemToUID(param1);
               if((Boolean(_loc5_)) && collection.sort.fields[_loc4_].name == _loc5_)
               {
                  return new SortInfo(_loc4_ + 1,collection.sort.fields[_loc4_].descending);
               }
               _loc4_++;
            }
            return null;
         }
         return super.getFieldSortInfo(param1);
      }
      
      override protected function unselectColumnHeader(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:Sprite = Sprite(selectionLayer.getChildByName("headerKeyboardSelection"));
         if(!_loc3_)
         {
            _loc3_ = Sprite(this.movingSelectionLayer.getChildByName("headerKeyboardSelection"));
         }
         if(_loc3_)
         {
            _loc3_.parent.removeChild(_loc3_);
         }
         mx_internal::selectedHeaderInfo = null;
         if(param2)
         {
            caretIndex = 0;
            mx_internal::isPressed = false;
            if(isCellSelectionMode())
            {
               this.caretColumnIndex = param1;
               this.selectItem(listItems[caretIndex][absoluteToVisibleColumnIndex(param1)],false,false);
            }
            else
            {
               this.selectItem(listItems[caretIndex][0],false,false);
            }
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         if(param1 == "sortFontFamily" || param1 == "sortFontSize" || param1 == "sortFontStyle" || param1 == "sortFontWeight")
         {
            itemsSizeChanged = true;
            rendererChanged = true;
            invalidateProperties();
            invalidateDisplayList();
         }
      }
      
      override protected function removeIndicators(param1:String) : void
      {
         var _loc2_:String = null;
         if(isCellSelectionMode())
         {
            for(_loc2_ in this.mx_internal::cellSelectionIndicators[param1])
            {
               this.removeCellIndicators(param1,int(_loc2_));
            }
            for(_loc2_ in this.visibleCellRenderers[param1])
            {
               delete this.visibleCellRenderers[param1][_loc2_];
            }
            delete this.visibleCellRenderers[param1];
         }
         super.removeIndicators(param1);
      }
      
      override protected function moveIndicators(param1:String, param2:int, param3:Boolean) : void
      {
         var _loc4_:String = null;
         if(!param1)
         {
            return;
         }
         if(!param3 && param2 == 0)
         {
            return;
         }
         if(isCellSelectionMode())
         {
            if(this.mx_internal::cellSelectionIndicators[param1])
            {
               for(_loc4_ in this.mx_internal::cellSelectionIndicators[param1])
               {
                  if(param3)
                  {
                     this.mx_internal::cellSelectionIndicators[param1][_loc4_].y = param2;
                  }
                  else
                  {
                     this.mx_internal::cellSelectionIndicators[param1][_loc4_].y += param2;
                  }
               }
            }
         }
         else
         {
            super.moveIndicators(param1,param2,param3);
         }
      }
      
      override mx_internal function clearHighlight(param1:IListItemRenderer) : void
      {
         var _loc2_:String = null;
         var _loc3_:AdvancedDataGridColumn = null;
         var _loc4_:int = 0;
         if(isCellSelectionMode())
         {
            _loc2_ = itemToUID(param1.data);
            _loc3_ = columnMap[param1.name];
            if(_loc3_)
            {
               _loc4_ = _loc3_.mx_internal::colNum;
               this.drawCellItem(param1,Boolean(this.mx_internal::cellSelectionData[_loc2_]) && Boolean(this.mx_internal::cellSelectionData[_loc2_][_loc4_]),false,caretUID == _loc2_ && this.caretColumnIndex == _loc4_);
            }
         }
         super.mx_internal::clearHighlight(param1);
      }
      
      override protected function selectData(param1:String, param2:Object, param3:int, param4:CursorBookmark) : void
      {
         var _loc5_:int = 0;
         if(isCellSelectionMode())
         {
            _loc5_ = this.selectedColumnIndex;
            if(!this.mx_internal::cellSelectionData[param1] || !this.mx_internal::cellSelectionData[param1][_loc5_])
            {
               if(Boolean(this.mx_internal::cellSelectionIndicators[param1]) && Boolean(this.mx_internal::cellSelectionIndicators[param1][_loc5_]))
               {
                  this.selectCellItem(this.mx_internal::cellSelectionData[param1][_loc5_],false,false);
               }
               else
               {
                  this.clearSelectedCells();
                  this.addCellSelectionData(param1,_loc5_,new AdvancedDataGridBaseSelectionData(param2,param3,_loc5_,false));
                  this.selectedColumnIndex = this.caretColumnIndex = this.anchorColumnIndex = _loc5_;
                  mx_internal::_selectedIndex = caretIndex = anchorIndex = param3;
                  caretBookmark = anchorBookmark = param4;
               }
            }
         }
         else
         {
            super.selectData(param1,param2,param3,param4);
         }
      }
      
      override protected function clearAllSelection() : void
      {
         if(isCellSelectionMode())
         {
            this.clearSelectedCells();
            this.clearCellIndicators();
         }
         super.clearAllSelection();
      }
      
      override protected function itemRendererToIndices(param1:IListItemRenderer) : Point
      {
         if(isHeaderItemRenderer(param1))
         {
            return null;
         }
         var _loc2_:Point = super.itemRendererToIndices(param1);
         if(_loc2_ && this.getOptimumColumns() != mx_internal::visibleColumns && _loc2_.x >= lockedColumnCount)
         {
            _loc2_.x -= horizontalScrollPosition;
         }
         return _loc2_;
      }
      
      override protected function getOptimumColumns() : Array
      {
         if(this.rendererProviders.length > 0 && horizontalScrollPolicy != ScrollPolicy.OFF || this.mx_internal::columnGrouping)
         {
            return displayableColumns;
         }
         return super.getOptimumColumns();
      }
      
      override protected function getRowHeight(param1:Object = null) : Number
      {
         if(this.groupRowHeight > 0 && this.dataProvider is IHierarchicalCollectionView && this.mx_internal::_rootModel.hasChildren(param1))
         {
            return this.groupRowHeight;
         }
         return super.getRowHeight();
      }
      
      override mx_internal function getMeasuringRenderer(param1:AdvancedDataGridColumn, param2:Boolean, param3:Object) : IListItemRenderer
      {
         var _loc4_:AdvancedDataGridRendererDescription = null;
         var _loc5_:IFactory = null;
         var _loc6_:IListItemRenderer = null;
         if(!param2)
         {
            if(this.rendererProviders.length != 0)
            {
               _loc4_ = this.mx_internal::getRendererDescription(param3,param1,false);
               if((Boolean(_loc4_)) && Boolean(_loc4_.renderer))
               {
                  _loc5_ = _loc4_.renderer;
                  _loc6_ = measuringObjects[_loc5_];
                  if(!_loc6_)
                  {
                     _loc6_ = _loc4_.renderer.newInstance();
                     _loc6_.visible = false;
                     _loc6_.styleName = param1;
                     listContent.addChild(DisplayObject(_loc6_));
                     measuringObjects[_loc5_] = _loc6_;
                  }
                  return _loc6_;
               }
            }
         }
         return super.mx_internal::getMeasuringRenderer(param1,param2,param3);
      }
      
      protected function isBranch(param1:Object) : Boolean
      {
         if(Boolean(this.mx_internal::_rootModel) && param1 != null)
         {
            return this.mx_internal::_rootModel.canHaveChildren(param1);
         }
         return false;
      }
      
      mx_internal function getChildren(param1:Object, param2:Object) : ICollectionView
      {
         return IHierarchicalCollectionView(collection).getChildren(param1);
      }
      
      mx_internal function getItemDepth(param1:Object, param2:int) : int
      {
         if(!collection)
         {
            return 0;
         }
         if(!iterator)
         {
            iterator = collection.createCursor();
         }
         return this.getDepth(param1);
      }
      
      protected function getDepth(param1:Object) : int
      {
         if(this.mx_internal::_rootModel is IHierarchicalData && collection is IHierarchicalCollectionView)
         {
            return IHierarchicalCollectionView(this.dataProvider).getNodeDepth(param1);
         }
         return -1;
      }
      
      public function setItemIcon(param1:Object, param2:Class, param3:Class) : void
      {
         if(!this.itemIcons)
         {
            this.itemIcons = {};
         }
         if(!param3)
         {
            param3 = param2;
         }
         this.itemIcons[itemToUID(param1)] = {
            "iconID":param2,
            "iconID2":param3
         };
         itemsSizeChanged = true;
         invalidateDisplayList();
      }
      
      private function getVisibleChildrenCount(param1:Object) : int
      {
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:int = 0;
         if(param1 == null)
         {
            return _loc2_;
         }
         var _loc3_:String = itemToUID(param1);
         if(IHierarchicalCollectionView(collection).openNodes[_loc3_] && this.mx_internal::_rootModel.canHaveChildren(param1) && this.mx_internal::_rootModel.hasChildren(param1))
         {
            _loc4_ = this.mx_internal::getChildren(param1,iterator.view);
         }
         if(_loc4_ != null)
         {
            _loc5_ = int(_loc4_.length);
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc2_++;
               _loc3_ = itemToUID(_loc4_[_loc6_]);
               if(IHierarchicalCollectionView(collection).openNodes[_loc3_])
               {
                  _loc2_ += this.getVisibleChildrenCount(_loc4_[_loc6_]);
               }
               _loc6_++;
            }
         }
         return _loc2_;
      }
      
      public function isItemOpen(param1:Object) : Boolean
      {
         var _loc2_:String = itemToUID(param1);
         return IHierarchicalCollectionView(collection).openNodes[_loc2_] != null;
      }
      
      private function makeMask() : DisplayObject
      {
         var _loc1_:Shape = new FlexShape();
         _loc1_.name = "mask";
         var _loc2_:Graphics = _loc1_.graphics;
         _loc2_.beginFill(16777215);
         _loc2_.moveTo(0,0);
         _loc2_.lineTo(0,10);
         _loc2_.lineTo(10,10);
         _loc2_.lineTo(10,0);
         _loc2_.lineTo(0,0);
         _loc2_.endFill();
         listContent.addChild(_loc1_);
         return _loc1_;
      }
      
      public function expandItem(param1:Object, param2:Boolean, param3:Boolean = false, param4:Boolean = false, param5:Event = null) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:BaseListData = null;
         var _loc13_:DisplayObject = null;
         var _loc18_:Object = null;
         var _loc22_:Array = null;
         var _loc23_:IListItemRenderer = null;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:int = 0;
         var _loc30_:Number = NaN;
         var _loc31_:AdvancedDataGridColumn = null;
         var _loc32_:Array = null;
         var _loc33_:Function = null;
         var _loc34_:IDropInListItemRenderer = null;
         var _loc35_:AdvancedDataGridListData = null;
         var _loc36_:Object = null;
         var _loc37_:ListRowInfo = null;
         var _loc38_:Boolean = false;
         var _loc39_:Boolean = false;
         var _loc40_:Number = NaN;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc43_:Number = NaN;
         var _loc44_:Number = NaN;
         var _loc45_:int = 0;
         var _loc46_:Array = null;
         var _loc47_:int = 0;
         var _loc48_:Object = null;
         var _loc49_:int = 0;
         var _loc50_:int = 0;
         var _loc51_:String = null;
         var _loc52_:Object = null;
         var _loc53_:IListItemRenderer = null;
         if(iterator == null)
         {
            return;
         }
         if(param5)
         {
            this.lastUserInteraction = param5;
         }
         this.expandedItem = param1;
         listContent.mx_internal::allowItemSizeChangeNotification = false;
         mx_internal::listSubContent.mx_internal::allowItemSizeChangeNotification = false;
         var _loc8_:* = false;
         var _loc9_:* = false;
         var _loc10_:* = false;
         var _loc14_:String = itemToUID(param1);
         if(!this.isBranch(param1) || this.isItemOpen(param1) == param2 || this.mx_internal::isOpening)
         {
            return;
         }
         if(itemEditorInstance)
         {
            endEdit(ListEventReason.OTHER);
         }
         this.oldLength = this.mx_internal::collectionLength;
         var _loc15_:CursorBookmark = iterator.bookmark;
         var _loc16_:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE,false,true,CollectionEventKind.mx_internal::EXPAND);
         _loc16_.items = [param1];
         if(param2)
         {
            IHierarchicalCollectionView(collection).openNode(param1);
            this.rowsTweened = Math.abs(this.oldLength - collection.length);
         }
         else
         {
            IHierarchicalCollectionView(collection).closeNode(param1);
            this.rowsTweened = Math.abs(this.oldLength - collection.length);
         }
         if(this.isItemVisible(param1))
         {
            if(visibleData[_loc14_])
            {
               _loc7_ = int(listItems.length);
               this.rowIndex = 0;
               while(this.rowIndex < _loc7_)
               {
                  if(rowInfo[this.rowIndex].uid == _loc14_)
                  {
                     ++this.rowIndex;
                     break;
                  }
                  ++this.rowIndex;
               }
            }
            var _loc17_:int = int(listItems.length);
            var _loc19_:int = this.treeColumnIndex;
            var _loc20_:int = this.rowsTweened;
            var _loc21_:Number = Number(getStyle("openDuration"));
            if(param3 && this.rowIndex < _loc17_ && _loc20_ > 0 && _loc20_ < 20 && _loc21_ != 0)
            {
               if(this.tween)
               {
                  this.tween.endTween();
               }
               _loc23_ = listItems[this.rowIndex - 1][_loc19_];
               if(_loc23_ is IDropInListItemRenderer)
               {
                  _loc34_ = IDropInListItemRenderer(_loc23_);
                  _loc35_ = AdvancedDataGridListData(_loc34_.listData);
                  _loc35_ = AdvancedDataGridListData(this.makeListData(_loc35_.item,_loc35_.uid,_loc35_.rowIndex,_loc19_,mx_internal::visibleColumns[_loc19_]));
                  _loc34_.listData = _loc35_;
                  _loc23_.data = _loc23_.data;
               }
               this.opening = param2;
               this.mx_internal::isOpening = true;
               this.maskList = [];
               this.rowList = [];
               _loc25_ = _loc24_ = 0;
               _loc26_ = 0;
               _loc27_ = 0;
               _loc28_ = 0;
               _loc29_ = this.rowIndex;
               _loc30_ = 0;
               _loc32_ = this.getOptimumColumns();
               if(param2)
               {
                  _loc11_ = this.rowIndex;
                  _loc30_ = listContent.height - rowInfo[this.rowIndex].y;
                  iterator.seek(CursorBookmark.CURRENT,_loc29_);
                  _loc6_ = 0;
                  while(_loc6_ < _loc20_ && _loc27_ < _loc30_)
                  {
                     _loc36_ = iterator.current;
                     _loc25_ = _loc24_;
                     currentRowNum = this.rowIndex + _loc6_;
                     _loc28_ = 0;
                     currentColNum = 0;
                     _loc14_ = itemToUID(_loc36_);
                     this.setupRenderer(_loc36_,_loc14_,true);
                     _loc8_ = selectedData[_loc14_] != null || Boolean(this.mx_internal::cellSelectionData[_loc14_]) && Boolean(this.mx_internal::cellSelectionData[_loc14_][currentColNum.toString()]);
                     _loc9_ = highlightUID == _loc14_;
                     _loc10_ = caretUID == _loc14_;
                     currentItemTop = _loc27_;
                     _loc28_ = layoutRow(true,_loc25_,_loc28_);
                     _loc18_ = new ListRowInfo(_loc27_,_loc28_,_loc14_,_loc36_);
                     _loc27_ += _loc28_;
                     rowInfo.splice(this.rowIndex + _loc6_,0,_loc18_);
                     iterator.moveNext();
                     _loc6_++;
                  }
                  this.rowsTweened = _loc6_;
                  _loc37_ = rowInfo[this.rowIndex + this.rowsTweened];
                  _loc6_ = 0;
                  while(_loc6_ < this.rowsTweened)
                  {
                     _loc25_ = _loc24_;
                     rowInfo[this.rowIndex + _loc6_].y -= _loc27_ - _loc37_.y;
                     _loc19_ = 0;
                     while(_loc19_ < _loc32_.length)
                     {
                        _loc23_ = listItems[this.rowIndex + _loc6_][_loc19_];
                        _loc23_.move(_loc23_.x,_loc23_.y - (_loc27_ - _loc37_.y));
                        _loc13_ = this.makeMask();
                        if(_loc19_ < lockedColumnCount)
                        {
                           _loc13_.x = _loc25_;
                        }
                        else
                        {
                           _loc13_.x = getAdjustedXPos(_loc25_);
                        }
                        _loc13_.y = _loc37_.y;
                        _loc13_.width = _loc23_.width;
                        _loc13_.height = _loc27_;
                        listItems[this.rowIndex + _loc6_][_loc19_].mask = _loc13_;
                        _loc25_ += _loc32_[_loc19_].width;
                        _loc19_++;
                     }
                     _loc6_++;
                  }
               }
               else
               {
                  _loc38_ = true;
                  _loc39_ = true;
                  _loc40_ = _loc27_ = rowInfo[listItems.length - 1].y + rowInfo[listItems.length - 1].height;
                  _loc6_ = this.rowIndex;
                  while(_loc6_ < this.rowIndex + _loc20_ && _loc6_ < _loc17_)
                  {
                     _loc30_ += rowInfo[_loc6_].height;
                     _loc25_ = _loc24_;
                     _loc46_ = [];
                     _loc19_ = 0;
                     while(_loc19_ < _loc32_.length)
                     {
                        _loc46_.push({"item":listItems[_loc6_][_loc19_]});
                        _loc13_ = this.makeMask();
                        if(_loc19_ < lockedColumnCount)
                        {
                           _loc13_.x = _loc25_;
                        }
                        else
                        {
                           _loc13_.x = getAdjustedXPos(_loc25_);
                        }
                        _loc13_.y = listItems[this.rowIndex][_loc19_].y;
                        _loc13_.width = listItems[_loc6_][_loc19_].width;
                        _loc13_.height = _loc30_;
                        listItems[_loc6_][_loc19_].mask = _loc13_;
                        _loc25_ += _loc32_[_loc19_].width;
                        _loc19_++;
                     }
                     if(_loc46_.length != 0)
                     {
                        this.rowList.push(_loc46_);
                     }
                     _loc6_++;
                  }
                  _loc20_ = _loc6_ - this.rowIndex;
                  rowInfo.splice(this.rowIndex,_loc20_);
                  listItems.splice(this.rowIndex,_loc20_);
                  iterator.seek(CursorBookmark.CURRENT,listItems.length);
                  _loc38_ = iterator != null && !iterator.afterLast && iteratorValid;
                  _loc30_ += _loc27_;
                  _loc6_ = 0;
                  while(_loc6_ < _loc20_ && _loc27_ < _loc30_)
                  {
                     _loc14_ = null;
                     _loc36_ = null;
                     _loc23_ = null;
                     _loc39_ = _loc38_;
                     _loc36_ = _loc38_ ? iterator.current : null;
                     _loc25_ = _loc24_;
                     if(_loc39_)
                     {
                        currentRowNum = _loc17_ - _loc20_ + _loc6_;
                        currentColNum = 0;
                        _loc14_ = itemToUID(_loc36_);
                        this.setupRenderer(_loc36_,_loc14_,true);
                        _loc8_ = selectedData[_loc14_] != null;
                        _loc9_ = highlightUID == _loc14_;
                        _loc10_ = caretUID == _loc14_;
                        currentItemTop = _loc27_;
                        _loc28_ = layoutRow(true,_loc25_,_loc28_);
                     }
                     else
                     {
                        _loc28_ = rowHeight;
                     }
                     _loc18_ = new ListRowInfo(_loc27_,_loc28_,_loc14_,_loc36_);
                     rowInfo.push(_loc18_);
                     _loc27_ += _loc28_;
                     if(_loc38_)
                     {
                        _loc38_ = Boolean(iterator.moveNext());
                     }
                     _loc6_++;
                  }
                  _loc41_ = this.rowList[0][0].item.y - getStyle("paddingTop");
                  _loc42_ = this.rowList[0][0].item.x - getStyle("paddingLeft");
                  _loc6_ = 0;
                  while(_loc6_ < this.rowList.length)
                  {
                     _loc47_ = this.rowList[_loc6_].length - 1;
                     _loc48_ = selectionIndicators[itemToUID(this.rowList[_loc6_][_loc47_].item.data)];
                     if(_loc48_)
                     {
                        _loc13_ = this.makeMask();
                        _loc13_.x = _loc42_;
                        _loc13_.y = _loc41_;
                        _loc13_.width = this.rowList[_loc6_][_loc47_].item.x + this.rowList[_loc6_][_loc47_].item.width + getStyle("paddingLeft") + getStyle("paddingRight");
                        _loc13_.height = this.rowList[_loc6_][_loc47_].item.y + this.rowList[_loc6_][_loc47_].item.height + getStyle("paddingTop") + getStyle("paddingBottom") - _loc41_;
                        selectionIndicators[itemToUID(this.rowList[_loc6_][_loc47_].item.data)].mask = _loc13_;
                     }
                     _loc6_++;
                  }
                  _loc43_ = this.rowList[0][0].item.y - getStyle("paddingTop");
                  _loc44_ = this.rowList[0][0].item.x - getStyle("paddingLeft");
                  _loc45_ = 0;
                  while(_loc45_ < this.rowList.length)
                  {
                     _loc49_ = 0;
                     while(_loc49_ < this.rowList[_loc45_].length)
                     {
                        _loc50_ = this.rowList[_loc45_].length - 1;
                        _loc51_ = itemToUID(this.rowList[_loc45_][_loc49_].item.data);
                        if(_loc51_ in this.mx_internal::cellSelectionIndicators)
                        {
                           _loc52_ = this.mx_internal::cellSelectionIndicators[_loc51_][_loc49_];
                           if(_loc52_)
                           {
                              _loc13_ = this.makeMask();
                              _loc13_.x = _loc42_;
                              _loc13_.y = _loc41_;
                              _loc13_.width = this.rowList[_loc45_][_loc50_].item.x + this.rowList[_loc45_][_loc50_].item.width + getStyle("paddingLeft") + getStyle("paddingRight");
                              _loc13_.height = this.rowList[_loc45_][_loc50_].item.y + this.rowList[_loc45_][_loc50_].item.height + getStyle("paddingTop") + getStyle("paddingBottom") - _loc41_;
                              _loc52_.mask = _loc13_;
                           }
                        }
                        _loc49_++;
                     }
                     _loc45_++;
                  }
               }
               iterator.seek(_loc15_,0);
               _loc17_ = int(this.rowList.length);
               _loc6_ = 0;
               while(_loc6_ < _loc17_)
               {
                  _loc19_ = 0;
                  while(_loc19_ < this.rowList[_loc6_].length)
                  {
                     this.rowList[_loc6_][_loc19_].itemOldY = this.rowList[_loc6_][_loc19_].item.y;
                     _loc19_++;
                  }
                  _loc6_++;
               }
               _loc17_ = int(listItems.length);
               _loc6_ = this.rowIndex;
               while(_loc6_ < _loc17_)
               {
                  if(listItems[_loc6_].length)
                  {
                     rowInfo[_loc6_].itemOldY = listItems[_loc6_][0].y;
                  }
                  rowInfo[_loc6_].oldY = rowInfo[_loc6_].y;
                  _loc6_++;
               }
               _loc21_ *= Math.max(_loc20_ / 5,1);
               if(param4)
               {
                  this.eventAfterTween = param1;
               }
               this.tween = new Tween(this,0,param2 ? _loc27_ : _loc40_ - _loc27_,_loc21_,5);
               _loc33_ = getStyle("openEasingFunction") as Function;
               if(_loc33_ != null)
               {
                  this.tween.easingFunction = _loc33_;
               }
               UIComponent.suspendBackgroundProcessing();
               UIComponentGlobals.mx_internal::layoutManager.validateNow();
            }
            else
            {
               if(param4)
               {
                  _loc53_ = !!this.eventItemRenderer ? this.eventItemRenderer : visibleData[itemToUID(param1)];
                  this.mx_internal::dispatchAdvancedDataGridEvent(param2 ? AdvancedDataGridEvent.ITEM_OPEN : AdvancedDataGridEvent.ITEM_CLOSE,param1,_loc53_,this.lastUserInteraction);
                  this.lastUserInteraction = null;
                  this.eventItemRenderer = null;
               }
               itemsSizeChanged = true;
               invalidateDisplayList();
            }
            if(!wordWrap && Boolean(initialized))
            {
               super.maxHorizontalScrollPosition = this._userMaxHorizontalScrollPosition > 0 ? this._userMaxHorizontalScrollPosition + this.getIndent() : Number(super.maxHorizontalScrollPosition);
            }
            listContent.mx_internal::allowItemSizeChangeNotification = variableRowHeight;
            mx_internal::listSubContent.mx_internal::allowItemSizeChangeNotification = variableRowHeight;
            return;
         }
         _loc22_ = param2 ? this.buildUpCollectionEvents(true) : this.buildUpCollectionEvents(false);
         _loc7_ = int(_loc22_.length);
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            collection.dispatchEvent(_loc22_[_loc6_]);
            _loc6_++;
         }
         if(param4)
         {
            this.mx_internal::dispatchAdvancedDataGridEvent(param2 ? AdvancedDataGridEvent.ITEM_OPEN : AdvancedDataGridEvent.ITEM_CLOSE,param1,visibleData[itemToUID(param1)],this.lastUserInteraction);
            this.lastUserInteraction = null;
         }
      }
      
      mx_internal function onTweenUpdate(param1:Object) : void
      {
         var _loc2_:IFlexDisplayObject = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:Sprite = null;
         var _loc12_:Boolean = false;
         _loc3_ = int(listItems.length);
         _loc5_ = this.rowIndex;
         while(_loc5_ < _loc3_)
         {
            if(listItems[_loc5_].length)
            {
               _loc4_ = int(listItems[_loc5_].length);
               _loc6_ = 0;
               while(_loc6_ < _loc4_)
               {
                  _loc2_ = IFlexDisplayObject(listItems[_loc5_][_loc6_]);
                  _loc8_ = Number(_loc2_.y);
                  _loc2_.move(_loc2_.x,rowInfo[_loc5_].itemOldY + param1);
                  _loc7_ = _loc2_.y - _loc8_;
                  _loc6_++;
               }
            }
            rowInfo[_loc5_].y += _loc7_;
            _loc11_ = selectionIndicators[rowInfo[_loc5_].uid];
            if(_loc11_)
            {
               _loc11_.y += _loc7_;
            }
            if(isCellSelectionMode())
            {
               _loc10_ = rowInfo[_loc5_].uid;
               if(this.mx_internal::cellSelectionIndicators[_loc10_])
               {
                  for(_loc9_ in this.mx_internal::cellSelectionIndicators[_loc10_])
                  {
                     this.mx_internal::cellSelectionIndicators[_loc10_][_loc9_].y += _loc7_;
                  }
               }
            }
            _loc5_++;
         }
         _loc3_ = int(this.rowList.length);
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc12_ = true;
            _loc4_ = int(this.rowList[_loc5_].length);
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc11_ = null;
               _loc2_ = IFlexDisplayObject(this.rowList[_loc5_][_loc6_].item);
               if(rowMap[_loc2_.name] != null)
               {
                  _loc11_ = selectionIndicators[BaseListData(rowMap[_loc2_.name]).uid];
               }
               _loc8_ = Number(_loc2_.y);
               _loc2_.move(_loc2_.x,this.rowList[_loc5_][_loc6_].itemOldY + param1);
               _loc7_ = _loc2_.y - _loc8_;
               if(_loc12_ && Boolean(_loc11_))
               {
                  _loc11_.y += _loc7_;
                  _loc12_ = false;
               }
               _loc6_++;
            }
            if(isCellSelectionMode())
            {
               _loc10_ = BaseListData(rowMap[_loc2_.name]).uid;
               if(this.mx_internal::cellSelectionIndicators[_loc10_])
               {
                  for(_loc9_ in this.mx_internal::cellSelectionIndicators[_loc10_])
                  {
                     this.mx_internal::cellSelectionIndicators[_loc10_][_loc9_].y += _loc7_;
                  }
               }
            }
            _loc5_++;
         }
      }
      
      mx_internal function onTweenEnd(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = undefined;
         var _loc7_:IDropInListItemRenderer = null;
         var _loc9_:* = undefined;
         var _loc10_:Object = null;
         var _loc11_:String = null;
         var _loc12_:Array = null;
         var _loc13_:int = 0;
         var _loc14_:DisplayObject = null;
         var _loc15_:IListItemRenderer = null;
         UIComponent.resumeBackgroundProcessing();
         this.mx_internal::onTweenUpdate(param1);
         var _loc8_:int = int(listItems.length);
         this.mx_internal::isOpening = false;
         if(collection)
         {
            _loc12_ = this.opening ? this.buildUpCollectionEvents(true) : this.buildUpCollectionEvents(false);
            _loc4_ = int(_loc12_.length);
            _loc2_ = 0;
            while(_loc2_ < _loc4_)
            {
               collection.dispatchEvent(_loc12_[_loc2_]);
               _loc2_++;
            }
         }
         if(this.opening)
         {
            _loc13_ = -1;
            _loc2_ = this.rowIndex;
            while(_loc2_ < _loc8_)
            {
               if(listItems[_loc2_].length)
               {
                  _loc3_ = 0;
                  while(_loc3_ < listItems[_loc2_].length)
                  {
                     _loc6_ = listItems[_loc2_][_loc3_];
                     _loc14_ = _loc6_.mask;
                     if(_loc14_)
                     {
                        listContent.removeChild(_loc14_);
                        _loc6_.mask = null;
                     }
                     rowMap[_loc6_.name].rowIndex = _loc2_;
                     if(_loc6_ is IDropInListItemRenderer)
                     {
                        _loc7_ = IDropInListItemRenderer(_loc6_);
                        if(_loc7_.listData)
                        {
                           _loc7_.listData.rowIndex = _loc2_;
                           _loc7_.listData = _loc7_.listData;
                        }
                     }
                     if(_loc6_.y > listContent.height)
                     {
                        addToFreeItemRenderers(_loc6_);
                        _loc9_ = itemToUID(_loc6_.data);
                        if(selectionIndicators[_loc9_])
                        {
                           _loc10_ = selectionIndicators[_loc9_];
                           if(_loc10_)
                           {
                              _loc14_ = _loc10_.mask;
                              if(_loc14_)
                              {
                                 listContent.removeChild(_loc14_);
                                 _loc10_.mask = null;
                              }
                           }
                           this.removeIndicators(_loc9_);
                        }
                        if(isCellSelectionMode())
                        {
                           if(this.mx_internal::cellSelectionIndicators[_loc9_])
                           {
                              for(_loc11_ in this.mx_internal::cellSelectionIndicators[_loc9_])
                              {
                                 _loc10_ = this.mx_internal::cellSelectionIndicators[_loc9_][_loc11_];
                                 if(_loc10_)
                                 {
                                    _loc14_ = _loc10_.mask;
                                    if(_loc14_)
                                    {
                                       listContent.removeChild(_loc14_);
                                       _loc10_.mask = null;
                                    }
                                 }
                              }
                              this.removeCellIndicators(_loc9_,int(_loc11_));
                           }
                        }
                        delete rowMap[_loc6_.name];
                        if(_loc13_ < 0)
                        {
                           _loc13_ = _loc2_;
                        }
                     }
                     _loc3_++;
                  }
               }
               else if(rowInfo[_loc2_].y >= listContent.height)
               {
                  if(_loc13_ < 0)
                  {
                     _loc13_ = _loc2_;
                  }
               }
               _loc2_++;
            }
            if(_loc13_ >= 0)
            {
               rowInfo.splice(_loc13_);
               listItems.splice(_loc13_);
            }
         }
         else
         {
            _loc4_ = int(this.rowList.length);
            _loc2_ = 0;
            while(_loc2_ < _loc4_)
            {
               _loc5_ = int(this.rowList[_loc2_].length);
               _loc3_ = 0;
               while(_loc3_ < _loc5_)
               {
                  _loc14_ = this.rowList[_loc2_][_loc3_].item.mask;
                  if(_loc14_)
                  {
                     listContent.removeChild(_loc14_);
                     this.rowList[_loc2_][_loc3_].item.mask = null;
                  }
                  addToFreeItemRenderers(this.rowList[_loc2_][_loc3_].item);
                  _loc9_ = itemToUID(this.rowList[_loc2_][_loc3_].item.data);
                  if(selectionIndicators[_loc9_])
                  {
                     _loc10_ = selectionIndicators[_loc9_];
                     if(_loc10_)
                     {
                        _loc14_ = _loc10_.mask;
                        if(_loc14_)
                        {
                           listContent.removeChild(_loc14_);
                           _loc10_.mask = null;
                        }
                     }
                     this.removeIndicators(_loc9_);
                  }
                  if(isCellSelectionMode())
                  {
                     if(this.mx_internal::cellSelectionIndicators[_loc9_])
                     {
                        for(_loc11_ in this.mx_internal::cellSelectionIndicators[_loc9_])
                        {
                           _loc10_ = this.mx_internal::cellSelectionIndicators[_loc9_][_loc11_];
                           if(_loc10_)
                           {
                              _loc14_ = _loc10_.mask;
                              if(_loc14_)
                              {
                                 listContent.removeChild(_loc14_);
                                 _loc10_.mask = null;
                              }
                           }
                           this.removeCellIndicators(_loc9_,int(_loc11_));
                        }
                     }
                  }
                  delete rowMap[this.rowList[_loc2_][_loc3_].item.name];
                  _loc3_++;
               }
               _loc2_++;
            }
            _loc2_ = this.rowIndex;
            while(_loc2_ < _loc8_)
            {
               if(listItems[_loc2_].length)
               {
                  _loc5_ = int(listItems[_loc2_].length);
                  _loc3_ = 0;
                  while(_loc3_ < _loc5_)
                  {
                     _loc6_ = listItems[_loc2_][_loc3_];
                     rowMap[_loc6_.name].rowIndex = _loc2_;
                     if(_loc6_ is IDropInListItemRenderer)
                     {
                        _loc7_ = IDropInListItemRenderer(_loc6_);
                        if(_loc7_.listData)
                        {
                           _loc7_.listData.rowIndex = _loc2_;
                           _loc7_.listData = _loc7_.listData;
                        }
                     }
                     _loc3_++;
                  }
               }
               _loc2_++;
            }
         }
         if(this.eventAfterTween)
         {
            _loc15_ = !!this.eventItemRenderer ? this.eventItemRenderer : visibleData[itemToUID(this.eventAfterTween)];
            this.mx_internal::dispatchAdvancedDataGridEvent(this.isItemOpen(this.eventAfterTween) ? AdvancedDataGridEvent.ITEM_OPEN : AdvancedDataGridEvent.ITEM_CLOSE,this.eventAfterTween,_loc15_,this.lastUserInteraction);
            this.lastUserInteraction = null;
            this.eventAfterTween = false;
            _loc15_ = null;
         }
         itemsSizeChanged = true;
         invalidateDisplayList();
         this.tween = null;
         configureScrollBars();
      }
      
      private function buildUpCollectionEvents(param1:Boolean) : Array
      {
         var ce:CollectionEvent = null;
         var item:Object = null;
         var parentArray:Array = null;
         var children:ICollectionView = null;
         var cursor:IViewCursor = null;
         var push:Boolean = false;
         var stack:Array = null;
         var i:int = 0;
         var n:int = 0;
         var m:int = 0;
         var j:int = 0;
         var open:Boolean = param1;
         var rowsAdded:Array = [];
         var rowsRemoved:Array = [];
         var retVal:Array = [];
         var itemIndex:int = this.getItemIndex(this.expandedItem);
         if(open)
         {
            children = this.mx_internal::getChildren(this.expandedItem,iterator.view);
            if(!children)
            {
               return [];
            }
            cursor = children.createCursor();
            push = true;
            while(!cursor.afterLast)
            {
               rowsAdded.push(item);
               try
               {
                  cursor.moveNext();
               }
               catch(e:ItemPendingError)
               {
                  break;
               }
            }
         }
         else
         {
            stack = [];
            stack = this.getOpenChildrenStack(this.expandedItem,stack);
            n = int(stack.length);
            while(i < n)
            {
               m = int(selectedItems.length);
               j = 0;
               while(j < m)
               {
                  if(selectedItems[j] == stack[i])
                  {
                     this.bSelectedItemRemoved = true;
                  }
                  j++;
               }
               rowsRemoved.push(stack[i]);
               i++;
            }
         }
         if(rowsAdded.length > 0)
         {
            ce = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
            ce.kind = CollectionEventKind.ADD;
            ce.location = itemIndex + 1;
            ce.items = rowsAdded;
            retVal.push(ce);
         }
         if(rowsRemoved.length > 0)
         {
            ce = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
            ce.kind = CollectionEventKind.REMOVE;
            ce.location = itemIndex;
            ce.items = rowsRemoved;
            retVal.push(ce);
         }
         return retVal;
      }
      
      private function getIndent() : Number
      {
         var _loc2_:String = null;
         var _loc1_:Number = 0;
         for(_loc2_ in IHierarchicalCollectionView(collection).openNodes)
         {
            _loc1_ = Math.max(this.mx_internal::getItemDepth(IHierarchicalCollectionView(collection).openNodes[_loc2_],0),_loc1_);
         }
         return _loc1_ * getStyle("indentation");
      }
      
      private function getItemIndex(param1:Object) : int
      {
         var _loc2_:IViewCursor = collection.createCursor();
         var _loc3_:int = 0;
         while(_loc2_.current !== param1)
         {
            _loc3_++;
            if(!_loc2_.moveNext())
            {
               break;
            }
         }
         return _loc3_;
      }
      
      private function getIndexItem(param1:int) : Object
      {
         var _loc2_:IViewCursor = collection.createCursor();
         var _loc3_:int = param1;
         while(_loc2_.moveNext())
         {
            if(_loc3_ == 0)
            {
               return _loc2_.current;
            }
            _loc3_--;
         }
         return null;
      }
      
      public function expandChildrenOf(param1:Object, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:IViewCursor = null;
         if(iterator == null)
         {
            return;
         }
         if(this.isBranch(param1))
         {
            this.mx_internal::dispatchAdvancedDataGridEvent(AdvancedDataGridEvent.ITEM_OPENING,param1,null,null,param2,false,true);
            _loc3_ = 0;
            if(param1 != null && this.mx_internal::_rootModel.canHaveChildren(param1) && this.mx_internal::_rootModel.hasChildren(param1))
            {
               _loc4_ = this.mx_internal::getChildren(param1,iterator.view);
            }
            if(_loc4_)
            {
               _loc5_ = _loc4_.createCursor();
               while(!_loc5_.afterLast)
               {
                  if(this.isBranch(_loc5_.current))
                  {
                     this.expandChildrenOf(_loc5_.current,param2);
                  }
                  _loc5_.moveNext();
               }
            }
         }
      }
      
      public function getParentItem(param1:Object) : *
      {
         if(param1 == null)
         {
            return null;
         }
         if(Boolean(param1) && Boolean(collection))
         {
            return IHierarchicalCollectionView(collection).getParentItem(param1);
         }
         return null;
      }
      
      private function getParentStack(param1:Object) : Array
      {
         var _loc2_:Array = [];
         if(param1 == null)
         {
            return _loc2_;
         }
         var _loc3_:* = this.getParentItem(param1);
         while(_loc3_)
         {
            _loc2_.push(_loc3_);
            _loc3_ = this.getParentItem(_loc3_);
         }
         return _loc2_;
      }
      
      private function getOpenChildrenStack(param1:Object, param2:Array) : Array
      {
         var children:ICollectionView;
         var cursor:IViewCursor;
         var curr:Object = null;
         var item:Object = param1;
         var stack:Array = param2;
         if(item == null)
         {
            return stack;
         }
         children = this.mx_internal::getChildren(item,iterator.view);
         if(!children)
         {
            return [];
         }
         cursor = children.createCursor();
         while(!cursor.afterLast)
         {
            curr = cursor.current;
            stack.push(curr);
            if(this.isBranch(curr) && this.isItemOpen(curr))
            {
               this.getOpenChildrenStack(curr,stack);
            }
            try
            {
               cursor.moveNext();
            }
            catch(e:ItemPendingError)
            {
               break;
            }
         }
         return stack;
      }
      
      private function getChildIndexInParent(param1:Object, param2:Object) : int
      {
         var _loc4_:IViewCursor = null;
         var _loc5_:ICollectionView = null;
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         if(!param1)
         {
            _loc4_ = ICollectionView(iterator.view).createCursor();
            while(!_loc4_.afterLast)
            {
               if(param2 === _loc4_.current)
               {
                  break;
               }
               _loc3_++;
               _loc4_.moveNext();
            }
         }
         else if(param1 != null && this.mx_internal::_rootModel.canHaveChildren(param1) && this.mx_internal::_rootModel.hasChildren(param1))
         {
            _loc5_ = this.mx_internal::getChildren(param1,iterator.view);
            if(_loc5_.contains(param2))
            {
               _loc6_ = int(_loc5_.length);
               while(_loc3_ < _loc6_)
               {
                  if(param2 === _loc5_[_loc3_])
                  {
                     break;
                  }
                  _loc3_++;
               }
            }
         }
         return _loc3_;
      }
      
      private function collapseSelectedItems() : Array
      {
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         var _loc1_:ArrayCollection = new ArrayCollection(selectedItems);
         var _loc2_:int = 0;
         while(_loc2_ < selectedItems.length)
         {
            _loc3_ = selectedItems[_loc2_];
            _loc4_ = this.getParentStack(_loc3_);
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               if(_loc1_.contains(_loc4_[_loc5_]))
               {
                  _loc6_ = int(_loc1_.getItemIndex(_loc3_));
                  _loc7_ = _loc1_.removeItemAt(_loc6_);
                  break;
               }
               _loc5_++;
            }
            _loc2_++;
         }
         return _loc1_.source;
      }
      
      protected function initListData(param1:Object, param2:AdvancedDataGridListData) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc3_:Boolean = this.isItemOpen(param1);
         var _loc4_:Boolean = this.isBranch(param1);
         var _loc5_:String = itemToUID(param1);
         if(this.displayDisclosureIcon)
         {
            param2.disclosureIcon = getStyle(_loc3_ ? "disclosureOpenIcon" : "disclosureClosedIcon");
         }
         param2.open = _loc3_;
         param2.hasChildren = this.mx_internal::_rootModel.hasChildren(param1);
         if(itemPending)
         {
            param2.depth = 1;
         }
         else
         {
            param2.depth = this.mx_internal::getItemDepth(param1,param2.rowIndex);
         }
         param2.indent = (param2.depth - 1) * getStyle("indentation");
         param2.item = param1;
         if(this.groupIconFunction != null && this.isBranch(param1))
         {
            if(this.groupIconFunction(param1,param2.depth) != null)
            {
               param2.icon = this.groupIconFunction(param1,param2.depth);
            }
            else
            {
               param2.icon = this.itemToIcon(param1);
            }
         }
         else
         {
            param2.icon = this.itemToIcon(param1);
         }
      }
      
      mx_internal function addChildItem(param1:Object, param2:Object, param3:Number) : Boolean
      {
         return IHierarchicalCollectionView(this.dataProvider).addChildAt(param1,param2,param3);
      }
      
      mx_internal function removeChildItem(param1:Object, param2:Object, param3:Number) : Boolean
      {
         return IHierarchicalCollectionView(this.dataProvider).removeChildAt(param1,param3);
      }
      
      mx_internal function dispatchAdvancedDataGridEvent(param1:String, param2:Object, param3:IListItemRenderer, param4:Event = null, param5:Boolean = true, param6:Boolean = true, param7:Boolean = true) : void
      {
         var _loc8_:AdvancedDataGridEvent = null;
         if(param1 == AdvancedDataGridEvent.ITEM_OPENING)
         {
            _loc8_ = new AdvancedDataGridEvent(AdvancedDataGridEvent.ITEM_OPENING,false,true);
            _loc8_.opening = param5;
            _loc8_.animate = param6;
            _loc8_.dispatchEvent = param7;
         }
         if(!_loc8_)
         {
            _loc8_ = new AdvancedDataGridEvent(param1);
         }
         _loc8_.item = param2;
         _loc8_.itemRenderer = param3;
         _loc8_.triggerEvent = param4;
         dispatchEvent(_loc8_);
      }
      
      private function setDesignViewData() : void
      {
         var _loc4_:int = 0;
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:AdvancedDataGridColumn = null;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         this.designViewDataFlag = true;
         var _loc1_:Array = [];
         var _loc2_:int = 1;
         var _loc3_:int = 10;
         if(!columns || columns.length == 0)
         {
            return;
         }
         if(this.designViewDataType == this.designViewDataFlatType)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = {};
               _loc7_ = int(columns.length);
               _loc6_ = 0;
               while(_loc6_ < _loc7_)
               {
                  _loc8_ = columns[_loc6_];
                  if(_loc8_.dataField != null)
                  {
                     _loc5_[_loc8_.dataField] = _loc2_;
                  }
                  _loc2_++;
                  _loc6_++;
               }
               _loc1_.push(_loc5_);
               _loc4_++;
            }
            this.dataProvider = _loc1_;
         }
         else if(this.designViewDataType == this.designViewDataTreeType)
         {
            _loc9_ = columns[0].dataField || "";
            _loc10_ = 1;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc11_ = "children";
               _loc5_ = {};
               _loc5_[_loc11_] = [{}];
               _loc5_[_loc9_] = resourceManager.getString("datamanagement","Branch",[_loc10_]);
               _loc7_ = int(columns.length);
               _loc6_ = 0;
               while(_loc6_ < _loc7_)
               {
                  _loc8_ = columns[_loc6_];
                  if(_loc8_.dataField != null)
                  {
                     _loc5_[_loc11_][0][_loc8_.dataField] = _loc2_;
                  }
                  _loc2_++;
                  _loc6_++;
               }
               _loc1_.push(_loc5_);
               _loc10_++;
               _loc4_++;
            }
            this.dataProvider = new HierarchicalData(_loc1_);
         }
      }
      
      private function setDesignViewSort() : void
      {
         if(collection == null)
         {
            return;
         }
         var _loc1_:Sort = new Sort();
         _loc1_.fields = [];
         var _loc2_:* = false;
         var _loc3_:int = int(columns.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_.fields.push(new SortField(columns[_loc4_].dataField,false,_loc2_,false));
            _loc2_ = !_loc2_;
            _loc4_++;
         }
         if(collection)
         {
            collection.sort = _loc1_;
         }
      }
      
      public function setDesignView() : void
      {
         this.designViewDataType = this.mx_internal::dataType;
         this.designViewDataTypeChanged = true;
         invalidateProperties();
      }
      
      protected function processCellsWaitingToBeDisplayed() : void
      {
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:IListItemRenderer = null;
         var _loc1_:Array = [];
         var _loc2_:int = int(pendingCellSelection.length);
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = absoluteToVisibleIndices(pendingCellSelection[_loc3_].rowIndex,pendingCellSelection[_loc3_].columnIndex);
            _loc5_ = int(_loc4_.rowIndex);
            _loc6_ = int(_loc4_.columnIndex);
            if(Boolean(listItems[_loc5_]) && Boolean(listItems[_loc5_][_loc6_]))
            {
               _loc7_ = listItems[_loc5_][_loc6_];
               this.selectCellItem(_loc7_,false,true);
               _loc1_.push(_loc3_);
            }
            _loc3_++;
         }
         _loc1_.sort(Array.NUMERIC | Array.DESCENDING);
         _loc2_ = int(_loc1_.length);
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            pendingCellSelection.removeItemAt(_loc1_[_loc3_]);
            _loc3_++;
         }
         if(pendingCellSelection.length == 0)
         {
            cellsWaitingToBeDisplayed = false;
         }
      }
      
      public function expandAll() : void
      {
         var _loc1_:Object = null;
         var _loc2_:IListItemRenderer = null;
         if(this.dataProvider is IHierarchicalCollectionView && Boolean(iterator))
         {
            iterator.seek(CursorBookmark.FIRST);
            while(!iterator.afterLast)
            {
               _loc1_ = iterator.current;
               if(this.isBranch(_loc1_) && !this.isItemOpen(_loc1_))
               {
                  IHierarchicalCollectionView(collection).openNode(_loc1_);
                  _loc2_ = visibleData[itemToUID(_loc1_)];
                  this.mx_internal::dispatchAdvancedDataGridEvent(AdvancedDataGridEvent.ITEM_OPEN,_loc1_,_loc2_,null);
               }
               iterator.moveNext();
            }
            itemsSizeChanged = true;
            invalidateDisplayList();
            iterator.seek(CursorBookmark.FIRST,verticalScrollPosition);
         }
      }
      
      public function collapseAll() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:int = 0;
         if(this.dataProvider is IHierarchicalCollectionView && Boolean(iterator))
         {
            clearSelected();
            for each(_loc1_ in IHierarchicalCollectionView(collection).openNodes)
            {
               this.mx_internal::dispatchAdvancedDataGridEvent(AdvancedDataGridEvent.ITEM_CLOSE,_loc1_,visibleData[itemToUID(_loc1_)]);
            }
            _loc2_ = verticalScrollPosition;
            this.verticalScrollPosition = 0;
            IHierarchicalCollectionView(collection).openNodes = {};
            this.verticalScrollPosition = _loc2_ >= collection.length ? collection.length - 1 : _loc2_;
            iterator.seek(CursorBookmark.FIRST,verticalScrollPosition);
         }
      }
      
      mx_internal function getRendererDescription(param1:Object, param2:AdvancedDataGridColumn, param3:Boolean = false) : AdvancedDataGridRendererDescription
      {
         var _loc4_:AdvancedDataGridRendererDescription = new AdvancedDataGridRendererDescription();
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(this.rendererProviders.length != 0)
         {
            if(param3)
            {
               _loc5_ = this.getItemIndex(param1);
            }
            _loc6_ = this.mx_internal::getItemDepth(param1,_loc5_);
         }
         var _loc7_:int = int(this.rendererProviders.length);
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            IAdvancedDataGridRendererProvider(this.rendererProviders[_loc8_]).describeRendererForItem(param1,_loc6_,param2,_loc4_);
            if(_loc4_.renderer)
            {
               return _loc4_;
            }
            _loc8_++;
         }
         return _loc4_;
      }
      
      private function findHeaderRenderer(param1:Point) : IListItemRenderer
      {
         var _loc2_:IListItemRenderer = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:Array = visibleHeaderInfos;
         while(true)
         {
            if(_loc3_)
            {
               return null;
            }
            _loc6_ = !!_loc4_ ? int(_loc4_.length) : 0;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc2_ = _loc4_[_loc7_]["headerItem"];
               _loc5_ = Number(_loc2_.x);
               if(_loc4_[_loc7_].actualColNum >= lockedColumnCount)
               {
                  _loc5_ = getAdjustedXPos(_loc2_.x);
               }
               if(param1.x >= _loc5_ && param1.x < _loc5_ + _loc2_.getExplicitOrMeasuredWidth())
               {
                  _loc3_ = true;
                  if(param1.y > _loc2_.y - mx_internal::cachedPaddingTop && param1.y <= _loc2_.y + _loc2_.height + mx_internal::cachedPaddingBottom)
                  {
                     return _loc2_;
                  }
                  if(Boolean(_loc4_[_loc7_].visibleChildren) && _loc4_[_loc7_].visibleChildren.length > 0)
                  {
                     _loc4_ = _loc4_[_loc7_].visibleChildren;
                     break;
                  }
                  return null;
               }
               _loc7_++;
            }
            if(!_loc3_)
            {
               break;
            }
            _loc3_ = false;
         }
         return null;
      }
      
      private function getLastColumnResidualWidth() : Number
      {
         var _loc4_:int = 0;
         var _loc1_:int = int(displayableColumns.length - 1);
         var _loc2_:int = unscaledWidth - viewMetrics.right - viewMetrics.left;
         var _loc3_:Number = 0;
         var _loc5_:int = Math.max(0,lockedColumnCount);
         if(_loc5_ > 0 && _loc5_ < mx_internal::visibleColumns.length)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc5_)
            {
               _loc2_ -= displayableColumns[_loc4_].width;
               _loc4_++;
            }
         }
         if(_loc1_ >= 0)
         {
            _loc3_ = isNaN(displayableColumns[_loc1_].explicitWidth) ? Number(displayableColumns[_loc1_].preferredWidth) : Number(displayableColumns[_loc1_].explicitWidth);
         }
         _loc4_ = _loc1_ - 1;
         while(_loc4_ >= _loc5_)
         {
            if(_loc3_ + displayableColumns[_loc4_].width > _loc2_)
            {
               break;
            }
            _loc3_ += displayableColumns[_loc4_].width;
            _loc4_--;
         }
         return _loc2_ - _loc3_;
      }
      
      private function createHeaderItems(param1:Array) : Number
      {
         var _loc2_:int = 0;
         var _loc3_:AdvancedDataGridColumn = null;
         var _loc4_:AdvancedDataGridListData = null;
         var _loc5_:IListItemRenderer = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = 0;
         var _loc8_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc8_)
         {
            if(param1[_loc2_].visibleChildren)
            {
               _loc6_ = this.createHeaderItems(param1[_loc2_].visibleChildren);
            }
            _loc3_ = param1[_loc2_].column;
            if(horizontalScrollPolicy != ScrollPolicy.OFF && _loc3_ == displayableColumns[displayableColumns.length - 1])
            {
               this.lastColumnWidth = (isNaN(_loc3_.mx_internal::explicitWidth) ? _loc3_.mx_internal::preferredWidth : _loc3_.mx_internal::explicitWidth) + this.getLastColumnResidualWidth();
            }
            _loc5_ = getHeaderRenderer(_loc3_);
            _loc4_ = AdvancedDataGridListData(this.makeListData(_loc3_,uid,-1,_loc3_.mx_internal::colNum,_loc3_));
            rowMap[_loc5_.name] = _loc4_;
            if(_loc5_ is IDropInListItemRenderer)
            {
               IDropInListItemRenderer(_loc5_).listData = _loc4_;
            }
            _loc5_.data = _loc3_;
            _loc5_.styleName = _loc3_;
            if(!this.isMeasuringHeader)
            {
               this.addRendererToContentArea(_loc5_,_loc3_);
            }
            this.headerItemsList.push(_loc5_);
            param1[_loc2_].headerItem = _loc5_;
            if(param1[_loc2_].visibleChildren)
            {
               _loc5_.explicitWidth = _loc6_;
               _loc3_.width = _loc6_;
            }
            else if(!isNaN(this.lastColumnWidth) && _loc3_ == displayableColumns[displayableColumns.length - 1])
            {
               _loc5_.explicitWidth = this.lastColumnWidth;
            }
            else
            {
               _loc5_.explicitWidth = _loc3_.width;
            }
            UIComponentGlobals.mx_internal::layoutManager.validateClient(_loc5_,true);
            if(!isNaN(this.lastColumnWidth) && _loc3_ == displayableColumns[displayableColumns.length - 1])
            {
               _loc7_ += this.lastColumnWidth;
            }
            else
            {
               _loc7_ += _loc3_.width;
            }
            _loc2_++;
         }
         return _loc7_;
      }
      
      private function measureHeaderHeights(param1:Array, param2:uint) : Number
      {
         var _loc3_:int = 0;
         var _loc7_:Number = NaN;
         var _loc4_:Number = 0;
         var _loc5_:int = mx_internal::cachedPaddingTop + mx_internal::cachedPaddingBottom;
         var _loc6_:int = int(param1.length);
         _loc3_ = 0;
         while(_loc3_ < _loc6_)
         {
            _loc7_ = !!mx_internal::_explicitHeaderHeight ? Number(mx_internal::_headerHeight) : param1[_loc3_].headerItem.getExplicitOrMeasuredHeight() + _loc5_;
            if(param1[_loc3_].visibleChildren)
            {
               _loc7_ += this.measureHeaderHeights(param1[_loc3_].visibleChildren,param2 + 1);
            }
            _loc4_ = Math.max(_loc4_,_loc7_);
            _loc3_++;
         }
         if(!headerRowInfo[param2])
         {
            headerRowInfo[param2] = new ListRowInfo(0,0,uid);
         }
         headerRowInfo[param2].height = Math.max(headerRowInfo[param2].height,_loc4_);
         return headerRowInfo[param2].height;
      }
      
      private function layoutHeaders(param1:Array, param2:Number, param3:Number, param4:int) : void
      {
         var _loc5_:int = 0;
         var _loc9_:Number = NaN;
         var _loc6_:Number = param2;
         var _loc7_:int = mx_internal::cachedPaddingTop + mx_internal::cachedPaddingBottom;
         headerRowInfo[param4].y = param3;
         var _loc8_:int = int(param1.length);
         _loc5_ = 0;
         while(_loc5_ < _loc8_)
         {
            param1[_loc5_].headerItem.move(_loc6_,param3 + mx_internal::cachedPaddingTop);
            _loc9_ = Number(param1[_loc5_].headerItem.height);
            if(param1[_loc5_].visibleChildren)
            {
               this.layoutHeaders(param1[_loc5_].visibleChildren,_loc6_,param3 + _loc9_ + _loc7_,param4 + 1);
            }
            _loc6_ += param1[_loc5_].headerItem.getExplicitOrMeasuredWidth();
            _loc5_++;
         }
      }
      
      protected function applyUserStylesForItemRenderer(param1:IListItemRenderer) : void
      {
         var _loc4_:String = null;
         var _loc5_:Object = null;
         if(!param1)
         {
            return;
         }
         if(!(param1 is IStyleClient && param1 is IDataRenderer && param1 is DisplayObject))
         {
            return;
         }
         var _loc2_:IStyleClient = param1 as IStyleClient;
         var _loc3_:AdvancedDataGridColumn = columnMap[DisplayObject(_loc2_).name];
         if(!this.oldStyles)
         {
            this.oldStyles = new Dictionary(true);
         }
         if(this.oldStyles[_loc2_])
         {
            for(_loc4_ in this.oldStyles[_loc2_])
            {
               _loc2_.setStyle(_loc4_,this.oldStyles[_loc2_][_loc4_]);
            }
            delete this.oldStyles[_loc2_];
         }
         if(styleFunction != null)
         {
            _loc5_ = styleFunction(IDataRenderer(_loc2_).data,_loc3_);
            if(_loc5_)
            {
               for(_loc4_ in _loc5_)
               {
                  if(!this.oldStyles[_loc2_])
                  {
                     this.oldStyles[_loc2_] = {};
                  }
                  this.oldStyles[_loc2_][_loc4_] = _loc2_.getStyle(_loc4_);
                  _loc2_.setStyle(_loc4_,_loc5_[_loc4_]);
               }
            }
         }
         if(Boolean(_loc3_) && _loc3_.styleFunction != null)
         {
            _loc5_ = _loc3_.styleFunction(IDataRenderer(_loc2_).data,_loc3_);
            if(_loc5_)
            {
               for(_loc4_ in _loc5_)
               {
                  if(!this.oldStyles[_loc2_])
                  {
                     this.oldStyles[_loc2_] = {};
                  }
                  if(!this.oldStyles[_loc2_][_loc4_])
                  {
                     this.oldStyles[_loc2_][_loc4_] = _loc2_.getStyle(_loc4_);
                  }
                  _loc2_.setStyle(_loc4_,_loc5_[_loc4_]);
               }
            }
         }
      }
      
      private function removeOldHeaders() : void
      {
         var _loc1_:IListItemRenderer = null;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.mx_internal::columnGrouping)
         {
            if(Boolean(headerItems) && Boolean(headerItems.length))
            {
               while(headerItems.length)
               {
                  _loc2_ = headerItems.pop();
                  while(_loc2_.length)
                  {
                     _loc1_ = IListItemRenderer(_loc2_.pop());
                     _loc1_.parent.removeChild(DisplayObject(_loc1_));
                  }
               }
            }
         }
         else
         {
            if(Boolean(this.headerItemsList) && Boolean(this.headerItemsList.length))
            {
               while(this.headerItemsList.length)
               {
                  _loc1_ = this.headerItemsList.pop();
                  _loc1_.parent.removeChild(DisplayObject(_loc1_));
               }
            }
            if(this._groupedColumns)
            {
               _loc3_ = int(this._groupedColumns.length);
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  if(this._groupedColumns[_loc4_] is AdvancedDataGridColumnGroup)
                  {
                     this.columnGroupRendererChanged(AdvancedDataGridColumnGroup(this._groupedColumns[_loc4_]));
                  }
                  _loc4_++;
               }
            }
         }
      }
      
      private function columnGroupRendererChanged(param1:AdvancedDataGridColumnGroup) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = !!param1.children ? int(param1.children.length) : 0;
         if(_loc2_ > 0)
         {
            mx_internal::columnRendererChanged(param1);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(param1.children[_loc3_] is AdvancedDataGridColumnGroup)
               {
                  this.columnGroupRendererChanged(param1.children[_loc3_]);
               }
               _loc3_++;
            }
         }
      }
      
      private function addItemsToTarget(param1:DragEvent, param2:Array) : void
      {
         var _loc9_:Object = null;
         var _loc10_:Object = null;
         var _loc3_:String = getQualifiedClassName(param1.relatedObject);
         var _loc4_:Class = getDefinitionByName(_loc3_) as Class;
         var _loc5_:Object = new _loc4_();
         if(!(_loc5_ is AdvancedDataGrid))
         {
            return;
         }
         var _loc6_:Object = param1.relatedObject;
         if(!_loc6_.collection)
         {
            _loc9_ = param2.shift();
            _loc6_.dataProvider = new HierarchicalData(_loc9_);
            _loc6_.validateNow();
         }
         else if(_loc6_.collection.length == 0)
         {
            _loc10_ = param2.shift();
            _loc6_.addChildItem(_loc6_._dropData.parent,_loc10_,_loc6_._dropData.index);
         }
         var _loc7_:int = int(param2.length);
         var _loc8_:int = _loc7_ - 1;
         while(_loc8_ >= 0)
         {
            _loc6_.addChildItem(_loc6_._dropData.parent,param2[_loc8_],_loc6_._dropData.index);
            _loc8_--;
         }
      }
      
      private function validateGroupedColumns(param1:Array) : Boolean
      {
         var _loc7_:AdvancedDataGridColumn = null;
         var _loc8_:String = null;
         var _loc9_:AdvancedDataGridColumnGroup = null;
         var _loc2_:Dictionary = new Dictionary();
         var _loc3_:Array = [];
         var _loc4_:Boolean = true;
         var _loc5_:int = int(param1.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_.push(param1[_loc6_]);
            _loc6_++;
         }
         while(_loc3_.length > 0 && _loc4_)
         {
            _loc7_ = _loc3_.shift();
            _loc8_ = itemToUID(_loc7_);
            if(_loc2_[_loc8_] != null)
            {
               _loc4_ = false;
               throw new Error(resourceManager.getString("datamanagement","repeatColumnsNotAllowed"));
            }
            _loc2_[_loc8_] = _loc7_;
            if(_loc7_ is AdvancedDataGridColumnGroup)
            {
               _loc9_ = AdvancedDataGridColumnGroup(_loc7_);
               if(_loc9_.children)
               {
                  _loc5_ = int(_loc9_.children.length);
                  _loc6_ = 0;
                  while(_loc6_ < _loc5_)
                  {
                     _loc3_.push(_loc9_.children[_loc6_]);
                     _loc6_++;
                  }
               }
            }
         }
         return _loc4_;
      }
      
      private function getLeafColumns(param1:Array) : Array
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(param1[_loc2_] is AdvancedDataGridColumnGroup && param1[_loc2_].children && param1[_loc2_].children.length > 0)
            {
               _loc3_ = param1.slice(0,_loc2_);
               _loc4_ = param1.slice(_loc2_ + 1);
               _loc3_ = _loc3_.concat(this.getLeafColumns(param1[_loc2_].children));
               param1 = _loc3_.concat(_loc4_);
               _loc2_ = int(_loc3_.length);
            }
            else
            {
               _loc2_++;
            }
         }
         return param1;
      }
      
      private function initializeGroupedHeaderInfo(param1:Array, param2:AdvancedDataGridHeaderInfo, param3:int, param4:Function = null) : Array
      {
         var headerInfo:AdvancedDataGridHeaderInfo = null;
         var uid:String = null;
         var childInternalLabelFunction:Function = null;
         var groupedColumns:Array = param1;
         var parent:AdvancedDataGridHeaderInfo = param2;
         var depth:int = param3;
         var parentInternalLabelFunction:Function = param4;
         var headerInfos:Array = [];
         var n:int = int(groupedColumns.length);
         var i:int = 0;
         while(i < n)
         {
            headerInfo = new AdvancedDataGridHeaderInfo(groupedColumns[i],parent,i,depth);
            uid = itemToUID(groupedColumns[i]);
            this.mx_internal::columnsToInfo[uid] = headerInfo;
            groupedColumns[i].owner = this;
            headerInfo.internalLabelFunction = parentInternalLabelFunction;
            if(Boolean(mx_internal::selectedHeaderInfo) && mx_internal::selectedHeaderInfo.column == groupedColumns[i])
            {
               mx_internal::selectedHeaderInfo = headerInfo;
            }
            if(groupedColumns[i] is AdvancedDataGridColumnGroup && groupedColumns[i].children && groupedColumns[i].children.length > 0)
            {
               if(Boolean(groupedColumns[i].dataField) || Boolean(groupedColumns[i].labelFunction) || parentInternalLabelFunction != null)
               {
                  if(parentInternalLabelFunction == null)
                  {
                     childInternalLabelFunction = function(param1:Object, param2:AdvancedDataGridColumn):*
                     {
                        var _loc3_:* = mx_internal::getHeaderInfo(param2).parent;
                        var _loc4_:* = _loc3_.column as AdvancedDataGridColumnGroup;
                        return _loc4_.itemToData(param1);
                     };
                  }
                  else
                  {
                     childInternalLabelFunction = function(param1:Object, param2:AdvancedDataGridColumn):*
                     {
                        var _loc3_:* = mx_internal::getHeaderInfo(param2).parent;
                        var _loc4_:* = _loc3_.column as AdvancedDataGridColumnGroup;
                        var _loc5_:* = _loc3_.internalLabelFunction(param1,_loc3_.column);
                        return _loc4_.itemToData(_loc5_);
                     };
                  }
               }
               headerInfo.children = this.initializeGroupedHeaderInfo(groupedColumns[i].children,headerInfo,depth + 1,childInternalLabelFunction);
            }
            headerInfos.push(headerInfo);
            i++;
         }
         return headerInfos;
      }
      
      protected function updateVisibleHeaderInfos(param1:Array = null, param2:Boolean = true, param3:int = 0) : Object
      {
         var _loc5_:int = 0;
         var _loc7_:Array = null;
         var _loc9_:AdvancedDataGridHeaderInfo = null;
         var _loc10_:Object = null;
         var _loc4_:int = !!param1 ? int(param1.length) : 0;
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc9_ = param1[_loc5_];
            if(!param2)
            {
               _loc9_.visible = false;
            }
            else
            {
               _loc9_.visible = _loc9_.column.visible;
            }
            if(param1[_loc5_].visible == false)
            {
               _loc9_.visibleIndex = NaN;
               _loc9_.actualColNum = NaN;
               _loc9_.columnSpan = 0;
               this.updateVisibleHeaderInfos(_loc9_.children,false);
            }
            else if(Boolean(param1[_loc5_].children) && param1[_loc5_].children.length > 0)
            {
               _loc10_ = this.updateVisibleHeaderInfos(param1[_loc5_].children,true,param3);
               _loc9_.visibleChildren = _loc10_.infos;
               if(_loc9_.visibleChildren == null)
               {
                  _loc9_.visible = false;
                  _loc9_.actualColNum = NaN;
                  _loc9_.columnSpan = 0;
               }
               else
               {
                  if(!_loc7_)
                  {
                     _loc7_ = [];
                  }
                  _loc7_.push(_loc9_);
                  _loc9_.visibleIndex = _loc6_++;
                  _loc9_.actualColNum = param3;
                  _loc9_.columnSpan = _loc10_.colSpan;
               }
            }
            else
            {
               if(!_loc7_)
               {
                  _loc7_ = [];
               }
               _loc9_.visibleIndex = _loc6_++;
               _loc7_.push(_loc9_);
               _loc9_.actualColNum = param3;
               _loc9_.columnSpan = 1;
            }
            _loc8_ += _loc9_.columnSpan;
            param3 += _loc9_.columnSpan;
            _loc5_++;
         }
         return {
            "infos":_loc7_,
            "colSpan":_loc8_
         };
      }
      
      private function updateHeadersList(param1:Array) : void
      {
         var _loc5_:AdvancedDataGridHeaderInfo = null;
         var _loc2_:int = !!param1 ? int(param1.length) : 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = param1[_loc4_];
            orderedHeadersList.push(_loc5_);
            if(Boolean(_loc5_.visibleChildren) && _loc5_.visibleChildren.length > 0)
            {
               this.updateHeadersList(_loc5_.visibleChildren);
            }
            _loc4_++;
         }
      }
      
      private function updateDropData(param1:DragEvent) : void
      {
         var _loc9_:Object = null;
         var _loc10_:int = 0;
         var _loc2_:int = int(rowInfo.length);
         var _loc3_:int = 0;
         var _loc4_:int = rowInfo[_loc3_].height + (!!mx_internal::headerVisible ? headerHeight : 0);
         var _loc5_:Point = globalToLocal(new Point(param1.stageX,param1.stageY));
         while(Boolean(rowInfo[_loc3_]) && _loc5_.y >= _loc4_)
         {
            if(_loc3_ != rowInfo.length - 1)
            {
               _loc3_++;
               _loc4_ += rowInfo[_loc3_].height;
            }
            else
            {
               _loc4_ += rowInfo[_loc3_].height;
               _loc3_++;
            }
         }
         var _loc6_:Number = _loc3_ < rowInfo.length ? Number(rowInfo[_loc3_].y) : rowInfo[_loc3_ - 1].y + rowInfo[_loc3_ - 1].height;
         var _loc7_:Number = _loc5_.y - _loc6_;
         var _loc8_:Number = _loc3_ < rowInfo.length ? Number(rowInfo[_loc3_].height) : Number(rowInfo[_loc3_ - 1].height);
         _loc3_ += verticalScrollPosition;
         var _loc11_:Boolean = false;
         var _loc12_:int = !!collection ? int(collection.length) : 0;
         var _loc13_:Object = _loc3_ > mx_internal::_verticalScrollPosition && _loc3_ <= _loc12_ ? listItems[_loc3_ - mx_internal::_verticalScrollPosition - 1][0].data : null;
         var _loc14_:Object = _loc3_ - verticalScrollPosition < rowInfo.length && _loc3_ < _loc12_ ? listItems[_loc3_ - mx_internal::_verticalScrollPosition][0].data : null;
         var _loc15_:Object = !!collection ? this.getParentItem(_loc13_) : null;
         var _loc16_:Object = !!collection ? this.getParentItem(_loc14_) : null;
         if(_loc7_ > _loc8_ * 0.5 && this.isItemOpen(_loc14_) && this.mx_internal::_rootModel.canHaveChildren(_loc14_) && !this.mx_internal::_rootModel.hasChildren(_loc14_))
         {
            _loc9_ = _loc14_;
            _loc10_ = 0;
            _loc11_ = true;
         }
         else if(!_loc13_ && !_loc3_ == _loc2_)
         {
            _loc9_ = !!collection ? this.getParentItem(_loc14_) : null;
            _loc10_ = !!_loc14_ ? this.getChildIndexInParent(_loc9_,_loc14_) : 0;
            _loc3_ = 0;
         }
         else if(Boolean(_loc14_) && _loc16_ == _loc13_)
         {
            _loc9_ = _loc13_;
            _loc10_ = 0;
         }
         else if(Boolean(_loc13_) && Boolean(_loc14_) && _loc15_ == _loc16_)
         {
            _loc9_ = !!collection ? this.getParentItem(_loc13_) : null;
            _loc10_ = !!iterator ? this.getChildIndexInParent(_loc9_,_loc14_) : 0;
         }
         else if(Boolean(_loc13_) && _loc7_ < _loc8_ * 0.5)
         {
            _loc9_ = _loc15_;
            _loc10_ = this.getChildIndexInParent(_loc9_,_loc13_) + 1;
         }
         else if(!_loc14_)
         {
            _loc9_ = null;
            if(_loc3_ - verticalScrollPosition == 0)
            {
               _loc10_ = 0;
            }
            else if(collection)
            {
               _loc10_ = int(collection.length);
            }
            else
            {
               _loc10_ = 0;
            }
         }
         else
         {
            _loc9_ = _loc16_;
            _loc10_ = this.getChildIndexInParent(_loc9_,_loc14_);
         }
         this.mx_internal::_dropData = {
            "parent":_loc9_,
            "index":_loc10_,
            "localX":param1.localX,
            "localY":param1.localY,
            "emptyFolder":_loc11_,
            "rowHeight":_loc8_,
            "rowIndex":_loc3_
         };
      }
      
      protected function selectColumnGroupHeader(param1:AdvancedDataGridHeaderInfo) : void
      {
         var _loc3_:Sprite = null;
         var _loc4_:Sprite = null;
         var _loc5_:Sprite = null;
         var _loc2_:IListItemRenderer = param1.headerItem;
         if(param1.actualColNum < lockedColumnCount)
         {
            _loc3_ = selectionLayer;
            _loc4_ = this.movingSelectionLayer;
         }
         else
         {
            _loc3_ = this.movingSelectionLayer;
            _loc4_ = selectionLayer;
         }
         _loc5_ = Sprite(_loc3_.getChildByName("headerKeyboardSelection"));
         if(!_loc5_)
         {
            _loc5_ = Sprite(_loc4_.getChildByName("headerKeyboardSelection"));
         }
         if(!_loc5_)
         {
            _loc5_ = new FlexSprite();
            _loc5_.name = "headerKeyboardSelection";
         }
         if(_loc5_.parent != _loc3_)
         {
            _loc3_.addChild(_loc5_);
         }
         var _loc6_:Graphics = _loc5_.graphics;
         _loc6_.clear();
         _loc6_.beginFill(Boolean(mx_internal::isPressed) || isKeyPressed ? uint(getStyle("selectionColor")) : uint(getStyle("rollOverColor")));
         _loc6_.drawRect(0,0,_loc2_.width,_loc2_.height + mx_internal::cachedPaddingTop + mx_internal::cachedPaddingBottom - 0.5);
         _loc6_.endFill();
         _loc5_.x = _loc2_.x;
         _loc5_.y = _loc2_.y - mx_internal::cachedPaddingTop;
         caretIndex = -1;
         mx_internal::isPressed = false;
         this.selectItem(param1.headerItem,false,false);
      }
      
      private function scrollColumnGroupIfNeeded(param1:AdvancedDataGridHeaderInfo, param2:AdvancedDataGridHeaderInfo) : void
      {
         if(!isColumnFullyVisible(displayableColumns[param2.actualColNum].colNum))
         {
            scrollToViewColumn(displayableColumns[param2.actualColNum].colNum,displayableColumns[param1.actualColNum].colNum);
         }
      }
      
      protected function clearHeaderHorizontalSeparators() : void
      {
         if(!this.horizontalSeparators)
         {
            return;
         }
         var _loc1_:Sprite = Sprite(mx_internal::listSubContent.getChildByName("lines"));
         var _loc2_:Sprite = Sprite(_loc1_.getChildByName("headerHorizontalLines"));
         while(_loc2_.numChildren)
         {
            _loc2_.removeChildAt(_loc2_.numChildren - 1);
            this.horizontalSeparators.pop();
         }
         var _loc3_:Sprite = this.getLockedContent();
         var _loc4_:Sprite = Sprite(_loc3_.getChildByName("lockedHeaderheaderHorizontalLines"));
         if(_loc4_)
         {
            while(_loc4_.numChildren)
            {
               _loc4_.removeChildAt(_loc4_.numChildren - 1);
               this.horizontalLockedSeparators.pop();
            }
         }
      }
      
      protected function drawHeaderHorizontalSeparators() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Sprite = null;
         var _loc3_:UIComponent = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:UIComponent = null;
         var _loc7_:UIComponent = null;
         var _loc8_:Sprite = null;
         var _loc9_:UIComponent = null;
         if(!this.horizontalSeparators)
         {
            this.horizontalSeparators = [];
            this.horizontalLockedSeparators = [];
         }
         _loc2_ = Sprite(mx_internal::listSubContent.getChildByName("lines"));
         _loc3_ = UIComponent(_loc2_.getChildByName("headerHorizontalLines"));
         if(!_loc3_)
         {
            _loc3_ = new UIComponent();
            _loc3_.name = "headerHorizontalLines";
            _loc2_.addChild(_loc3_);
         }
         if(_loc2_.numChildren > 1)
         {
            _loc7_ = UIComponent(_loc2_.getChildByName("header"));
            if(_loc7_)
            {
               _loc1_ = _loc2_.getChildIndex(_loc7_);
               if(_loc1_ + 1 < _loc2_.numChildren)
               {
                  _loc2_.setChildIndex(_loc3_,_loc1_ + 1);
               }
            }
         }
         this.numSeparators = 0;
         if(visibleHeaderInfos)
         {
            if(!isNaN(this._lockedColumnCountVal) && this._lockedColumnCountVal > 0)
            {
               _loc5_ = visibleHeaderInfos.slice(0,this._lockedColumnCountVal);
               _loc4_ = visibleHeaderInfos.slice(this._lockedColumnCountVal);
            }
            else
            {
               _loc4_ = visibleHeaderInfos;
            }
            this.createHeaderHorizontalSeparators(_loc4_,this.horizontalSeparators,_loc3_);
         }
         while(_loc3_.numChildren > this.numSeparators)
         {
            _loc3_.removeChildAt(_loc3_.numChildren - 1);
            this.horizontalSeparators.pop();
         }
         this.numSeparators = 0;
         if(lockedColumnCount > 0)
         {
            _loc8_ = this.getLockedContent();
            _loc6_ = UIComponent(_loc8_.getChildByName("lockedHeaderHorizontalLines"));
            if(!_loc6_)
            {
               _loc6_ = new UIComponent();
               _loc6_.name = "lockedHeaderHorizontalLines";
               _loc8_.addChild(_loc6_);
            }
            if(_loc8_.numChildren > 1)
            {
               _loc9_ = UIComponent(_loc8_.getChildByName("lockedHeaderLines"));
               if(_loc9_)
               {
                  _loc1_ = _loc8_.getChildIndex(_loc9_);
                  if(_loc1_ + 1 < _loc2_.numChildren)
                  {
                     _loc8_.setChildIndex(_loc6_,_loc1_ + 1);
                  }
               }
            }
            this.createHeaderHorizontalSeparators(_loc5_,this.horizontalLockedSeparators,_loc6_);
         }
         if(_loc6_)
         {
            while(_loc6_.numChildren > this.numSeparators)
            {
               _loc6_.removeChildAt(_loc6_.numChildren - 1);
               this.horizontalLockedSeparators.pop();
            }
         }
      }
      
      private function getLockedContent() : Sprite
      {
         var _loc1_:Sprite = null;
         _loc1_ = Sprite(listContent.getChildByName("lockedContent"));
         if(!_loc1_)
         {
            _loc1_ = new UIComponent();
            _loc1_.name = "lockedContent";
            _loc1_.cacheAsBitmap = true;
            _loc1_.mouseEnabled = false;
            listContent.addChild(_loc1_);
         }
         listContent.setChildIndex(_loc1_,listContent.numChildren - 1);
         return _loc1_;
      }
      
      protected function createHeaderHorizontalSeparators(param1:Array, param2:Array, param3:UIComponent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:UIComponent = null;
         var _loc7_:IFlexDisplayObject = null;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         _loc4_ = int(param1.length);
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            if(Boolean(param1[_loc5_].visible) && Boolean(param1[_loc5_].visibleChildren) && param1[_loc5_].visibleChildren.length > 0)
            {
               _loc6_ = this.getHorizontalSeparator(this.numSeparators,param2,param3);
               _loc7_ = IFlexDisplayObject(_loc6_.getChildAt(0));
               if(!param1[_loc5_].headerItem)
               {
                  _loc6_.visible = false;
               }
               ++this.numSeparators;
               _loc6_.visible = true;
               _loc8_ = Number(param1[_loc5_].column.width);
               _loc7_.setActualSize(_loc8_,2);
               _loc6_.x = param1[_loc5_].headerItem.x;
               _loc9_ = int(param1[_loc5_].depth);
               _loc6_.y = headerRowInfo[_loc9_].y + (headerRowInfo[_loc9_].height - headerRowInfo[_loc9_ + 1].height) - 2;
               this.createHeaderHorizontalSeparators(param1[_loc5_].children,param2,param3);
            }
            _loc5_++;
         }
      }
      
      protected function getHorizontalSeparator(param1:int, param2:Array, param3:UIComponent) : UIComponent
      {
         var _loc4_:UIComponent = null;
         var _loc5_:IFlexDisplayObject = null;
         var _loc6_:Class = null;
         _loc6_ = getStyle("headerHorizontalSeparatorSkin");
         if(param1 < param3.numChildren)
         {
            _loc4_ = UIComponent(param3.getChildAt(param1));
            _loc5_ = IFlexDisplayObject(_loc4_.getChildAt(0));
         }
         else
         {
            _loc4_ = new UIComponent();
            param3.addChild(_loc4_);
         }
         if(_loc5_)
         {
            if(_loc5_ is _loc6_)
            {
               _loc5_ = IFlexDisplayObject(_loc4_.getChildAt(0));
            }
            else
            {
               _loc4_.removeChildAt(0);
               _loc5_ = null;
            }
         }
         if(!_loc5_)
         {
            _loc5_ = new _loc6_();
            if(_loc5_ is ISimpleStyleClient)
            {
               ISimpleStyleClient(_loc5_).styleName = this;
            }
            _loc4_.addChild(DisplayObject(_loc5_));
         }
         param2.push(_loc4_);
         return _loc4_;
      }
      
      private function updateMovingColumnIndex() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this.mx_internal::movingColumnIndex = -1;
         if(movingColumn)
         {
            _loc1_ = !!orderedHeadersList ? int(orderedHeadersList.length) : 0;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               if(orderedHeadersList[_loc2_].column == movingColumn)
               {
                  this.mx_internal::movingColumnIndex = _loc2_;
                  break;
               }
               _loc2_++;
            }
         }
      }
      
      protected function finishCellKeySelection() : void
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         var _loc4_:IListItemRenderer = null;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Object = null;
         var _loc12_:ListEvent = null;
         var _loc13_:Point = null;
         _loc2_ = int(listItems.length);
         var _loc3_:int = rowInfo[_loc2_ - 1].y + rowInfo[_loc2_ - 1].height > listContent.height ? 1 : 0;
         _loc5_ = false;
         _loc6_ = this.caretColumnIndex;
         if(bSelectItem && caretIndex - verticalScrollPosition >= 0)
         {
            if(caretIndex - verticalScrollPosition > listItems.length - 1)
            {
               caretIndex = listItems.length - 1 + verticalScrollPosition;
            }
            _loc7_ = absoluteToVisibleIndices(caretIndex,this.caretColumnIndex);
            _loc8_ = int(_loc7_.rowIndex);
            _loc9_ = int(_loc7_.columnIndex);
            if(_loc8_ >= 0 && _loc9_ >= 0)
            {
               _loc4_ = listItems[_loc8_][_loc9_];
            }
            while(Boolean(_loc4_) && !_loc4_.visible)
            {
               if(!(Boolean(listItems[_loc8_]) && Boolean(listItems[_loc8_][_loc9_ - 1])))
               {
                  break;
               }
               _loc4_ = listItems[_loc8_][_loc9_];
               _loc9_--;
               _loc6_--;
            }
            if(_loc4_)
            {
               _loc1_ = itemToUID(_loc4_.data);
               if(this.visibleCellRenderers[_loc1_])
               {
                  _loc4_ = this.visibleCellRenderers[_loc1_][_loc6_.toString()];
               }
               if(bShiftKey)
               {
                  this.selectCellItem(_loc4_,bShiftKey,bCtrlKey);
                  _loc5_ = true;
               }
               else if(bCtrlKey)
               {
                  if(lastKey == Keyboard.SPACE)
                  {
                     this.selectCellItem(_loc4_,bShiftKey,bCtrlKey,true);
                  }
                  else
                  {
                     this.drawCellItem(_loc4_,Boolean(this.mx_internal::cellSelectionData[_loc1_]) && this.mx_internal::cellSelectionData[_loc1_][_loc6_.toString()] != null,_loc1_ == highlightUID && this.caretColumnIndex == this.highlightColumnIndex,true);
                     _loc5_ = true;
                  }
               }
               else
               {
                  _loc10_ = caretIndex;
                  this.clearSelectedCells();
                  caretIndex = _loc10_;
                  anchorIndex = caretIndex;
                  mx_internal::_selectedIndex = caretIndex;
                  this.selectedColumnIndex = this.caretColumnIndex;
                  this.anchorColumnIndex = this.caretColumnIndex;
                  this.selectCellItem(_loc4_,bShiftKey,bCtrlKey,false);
                  _loc5_ = true;
               }
            }
         }
         if(!bSelectItem && this.caretColumnIndex - horizontalScrollPosition >= 0)
         {
            if(this.caretColumnIndex - horizontalScrollPosition > _columns.length - 1)
            {
               this.caretColumnIndex = _columns.length - 1 + horizontalScrollPosition;
            }
            if(caretIndex - verticalScrollPosition >= 0)
            {
               _loc11_ = absoluteToVisibleIndices(caretIndex,this.caretColumnIndex);
               _loc4_ = listItems[_loc11_.rowIndex][_loc11_.columnIndex];
            }
            if(_loc4_)
            {
               _loc1_ = itemToUID(_loc4_.data);
               if(this.visibleCellRenderers[_loc1_])
               {
                  _loc4_ = this.visibleCellRenderers[_loc1_][_loc6_.toString()];
               }
               if(bShiftKey)
               {
                  this.selectCellItem(_loc4_,bShiftKey,bCtrlKey);
                  _loc5_ = true;
               }
               else if(bCtrlKey)
               {
                  this.drawCellItem(_loc4_,Boolean(this.mx_internal::cellSelectionData[_loc1_]) && this.mx_internal::cellSelectionData[_loc1_][_loc6_.toString()] != null,_loc1_ == highlightUID && this.caretColumnIndex == this.highlightColumnIndex,true);
               }
               else
               {
                  _loc10_ = caretIndex;
                  this.clearSelectedCells();
                  caretIndex = _loc10_;
                  anchorIndex = caretIndex;
                  mx_internal::_selectedIndex = caretIndex;
                  this.selectCellItem(_loc4_,bShiftKey,bCtrlKey,false);
                  _loc5_ = true;
               }
            }
         }
         if(_loc5_)
         {
            _loc12_ = new ListEvent(ListEvent.CHANGE);
            _loc12_.itemRenderer = _loc4_;
            _loc13_ = this.itemRendererToIndices(_loc4_);
            if(_loc13_)
            {
               _loc12_.rowIndex = _loc13_.y;
               _loc12_.columnIndex = displayToAbsoluteColumnIndex(_loc13_.x);
            }
            dispatchEvent(_loc12_);
         }
      }
      
      protected function selectCellItem(param1:IListItemRenderer, param2:Boolean, param3:Boolean, param4:Boolean = true) : Boolean
      {
         var data:Object;
         var selectionChange:Boolean = false;
         var placeHolder:CursorBookmark = null;
         var pt:Point = null;
         var index:int = 0;
         var columnIndex:int = 0;
         var uid:String = null;
         var numSelected:int = 0;
         var curSelectionData:AdvancedDataGridBaseSelectionData = null;
         var oldCaretIndex:int = 0;
         var oldCaretColumnIndex:int = 0;
         var oldAnchorBookmark:CursorBookmark = null;
         var oldAnchorIndex:int = 0;
         var oldAnchorColumnIndex:int = 0;
         var item:IListItemRenderer = param1;
         var shiftKey:Boolean = param2;
         var ctrlKey:Boolean = param3;
         var transition:Boolean = param4;
         if(!selectable || !item || !this.itemRendererToIndices(item))
         {
            return false;
         }
         if(isHeaderItemRenderer(item))
         {
            return false;
         }
         selectionChange = false;
         placeHolder = iterator.bookmark;
         pt = this.itemRendererToIndices(item);
         if(pt.x < 0)
         {
            return false;
         }
         index = pt.y;
         columnIndex = displayToAbsoluteColumnIndex(pt.x);
         uid = itemToUID(item.data);
         data = item.data;
         if(selectionMode == SINGLE_CELL || selectionMode == MULTIPLE_CELLS && !ctrlKey && !shiftKey)
         {
            numSelected = 0;
            if(selectionMode == MULTIPLE_CELLS)
            {
               curSelectionData = this.mx_internal::firstCellSelectionData;
               if(curSelectionData != null)
               {
                  numSelected++;
                  if(curSelectionData.mx_internal::nextSelectionData)
                  {
                     numSelected++;
                  }
               }
            }
            if(ctrlKey && this.mx_internal::cellSelectionData[uid] && Boolean(this.mx_internal::cellSelectionData[uid][columnIndex]))
            {
               selectionChange = true;
               oldCaretIndex = caretIndex;
               oldCaretColumnIndex = this.caretColumnIndex;
               this.clearSelectedCells();
               caretIndex = oldCaretIndex;
               this.caretColumnIndex = oldCaretColumnIndex;
            }
            else if(mx_internal::_selectedIndex != index || this.selectedColumnIndex != columnIndex || selectionMode == MULTIPLE_CELLS && numSelected != 1 || selectionMode == SINGLE_CELL)
            {
               selectionChange = true;
               this.clearSelectedCells();
               this.addCellSelectionData(uid,columnIndex,new AdvancedDataGridBaseSelectionData(item.data,index,columnIndex,false));
               this.mx_internal::addToSelectedCells(index,columnIndex);
               this.drawCellItem(item,true,uid == highlightUID && columnIndex == this.highlightColumnIndex,true,transition);
               this.selectedColumnIndex = columnIndex;
               mx_internal::_selectedIndex = pt.y;
               iterator.seek(CursorBookmark.CURRENT,mx_internal::_selectedIndex - verticalScrollPosition);
               this.anchorColumnIndex = this.caretColumnIndex = this.selectedColumnIndex;
               anchorIndex = caretIndex = mx_internal::_selectedIndex;
               anchorBookmark = caretBookmark = iterator.bookmark;
               iterator.seek(placeHolder,0);
            }
         }
         else if(shiftKey && selectionMode == MULTIPLE_CELLS)
         {
            if(anchorBookmark)
            {
               oldAnchorBookmark = anchorBookmark;
               oldAnchorIndex = anchorIndex;
               oldAnchorColumnIndex = this.anchorColumnIndex;
               this.clearSelectedCells();
               caretIndex = index;
               this.caretColumnIndex = columnIndex;
               caretBookmark = iterator.bookmark;
               anchorIndex = oldAnchorIndex;
               anchorBookmark = oldAnchorBookmark;
               this.anchorColumnIndex = oldAnchorColumnIndex;
               try
               {
                  iterator.seek(anchorBookmark,0);
               }
               catch(e:ItemPendingError)
               {
                  e.addResponder(new ItemResponder(cellSelectionPendingResultHandler,cellSelectionPendingFailureHandler,new AdvancedDataGridBaseSelectionPending(index,anchorIndex,columnIndex,anchorColumnIndex,item.data,transition,placeHolder,CursorBookmark.CURRENT,0)));
                  iteratorValid = false;
               }
               this.shiftCellSelectionLoop(index,anchorIndex,columnIndex,this.anchorColumnIndex,item.data,transition,placeHolder);
               selectionChange = true;
            }
         }
         else if(ctrlKey && selectionMode == MULTIPLE_CELLS)
         {
            if(Boolean(this.mx_internal::cellSelectionData[uid]) && Boolean(this.mx_internal::cellSelectionData[uid][columnIndex.toString()]))
            {
               this.removeCellSelectionData(uid,columnIndex);
               this.drawCellItem(this.visibleCellRenderers[uid][columnIndex.toString()],false,uid == highlightUID && columnIndex == this.highlightColumnIndex,true,transition);
               this.mx_internal::removeFromSelectedCells(index,columnIndex);
            }
            else
            {
               this.addCellSelectionData(uid,columnIndex,new AdvancedDataGridBaseSelectionData(item.data,index,columnIndex,false));
               this.drawCellItem(this.visibleCellRenderers[uid][columnIndex.toString()],true,uid == highlightUID && columnIndex == this.highlightColumnIndex,true,transition);
               this.mx_internal::addToSelectedCells(index,columnIndex);
               mx_internal::_selectedIndex = index;
               this.selectedColumnIndex = columnIndex;
            }
            iterator.seek(CursorBookmark.CURRENT,index - verticalScrollPosition);
            caretIndex = index;
            this.caretColumnIndex = columnIndex;
            caretBookmark = iterator.bookmark;
            anchorIndex = index;
            this.anchorColumnIndex = columnIndex;
            anchorBookmark = iterator.bookmark;
            iterator.seek(placeHolder,0);
            selectionChange = true;
         }
         return selectionChange;
      }
      
      private function shiftCellSelectionLoop(param1:int, param2:int, param3:int, param4:int, param5:Object, param6:Boolean, param7:CursorBookmark) : void
      {
         var incr:Boolean = false;
         var columnIncr:Boolean = false;
         var data:Object = null;
         var uid:String = null;
         var index:int = 0;
         var columnIndex:int = 0;
         var stopIndex:int = param1;
         var anchorIndex:int = param2;
         var stopColumnIndex:int = param3;
         var anchorColumnIndex:int = param4;
         var stopData:Object = param5;
         var transition:Boolean = param6;
         var placeHolder:CursorBookmark = param7;
         incr = anchorIndex < stopIndex;
         columnIncr = anchorColumnIndex < stopColumnIndex;
         index = anchorIndex;
         try
         {
            do
            {
               data = iterator.current;
               uid = itemToUID(data);
               columnIndex = anchorColumnIndex;
               while(true)
               {
                  this.addCellSelectionData(uid,columnIndex,new AdvancedDataGridBaseSelectionData(data,index,columnIndex,false));
                  this.mx_internal::addToSelectedCells(index,columnIndex);
                  if(Boolean(this.visibleCellRenderers[uid]) && Boolean(this.visibleCellRenderers[uid][columnIndex.toString()]) && Boolean(this.visibleCellRenderers[uid][columnIndex.toString()].visible))
                  {
                     this.drawCellItem(this.visibleCellRenderers[uid][columnIndex.toString()],true,uid == highlightUID && columnIndex == this.highlightColumnIndex,false,transition);
                  }
                  if(!(columnIndex != stopColumnIndex && columnIndex != -1))
                  {
                     break;
                  }
                  if(columnIncr)
                  {
                     columnIndex = viewDisplayableColumnAtOffset(columnIndex,1,-1,false);
                  }
                  else
                  {
                     columnIndex = viewDisplayableColumnAtOffset(columnIndex,-1,-1,false);
                  }
               }
               if(data == stopData)
               {
                  if(Boolean(this.visibleCellRenderers[uid]) && Boolean(this.visibleCellRenderers[uid][columnIndex.toString()]))
                  {
                     this.drawCellItem(this.visibleCellRenderers[uid][columnIndex.toString()],true,uid == highlightUID && columnIndex == this.highlightColumnIndex,true,transition);
                  }
                  break;
               }
               if(incr)
               {
                  index++;
               }
               else
               {
                  index--;
               }
            }
            while(incr ? Boolean(iterator.moveNext()) : Boolean(iterator.movePrevious()));
            
         }
         catch(e:ItemPendingError)
         {
            e.addResponder(new ItemResponder(cellSelectionPendingResultHandler,cellSelectionPendingFailureHandler,new AdvancedDataGridBaseSelectionPending(index,anchorIndex,columnIndex,anchorColumnIndex,data,transition,placeHolder,CursorBookmark.CURRENT,0)));
            iteratorValid = false;
         }
         try
         {
            iterator.seek(placeHolder,0);
            iteratorValid = true;
         }
         catch(e2:ItemPendingError)
         {
            lastSeekPending = new ListBaseSeekPending(placeHolder,0);
            e2.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
         }
      }
      
      private function cellSelectionPendingResultHandler(param1:Object, param2:AdvancedDataGridBaseSelectionPending) : void
      {
         iterator.seek(param2.bookmark,param2.offset);
         this.shiftCellSelectionLoop(param2.index,param2.anchorIndex,param2.columnIndex,param2.anchorColumnIndex,param2.stopData,param2.transition,param2.placeHolder);
      }
      
      private function cellSelectionPendingFailureHandler(param1:Object, param2:AdvancedDataGridBaseSelectionPending) : void
      {
      }
      
      private function isCellAlreadySelected(param1:int, param2:int) : Boolean
      {
         if(!this._selectedCells || !this._selectedCells.length)
         {
            return false;
         }
         return this.mx_internal::cellSelections[[param1,param2]] != null;
      }
      
      mx_internal function addToSelectedCells(param1:int, param2:int) : void
      {
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         if(this.isCellAlreadySelected(param1,param2))
         {
            return;
         }
         _loc3_ = {
            "rowIndex":param1,
            "columnIndex":param2
         };
         _loc4_ = this._selectedCells;
         if(!_loc4_)
         {
            _loc4_ = [];
         }
         _loc4_.unshift(_loc3_);
         this._selectedCells = _loc4_;
         this.mx_internal::cellSelections[[param1,param2]] = _loc3_;
      }
      
      mx_internal function removeFromSelectedCells(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc3_ = -1;
         if(this._selectedCells)
         {
            _loc4_ = int(this._selectedCells.length);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               if(this._selectedCells[_loc5_].rowIndex == param1 && this._selectedCells[_loc5_].columnIndex == param2)
               {
                  _loc3_ = _loc5_;
                  break;
               }
               _loc5_++;
            }
            if(_loc3_ != -1)
            {
               this._selectedCells.splice(_loc3_,1);
            }
         }
      }
      
      protected function addCellSelectionData(param1:String, param2:int, param3:AdvancedDataGridBaseSelectionData) : void
      {
         if(this.mx_internal::firstCellSelectionData != null)
         {
            this.mx_internal::firstCellSelectionData.mx_internal::prevSelectionData = param3;
         }
         param3.mx_internal::nextSelectionData = this.mx_internal::firstCellSelectionData;
         this.mx_internal::firstCellSelectionData = param3;
         if(!this.mx_internal::cellSelectionData[param1])
         {
            this.mx_internal::cellSelectionData[param1] = {};
         }
         this.mx_internal::cellSelectionData[param1][param2.toString()] = param3;
      }
      
      protected function removeCellSelectionData(param1:String, param2:int) : void
      {
         var _loc3_:AdvancedDataGridBaseSelectionData = null;
         if(!this.mx_internal::cellSelectionData[param1])
         {
            return;
         }
         _loc3_ = this.mx_internal::cellSelectionData[param1][param2.toString()];
         if(this.mx_internal::firstCellSelectionData == _loc3_)
         {
            this.mx_internal::firstCellSelectionData = _loc3_.mx_internal::nextSelectionData;
         }
         if(_loc3_.mx_internal::prevSelectionData != null)
         {
            _loc3_.mx_internal::prevSelectionData.mx_internal::nextSelectionData = _loc3_.mx_internal::nextSelectionData;
         }
         if(_loc3_.mx_internal::nextSelectionData != null)
         {
            _loc3_.mx_internal::nextSelectionData.mx_internal::prevSelectionData = _loc3_.mx_internal::prevSelectionData;
         }
         delete this.mx_internal::cellSelectionData[param1][param2.toString()];
         if(!this.atLeastOneProperty(this.mx_internal::cellSelectionData[param1]))
         {
            delete this.mx_internal::cellSelectionData[param1];
         }
      }
      
      protected function atLeastOneProperty(param1:Object) : Boolean
      {
         var _loc2_:String = null;
         var _loc3_:XML = null;
         var _loc4_:int = 0;
         var _loc5_:* = param1;
         for(_loc2_ in _loc5_)
         {
            return true;
         }
         _loc4_ = 0;
         _loc5_ = describeType(data).variable;
         for each(_loc3_ in _loc5_)
         {
            return true;
         }
         return false;
      }
      
      protected function clearSelectedCells(param1:Boolean = false) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:IListItemRenderer = null;
         var _loc5_:Object = null;
         for(_loc2_ in this.visibleCellRenderers)
         {
            for(_loc3_ in this.mx_internal::cellSelectionData[_loc2_])
            {
               _loc5_ = this.visibleCellRenderers[_loc2_];
               if(_loc5_)
               {
                  _loc4_ = _loc5_[_loc3_];
               }
               if(_loc4_)
               {
                  this.drawCellItem(_loc4_,false,_loc2_ == highlightUID && this.highlightColumnIndex == int(_loc3_),false,param1);
               }
            }
         }
         this._selectedCells = [];
         this.mx_internal::cellSelections = {};
         this.clearCellSelectionData();
         mx_internal::_selectedIndex = -1;
         selectedItem = null;
         caretIndex = -1;
         anchorIndex = -1;
         caretBookmark = null;
         anchorBookmark = null;
      }
      
      protected function clearPendingCells() : void
      {
         cellsWaitingToBeDisplayed = false;
         pendingCellSelection.removeAll();
      }
      
      protected function clearCellSelectionData() : void
      {
         this.mx_internal::cellSelectionData = {};
         this.mx_internal::firstCellSelectionData = null;
      }
      
      protected function addIndicatorToSelectionLayer(param1:Sprite, param2:int) : void
      {
         if(param2 < lockedColumnCount)
         {
            if(param1.parent != selectionLayer)
            {
               selectionLayer.addChild(DisplayObject(param1));
            }
            else
            {
               param1.parent.setChildIndex(DisplayObject(param1),param1.parent.numChildren - 1);
            }
         }
         else if(param1.parent != this.movingSelectionLayer)
         {
            this.movingSelectionLayer.addChild(DisplayObject(param1));
         }
         else
         {
            param1.parent.setChildIndex(DisplayObject(param1),param1.parent.numChildren - 1);
         }
      }
      
      protected function drawCellItem(param1:IListItemRenderer, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false) : void
      {
         var _loc6_:Point = null;
         var _loc8_:int = 0;
         var _loc9_:BaseListData = null;
         var _loc10_:Sprite = null;
         var _loc11_:Graphics = null;
         var _loc12_:Number = NaN;
         var _loc13_:int = 0;
         var _loc14_:Array = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:Boolean = false;
         var _loc18_:Object = null;
         var _loc19_:Sprite = null;
         var _loc20_:IListItemRenderer = null;
         if(!param1 || isHeaderItemRenderer(param1))
         {
            return;
         }
         _loc6_ = this.itemRendererToIndices(param1);
         if(!_loc6_)
         {
            return;
         }
         var _loc7_:int = _loc6_.y;
         _loc8_ = displayToAbsoluteColumnIndex(_loc6_.x);
         _loc9_ = rowMap[param1.name];
         _loc12_ = Number(param1.x);
         if(param3 && (!highlightItemRenderer || highlightUID != _loc9_.uid && _loc8_ != this.highlightColumnIndex))
         {
            if(!highlightIndicator)
            {
               _loc10_ = new SpriteAsset();
               highlightIndicator = _loc10_;
            }
            _loc10_ = highlightIndicator;
            this.addIndicatorToSelectionLayer(_loc10_,_loc6_.x);
            drawHighlightIndicator(_loc10_,_loc12_,rowInfo[_loc9_.rowIndex].y,param1.width,rowInfo[_loc9_.rowIndex].height,getStyle("rollOverColor"),param1);
            highlightItemRenderer = param1;
            highlightUID = _loc9_.uid;
            this.highlightColumnIndex = _loc8_;
         }
         else if(!param3 && highlightItemRenderer && (_loc9_ && highlightUID == _loc9_.uid && this.highlightColumnIndex == _loc8_))
         {
            if(highlightIndicator)
            {
               Sprite(highlightIndicator).graphics.clear();
            }
            mx_internal::lastHighlightItemRenderer = highlightItemRenderer;
            highlightItemRenderer = null;
            highlightUID = null;
            this.highlightColumnIndex = -1;
         }
         if(param2)
         {
            if(!this.mx_internal::cellSelectionIndicators[_loc9_.uid])
            {
               this.mx_internal::cellSelectionIndicators[_loc9_.uid] = {};
            }
            _loc17_ = false;
            if(!this.mx_internal::cellSelectionIndicators[_loc9_.uid][_loc8_.toString()])
            {
               _loc10_ = new SpriteAsset();
               _loc10_.mouseEnabled = false;
               this.mx_internal::cellSelectionIndicators[_loc9_.uid][_loc8_.toString()] = _loc10_;
               _loc17_ = true;
            }
            _loc10_ = this.mx_internal::cellSelectionIndicators[_loc9_.uid][_loc8_.toString()];
            this.addIndicatorToSelectionLayer(_loc10_,_loc6_.x);
            drawSelectionIndicator(_loc10_,_loc12_,rowInfo[_loc9_.rowIndex].y,param1.width,rowInfo[_loc9_.rowIndex].height,enabled ? uint(getStyle("selectionColor")) : uint(getStyle("selectionDisabledColor")),param1);
            if(_loc17_)
            {
               if(param5)
               {
                  this.applyCellSelectionEffect(_loc10_,_loc9_.uid,_loc8_,param1);
               }
            }
         }
         else if(!param2)
         {
            if(_loc9_)
            {
               _loc18_ = this.mx_internal::cellSelectionIndicators[_loc9_.uid];
               if((Boolean(_loc18_)) && (Boolean(_loc19_ = _loc18_[_loc8_.toString()])))
               {
                  _loc10_ = _loc19_;
                  if(_loc10_.parent)
                  {
                     _loc10_.parent.removeChild(_loc10_);
                  }
                  delete _loc18_[_loc8_.toString()];
                  if(!this.atLeastOneProperty(_loc18_))
                  {
                     delete this.mx_internal::cellSelectionIndicators[_loc9_.uid];
                  }
               }
            }
         }
         if(param4)
         {
            if(showCaret)
            {
               if(!caretIndicator)
               {
                  _loc10_ = new SpriteAsset();
                  _loc10_.mouseEnabled = false;
                  caretIndicator = _loc10_;
               }
               _loc10_ = caretIndicator;
               this.addIndicatorToSelectionLayer(_loc10_,_loc6_.x);
               drawCaretIndicator(_loc10_,_loc12_,rowInfo[_loc9_.rowIndex].y,param1.width,rowInfo[_loc9_.rowIndex].height,getStyle("selectionColor"),param1);
               caretItemRenderer = param1;
               caretUID = _loc9_.uid;
               this.caretColumnIndex = _loc8_;
            }
         }
         else if(!param4 && caretItemRenderer && caretUID == _loc9_.uid && this.caretColumnIndex == _loc8_)
         {
            if(caretIndicator)
            {
               Sprite(caretIndicator).graphics.clear();
            }
            caretItemRenderer = null;
            caretUID = null;
         }
         if(param1 is IFlexDisplayObject)
         {
            if(param1 is IInvalidating)
            {
               IInvalidating(param1).invalidateDisplayList();
               IInvalidating(param1).validateNow();
            }
         }
         else if(param1 is IUITextField)
         {
            IUITextField(param1).validateNow();
         }
         _loc13_ = int(rowMap[param1.name].rowIndex);
         _loc14_ = this.getOptimumColumns();
         _loc15_ = int(_loc14_.length);
         _loc16_ = 0;
         while(_loc16_ < _loc15_)
         {
            _loc20_ = listItems[_loc13_][_loc16_];
            this.updateDisplayOfItemRenderer(_loc20_);
            _loc16_++;
         }
      }
      
      protected function applyCellSelectionEffect(param1:Sprite, param2:String, param3:int, param4:IListItemRenderer) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Function = null;
         _loc5_ = Number(getStyle("selectionDuration"));
         if(_loc5_ != 0)
         {
            param1.alpha = 0;
            if(!this.cellSelectionTweens[param2])
            {
               this.cellSelectionTweens[param2] = {};
            }
            this.cellSelectionTweens[param2][param3.toString()] = new Tween(param1,0,1,_loc5_,5);
            this.cellSelectionTweens[param2][param3.toString()].addEventListener(TweenEvent.TWEEN_UPDATE,selectionTween_updateHandler);
            this.cellSelectionTweens[param2][param3.toString()].addEventListener(TweenEvent.TWEEN_END,selectionTween_endHandler);
            this.cellSelectionTweens[param2][param3.toString()].setTweenHandlers(onSelectionTweenUpdate,onSelectionTweenUpdate);
            _loc6_ = getStyle("selectionEasingFunction") as Function;
            if(_loc6_ != null)
            {
               this.cellSelectionTweens[param2][param3.toString()].easingFunction = _loc6_;
            }
         }
      }
      
      protected function removeCellIndicators(param1:String, param2:int) : void
      {
         if(Boolean(this.cellSelectionTweens[param1]) && Boolean(this.cellSelectionTweens[param1][param2.toString()]))
         {
            this.cellSelectionTweens[param1][param2.toString()].removeEventListener(TweenEvent.TWEEN_UPDATE,selectionTween_updateHandler);
            this.cellSelectionTweens[param1][param2.toString()].removeEventListener(TweenEvent.TWEEN_END,selectionTween_endHandler);
            if(this.mx_internal::cellSelectionIndicators[param1][param2.toString()].alpha < 1)
            {
               Tween.mx_internal::removeTween(this.cellSelectionTweens[param1][param2.toString()]);
            }
            delete this.cellSelectionTweens[param1][param2.toString()];
            if(!this.atLeastOneProperty(this.cellSelectionTweens[param1]))
            {
               delete this.cellSelectionTweens[param1];
            }
         }
         if(Boolean(this.mx_internal::cellSelectionIndicators[param1]) && Boolean(this.mx_internal::cellSelectionIndicators[param1][param2.toString()]))
         {
            this.mx_internal::cellSelectionIndicators[param1][param2.toString()].parent.removeChild(this.mx_internal::cellSelectionIndicators[param1][param2.toString()]);
            delete this.mx_internal::cellSelectionIndicators[param1][param2.toString()];
            if(!this.atLeastOneProperty(this.mx_internal::cellSelectionIndicators[param1]))
            {
               delete this.mx_internal::cellSelectionIndicators[param1];
            }
         }
         if(param1 == highlightUID && param2 == this.highlightColumnIndex)
         {
            mx_internal::lastHighlightItemRenderer = highlightItemRenderer;
            highlightItemRenderer = null;
            highlightUID = null;
            if(highlightIndicator)
            {
               Sprite(highlightIndicator).graphics.clear();
            }
         }
         if(param1 == caretUID && param2 == this.caretColumnIndex)
         {
            caretItemRenderer = null;
            caretUID = null;
            if(caretIndicator)
            {
               Sprite(caretIndicator).graphics.clear();
            }
         }
      }
      
      override protected function clearIndicators() : void
      {
         if(isCellSelectionMode())
         {
            this.clearCellIndicators();
         }
         super.clearIndicators();
      }
      
      protected function clearCellIndicators() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         for(_loc1_ in this.mx_internal::cellSelectionIndicators)
         {
            for(_loc2_ in this.mx_internal::cellSelectionIndicators[_loc1_])
            {
               this.removeCellIndicators(_loc1_,int(_loc2_));
            }
         }
         this.cellSelectionTweens = {};
         this.mx_internal::cellSelectionIndicators = {};
         this.visibleCellRenderers = {};
      }
      
      mx_internal function setSelectedCells(param1:Array) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:IListItemRenderer = null;
         _loc2_ = true;
         _loc3_ = int(param1.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1[_loc4_];
            if(!this.isCellAlreadySelected(_loc5_.rowIndex,_loc5_.columnIndex))
            {
               _loc6_ = absoluteToVisibleIndices(param1[_loc4_].rowIndex,param1[_loc4_].columnIndex);
               _loc7_ = int(_loc6_.rowIndex);
               _loc8_ = int(_loc6_.columnIndex);
               if(Boolean(listItems[_loc7_]) && Boolean(listItems[_loc7_][_loc8_]))
               {
                  _loc9_ = listItems[_loc7_][_loc8_];
                  if(_loc2_)
                  {
                     this.selectCellItem(_loc9_,false,false);
                     _loc2_ = false;
                  }
                  else
                  {
                     this.selectCellItem(_loc9_,false,true);
                  }
               }
               else
               {
                  this.mx_internal::addToSelectedCells(param1[_loc4_].rowIndex,param1[_loc4_].columnIndex);
                  pendingCellSelection.addItem(param1[_loc4_]);
                  cellsWaitingToBeDisplayed = true;
               }
            }
            _loc4_++;
         }
      }
      
      protected function updateSelectedCells() : void
      {
         switch(selectionMode)
         {
            case NONE:
               if(this._selectedCells)
               {
                  this._selectedCells = null;
               }
               break;
            case SINGLE_ROW:
               this._selectedCells = [{
                  "rowIndex":selectedIndex,
                  "columnIndex":-1
               }];
               break;
            case MULTIPLE_ROWS:
               this._selectedCells = selectedIndices.map(this.rowToCell);
         }
         this.syncCellSelections(this._selectedCells);
      }
      
      private function syncCellSelections(param1:Array) : void
      {
         var _loc2_:Object = null;
         if(!param1)
         {
            this.mx_internal::cellSelections = null;
         }
         else
         {
            this.mx_internal::cellSelections = {};
            for each(_loc2_ in param1)
            {
               this.mx_internal::cellSelections[[_loc2_.rowIndex,_loc2_.columnIndex]] = _loc2_;
            }
         }
      }
      
      private function rowToCell(param1:*, param2:int, param3:Array) : Object
      {
         return {
            "rowIndex":param1,
            "columnIndex":-1
         };
      }
      
      private function getAdjustedLockedCount(param1:int) : int
      {
         if(visibleHeaderInfos)
         {
            param1 = Math.min(param1,visibleHeaderInfos.length);
            if(visibleHeaderInfos[param1 - 1])
            {
               return visibleHeaderInfos[param1 - 1].actualColNum + visibleHeaderInfos[param1 - 1].columnSpan;
            }
         }
         return 0;
      }
      
      override protected function collectionChangeHandler(param1:Event) : void
      {
         var _loc2_:CollectionEvent = null;
         var _loc3_:CollectionEvent = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1 is CollectionEvent)
         {
            _loc2_ = CollectionEvent(param1);
            if(_loc2_.kind == CollectionEventKind.RESET)
            {
               if(this.mx_internal::_rootModel is IGroupingCollection && Boolean(IGroupingCollection(this.mx_internal::_rootModel).grouping))
               {
                  this.groupLabelField = IGroupingCollection(this.mx_internal::_rootModel).grouping.label;
               }
               if(this.mx_internal::_rootModel is IGroupingCollection2 && Boolean(IGroupingCollection2(this.mx_internal::_rootModel).grouping))
               {
                  this.groupLabelField = IGroupingCollection2(this.mx_internal::_rootModel).grouping.label;
               }
               if(this.displayItemsExpanded)
               {
                  this.expandAll();
               }
            }
            if(_loc2_.kind == CollectionEventKind.REFRESH)
            {
               if(this.displayItemsExpanded)
               {
                  this.expandAll();
               }
            }
         }
         super.collectionChangeHandler(param1);
         if(param1 is CollectionEvent)
         {
            _loc3_ = CollectionEvent(param1);
            if(_loc3_.kind == CollectionEventKind.ADD)
            {
               if(this.displayItemsExpanded)
               {
                  _loc4_ = int(_loc3_.items.length);
                  _loc5_ = 0;
                  while(_loc5_ < _loc4_)
                  {
                     this.expandChildrenOf(_loc3_.items[_loc5_],true);
                     _loc5_++;
                  }
               }
            }
         }
      }
      
      override protected function headerNavigationHandler(param1:KeyboardEvent) : void
      {
         var _loc2_:AdvancedDataGridHeaderInfo = null;
         var _loc3_:Array = null;
         var _loc4_:AdvancedDataGridEvent = null;
         if(!this.mx_internal::columnGrouping || mx_internal::headerIndex == -1 || mx_internal::selectedHeaderInfo == null)
         {
            super.headerNavigationHandler(param1);
         }
         else
         {
            if(mx_internal::headerIndex == -1 || mx_internal::selectedHeaderInfo == null)
            {
               return;
            }
            if(param1.keyCode == Keyboard.UP)
            {
               if(mx_internal::selectedHeaderInfo.parent != null)
               {
                  _loc2_ = mx_internal::selectedHeaderInfo.parent;
                  this.unselectColumnHeader(mx_internal::headerIndex);
                  mx_internal::selectedHeaderInfo = _loc2_;
                  mx_internal::headerIndex = _loc2_.index;
                  this.selectColumnGroupHeader(_loc2_);
               }
            }
            else if(param1.keyCode == Keyboard.DOWN)
            {
               if(mx_internal::selectedHeaderInfo.visibleChildren == null || mx_internal::selectedHeaderInfo.visibleChildren.length == 0)
               {
                  this.unselectColumnHeader(mx_internal::selectedHeaderInfo.column.mx_internal::colNum,true);
                  mx_internal::headerIndex = -1;
               }
               else
               {
                  _loc2_ = mx_internal::selectedHeaderInfo.visibleChildren[0];
                  this.unselectColumnHeader(mx_internal::headerIndex);
                  mx_internal::selectedHeaderInfo = _loc2_;
                  mx_internal::headerIndex = 0;
                  this.selectColumnGroupHeader(_loc2_);
               }
            }
            else if(param1.keyCode == Keyboard.LEFT)
            {
               _loc3_ = mx_internal::selectedHeaderInfo.parent != null ? mx_internal::selectedHeaderInfo.parent.visibleChildren : visibleHeaderInfos;
               if(mx_internal::selectedHeaderInfo.visibleIndex > 0)
               {
                  _loc2_ = _loc3_[mx_internal::selectedHeaderInfo.visibleIndex - 1];
                  this.scrollColumnGroupIfNeeded(mx_internal::selectedHeaderInfo,_loc2_);
                  this.unselectColumnHeader(mx_internal::headerIndex);
                  mx_internal::selectedHeaderInfo = _loc2_;
                  mx_internal::headerIndex = _loc2_.visibleIndex;
                  this.selectColumnGroupHeader(_loc2_);
               }
            }
            else if(param1.keyCode == Keyboard.RIGHT)
            {
               _loc3_ = mx_internal::selectedHeaderInfo.parent != null ? mx_internal::selectedHeaderInfo.parent.visibleChildren : visibleHeaderInfos;
               if(mx_internal::selectedHeaderInfo.visibleIndex < _loc3_.length - 1)
               {
                  _loc2_ = _loc3_[mx_internal::selectedHeaderInfo.visibleIndex + 1];
                  this.scrollColumnGroupIfNeeded(mx_internal::selectedHeaderInfo,_loc2_);
                  this.unselectColumnHeader(mx_internal::headerIndex);
                  mx_internal::selectedHeaderInfo = _loc2_;
                  mx_internal::headerIndex = _loc2_.visibleIndex;
                  this.selectColumnGroupHeader(_loc2_);
               }
            }
            else if(param1.keyCode == Keyboard.SPACE)
            {
               if(sortableColumns && mx_internal::selectedHeaderInfo.column.mx_internal::colNum != -1 && !isNaN(mx_internal::selectedHeaderInfo.column.mx_internal::colNum) && Boolean(columns[mx_internal::selectedHeaderInfo.column.mx_internal::colNum].sortable))
               {
                  isKeyPressed = true;
                  this.selectColumnHeader(mx_internal::selectedHeaderInfo.column.mx_internal::colNum);
                  _loc4_ = new AdvancedDataGridEvent(AdvancedDataGridEvent.SORT,false,true);
                  _loc4_.multiColumnSort = param1.ctrlKey;
                  _loc4_.removeColumnFromSort = param1.shiftKey;
                  _loc4_.columnIndex = mx_internal::selectedHeaderInfo.column.mx_internal::colNum;
                  _loc4_.dataField = mx_internal::selectedHeaderInfo.column.dataField;
                  dispatchEvent(_loc4_);
               }
            }
            else if(param1.shiftKey && (param1.keyCode == Keyboard.PAGE_UP || param1.keyCode == Keyboard.PAGE_DOWN))
            {
               moveSelectionHorizontally(param1.keyCode,param1.shiftKey,param1.ctrlKey);
            }
            param1.stopPropagation();
         }
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         if(Boolean(itemEditorInstance) || param1.target != param1.currentTarget)
         {
            return;
         }
         if(this.mx_internal::isOpening)
         {
            param1.stopImmediatePropagation();
            return;
         }
         if(this.mx_internal::_rootModel is IHierarchicalData)
         {
            if(this.treeNavigationHandler(param1))
            {
               return;
            }
         }
         if(isCellSelectionMode() && mx_internal::headerIndex == -1 && param1.keyCode != Keyboard.ESCAPE)
         {
            this.cellNavigationHandler(param1);
         }
         else
         {
            super.keyDownHandler(param1);
         }
         if(isRowSelectionMode())
         {
            this.updateSelectedCells();
         }
      }
      
      override protected function keyUpHandler(param1:KeyboardEvent) : void
      {
         if(isKeyPressed && this.mx_internal::columnGrouping)
         {
            isKeyPressed = false;
            if(mx_internal::selectedHeaderInfo != null)
            {
               this.selectColumnHeader(mx_internal::selectedHeaderInfo.column.mx_internal::colNum);
            }
         }
         else
         {
            super.keyUpHandler(param1);
         }
      }
      
      override protected function editorKeyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.F2)
         {
            endEdit(AdvancedDataGridEventReason.OTHER);
            setFocus();
            invalidateDisplayList();
         }
         super.editorKeyDownHandler(param1);
      }
      
      override protected function mouseOutHandler(param1:MouseEvent) : void
      {
         var _loc2_:IListItemRenderer = null;
         var _loc3_:int = 0;
         if(param1.target == listContent.getChildByName("headerBG"))
         {
            return;
         }
         if(this.tween)
         {
            return;
         }
         if(!sortExpertMode)
         {
            _loc2_ = this.mouseEventToItemRenderer(param1);
            if(_loc2_ && _loc2_ is IDropInListItemRenderer && isHeaderItemRenderer(_loc2_))
            {
               _loc3_ = int(IDropInListItemRenderer(_loc2_).listData.columnIndex);
               delete this.visualSortInfo[_loc3_];
               delete this.visualSortInfo["HEADERPART" + _loc3_];
               invalidateRenderer(_loc2_);
            }
         }
         super.mouseOutHandler(param1);
      }
      
      override protected function mouseOverHandler(param1:MouseEvent) : void
      {
         var _loc2_:IListItemRenderer = null;
         var _loc3_:IDropInListItemRenderer = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:* = false;
         var _loc8_:SortInfo = null;
         var _loc9_:ListEvent = null;
         var _loc10_:Point = null;
         var _loc11_:int = 0;
         var _loc12_:String = null;
         if(this.tween)
         {
            return;
         }
         if(movingColumn)
         {
            return;
         }
         if(!enabled || !selectable)
         {
            return;
         }
         _loc2_ = this.mouseEventToItemRenderer(param1);
         if(!sortExpertMode)
         {
            if(_loc2_)
            {
               _loc3_ = _loc2_ as IDropInListItemRenderer;
            }
            else
            {
               this.visualSortInfo = new Dictionary();
            }
            if(Boolean(_loc3_) && Boolean(_loc3_.listData))
            {
               _loc4_ = int(_loc3_.listData.columnIndex);
            }
            if(_loc3_ && isHeaderItemRenderer(_loc2_) && sortableColumns && _loc4_ != -1 && Boolean(columns[_loc4_].sortable) && Boolean(Object(_loc2_).hasOwnProperty("mouseEventToHeaderPart")))
            {
               _loc5_ = Object(_loc2_).mouseEventToHeaderPart(param1);
               if(!this.visualSortInfo[_loc4_] || this.visualSortInfo["HEADERPART" + _loc4_] != _loc5_)
               {
                  if(_loc5_ == HEADER_TEXT_PART)
                  {
                     this.visualSortInfo[_loc4_] = new SortInfo(1,false,SortInfo.PROPOSEDSORT);
                     invalidateRenderer(_loc2_);
                     this.visualSortInfo["HEADERPART" + _loc4_] = _loc5_;
                  }
                  else if(_loc5_ == HEADER_ICON_PART)
                  {
                     _loc8_ = this.getFieldSortInfo(columns[_loc4_]);
                     if(_loc8_)
                     {
                        _loc6_ = _loc8_.sequenceNumber;
                        _loc7_ = !_loc8_.descending;
                     }
                     else if(collection && collection.sort && collection.sort.fields && Boolean(collection.sort.fields.length))
                     {
                        _loc6_ = collection.sort.fields.length + 1;
                        _loc7_ = false;
                     }
                     else
                     {
                        _loc6_ = 1;
                        _loc7_ = false;
                     }
                     this.visualSortInfo[_loc4_] = new SortInfo(_loc6_,_loc7_,SortInfo.PROPOSEDSORT);
                     invalidateRenderer(_loc2_);
                     this.visualSortInfo["HEADERPART" + _loc4_] = _loc5_;
                  }
               }
            }
         }
         if(_loc2_ && !isHeaderItemRenderer(_loc2_) && isCellSelectionMode())
         {
            _loc10_ = this.itemRendererToIndices(_loc2_);
            if(!_loc10_)
            {
               return;
            }
            mx_internal::isPressed = param1.buttonDown;
            _loc11_ = displayToAbsoluteColumnIndex(_loc10_.x);
            if(!mx_internal::isPressed || allowDragSelection)
            {
               if(Boolean(getStyle("useRollOver")) && _loc2_.data != null)
               {
                  if(allowDragSelection)
                  {
                     mx_internal::bSelectOnRelease = true;
                  }
                  _loc12_ = itemToUID(_loc2_.data);
                  if(this.visibleCellRenderers[_loc12_])
                  {
                     this.drawCellItem(this.visibleCellRenderers[_loc12_][_loc11_.toString()],Boolean(this.mx_internal::cellSelectionData[_loc12_]) && Boolean(this.mx_internal::cellSelectionData[_loc12_][_loc11_.toString()]),true,_loc12_ == caretUID && _loc11_ == this.caretColumnIndex);
                  }
                  if(_loc10_)
                  {
                     _loc9_ = new ListEvent(ListEvent.ITEM_ROLL_OVER);
                     _loc9_.columnIndex = _loc10_.x;
                     _loc9_.rowIndex = _loc10_.y;
                     _loc9_.itemRenderer = _loc2_;
                     dispatchEvent(_loc9_);
                  }
               }
            }
            else
            {
               if(DragManager.isDragging)
               {
                  return;
               }
               if(allowDragSelection || menuSelectionMode)
               {
                  if(this.selectCellItem(_loc2_,param1.shiftKey,param1.ctrlKey))
                  {
                     _loc9_ = new ListEvent(ListEvent.CHANGE);
                     _loc9_.itemRenderer = _loc2_;
                     if(_loc10_)
                     {
                        _loc9_.columnIndex = _loc10_.x;
                        _loc9_.rowIndex = _loc10_.y;
                     }
                     dispatchEvent(_loc9_);
                  }
               }
            }
         }
         else
         {
            super.mouseOverHandler(param1);
         }
      }
      
      override protected function sortHandler(param1:AdvancedDataGridEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:AdvancedDataGridHeaderInfo = null;
         if(param1.isDefaultPrevented())
         {
            return;
         }
         if(!sortableColumns || isNaN(param1.columnIndex) || param1.columnIndex == -1 || !columns[param1.columnIndex].sortable)
         {
            return;
         }
         if(this.mx_internal::columnGrouping)
         {
            _loc2_ = param1.columnIndex;
            if(isNaN(_loc2_) || _loc2_ == -1)
            {
               return;
            }
            _loc3_ = this.mx_internal::getHeaderInfo(columns[_loc2_]);
            if(_loc3_.internalLabelFunction != null)
            {
               param1.dataField = null;
            }
         }
         if(this.mx_internal::columnGrouping && mx_internal::selectedHeaderInfo != null)
         {
            mx_internal::selectedHeaderInfo = this.mx_internal::getHeaderInfo(columns[param1.columnIndex]);
         }
         super.sortHandler(param1);
         if(isRowSelectionMode())
         {
            this.updateSelectedCells();
         }
      }
      
      override protected function headerReleaseHandler(param1:AdvancedDataGridEvent) : void
      {
         var _loc2_:AdvancedDataGridEvent = null;
         if(param1.isDefaultPrevented())
         {
            return;
         }
         if(itemEditorInstance)
         {
            endEdit(AdvancedDataGridEventReason.OTHER);
         }
         if(sortExpertMode)
         {
            super.headerReleaseHandler(param1);
            return;
         }
         _loc2_ = new AdvancedDataGridEvent(AdvancedDataGridEvent.SORT,false,true);
         _loc2_.columnIndex = param1.columnIndex;
         _loc2_.dataField = param1.dataField;
         _loc2_.triggerEvent = param1.triggerEvent;
         _loc2_.multiColumnSort = false;
         if(!collection || !collection.sort || !collection.sort.fields || !collection.sort.fields.length)
         {
            dispatchEvent(_loc2_);
            return;
         }
         if(param1.headerPart == HEADER_TEXT_PART)
         {
            dispatchEvent(_loc2_);
         }
         else if(param1.headerPart == HEADER_ICON_PART)
         {
            _loc2_.multiColumnSort = true;
            dispatchEvent(_loc2_);
         }
      }
      
      override protected function mouseClickHandler(param1:MouseEvent) : void
      {
         if(!this.tween)
         {
            super.mouseClickHandler(param1);
         }
      }
      
      override protected function mouseDoubleClickHandler(param1:MouseEvent) : void
      {
         if(!this.tween)
         {
            super.mouseDoubleClickHandler(param1);
         }
      }
      
      override protected function mouseDownHandler(param1:MouseEvent) : void
      {
         if(!this.tween)
         {
            super.mouseDownHandler(param1);
            this.updateSelectedCells();
         }
      }
      
      override protected function mouseUpHandler(param1:MouseEvent) : void
      {
         if(!this.tween)
         {
            super.mouseUpHandler(param1);
         }
      }
      
      override protected function mouseWheelHandler(param1:MouseEvent) : void
      {
         if(!this.tween)
         {
            super.mouseWheelHandler(param1);
         }
      }
      
      mx_internal function expandItemHandler(param1:AdvancedDataGridEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         if(param1.type == AdvancedDataGridEvent.ITEM_OPENING)
         {
            this.eventItemRenderer = param1.itemRenderer;
            this.expandItem(param1.item,param1.opening,param1.animate,param1.dispatchEvent,param1.triggerEvent);
         }
      }
      
      private function updateCompleteHandler(param1:FlexEvent) : void
      {
         if(UIComponentGlobals.mx_internal::designTime)
         {
            if(!this.dataProvider || (this.dataProvider is ArrayCollection && !ArrayCollection(this.dataProvider).length || this.dataProvider is IHierarchicalCollectionView && !IHierarchicalCollectionView(this.dataProvider).length))
            {
               this.setDesignViewData();
            }
            if(this.designViewDataType == this.designViewDataTreeType && this.dataProvider && this.dataProvider is IHierarchicalCollectionView && (this.designViewDataFlag || !this.atLeastOneProperty(IHierarchicalCollectionView(collection).openNodes)))
            {
               IHierarchicalCollectionView(collection).openNodes = IHierarchicalCollectionView(this.dataProvider).createCursor().current;
               invalidateProperties();
               invalidateDisplayList();
               this.designViewDataFlag = false;
            }
            if(this.designViewDataTypeChanged)
            {
               this.designViewDataTypeChanged = false;
               this.setDesignViewSort();
            }
         }
      }
      
      protected function treeNavigationHandler(param1:KeyboardEvent) : Boolean
      {
         var _loc2_:ListEvent = null;
         var _loc3_:Point = null;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         var _loc8_:IListItemRenderer = null;
         var _loc9_:IListItemRenderer = null;
         var _loc10_:* = false;
         var _loc11_:int = 0;
         var _loc12_:ICollectionView = null;
         var _loc13_:IViewCursor = null;
         _loc4_ = absoluteToVisibleIndices(caretIndex,this.caretColumnIndex != -1 ? this.caretColumnIndex : 0);
         _loc5_ = int(_loc4_.rowIndex);
         _loc6_ = int(_loc4_.columnIndex);
         if(Boolean(listItems[_loc5_]) && Boolean(listItems[_loc5_][_loc6_]))
         {
            _loc7_ = listItems[_loc5_][_loc6_].data;
         }
         if(!_loc7_)
         {
            return false;
         }
         if(listItems[_loc5_])
         {
            _loc8_ = listItems[_loc5_][this.treeColumnIndex];
         }
         if(param1.ctrlKey && param1.shiftKey && param1.keyCode == Keyboard.SPACE)
         {
            if(caretIndex != selectedIndex)
            {
               _loc9_ = indexToItemRenderer(caretIndex);
               if(_loc9_)
               {
                  drawItem(_loc9_);
               }
               caretIndex = selectedIndex;
            }
            if(this.isBranch(_loc7_))
            {
               _loc10_ = !this.isItemOpen(_loc7_);
               this.mx_internal::dispatchAdvancedDataGridEvent(AdvancedDataGridEvent.ITEM_OPENING,_loc7_,_loc8_,param1,_loc10_,true,true);
            }
            param1.stopImmediatePropagation();
         }
         else if(param1.ctrlKey && param1.shiftKey && param1.keyCode == Keyboard.LEFT)
         {
            if(this.isItemOpen(_loc7_))
            {
               this.mx_internal::dispatchAdvancedDataGridEvent(AdvancedDataGridEvent.ITEM_OPENING,_loc7_,_loc8_,param1,false,true,true);
            }
            else
            {
               selectedItem = this.getParentItem(_loc7_);
               _loc2_ = new ListEvent(ListEvent.CHANGE);
               _loc2_.itemRenderer = indexToItemRenderer(selectedIndex);
               _loc3_ = this.itemRendererToIndices(_loc2_.itemRenderer);
               if(_loc3_)
               {
                  _loc2_.rowIndex = _loc3_.y;
                  _loc2_.columnIndex = _loc3_.x;
               }
               dispatchEvent(_loc2_);
               _loc11_ = this.getItemIndex(selectedItem);
               if(_loc11_ != caretIndex)
               {
                  caretIndex = selectedIndex;
               }
               if(_loc11_ < mx_internal::_verticalScrollPosition)
               {
                  this.verticalScrollPosition = _loc11_;
               }
            }
            param1.stopImmediatePropagation();
         }
         else if(param1.ctrlKey && param1.shiftKey && param1.keyCode == Keyboard.RIGHT)
         {
            if(this.isBranch(_loc7_))
            {
               if(this.isItemOpen(_loc7_))
               {
                  if(_loc7_)
                  {
                     _loc12_ = this.mx_internal::getChildren(_loc7_,iterator.view);
                     if(_loc12_)
                     {
                        _loc13_ = _loc12_.createCursor();
                        selectedItem = _loc13_.current;
                     }
                  }
                  else
                  {
                     selectedItem = null;
                  }
                  if(caretIndex != selectedIndex)
                  {
                     caretIndex = this.getItemIndex(selectedItem);
                  }
                  _loc2_ = new ListEvent(ListEvent.CHANGE);
                  _loc2_.itemRenderer = indexToItemRenderer(selectedIndex);
                  _loc3_ = this.itemRendererToIndices(_loc2_.itemRenderer);
                  if(_loc3_)
                  {
                     _loc2_.rowIndex = _loc3_.y;
                     _loc2_.columnIndex = _loc3_.x;
                  }
                  dispatchEvent(_loc2_);
               }
               else
               {
                  this.mx_internal::dispatchAdvancedDataGridEvent(AdvancedDataGridEvent.ITEM_OPENING,_loc7_,_loc8_,param1,true,true,true);
               }
            }
            param1.stopImmediatePropagation();
         }
         else if(param1.keyCode == Keyboard.NUMPAD_MULTIPLY)
         {
            this.expandChildrenOf(_loc7_,!this.isItemOpen(_loc7_));
         }
         else if(param1.keyCode == Keyboard.NUMPAD_ADD)
         {
            if(this.isBranch(_loc7_))
            {
               if(!this.isItemOpen(_loc7_))
               {
                  this.mx_internal::dispatchAdvancedDataGridEvent(AdvancedDataGridEvent.ITEM_OPENING,_loc7_,_loc8_,param1,true,true,true);
               }
            }
         }
         else
         {
            if(param1.keyCode != Keyboard.NUMPAD_SUBTRACT)
            {
               return false;
            }
            if(this.isItemOpen(_loc7_))
            {
               this.mx_internal::dispatchAdvancedDataGridEvent(AdvancedDataGridEvent.ITEM_OPENING,_loc7_,_loc8_,param1,false,true,true);
            }
         }
         return true;
      }
      
      protected function cellNavigationHandler(param1:KeyboardEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:Object = null;
         var _loc16_:AdvancedDataGridEvent = null;
         var _loc17_:Object = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:ScrollEvent = null;
         _loc2_ = [Keyboard.UP,Keyboard.DOWN,Keyboard.LEFT,Keyboard.RIGHT,Keyboard.SPACE,Keyboard.HOME,Keyboard.END,Keyboard.PAGE_UP,Keyboard.PAGE_DOWN,Keyboard.F2];
         _loc3_ = false;
         _loc4_ = int(_loc2_.length);
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            if(param1.keyCode == _loc2_[_loc5_])
            {
               _loc3_ = true;
               break;
            }
            _loc5_++;
         }
         if(!_loc3_)
         {
            if(findKey(param1.keyCode))
            {
               param1.stopPropagation();
            }
            return;
         }
         var _loc6_:Boolean = false;
         _loc7_ = false;
         _loc11_ = int(listItems.length);
         if(_loc11_ == 0)
         {
            return;
         }
         _loc12_ = 0;
         if(rowInfo[_loc11_ - 1].y + rowInfo[_loc11_ - 1].height > listContent.height)
         {
            _loc12_++;
         }
         showCaret = true;
         bSelectItem = false;
         switch(param1.keyCode)
         {
            case Keyboard.UP:
               if(caretIndex == 0 && selectedIndex == 0 && Boolean(mx_internal::headerVisible) && !param1.ctrlKey && !param1.shiftKey)
               {
                  _loc14_ = this.caretColumnIndex;
                  this.clearSelectedCells();
                  moveFocusToHeader(_loc14_);
               }
               else if(caretIndex > 0)
               {
                  if(mx_internal::visibleColumns.length > 0 && mx_internal::visibleColumns[0].colNum > this.caretColumnIndex)
                  {
                     this.caretColumnIndex = mx_internal::visibleColumns[0].colNum;
                  }
                  --caretIndex;
                  _loc7_ = true;
                  bSelectItem = true;
               }
               break;
            case Keyboard.DOWN:
               if(caretIndex < collection.length - 1)
               {
                  ++caretIndex;
                  if(caretIndex == 0)
                  {
                     this.caretColumnIndex = 0;
                  }
                  else if(mx_internal::visibleColumns.length > 0 && mx_internal::visibleColumns[0].colNum > this.caretColumnIndex)
                  {
                     this.caretColumnIndex = mx_internal::visibleColumns[0].colNum;
                  }
                  _loc7_ = true;
                  bSelectItem = true;
               }
               else if(caretIndex == collection.length - 1 && Boolean(_loc12_))
               {
                  if(verticalScrollPosition < maxVerticalScrollPosition)
                  {
                     _loc8_ = verticalScrollPosition + 1;
                  }
               }
               break;
            case Keyboard.LEFT:
               _loc13_ = viewDisplayableColumnAtOffset(this.caretColumnIndex,-1,caretIndex);
               if(_loc13_ != -1)
               {
                  this.caretColumnIndex = _loc13_;
                  bSelectItem = true;
               }
               break;
            case Keyboard.RIGHT:
               _loc13_ = viewDisplayableColumnAtOffset(this.caretColumnIndex,1,caretIndex);
               if(_loc13_ != -1)
               {
                  this.caretColumnIndex = _loc13_;
                  bSelectItem = true;
               }
               break;
            case Keyboard.SPACE:
               bSelectItem = param1.ctrlKey;
               break;
            case Keyboard.HOME:
            case Keyboard.END:
            case Keyboard.PAGE_UP:
            case Keyboard.PAGE_DOWN:
               moveSelectionVertically(param1.keyCode,param1.shiftKey,param1.ctrlKey);
               break;
            case Keyboard.F2:
               if(this.caretColumnIndex != -1)
               {
                  _loc15_ = rowNumberToData(caretIndex);
                  if((_loc15_) && this.isDataEditable(_loc15_) && Boolean(displayableColumns[this.caretColumnIndex].editable))
                  {
                     _loc16_ = new AdvancedDataGridEvent(AdvancedDataGridEvent.ITEM_EDIT_BEGINNING,false,true);
                     _loc16_.columnIndex = this.caretColumnIndex;
                     _loc16_.dataField = columns[this.caretColumnIndex].dataField;
                     _loc16_.rowIndex = caretIndex;
                     _loc17_ = absoluteToVisibleIndices(caretIndex,this.caretColumnIndex);
                     _loc18_ = int(_loc17_.rowIndex);
                     _loc19_ = int(_loc17_.columnIndex);
                     _loc16_.itemRenderer = listItems[_loc18_][_loc19_];
                     dispatchEvent(_loc16_);
                  }
               }
         }
         param1.stopPropagation();
         if(_loc7_)
         {
            if(caretIndex < this.lockedRowCount)
            {
               _loc8_ = 0;
            }
            else if(caretIndex < verticalScrollPosition + this.lockedRowCount)
            {
               _loc8_ = caretIndex - this.lockedRowCount;
            }
            else if(caretIndex >= verticalScrollPosition + _loc11_ - _loc12_)
            {
               _loc8_ = Math.min(maxVerticalScrollPosition,caretIndex - _loc11_ + _loc12_ + 1);
            }
            if(!isNaN(_loc8_))
            {
               if(verticalScrollPosition != _loc8_)
               {
                  _loc20_ = new ScrollEvent(ScrollEvent.SCROLL);
                  _loc20_.detail = ScrollEventDetail.THUMB_POSITION;
                  _loc20_.direction = ScrollEventDirection.VERTICAL;
                  _loc20_.delta = _loc8_ - verticalScrollPosition;
                  _loc20_.position = _loc8_;
                  this.verticalScrollPosition = _loc8_;
                  dispatchEvent(_loc20_);
               }
               if(!iteratorValid)
               {
                  keySelectionPending = true;
                  return;
               }
            }
         }
         bShiftKey = param1.shiftKey;
         bCtrlKey = param1.ctrlKey;
         lastKey = param1.keyCode;
         this.finishCellKeySelection();
      }
   }
}

