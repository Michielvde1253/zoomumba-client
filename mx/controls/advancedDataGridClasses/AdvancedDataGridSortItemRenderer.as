package mx.controls.advancedDataGridClasses
{
   import flash.display.DisplayObject;
   import flash.text.TextLineMetrics;
   import mx.controls.AdvancedDataGrid;
   import mx.controls.listClasses.IDropInListItemRenderer;
   import mx.core.IFlexDisplayObject;
   import mx.core.IUIComponent;
   import mx.core.IUITextField;
   import mx.core.UIComponent;
   import mx.core.UITextField;
   import mx.core.mx_internal;
   import mx.styles.ISimpleStyleClient;
   
   use namespace mx_internal;
   
   public class AdvancedDataGridSortItemRenderer extends UIComponent
   {
      mx_internal static const VERSION:String = "4.0.0.14159";
      
      mx_internal var icon:IFlexDisplayObject;
      
      mx_internal var iconName:String = "icon";
      
      protected var label:IUITextField;
      
      private var _descending:Boolean = false;
      
      public function AdvancedDataGridSortItemRenderer()
      {
         super();
         visible = false;
      }
      
      public function get descending() : Boolean
      {
         return this._descending;
      }
      
      public function set descending(param1:Boolean) : void
      {
         if(this._descending != param1)
         {
            this._descending = param1;
            invalidateDisplayList();
         }
      }
      
      override protected function createChildren() : void
      {
         var _loc1_:Class = null;
         super.createChildren();
         if(!this.label)
         {
            this.label = IUITextField(createInFontContext(UITextField));
            this.label.styleName = this;
            addChild(DisplayObject(this.label));
         }
         if(!this.mx_internal::icon)
         {
            _loc1_ = Class(getStyle(this.mx_internal::iconName));
            if(_loc1_)
            {
               this.mx_internal::icon = new _loc1_();
               this.mx_internal::icon.name = this.mx_internal::iconName;
               if(this.mx_internal::icon is ISimpleStyleClient)
               {
                  ISimpleStyleClient(this.mx_internal::icon).styleName = this;
               }
               addChild(DisplayObject(this.mx_internal::icon));
            }
         }
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         this.getFontStyles();
         var _loc1_:SortInfo = this.getFieldSortInfo();
         if(_loc1_)
         {
            visible = true;
            this.label.text = _loc1_.sequenceNumber.toString();
            if(_loc1_.status == SortInfo.PROPOSEDSORT)
            {
               this.label.setColor(getStyle("proposedColor") !== undefined ? uint(getStyle("proposedColor")) : 10066329);
            }
            else
            {
               this.label.setColor(getStyle("color") !== undefined ? uint(getStyle("color")) : 0);
            }
            this.descending = _loc1_.descending;
         }
         else
         {
            visible = false;
         }
      }
      
      override protected function measure() : void
      {
         super.measure();
         var _loc1_:int = int(getStyle("paddingLeft"));
         var _loc2_:int = int(getStyle("paddingRight"));
         var _loc3_:int = int(getStyle("paddingTop"));
         var _loc4_:int = int(getStyle("paddingBottom"));
         var _loc5_:TextLineMetrics = measureText(this.label.length == 0 ? "2" : this.label.text);
         var _loc6_:Number = _loc5_.width + UITextField.mx_internal::TEXT_WIDTH_PADDING;
         var _loc7_:Number = _loc5_.height + UITextField.mx_internal::TEXT_HEIGHT_PADDING;
         var _loc8_:Number = !!this.mx_internal::icon ? Number(this.mx_internal::icon.width) : 0;
         var _loc9_:Number = !!this.mx_internal::icon ? Number(this.mx_internal::icon.height) : 0;
         var _loc10_:Number = Number(getStyle("horizontalGap"));
         if(_loc8_ == 0)
         {
            _loc10_ = 0;
         }
         var _loc11_:Number = _loc6_ + _loc10_ + _loc8_;
         var _loc12_:Number = Math.max(_loc7_,_loc9_);
         _loc11_ += getStyle("paddingLeft") + getStyle("paddingRight");
         _loc12_ += getStyle("paddingTop") + getStyle("paddingBottom");
         measuredMinWidth = measuredWidth = _loc11_;
         measuredMinHeight = measuredHeight = _loc12_;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         super.updateDisplayList(param1,param2);
         if(param1 == 0)
         {
            return;
         }
         var _loc3_:int = int(getStyle("paddingLeft"));
         var _loc4_:int = int(getStyle("paddingRight"));
         var _loc5_:int = int(getStyle("paddingTop"));
         var _loc6_:int = int(getStyle("paddingBottom"));
         var _loc7_:Number = !!this.mx_internal::icon ? Number(this.mx_internal::icon.width) : 0;
         var _loc8_:Number = !!this.mx_internal::icon ? Number(this.mx_internal::icon.height) : 0;
         var _loc9_:Number = Number(getStyle("horizontalGap"));
         if(_loc7_ == 0)
         {
            _loc9_ = 0;
         }
         var _loc10_:Number = param1 - _loc7_ - _loc9_ - _loc3_ - _loc4_;
         var _loc11_:Number = param2 - _loc5_ - _loc6_;
         this.label.setActualSize(_loc10_,_loc11_);
         var _loc12_:Number = _loc3_;
         var _loc13_:Number = (param2 - this.label.height - _loc5_ - _loc6_) / 2 + _loc5_;
         _loc13_ = Math.max(_loc13_,0);
         this.label.x = Math.round(_loc12_);
         this.label.y = Math.round(_loc13_);
         if(this.mx_internal::icon)
         {
            _loc14_ = param1 - _loc7_ - _loc4_;
            _loc15_ = (param2 - _loc8_ - _loc5_ - _loc6_) / 2 + _loc5_;
            this.mx_internal::icon.x = Math.round(_loc14_);
            this.mx_internal::icon.y = Math.round(_loc15_);
            if(!this.descending)
            {
               this.mx_internal::icon.scaleY = -1;
               this.mx_internal::icon.y += _loc8_;
            }
            else
            {
               this.mx_internal::icon.scaleY = 1;
            }
         }
      }
      
      protected function getFontStyles() : void
      {
         var _loc1_:* = undefined;
         if(this.grid)
         {
            _loc1_ = this.grid.getStyle("sortFontFamily");
            if(_loc1_ !== undefined)
            {
               setStyle("fontFamily",_loc1_);
            }
            _loc1_ = this.grid.getStyle("sortFontSize");
            if(_loc1_ !== undefined)
            {
               setStyle("fontSize",_loc1_);
            }
            _loc1_ = this.grid.getStyle("sortFontStyle");
            if(_loc1_ !== undefined)
            {
               setStyle("fontStyle",_loc1_);
            }
            _loc1_ = this.grid.getStyle("sortFontWeight");
            if(_loc1_ !== undefined)
            {
               setStyle("fontWeight",_loc1_);
            }
         }
      }
      
      protected function getFieldSortInfo() : SortInfo
      {
         var _loc1_:AdvancedDataGridListData = null;
         if(Boolean(this.grid) && parent is IDropInListItemRenderer)
         {
            _loc1_ = (parent as IDropInListItemRenderer).listData as AdvancedDataGridListData;
            if(Boolean(_loc1_) && _loc1_.columnIndex != -1)
            {
               return this.grid.getFieldSortInfo(this.grid.columns[_loc1_.columnIndex]);
            }
         }
         return null;
      }
      
      protected function get grid() : AdvancedDataGrid
      {
         if(Boolean(parent) && Boolean(IUIComponent(parent).owner) && IUIComponent(parent).owner is AdvancedDataGrid)
         {
            return IUIComponent(parent).owner as AdvancedDataGrid;
         }
         return null;
      }
   }
}

