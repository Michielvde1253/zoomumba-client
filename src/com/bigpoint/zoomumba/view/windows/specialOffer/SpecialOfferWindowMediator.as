package com.bigpoint.zoomumba.view.windows.specialOffer
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import windows.custom.specialOffer.SpecialOfferContent;
   import windows.custom.specialOffer.SpecialOfferWindow;
   
   public class SpecialOfferWindowMediator extends WindowMediator
   {
      public static const NAME:String = "SpecialOfferWindowMediator";
      
      public function SpecialOfferWindowMediator(param1:SpecialOfferWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:InformationInitParams = param1 as InformationInitParams;
         this.content.header.title.text = _loc2_.title;
         this.content.message.htmlText = _loc2_.message;
         this.content.icon.source = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.PREMIUM,30),AssetConfig.DEFAULT_OBJECT_SPR);
      }
      
      private function get content() : SpecialOfferContent
      {
         return this.window.getContent() as SpecialOfferContent;
      }
      
      private function get window() : SpecialOfferWindow
      {
         return this.viewComponent as SpecialOfferWindow;
      }
      
      override public function dispose() : void
      {
      }
   }
}

