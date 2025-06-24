package com.bigpoint.zoomumba.view.windows.safari
{
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.windows.safari.SafariShowItemInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import components.radioButton.RadioButtonChildSkin;
   import components.radioButton.RadioButtonSexFemaleSkin;
   import components.radioButton.RadioButtonSexMaleSkin;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.safari.SafariItemContent;
   import windows.custom.safari.SafariItemWindow;
   
   public class SafariShowItemWindowMediator extends WindowMediator
   {
      public static const NAME:String = "SafariShowItemWindowMediator";
      
      private var winConfig:SafariShowItemInitParams;
      
      public function SafariShowItemWindowMediator(param1:SafariItemWindow)
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
         var _loc3_:TextReplace = null;
         var _loc4_:TextReplace = null;
         var _loc5_:Vector.<TextReplace> = null;
         var _loc6_:AnimalShopData = null;
         var _loc7_:String = null;
         this.winConfig = SafariShowItemInitParams(param1);
         this.content.header.title.text = TextResourceModule.getText("zoo.safari.title");
         if(this.winConfig.trap)
         {
            this.content.itemInfo.text = TextResourceModule.getText("zoo.safari.miniGame.tileInfo.trap");
            this.content.assetImage.source = new WrapedSprite("safari_gui","ContentTrapSPR");
            return;
         }
         if(this.winConfig.safariPrize)
         {
            this.content.assetImage.source = this.winConfig.safariPrize;
            _loc3_ = new TextReplace("%treasureCount%",this.winConfig.safariPrize.rewardCount.toString());
            _loc4_ = new TextReplace("%treasureName%",this.winConfig.safariPrize.localizedItemName);
            _loc5_ = new Vector.<TextReplace>();
            _loc5_.push(_loc3_);
            _loc5_.push(_loc4_);
            this.content.itemInfo.text = TextResourceModule.getTextReplaced("zoo.safari.miniGame.tileInfo.treasure",_loc5_);
         }
         else
         {
            _loc6_ = ConfigurationModule.getInstance().getAnimalData(this.winConfig.itemId);
            _loc7_ = TextIdHelper.getCardName(_loc6_.categoryId,_loc6_.speciesId);
            this.content.itemInfo.text = TextResourceModule.getTextReplaced("zoo.safari.miniGame.tileInfo.animal",Vector.<TextReplace>([new TextReplace("%animal%",_loc7_)]));
            this.content.assetImage.source = new WrapedSprite(AssetIds.getPreviewAssetId(this.winConfig.categoryId,this.winConfig.itemId),AssetConfig.DEFAULT_INFO_SPR);
            this.content.radioSex.visible = true;
            if(_loc6_.male == 1)
            {
               this.content.radioSex.setStyle("skinClass",RadioButtonSexMaleSkin);
            }
            else if(_loc6_.child == 1)
            {
               this.content.radioSex.setStyle("skinClass",RadioButtonChildSkin);
            }
            else
            {
               this.content.radioSex.setStyle("skinClass",RadioButtonSexFemaleSkin);
            }
         }
         var _loc2_:InventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         _loc2_.reload = true;
      }
      
      private function get content() : SafariItemContent
      {
         return this.window.getContent() as SafariItemContent;
      }
      
      private function get window() : SafariItemWindow
      {
         return this.viewComponent as SafariItemWindow;
      }
      
      override public function dispose() : void
      {
      }
   }
}

