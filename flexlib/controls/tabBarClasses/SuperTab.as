package flexlib.controls.tabBarClasses
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFieldType;
   import flexlib.events.SuperTabEvent;
   import mx.controls.Button;
   import mx.controls.tabBarClasses.Tab;
   import mx.core.UIComponent;
   
   public class SuperTab extends Tab
   {
      public static const CLOSE_TAB_EVENT:String = "closeTab";
      
      public static const CLOSE_ALWAYS:String = "close_always";
      
      public static const CLOSE_SELECTED:String = "close_selected";
      
      public static const CLOSE_ROLLOVER:String = "close_rollover";
      
      public static const CLOSE_NEVER:String = "close_never";
      
      private var _rolledOver:Boolean = false;
      
      private var closeButton:Button;
      
      private var indicator:DisplayObject;
      
      private var _closePolicy:String;
      
      private var _showIndicator:Boolean = false;
      
      private var _indicatorOffset:Number = 0;
      
      public var doubleClickToEdit:Boolean = false;
      
      private var _editableLabel:Boolean = false;
      
      public function SuperTab()
      {
         super();
         this.mouseChildren = true;
         this.doubleClickEnabled = true;
         this.addEventListener(MouseEvent.DOUBLE_CLICK,this.doubleClickHandler);
      }
      
      public function get closePolicy() : String
      {
         return this._closePolicy;
      }
      
      public function set closePolicy(param1:String) : void
      {
         this._closePolicy = param1;
         this.invalidateDisplayList();
      }
      
      public function get showIndicator() : Boolean
      {
         return this._showIndicator;
      }
      
      public function set showIndicator(param1:Boolean) : void
      {
         this._showIndicator = param1;
         this.invalidateDisplayList();
      }
      
      public function showIndicatorAt(param1:Number) : void
      {
         this._indicatorOffset = param1;
         this.showIndicator = true;
      }
      
      override protected function measure() : void
      {
         super.measure();
         if(this._closePolicy == SuperTab.CLOSE_ALWAYS || this._closePolicy == SuperTab.CLOSE_ROLLOVER)
         {
            measuredMinWidth += 10;
         }
         else if(this._closePolicy == SuperTab.CLOSE_SELECTED && selected)
         {
            measuredMinWidth += 10;
         }
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.closeButton = new Button();
         this.closeButton.width = 10;
         this.closeButton.height = 10;
         this.closeButton.addEventListener(MouseEvent.MOUSE_UP,this.closeClickHandler,false,0,true);
         this.closeButton.addEventListener(MouseEvent.MOUSE_DOWN,this.cancelEvent,false,0,true);
         this.closeButton.addEventListener(MouseEvent.CLICK,this.cancelEvent,false,0,true);
         var _loc1_:Class = getStyle("indicatorClass") as Class;
         if(_loc1_)
         {
            this.indicator = new _loc1_() as DisplayObject;
         }
         else
         {
            this.indicator = new UIComponent();
         }
         addChild(this.indicator);
         addChild(this.closeButton);
         this.closeButton.enabled = this.enabled;
         this.closeButton.styleName = getStyle("tabCloseButtonStyleName");
         this.textField.addEventListener(Event.CHANGE,this.captureTextChange);
      }
      
      private function doubleClickHandler(param1:MouseEvent) : void
      {
         if(this.doubleClickToEdit && this.enabled)
         {
            this.editableLabel = true;
         }
      }
      
      private function textUnfocusListener(param1:Event) : void
      {
         this.label = textField.text;
         this.editableLabel = false;
         dispatchEvent(new SuperTabEvent(SuperTabEvent.TAB_UPDATED,-1));
      }
      
      public function get editableLabel() : Boolean
      {
         return this._editableLabel;
      }
      
      public function set editableLabel(param1:Boolean) : void
      {
         if(param1 != this._editableLabel)
         {
            this._editableLabel = param1;
            this.textField.type = param1 ? TextFieldType.INPUT : TextFieldType.DYNAMIC;
            this.textField.selectable = param1;
            if(param1)
            {
               this.addEventListener(MouseEvent.MOUSE_DOWN,this.cancelEvent,false,10);
               this.textField.addEventListener(FocusEvent.FOCUS_OUT,this.textUnfocusListener);
               this.textField.addEventListener(KeyboardEvent.KEY_DOWN,this.checkEnterKey);
               this.textField.setSelection(0,textField.length - 1);
            }
            else
            {
               this.removeEventListener(MouseEvent.MOUSE_DOWN,this.cancelEvent);
               this.textField.removeEventListener(FocusEvent.FOCUS_OUT,this.textUnfocusListener);
               this.textField.removeEventListener(KeyboardEvent.KEY_DOWN,this.checkEnterKey);
               this.textField.setSelection(0,0);
               this.textField.invalidateDisplayList();
            }
         }
      }
      
      private function checkEnterKey(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 13)
         {
            param1.stopImmediatePropagation();
            param1.stopPropagation();
            this.editableLabel = false;
            dispatchEvent(new SuperTabEvent(SuperTabEvent.TAB_UPDATED,-1));
         }
      }
      
      private function captureTextChange(param1:Event) : void
      {
         if(this.label != textField.text)
         {
            this.label = textField.text;
         }
         param1.stopImmediatePropagation();
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         if(this.closeButton)
         {
            this.closeButton.enabled = param1;
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:String = null;
         super.updateDisplayList(param1,param2);
         setChildIndex(this.closeButton,numChildren - 2);
         setChildIndex(this.indicator,numChildren - 1);
         this.closeButton.visible = false;
         this.indicator.visible = false;
         if(this._closePolicy == SuperTab.CLOSE_SELECTED)
         {
            if(selected)
            {
               this.closeButton.visible = true;
               this.closeButton.enabled = true;
            }
         }
         else if(!this._rolledOver)
         {
            if(this._closePolicy == SuperTab.CLOSE_ALWAYS)
            {
               this.closeButton.visible = true;
               this.closeButton.enabled = false;
            }
            else if(this._closePolicy == SuperTab.CLOSE_ROLLOVER)
            {
               this.closeButton.visible = false;
               this.closeButton.enabled = false;
            }
         }
         else if(this._closePolicy != SuperTab.CLOSE_NEVER)
         {
            this.closeButton.visible = true;
            this.closeButton.enabled = this.enabled;
         }
         if(this._showIndicator)
         {
            this.indicator.visible = true;
            this.indicator.x = this._indicatorOffset - this.indicator.width / 2;
            this.indicator.y = 0;
         }
         if(this.closeButton.visible)
         {
            this.closeButton.x = param1 - this.closeButton.width - 4;
            this.closeButton.y = 4;
            _loc3_ = getStyle("tabCloseButtonStyleName");
            if(_loc3_ != null && _loc3_ != this.closeButton.styleName)
            {
               this.closeButton.styleName = _loc3_;
            }
            setChildIndex(this.closeButton,numChildren - 1);
         }
      }
      
      override protected function rollOverHandler(param1:MouseEvent) : void
      {
         if(!enabled)
         {
            param1.stopImmediatePropagation();
            param1.stopPropagation();
            return;
         }
         this._rolledOver = true;
         super.rollOverHandler(param1);
      }
      
      override protected function rollOutHandler(param1:MouseEvent) : void
      {
         this._rolledOver = false;
         super.rollOutHandler(param1);
      }
      
      private function closeClickHandler(param1:MouseEvent) : void
      {
         if(this.enabled)
         {
            dispatchEvent(new Event(CLOSE_TAB_EVENT));
         }
         param1.stopImmediatePropagation();
         param1.stopPropagation();
      }
      
      override public function set selected(param1:Boolean) : void
      {
         super.selected = param1;
         callLater(invalidateSize);
      }
      
      private function cancelEvent(param1:Event) : void
      {
         param1.stopPropagation();
         param1.stopImmediatePropagation();
      }
      
      override public function get measuredWidth() : Number
      {
         return this.measuredMinWidth;
      }
   }
}

