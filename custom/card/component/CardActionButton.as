package custom.card.component
{
   import buttons.extended.ButtonAction;
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import custom.card.events.CardEvent;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   
   public class CardActionButton extends Group implements IStateClient2
   {
      private var _1377687758button:ButtonAction;
      
      private var _1777527070buttonLabel:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function CardActionButton()
      {
         var _loc1_:DeferredInstanceFromFunction = null;
         var _loc2_:DeferredInstanceFromFunction = null;
         super();
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [];
         this.currentState = "none";
         _loc1_ = new DeferredInstanceFromFunction(this._CardActionButton_Button1_i);
         _loc2_ = new DeferredInstanceFromFunction(this._CardActionButton_ButtonAction1_i);
         states = [new State({
            "name":"none",
            "overrides":[]
         }),new State({
            "name":"button",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"buttonLabel",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         })];
         _loc2_.getInstance();
         _loc1_.getInstance();
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
      
      private function _CardActionButton_ButtonAction1_i() : ButtonAction
      {
         var _loc1_:ButtonAction = new ButtonAction();
         _loc1_.bottom = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.addEventListener("click",this.__button_click);
         _loc1_.id = "button";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.button = _loc1_;
         BindingManager.executeBindings(this,"button",this.button);
         return _loc1_;
      }
      
      public function __button_click(param1:MouseEvent) : void
      {
         dispatchEvent(new CardEvent(CardEvent.ACTION_BUTTON_CLICKED));
      }
      
      private function _CardActionButton_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.bottom = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 112;
         _loc1_.height = 30;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.addEventListener("click",this.__buttonLabel_click);
         _loc1_.id = "buttonLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonLabel = _loc1_;
         BindingManager.executeBindings(this,"buttonLabel",this.buttonLabel);
         return _loc1_;
      }
      
      public function __buttonLabel_click(param1:MouseEvent) : void
      {
         dispatchEvent(new CardEvent(CardEvent.ACTION_BUTTON_CLICKED));
      }
      
      [Bindable(event="propertyChange")]
      public function get button() : ButtonAction
      {
         return this._1377687758button;
      }
      
      public function set button(param1:ButtonAction) : void
      {
         var _loc2_:Object = this._1377687758button;
         if(_loc2_ !== param1)
         {
            this._1377687758button = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"button",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonLabel() : Button
      {
         return this._1777527070buttonLabel;
      }
      
      public function set buttonLabel(param1:Button) : void
      {
         var _loc2_:Object = this._1777527070buttonLabel;
         if(_loc2_ !== param1)
         {
            this._1777527070buttonLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonLabel",_loc2_,param1));
            }
         }
      }
   }
}

