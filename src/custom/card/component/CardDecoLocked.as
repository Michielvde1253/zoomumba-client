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
   
   public class CardDecoLocked extends Group implements IStateClient2
   {
      private var _2135202513_CardDecoLocked_Image1:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_Expansion_758828132:Class = CardDecoLocked__embed_mxml__general_Decorations_swf_Expansion_758828132;
      
      private var _embed_mxml__general_Decorations_swf_LockedJustHere_1390330437:Class = CardDecoLocked__embed_mxml__general_Decorations_swf_LockedJustHere_1390330437;
      
      private var _embed_mxml__general_Decorations_swf_LockClosedSPR_555374237:Class = CardDecoLocked__embed_mxml__general_Decorations_swf_LockClosedSPR_555374237;
      
      public function CardDecoLocked()
      {
         super();
         this.mouseEnabled = false;
         this.mouseChildren = false;
         this.mxmlContent = [this._CardDecoLocked_Image1_i()];
         this.currentState = "none";
         states = [new State({
            "name":"none",
            "overrides":[]
         }),new State({
            "name":"expansion",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardDecoLocked_Image1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_Expansion_758828132
            })]
         }),new State({
            "name":"locked",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardDecoLocked_Image1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_LockClosedSPR_555374237
            })]
         }),new State({
            "name":"lockedHere",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardDecoLocked_Image1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_LockedJustHere_1390330437
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
      
      private function _CardDecoLocked_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "_CardDecoLocked_Image1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardDecoLocked_Image1 = _loc1_;
         BindingManager.executeBindings(this,"_CardDecoLocked_Image1",this._CardDecoLocked_Image1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CardDecoLocked_Image1() : Image
      {
         return this._2135202513_CardDecoLocked_Image1;
      }
      
      public function set _CardDecoLocked_Image1(param1:Image) : void
      {
         var _loc2_:Object = this._2135202513_CardDecoLocked_Image1;
         if(_loc2_ !== param1)
         {
            this._2135202513_CardDecoLocked_Image1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CardDecoLocked_Image1",_loc2_,param1));
            }
         }
      }
   }
}

