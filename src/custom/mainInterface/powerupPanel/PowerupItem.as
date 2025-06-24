package custom.mainInterface.powerupPanel
{
   import flash.display.Sprite;
   import general.gradientText.GradientTextDEPRECATED;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   
   public class PowerupItem extends Group
   {
      private var _1332194002background:SpriteVisualElement;
      
      private var _3226745icon:SpriteVisualElement;
      
      private var _52923742timerIcon:SpriteVisualElement;
      
      private var _53253650timerText:GradientTextDEPRECATED;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var timeRemaining:int;
      
      public var itemID:int;
      
      public var tooltipID:String;
      
      private var TimerIcon:Class = PowerupItem_TimerIcon;
      
      public function PowerupItem()
      {
         super();
         this.mxmlContent = [this._PowerupItem_SpriteVisualElement1_i(),this._PowerupItem_SpriteVisualElement2_i(),this._PowerupItem_SpriteVisualElement3_i(),this._PowerupItem_GradientTextDEPRECATED1_i()];
         this.addEventListener("creationComplete",this.___PowerupItem_Group1_creationComplete);
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function addIcon(param1:Sprite) : void
      {
         this.icon.addChild(param1);
      }
      
      protected function group1_creationCompleteHandler(param1:FlexEvent) : void
      {
         this.timerIcon.addChild(new this.TimerIcon());
      }
      
      private function _PowerupItem_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _PowerupItem_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 25;
         _loc1_.y = 40;
         _loc1_.initialized(this,"icon");
         this.icon = _loc1_;
         BindingManager.executeBindings(this,"icon",this.icon);
         return _loc1_;
      }
      
      private function _PowerupItem_SpriteVisualElement3_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 107;
         _loc1_.y = 37;
         _loc1_.initialized(this,"timerIcon");
         this.timerIcon = _loc1_;
         BindingManager.executeBindings(this,"timerIcon",this.timerIcon);
         return _loc1_;
      }
      
      private function _PowerupItem_GradientTextDEPRECATED1_i() : GradientTextDEPRECATED
      {
         var _loc1_:GradientTextDEPRECATED = new GradientTextDEPRECATED();
         _loc1_.x = 20;
         _loc1_.y = 47;
         _loc1_.width = 100;
         _loc1_.height = 36;
         _loc1_.fontSize = 12;
         _loc1_.text = "00:00:00:00";
         _loc1_.bold = true;
         _loc1_.align = "right";
         _loc1_.id = "timerText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timerText = _loc1_;
         BindingManager.executeBindings(this,"timerText",this.timerText);
         return _loc1_;
      }
      
      public function ___PowerupItem_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.group1_creationCompleteHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : SpriteVisualElement
      {
         return this._1332194002background;
      }
      
      public function set background(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get icon() : SpriteVisualElement
      {
         return this._3226745icon;
      }
      
      public function set icon(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._3226745icon;
         if(_loc2_ !== param1)
         {
            this._3226745icon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"icon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timerIcon() : SpriteVisualElement
      {
         return this._52923742timerIcon;
      }
      
      public function set timerIcon(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._52923742timerIcon;
         if(_loc2_ !== param1)
         {
            this._52923742timerIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timerIcon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timerText() : GradientTextDEPRECATED
      {
         return this._53253650timerText;
      }
      
      public function set timerText(param1:GradientTextDEPRECATED) : void
      {
         var _loc2_:Object = this._53253650timerText;
         if(_loc2_ !== param1)
         {
            this._53253650timerText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timerText",_loc2_,param1));
            }
         }
      }
   }
}

