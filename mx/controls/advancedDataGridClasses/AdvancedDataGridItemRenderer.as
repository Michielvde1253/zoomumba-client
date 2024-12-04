package mx.controls.advancedDataGridClasses
{
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getQualifiedSuperclassName;
   import mx.controls.AdvancedDataGrid;
   import mx.controls.listClasses.BaseListData;
   import mx.controls.listClasses.IDropInListItemRenderer;
   import mx.controls.listClasses.IListItemRenderer;
   import mx.core.IDataRenderer;
   import mx.core.IFlexDisplayObject;
   import mx.core.IToolTip;
   import mx.core.UIComponentGlobals;
   import mx.core.UITextField;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.ToolTipEvent;
   import mx.managers.ILayoutManagerClient;
   import mx.managers.ISystemManager;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.IStyleClient;
   import mx.styles.StyleProtoChain;
   
   use namespace mx_internal;
   
   public class AdvancedDataGridItemRenderer extends UITextField implements IDataRenderer, IDropInListItemRenderer, ILayoutManagerClient, IListItemRenderer, IStyleClient
   {
      mx_internal static const VERSION:String = "4.0.0.14159";
      
      private var invalidatePropertiesFlag:Boolean = false;
      
      private var invalidateSizeFlag:Boolean = false;
      
      private var _data:Object;
      
      private var _listData:AdvancedDataGridListData;
      
      private var _styleDeclaration:CSSStyleDeclaration;
      
      public function AdvancedDataGridItemRenderer()
      {
         super();
         tabEnabled = false;
         mouseWheelEnabled = false;
         ignorePadding = false;
         addEventListener(ToolTipEvent.TOOL_TIP_SHOW,this.toolTipShowHandler);
         inheritingStyles = nonInheritingStyles = StyleProtoChain.STYLE_UNINITIALIZED;
      }
      
      override public function set nestLevel(param1:int) : void
      {
         super.nestLevel = param1;
         UIComponentGlobals.mx_internal::layoutManager.invalidateProperties(this);
         this.invalidatePropertiesFlag = true;
         UIComponentGlobals.mx_internal::layoutManager.invalidateSize(this);
         this.invalidateSizeFlag = true;
      }
      
      [Bindable("dataChange")]
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
      }
      
      [Bindable("dataChange")]
      public function get listData() : BaseListData
      {
         return this._listData;
      }
      
      public function set listData(param1:BaseListData) : void
      {
         this._listData = AdvancedDataGridListData(param1);
         if(Boolean(nestLevel) && !this.invalidatePropertiesFlag)
         {
            UIComponentGlobals.mx_internal::layoutManager.invalidateProperties(this);
            this.invalidatePropertiesFlag = true;
            UIComponentGlobals.mx_internal::layoutManager.invalidateSize(this);
            this.invalidateSizeFlag = true;
         }
      }
      
      public function get styleDeclaration() : CSSStyleDeclaration
      {
         return this._styleDeclaration;
      }
      
      public function set styleDeclaration(param1:CSSStyleDeclaration) : void
      {
         this._styleDeclaration = param1;
      }
      
      override public function initialize() : void
      {
         this.regenerateStyleCache(false);
      }
      
      override public function validateNow() : void
      {
         var _loc1_:Number = NaN;
         if(Boolean(this.data) && Boolean(parent))
         {
            if(AdvancedDataGrid(this._listData.owner).isItemHighlighted(this._listData.uid))
            {
               _loc1_ = this.getStyle("textRollOverColor");
            }
            else if(AdvancedDataGrid(this._listData.owner).isItemSelected(this._listData.uid))
            {
               _loc1_ = this.getStyle("textSelectedColor");
            }
            else
            {
               _loc1_ = this.getStyle("color");
            }
            if(_loc1_ != mx_internal::explicitColor)
            {
               mx_internal::styleChangedFlag = true;
               mx_internal::explicitColor = _loc1_;
               invalidateDisplayList();
            }
         }
         super.validateNow();
      }
      
      override public function getStyle(param1:String) : *
      {
         return !!styleManager.inheritingStyles[param1] ? inheritingStyles[param1] : nonInheritingStyles[param1];
      }
      
      override public function setStyle(param1:String, param2:*) : void
      {
         if(param1 == "styleName")
         {
            styleName = param2;
            return;
         }
         var _loc3_:Boolean = Boolean(styleManager.isInheritingStyle(param1));
         var _loc4_:* = inheritingStyles != StyleProtoChain.STYLE_UNINITIALIZED;
         if(_loc3_)
         {
            if(this.getStyle(param1) == param2 && _loc4_)
            {
               return;
            }
            if(!this.styleDeclaration)
            {
               this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
               this.styleDeclaration.mx_internal::setLocalStyle(param1,param2);
               if(_loc4_)
               {
                  this.regenerateStyleCache(true);
               }
            }
            else
            {
               this.styleDeclaration.mx_internal::setLocalStyle(param1,param2);
            }
         }
         else
         {
            if(this.getStyle(param1) == param2 && _loc4_)
            {
               return;
            }
            if(!this.styleDeclaration)
            {
               this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
               this.styleDeclaration.mx_internal::setLocalStyle(param1,param2);
               if(_loc4_)
               {
                  this.regenerateStyleCache(false);
               }
            }
            else
            {
               this.styleDeclaration.mx_internal::setLocalStyle(param1,param2);
            }
         }
         if(_loc4_)
         {
            styleChanged(param1);
            this.notifyStyleChangeInChildren(param1,_loc3_);
         }
      }
      
      public function validateProperties() : void
      {
         var _loc1_:AdvancedDataGrid = null;
         var _loc2_:AdvancedDataGridColumn = null;
         var _loc3_:Boolean = false;
         this.invalidatePropertiesFlag = false;
         if(this._listData)
         {
            _loc1_ = AdvancedDataGrid(this._listData.owner);
            _loc2_ = _loc1_.columns[this._listData.columnIndex];
            text = this._listData.label;
            if(this._data is AdvancedDataGridColumn)
            {
               wordWrap = _loc1_.mx_internal::columnHeaderWordWrap(_loc2_);
            }
            else
            {
               wordWrap = _loc1_.mx_internal::columnWordWrap(_loc2_);
            }
            if(AdvancedDataGrid(this._listData.owner).variableRowHeight)
            {
               multiline = true;
            }
            _loc3_ = _loc1_.showDataTips;
            if(_loc2_.showDataTips == true)
            {
               _loc3_ = true;
            }
            if(_loc2_.showDataTips == false)
            {
               _loc3_ = false;
            }
            if(_loc3_)
            {
               if(!(this._data is AdvancedDataGridColumn) && (textWidth > width || _loc2_.dataTipFunction || _loc2_.dataTipField || _loc1_.dataTipFunction || _loc1_.dataTipField))
               {
                  toolTip = _loc2_.itemToDataTip(this._data);
               }
               else
               {
                  toolTip = null;
               }
            }
            else
            {
               toolTip = null;
            }
         }
         else
         {
            text = " ";
            toolTip = null;
         }
      }
      
      public function validateSize(param1:Boolean = false) : void
      {
         this.invalidateSizeFlag = false;
         this.validateNow();
      }
      
      public function validateDisplayList() : void
      {
         this.validateNow();
      }
      
      public function clearStyle(param1:String) : void
      {
         this.setStyle(param1,undefined);
      }
      
      public function notifyStyleChangeInChildren(param1:String, param2:Boolean) : void
      {
      }
      
      public function initProtoChain() : void
      {
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:Object = null;
         var _loc10_:CSSStyleDeclaration = null;
         var _loc11_:CSSStyleDeclaration = null;
         mx_internal::styleChangedFlag = true;
         var _loc1_:Array = [];
         if(styleName)
         {
            if(styleName is CSSStyleDeclaration)
            {
               _loc1_.push(CSSStyleDeclaration(styleName));
            }
            else
            {
               if(styleName is IFlexDisplayObject)
               {
                  StyleProtoChain.initProtoChainForUIComponentStyleName(this);
                  return;
               }
               if(styleName is String)
               {
                  _loc7_ = styleName.split(/\s+/);
                  _loc8_ = 0;
                  while(_loc8_ < _loc7_.length)
                  {
                     if(_loc7_[_loc8_].length)
                     {
                        _loc1_.push(styleManager.getMergedStyleDeclaration("." + _loc7_[_loc8_]));
                     }
                     _loc8_++;
                  }
               }
            }
         }
         var _loc2_:Object = styleManager.stylesRoot;
         var _loc3_:IStyleClient = parent as IStyleClient;
         if(_loc3_)
         {
            _loc9_ = _loc3_.inheritingStyles;
            if(_loc9_ == StyleProtoChain.STYLE_UNINITIALIZED)
            {
               _loc9_ = _loc2_;
            }
         }
         else
         {
            _loc9_ = styleManager.stylesRoot;
         }
         var _loc4_:Array = this.getClassStyleDeclarations();
         var _loc5_:int = int(_loc4_.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc10_ = _loc4_[_loc6_];
            _loc9_ = _loc10_.mx_internal::addStyleToProtoChain(_loc9_,this);
            _loc2_ = _loc10_.mx_internal::addStyleToProtoChain(_loc2_,this);
            _loc6_++;
         }
         _loc6_ = 0;
         while(_loc6_ < _loc1_.length)
         {
            _loc11_ = _loc1_[_loc6_];
            if(_loc11_)
            {
               _loc9_ = _loc11_.mx_internal::addStyleToProtoChain(_loc9_,this);
               _loc2_ = _loc11_.mx_internal::addStyleToProtoChain(_loc2_,this);
            }
            _loc6_++;
         }
         inheritingStyles = !!this.styleDeclaration ? this.styleDeclaration.mx_internal::addStyleToProtoChain(_loc9_,this) : _loc9_;
         nonInheritingStyles = !!this.styleDeclaration ? this.styleDeclaration.mx_internal::addStyleToProtoChain(_loc2_,this) : _loc2_;
      }
      
      public function regenerateStyleCache(param1:Boolean) : void
      {
         this.initProtoChain();
      }
      
      public function registerEffects(param1:Array) : void
      {
      }
      
      public function getClassStyleDeclarations() : Array
      {
         var s:CSSStyleDeclaration = null;
         var className:String = getQualifiedClassName(this);
         className = className.replace("::",".");
         var decls:Array = [];
         while(className != null && className != "mx.core.UIComponent" && className != "mx.core.UITextField")
         {
            s = styleManager.getMergedStyleDeclaration(className);
            if(s)
            {
               decls.unshift(s);
            }
            try
            {
               className = getQualifiedSuperclassName(getDefinitionByName(className));
               className = className.replace("::",".");
            }
            catch(e:ReferenceError)
            {
               className = null;
            }
         }
         return decls;
      }
      
      protected function toolTipShowHandler(param1:ToolTipEvent) : void
      {
         var _loc2_:IToolTip = param1.toolTip;
         var _loc3_:ISystemManager = systemManager.topLevelSystemManager;
         var _loc4_:DisplayObject = _loc3_.getSandboxRoot();
         var _loc5_:Rectangle = _loc3_.getVisibleApplicationRect();
         var _loc6_:Point = new Point(0,0);
         _loc6_ = localToGlobal(_loc6_);
         _loc6_ = _loc4_.globalToLocal(_loc6_);
         _loc2_.move(_loc6_.x,_loc6_.y + (height - _loc2_.height) / 2);
         var _loc7_:Number = _loc5_.x + _loc5_.width;
         _loc6_.x = _loc2_.x;
         _loc6_.y = _loc2_.y;
         _loc6_ = _loc4_.localToGlobal(_loc6_);
         if(_loc6_.x + _loc2_.width > _loc7_)
         {
            _loc2_.move(_loc2_.x - (_loc6_.x + _loc2_.width - _loc7_),_loc2_.y);
         }
      }
   }
}

