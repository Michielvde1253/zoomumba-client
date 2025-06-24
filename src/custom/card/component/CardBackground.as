package custom.card.component
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   public class CardBackground extends Group implements IStateClient2
   {
      private var _1078996281_CardBackground_BitmapImage1:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_CardPaperNormal_161553848:Class = CardBackground__embed_mxml__general_Decorations_swf_CardPaperNormal_161553848;
      
      private var _embed_mxml__general_Decorations_swf_CardPaperOceanGoldSmall_1040498806:Class = CardBackground__embed_mxml__general_Decorations_swf_CardPaperOceanGoldSmall_1040498806;
      
      private var _embed_mxml__general_Decorations_swf_CardPaperGreen_1706632604:Class = CardBackground__embed_mxml__general_Decorations_swf_CardPaperGreen_1706632604;
      
      private var _embed_mxml__general_Decorations_swf_CardPaperOceanBlueMedium_1509043838:Class = CardBackground__embed_mxml__general_Decorations_swf_CardPaperOceanBlueMedium_1509043838;
      
      private var _embed_mxml__general_Decorations_swf_CardPaperOceanBlueSmall_10447824:Class = CardBackground__embed_mxml__general_Decorations_swf_CardPaperOceanBlueSmall_10447824;
      
      private var _embed_mxml__general_Decorations_swf_CardPaperGold_1282730371:Class = CardBackground__embed_mxml__general_Decorations_swf_CardPaperGold_1282730371;
      
      private var _embed_mxml__general_Decorations_swf_CardPaperRecycling_1070788859:Class = CardBackground__embed_mxml__general_Decorations_swf_CardPaperRecycling_1070788859;
      
      private var _embed_mxml__general_Decorations_swf_CardPaperOceanGoldNormal_1330245770:Class = CardBackground__embed_mxml__general_Decorations_swf_CardPaperOceanGoldNormal_1330245770;
      
      private var _embed_mxml__general_Decorations_swf_CardPaperOceanBlueNormal_1383034088:Class = CardBackground__embed_mxml__general_Decorations_swf_CardPaperOceanBlueNormal_1383034088;
      
      private var _embed_mxml__general_Decorations_swf_CardPaperOceanGoldMedium_1232208140:Class = CardBackground__embed_mxml__general_Decorations_swf_CardPaperOceanGoldMedium_1232208140;
      
      private var _embed_mxml__general_Decorations_swf_CardPaperOceanGoldLarge_1050914426:Class = CardBackground__embed_mxml__general_Decorations_swf_CardPaperOceanGoldLarge_1050914426;
      
      private var _embed_mxml__general_Decorations_swf_CardPaperBluePrint_134515564:Class = CardBackground__embed_mxml__general_Decorations_swf_CardPaperBluePrint_134515564;
      
      private var _embed_mxml__general_Decorations_swf_CardPaperOceanBlueLarge_3644476:Class = CardBackground__embed_mxml__general_Decorations_swf_CardPaperOceanBlueLarge_3644476;
      
      public function CardBackground()
      {
         super();
         this.width = 130;
         this.height = 152;
         this.mxmlContent = [this._CardBackground_BitmapImage1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardBackground_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_CardPaperNormal_161553848
            })]
         }),new State({
            "name":"gold",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardBackground_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_CardPaperGold_1282730371
            })]
         }),new State({
            "name":"green",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardBackground_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_CardPaperGreen_1706632604
            })]
         }),new State({
            "name":"blueprint",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardBackground_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_CardPaperBluePrint_134515564
            })]
         }),new State({
            "name":"recycling",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardBackground_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_CardPaperRecycling_1070788859
            })]
         }),new State({
            "name":"oceanBlueSmall",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardBackground_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_CardPaperOceanBlueSmall_10447824
            })]
         }),new State({
            "name":"oceanBlueMedium",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardBackground_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_CardPaperOceanBlueMedium_1509043838
            })]
         }),new State({
            "name":"oceanBlueLarge",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardBackground_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_CardPaperOceanBlueLarge_3644476
            })]
         }),new State({
            "name":"oceanBlueNormal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardBackground_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_CardPaperOceanBlueNormal_1383034088
            })]
         }),new State({
            "name":"oceanGoldSmall",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardBackground_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_CardPaperOceanGoldSmall_1040498806
            })]
         }),new State({
            "name":"oceanGoldMedium",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardBackground_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_CardPaperOceanGoldMedium_1232208140
            })]
         }),new State({
            "name":"oceanGoldLarge",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardBackground_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_CardPaperOceanGoldLarge_1050914426
            })]
         }),new State({
            "name":"oceanGoldNormal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CardBackground_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_CardPaperOceanGoldNormal_1330245770
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
      
      private function _CardBackground_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"_CardBackground_BitmapImage1");
         this._CardBackground_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_CardBackground_BitmapImage1",this._CardBackground_BitmapImage1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CardBackground_BitmapImage1() : BitmapImage
      {
         return this._1078996281_CardBackground_BitmapImage1;
      }
      
      public function set _CardBackground_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1078996281_CardBackground_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._1078996281_CardBackground_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CardBackground_BitmapImage1",_loc2_,param1));
            }
         }
      }
   }
}

