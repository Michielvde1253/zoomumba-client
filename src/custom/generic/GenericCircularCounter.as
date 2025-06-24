package custom.generic
{
   import buttons.customButtons.CustomizableCircularButton;
   import components.counter.Counter;
   import components.counter.CounterRectSmallSkin;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   
   public class GenericCircularCounter extends Group
   {
      private var _1377687758button:CustomizableCircularButton;
      
      private var _957830652counter:Counter;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var index:int = -1;
      
      public var valueId:String = "";
      
      public function GenericCircularCounter()
      {
         super();
         this.mxmlContent = [this._GenericCircularCounter_CustomizableCircularButton1_i(),this._GenericCircularCounter_Counter1_i()];
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
      
      private function _GenericCircularCounter_CustomizableCircularButton1_i() : CustomizableCircularButton
      {
         var _loc1_:CustomizableCircularButton = new CustomizableCircularButton();
         _loc1_.enabled = false;
         _loc1_.backgroundScale = 0.5;
         _loc1_.id = "button";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.button = _loc1_;
         BindingManager.executeBindings(this,"button",this.button);
         return _loc1_;
      }
      
      private function _GenericCircularCounter_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.visible = true;
         _loc1_.bottom = -15;
         _loc1_.right = -20;
         _loc1_.setStyle("skinClass",CounterRectSmallSkin);
         _loc1_.id = "counter";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.counter = _loc1_;
         BindingManager.executeBindings(this,"counter",this.counter);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get button() : CustomizableCircularButton
      {
         return this._1377687758button;
      }
      
      public function set button(param1:CustomizableCircularButton) : void
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
      public function get counter() : Counter
      {
         return this._957830652counter;
      }
      
      public function set counter(param1:Counter) : void
      {
         var _loc2_:Object = this._957830652counter;
         if(_loc2_ !== param1)
         {
            this._957830652counter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"counter",_loc2_,param1));
            }
         }
      }
   }
}

