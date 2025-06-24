package custom.info.component
{
   import mx.binding.BindingManager;
   import mx.controls.Image;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.HGroup;
   
   public class InfoDisplayTier extends HGroup implements IStateClient2
   {
      public var _InfoDisplayTier_Image1:Image;
      
      public var _InfoDisplayTier_Image2:Image;
      
      public var _InfoDisplayTier_Image3:Image;
      
      public var _InfoDisplayTier_Image4:Image;
      
      public var _InfoDisplayTier_Image5:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_Solitaire_735508405:Class = InfoDisplayTier__embed_mxml__general_Decorations_swf_Solitaire_735508405;
      
      public function InfoDisplayTier()
      {
         super();
         this.gap = 2;
         this.mxmlContent = [];
         this.currentState = "tier_1";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._InfoDisplayTier_Image1_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._InfoDisplayTier_Image2_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._InfoDisplayTier_Image3_i);
         var _loc4_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._InfoDisplayTier_Image4_i);
         var _loc5_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._InfoDisplayTier_Image5_i);
         states = [new State({
            "name":"tier_1",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"tier_2",
            "overrides":[new AddItems().initializeFromObject({
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
         }),new State({
            "name":"tier_3",
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
         }),new State({
            "name":"tier_4",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc4_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
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
         }),new State({
            "name":"tier_5",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc5_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc4_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
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
      
      private function _InfoDisplayTier_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.7;
         _loc1_.scaleY = 0.7;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_Solitaire_735508405;
         _loc1_.id = "_InfoDisplayTier_Image1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayTier_Image1 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayTier_Image1",this._InfoDisplayTier_Image1);
         return _loc1_;
      }
      
      private function _InfoDisplayTier_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.7;
         _loc1_.scaleY = 0.7;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_Solitaire_735508405;
         _loc1_.id = "_InfoDisplayTier_Image2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayTier_Image2 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayTier_Image2",this._InfoDisplayTier_Image2);
         return _loc1_;
      }
      
      private function _InfoDisplayTier_Image3_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.7;
         _loc1_.scaleY = 0.7;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_Solitaire_735508405;
         _loc1_.id = "_InfoDisplayTier_Image3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayTier_Image3 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayTier_Image3",this._InfoDisplayTier_Image3);
         return _loc1_;
      }
      
      private function _InfoDisplayTier_Image4_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.7;
         _loc1_.scaleY = 0.7;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_Solitaire_735508405;
         _loc1_.id = "_InfoDisplayTier_Image4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayTier_Image4 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayTier_Image4",this._InfoDisplayTier_Image4);
         return _loc1_;
      }
      
      private function _InfoDisplayTier_Image5_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.7;
         _loc1_.scaleY = 0.7;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_Solitaire_735508405;
         _loc1_.id = "_InfoDisplayTier_Image5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayTier_Image5 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayTier_Image5",this._InfoDisplayTier_Image5);
         return _loc1_;
      }
   }
}

