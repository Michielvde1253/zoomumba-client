package custom.card.component
{
   import components.image.StandardImage;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.HGroup;
   
   public class CardChances extends HGroup implements IStateClient2
   {
      public var _CardChances_StandardImage1:StandardImage;
      
      public var _CardChances_StandardImage2:StandardImage;
      
      public var _CardChances_StandardImage3:StandardImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_LoveVector_582927802:Class = CardChances__embed_mxml__general_Decorations_swf_LoveVector_582927802;
      
      public function CardChances()
      {
         super();
         this.horizontalAlign = "center";
         this.gap = 20;
         this.mxmlContent = [];
         this.currentState = "chance0";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CardChances_StandardImage1_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CardChances_StandardImage2_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CardChances_StandardImage3_i);
         states = [new State({
            "name":"chance0",
            "overrides":[]
         }),new State({
            "name":"chance1",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"chance2",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"chance3",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
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
      
      private function _CardChances_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = null;
         _loc1_ = new StandardImage();
         _loc1_.displayScale = 0.4;
         _loc1_.currentState = "imageCentered";
         _loc1_.displayClass = this._embed_mxml__general_Decorations_swf_LoveVector_582927802;
         _loc1_.id = "_CardChances_StandardImage1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardChances_StandardImage1 = _loc1_;
         BindingManager.executeBindings(this,"_CardChances_StandardImage1",this._CardChances_StandardImage1);
         return _loc1_;
      }
      
      private function _CardChances_StandardImage2_i() : StandardImage
      {
         var _loc1_:StandardImage = null;
         _loc1_ = new StandardImage();
         _loc1_.displayScale = 0.4;
         _loc1_.currentState = "imageCentered";
         _loc1_.displayClass = this._embed_mxml__general_Decorations_swf_LoveVector_582927802;
         _loc1_.id = "_CardChances_StandardImage2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardChances_StandardImage2 = _loc1_;
         BindingManager.executeBindings(this,"_CardChances_StandardImage2",this._CardChances_StandardImage2);
         return _loc1_;
      }
      
      private function _CardChances_StandardImage3_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.displayScale = 0.4;
         _loc1_.currentState = "imageCentered";
         _loc1_.displayClass = this._embed_mxml__general_Decorations_swf_LoveVector_582927802;
         _loc1_.id = "_CardChances_StandardImage3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardChances_StandardImage3 = _loc1_;
         BindingManager.executeBindings(this,"_CardChances_StandardImage3",this._CardChances_StandardImage3);
         return _loc1_;
      }
   }
}

