package com.bigpoint.zoomumba.controller.features.cageUpgrade
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.cageUpgrades.CageUpgradeProxy;
   import com.bigpoint.zoomumba.model.app.cageUpgrades.vo.GraphicVO;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.features.collectables.vo.CollectableItemType;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.cageUpgrade.CageUpgradeInitParams;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.actionMenu.ActionMenuManager;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OpenAniversaryCageUpgradeWindowCommand extends SimpleCommand
   {
      public function OpenAniversaryCageUpgradeWindowCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Cage = null;
         var _loc3_:CageUpgradeInitParams = null;
         var _loc6_:CollectablesProxy = null;
         _loc2_ = param1.getBody() as Cage;
         _loc3_ = new CageUpgradeInitParams();
         var _loc4_:CurrencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         var _loc5_:CageUpgradeProxy = facade.retrieveProxy(CageUpgradeProxy.NAME) as CageUpgradeProxy;
         _loc6_ = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         var _loc7_:ItemVO = new ItemVO();
         _loc7_.category = Categories.COLLECTIBLE;
         _loc7_.itemId = CollectableItemType.BALOONS2014;
         _loc3_.headerIcon = _loc7_;
         _loc3_.cageItem = _loc2_;
         _loc3_.upgradeInfo = TextResourceModule.getText("zoo.window.infoLayers.eventUpgrade");
         _loc3_.eventId = EventTypes.BDAY2014_EVENT;
         _loc3_.buyNote = Note.CAGE_UPGRADE_ACTION;
         _loc3_.upgadeResource.category = Categories.COLLECTIBLE;
         _loc3_.upgadeResource.itemId = CollectableItemType.CAKE2014;
         _loc3_.upgadeResource.count = _loc6_.getCollectableAmmount(CollectableItemType.CAKE2014);
         _loc3_.priceResources = _loc5_.getLevelUpCageConfigAsItemPackVO(5,EventTypes.BDAY2014_EVENT);
         _loc3_.bonusResource = _loc5_.getLevelUpCageConfigBonus(5);
         _loc3_.bonusFrom = (100 + _loc5_.getLevelUpCageConfigBonus(_loc2_.level).count * 100).toString();
         _loc3_.bonusTo = "125";
         _loc3_.canBuy = _loc6_.getCollectableAmmount(CollectableItemType.CAKE2014) >= _loc3_.priceResources[0].count;
         var _loc8_:GraphicVO = new GraphicVO();
         _loc8_.linkageId = AssetConfig.ANNIVERSARY_PLUS_BALLOONS;
         _loc8_.assetId = AssetConfig.ANNIVERSARY_ASSET_FILE;
         _loc8_.posX = 310;
         _loc8_.posY = 130;
         _loc3_.extraGraphics.push(_loc8_);
         _loc8_ = new GraphicVO();
         _loc8_.linkageId = AssetConfig.ANNIVERSARY_NO_INVENTORY;
         _loc8_.assetId = AssetConfig.ANNIVERSARY_ASSET_FILE;
         _loc8_.posX = 310;
         _loc8_.posY = 270;
         _loc3_.extraGraphics.push(_loc8_);
         var _loc9_:ActionMenuManager = facade.retrieveMediator(ActionMenuManager.NAME) as ActionMenuManager;
         _loc9_.closeMenu();
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CAGE_UPGRADE_WINDOW,"",_loc3_));
      }
   }
}

