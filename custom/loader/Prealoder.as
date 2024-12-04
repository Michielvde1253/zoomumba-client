package custom.loader
{
   import mx.binding.BindingManager;
   import mx.controls.Image;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.primitives.Rect;
   
   public class Prealoder extends Group implements IStateClient2
   {
      private var _213562276_Prealoder_Image1:Image;
      
      public var _Prealoder_Rect1:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_LoaderProgress_1407024497:Class = Prealoder__embed_mxml__general_Decorations_swf_LoaderProgress_1407024497;
      
      public function Prealoder()
      {
         super();
         this.mxmlContent = [this._Prealoder_Image1_i()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._Prealoder_Rect1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"small",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_Prealoder_Image1",
               "name":"scaleX",
               "value":0.3
            }),new SetProperty().initializeFromObject({
               "target":"_Prealoder_Image1",
               "name":"scaleY",
               "value":0.3
            })]
         }),new State({
            "name":"dark",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "name":"left",
               "value":0
            }),new SetProperty().initializeFromObject({
               "name":"right",
               "value":0
            }),new SetProperty().initializeFromObject({
               "name":"top",
               "value":0
            }),new SetProperty().initializeFromObject({
               "name":"bottom",
               "value":0
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
      
      private function _Prealoder_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.fill = this._Prealoder_SolidColor1_c();
         _loc1_.initialized(this,"_Prealoder_Rect1");
         this._Prealoder_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_Prealoder_Rect1",this._Prealoder_Rect1);
         return _loc1_;
      }
      
      private function _Prealoder_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.5;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _Prealoder_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_LoaderProgress_1407024497;
         _loc1_.id = "_Prealoder_Image1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._Prealoder_Image1 = _loc1_;
         BindingManager.executeBindings(this,"_Prealoder_Image1",this._Prealoder_Image1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _Prealoder_Image1() : Image
      {
         return this._213562276_Prealoder_Image1;
      }
      
      public function set _Prealoder_Image1(param1:Image) : void
      {
         var _loc2_:Object = this._213562276_Prealoder_Image1;
         if(_loc2_ !== param1)
         {
            this._213562276_Prealoder_Image1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_Prealoder_Image1",_loc2_,param1));
            }
         }
      }
   }
}

