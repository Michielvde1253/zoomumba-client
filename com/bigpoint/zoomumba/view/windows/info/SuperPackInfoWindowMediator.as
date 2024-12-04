package com.bigpoint.zoomumba.view.windows.info
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.windows.info.SuperPackInfoInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.display.Sprite;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.superPack.SuperPackInfoContent;
   import windows.custom.superPack.SuperPackInfoWindow;
   
   public class SuperPackInfoWindowMediator extends WindowMediator
   {
      private static const BONUS_PERCENTAGES:Vector.<int> = Vector.<int>([0,63,125,181]);
      
      private static const ITEM_COUNT:Vector.<int> = Vector.<int>([0,40,125,350]);
      
      public static const NAME:String = "SuperPackInfoWindowMediator";
      
      private var superPackNr:int;
      
      private var windowContent:SuperPackInfoContent;
      
      public function SuperPackInfoWindowMediator(param1:SuperPackInfoWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:SuperPackInfoInitParams = param1 as SuperPackInfoInitParams;
         this.windowContent = (viewComponent as SuperPackInfoWindow).getContent(0) as SuperPackInfoContent;
         this.superPackNr = _loc2_.superPackNr;
         this.windowContent.header.title.text = TextResourceModule.getText("zoo.packs.resources.title." + this.superPackNr);
         this.windowContent.info.text = TextResourceModule.getText("zoo.packs.resources.text." + this.superPackNr);
         this.windowContent.itemCount.text = ITEM_COUNT[this.superPackNr] + " x";
         this.windowContent.bonusPercentage.text = BONUS_PERCENTAGES[this.superPackNr] + " %";
         this.windowContent.giftCount.visible = false;
         AssetLibrary.sendAssetToFunction("super_pack_info",this.handleSuperPackPic);
      }
      
      private function handleSuperPackPic(param1:SWFAsset) : void
      {
         var _loc2_:Sprite = null;
         this.windowContent.pictureContainer.addChild(param1.getEmbededSprite("PackPic" + this.superPackNr));
         if(this.superPackNr == 3)
         {
            _loc2_ = param1.getEmbededSprite("GiftToFriendSPR");
            _loc2_.x = 45;
            _loc2_.y = 20;
            this.windowContent.pictureContainer.addChild(_loc2_);
            this.windowContent.giftCount.visible = true;
         }
      }
      
      override public function dispose() : void
      {
      }
   }
}

