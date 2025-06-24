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
   
   public class CardDecoReady extends Group implements IStateClient2
   {
      private var _1412540398_CardDecoReady_Image1:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_ArrowOk_463444714:Class = CardDecoReady__embed_mxml__general_Decorations_swf_ArrowOk_463444714;
      
      public function CardDecoReady()
      {
         super();
         this.mouseEnabled = false;
         this.mouseChildren = false;
         this.mxmlContent = [this._CardDecoReady_Image1_i()];
         this.currentState = "none";
         states = [new State({
            "name":"none",
            "overrides":[]
         }),new State({
            "name":"ready",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardDecoReady_Image1",
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
      
      private function _CardDecoReady_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "_CardDecoReady_Image1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardDecoReady_Image1 = _loc1_;
         BindingManager.executeBindings(this,"_CardDecoReady_Image1",this._CardDecoReady_Image1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CardDecoReady_Image1() : Image
      {
         return this._1412540398_CardDecoReady_Image1;
      }
      
      public function set _CardDecoReady_Image1(param1:Image) : void
      {
         var _loc2_:Object = this._1412540398_CardDecoReady_Image1;
         if(_loc2_ !== param1)
         {
            this._1412540398_CardDecoReady_Image1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CardDecoReady_Image1",_loc2_,param1));
            }
         }
      }
   }
}

