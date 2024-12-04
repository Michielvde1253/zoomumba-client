package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.SizedMiniWindow;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import flash.display.MovieClip;
   import flash.text.TextField;
   import spark.core.SpriteVisualElement;
   import windows.custom.confirmation.extended.ExtendedBuyConfirmationContent;
   
   public class ZDResourceConfirmationWindow extends SizedMiniWindow
   {
      private var windowTitleText:String = "zoo.window.confirmation.shop.buyitemreal.title";
      
      private var windowInfoText:String = "zoo.window.confirmation.shop.buyitemreal.info";
      
      private var item:ItemPackVO;
      
      public function ZDResourceConfirmationWindow(param1:Notifier, param2:ItemPackVO, param3:WindowButtonParams = null)
      {
         var _loc4_:String = null;
         _loc4_ = "ZDResourceConfirmation";
         modal = true;
         useHeaderLoader = false;
         this.item = param2;
         super(param1,_loc4_,param3);
      }
      
      override public function draw() : void
      {
         halign = Coreponent.ALIGN_H_LEFT;
         valign = Coreponent.ALIGN_V_TOP;
         this.x = 300;
         this.y = 115;
         super.draw();
      }
      
      override protected function loadContentFinished() : void
      {
         super.loadContentFinished();
         this.loadIndividualItems();
      }
      
      private function loadIndividualItems() : void
      {
         var _loc1_:MovieClip = loadedContent.getChildByName("WindowContainer") as MovieClip;
         var _loc2_:TextField = loadedContent.getChildByName("txt_title") as TextField;
         var _loc3_:TextField = loadedContent.getChildByName("txt_info") as TextField;
         var _loc4_:TextField = loadedContent.getChildByName("txt_amount") as TextField;
         _loc2_.text = TextResourceModule.getText(this.windowTitleText);
         _loc3_.text = TextResourceModule.getText(this.windowInfoText);
         StyleModule.setTextFieldStyle(_loc2_,StyleModule.HEADER_BOLD_18_CENTER);
         StyleModule.setTextFieldStyle(_loc3_,StyleModule.HEADER_BOLD_12_CENTER);
         StyleModule.setTextFieldStyle(_loc4_,StyleModule.HEADER_BOLD_12_RIGHT);
         var _loc5_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.addChild(_loc5_);
         var _loc6_:ExtendedBuyConfirmationContent = new ExtendedBuyConfirmationContent();
         _loc5_.addChild(_loc6_);
         _loc6_.x = -140;
         _loc6_.y = -70;
         if(this.item.count > 0)
         {
            _loc4_.text = this.item.count.toString() + " X";
         }
         _loc6_.label.value = 2 * this.item.count;
         var _loc7_:WrapedSprite = new WrapedSprite(AssetIds.getPreviewAssetId(this.item.category,this.item.itemId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,50);
         _loc7_.x = 50;
         _loc7_.y = 113;
         _loc1_.addChild(_loc7_);
         _loc6_.itemPreview.invalidateSize();
      }
      
      override public function show() : void
      {
         super.show();
      }
      
      override public function hide() : void
      {
         super.hide();
      }
   }
}

