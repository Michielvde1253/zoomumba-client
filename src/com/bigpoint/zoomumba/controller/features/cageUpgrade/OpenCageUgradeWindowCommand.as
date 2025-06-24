package com.bigpoint.zoomumba.controller.features.cageUpgrade
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.cageUpgrades.CageUpgradeProxy;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.cageUpgrade.CageUpgradeInitParams;
   import com.bigpoint.zoorama.view.actionMenu.ActionMenuManager;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OpenCageUgradeWindowCommand extends SimpleCommand
   {
      public function OpenCageUgradeWindowCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:Cage = null;
         var _loc9_:int = 0;
         var _loc2_:Array = param1.getBody() as Array;
         _loc3_ = _loc2_[0] as Cage;
         var _loc4_:int = int(_loc2_[1]);
         var _loc5_:CageUpgradeInitParams = new CageUpgradeInitParams();
         var _loc6_:CurrencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         var _loc7_:CageUpgradeProxy = facade.retrieveProxy(CageUpgradeProxy.NAME) as CageUpgradeProxy;
         var _loc8_:ItemVO = new ItemVO();
         _loc8_.category = Categories.USER;
         _loc5_.headerIcon = _loc8_;
         _loc5_.cageItem = _loc3_;
         _loc5_.upgradeInfo = "zoo.window.upgrade.info";
         _loc5_.upgadeResource.category = Categories.USER;
         if(_loc4_ == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
         {
            _loc8_.itemId = UserResources.PEARLS;
            _loc5_.upgadeResource.itemId = UserResources.PEARLS;
            _loc5_.upgadeResource.count = _loc6_.pearls;
         }
         else
         {
            _loc8_.itemId = UserResources.PET_POWNS;
            _loc5_.upgadeResource.itemId = UserResources.PET_POWNS;
            _loc5_.upgadeResource.count = _loc6_.petPowns;
         }
         _loc5_.buyNote = Note.CAGE_UPGRADE_ACTION;
         if(_loc4_ == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
         {
            _loc5_.priceResources = _loc7_.getOceanWorldLevelUpCageConfigAsItemPackVO(_loc3_.level + 1);
         }
         else
         {
            _loc5_.priceResources = _loc7_.getLevelUpCageConfigAsItemPackVO(_loc3_.level + 1);
         }
         _loc5_.bonusResource = _loc7_.getLevelUpCageConfigBonus(_loc3_.level + 1);
         _loc5_.bonusFrom = (100 + _loc7_.getLevelUpCageConfigBonus(_loc3_.level).count * 100).toString();
         _loc5_.bonusTo = (100 + _loc7_.getLevelUpCageConfigBonus(_loc3_.level + 1).count * 100).toString();
         _loc5_.canBuy = true;
         var _loc10_:int = 0;
         while(_loc10_ < _loc5_.priceResources.length)
         {
            _loc9_ = _loc5_.priceResources[_loc10_].itemId;
            if(_loc6_.getCurrency(_loc9_) < _loc5_.priceResources[_loc10_].count)
            {
               _loc5_.canBuy = false;
            }
            _loc10_++;
         }
         var _loc11_:ActionMenuManager = facade.retrieveMediator(ActionMenuManager.NAME) as ActionMenuManager;
         _loc11_.closeMenu();
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CAGE_UPGRADE_WINDOW,"",_loc5_));
      }
      
      private function get afford() : Boolean
      {
         return true;
      }
   }
}

