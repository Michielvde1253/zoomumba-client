package custom.card.component
{
   import mx.binding.BindingManager;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   
   public class CardDecoPossible extends Group implements IStateClient2
   {
      private var _243567592_CardDecoPossible_Image1:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_ArrowOk_463444714:Class = CardDecoPossible__embed_mxml__general_Decorations_swf_ArrowOk_463444714;
      
      public function CardDecoPossible()
      {
         super();
         this.mouseEnabled = false;
         this.mouseChildren = false;
         this.mxmlContent = [this._CardDecoPossible_Image1_i()];
         this.currentState = "none";
         states = [new State({
            "name":"none",
            "overrides":[]
         }),new State({
            "name":"possible",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardDecoPossible_Image1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_ArrowOk_463444714
            })]
         })];
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
      
      private function _CardDecoPossible_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.bottom = -10;
         _loc1_.right = -10;
         _loc1_.percentWidth = 35;
         _loc1_.percentHeight = 35;
         _loc1_.id = "_CardDecoPossible_Image1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardDecoPossible_Image1 = _loc1_;
         BindingManager.executeBindings(this,"_CardDecoPossible_Image1",this._CardDecoPossible_Image1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CardDecoPossible_Image1() : Image
      {
         return this._243567592_CardDecoPossible_Image1;
      }
      
      public function set _CardDecoPossible_Image1(param1:Image) : void
      {
         var _loc2_:Object = this._243567592_CardDecoPossible_Image1;
         if(_loc2_ !== param1)
         {
            this._243567592_CardDecoPossible_Image1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CardDecoPossible_Image1",_loc2_,param1));
            }
         }
      }
   }
}

