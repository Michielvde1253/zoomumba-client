package com.bigpoint.zoomumba.view.windows.fortuneWheel
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.features.fortuneWheel.vo.FortuneWheelRewardVO;
   import com.bigpoint.zoomumba.model.windows.fortuneWheel.ZooWheelRewardInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.zooWheel.reward.ZooWheelRewardContent;
   import windows.custom.zooWheel.reward.ZooWheelRewardWindow;
   
   public class RewardWindowMediator extends WindowMediator
   {
      public static const NAME:String = "RewardWindowMediator";
      
      private var rewardText:String;
      
      public function RewardWindowMediator(param1:ZooWheelRewardWindow)
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
         var _loc2_:ZooWheelRewardInitParams = param1 as ZooWheelRewardInitParams;
         this.windowContent.header.title.text = TextResourceModule.getText("zoo.wheel.price.title");
         this.windowContent.text1.text = TextResourceModule.getText("zoo.wheel.price.text.1");
         this.windowContent.text3.text = TextResourceModule.getText("zoo.wheel.price.text.2");
         this.windowContent.bearImage.addChild(new WrapedSprite(AssetConfig.ZOO_WHEEL_ASSET_FILE,AssetConfig.ZOO_WHEEL_BEAR_IMAGE));
         this.windowContent.blueprintImage.addChild(new WrapedSprite(AssetConfig.ZOO_WHEEL_ASSET_FILE,AssetConfig.ZOO_WHEEL_BEAR_BLUEPRINT_IMAGE));
         this.windowContent.blueprintImage.alpha = 0.9;
         this.handleWonItem(_loc2_.reward);
         super.init(param1);
      }
      
      private function handleWonItem(param1:FortuneWheelRewardVO) : void
      {
         var _loc2_:String = null;
         var _loc3_:ShopItemData = null;
         if(param1)
         {
            _loc2_ = ItemTypeHelper.categoryToType(param1.category);
            _loc3_ = AssetIds.getShopItemData(_loc2_,param1.id,param1.count);
            this.rewardText = param1.count + " x " + _loc3_.localizedName;
            this.windowContent.text2.text = this.rewardText;
            this.windowContent.wonItem.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(param1.category,param1.id),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
            this.windowContent.blueprintImage.visible = param1.isBlueprint;
            this.addTooltip();
            this.toggleSexIfAnimal(param1);
         }
      }
      
      private function addTooltip() : void
      {
         this.windowContent.wonItem.addEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOver);
         this.windowContent.wonItem.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
      }
      
      private function handleMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(this.windowContent.wonItem,this.rewardText,true);
      }
      
      private function handleMouseOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      private function toggleSexIfAnimal(param1:FortuneWheelRewardVO) : void
      {
         var _loc2_:String = null;
         var _loc3_:ShopItemData = null;
         var _loc4_:Boolean = false;
         if(param1.category == Categories.ANIMAL)
         {
            _loc2_ = ItemTypeHelper.categoryToType(param1.category);
            _loc3_ = AssetIds.getShopItemData(_loc2_,param1.id,param1.count);
            _loc4_ = Boolean((_loc3_ as AnimalShopData).male);
            if(_loc4_)
            {
               this.windowContent.animalSexContainer.addChild(new WrapedSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,"MaleIconSPR",PreloaderTypes.MINI));
            }
            else
            {
               this.windowContent.animalSexContainer.addChild(new WrapedSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,"FemaleIconSPR",PreloaderTypes.MINI));
            }
         }
      }
      
      private function get windowContent() : ZooWheelRewardContent
      {
         return this.rewardWindow.getContent(0) as ZooWheelRewardContent;
      }
      
      private function get rewardWindow() : ZooWheelRewardWindow
      {
         return this.viewComponent as ZooWheelRewardWindow;
      }
      
      override public function dispose() : void
      {
         sendNotification(Note.UPDATE_FOR_NEXT_SPIN);
      }
   }
}

