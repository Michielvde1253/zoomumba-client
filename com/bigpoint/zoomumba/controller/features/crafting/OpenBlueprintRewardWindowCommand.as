package com.bigpoint.zoomumba.controller.features.crafting
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.controller.features.crafting.vo.BlueprintRewardVo;
   import com.bigpoint.zoomumba.model.app.items.BlueprintInfoVO;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OpenBlueprintRewardWindowCommand extends SimpleCommand
   {
      public function OpenBlueprintRewardWindowCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc6_:BlueprintRewardVo = null;
         var _loc7_:BlueprintInfoVO = null;
         var _loc2_:CraftingProxy = facade.getProxy(CraftingProxy) as CraftingProxy;
         var _loc3_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc4_:Vector.<BlueprintRewardVo> = param1.getBody() as Vector.<BlueprintRewardVo>;
         var _loc5_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc6_ in _loc4_)
         {
            _loc7_ = _loc2_.getBlueprintInfoByBlueprintId(_loc6_.blueprintId);
            switch(_loc7_.category)
            {
               case Categories.CAGE:
                  _loc5_.push(_loc3_.getCageData(_loc7_.itemId));
                  break;
               case Categories.DECOR:
                  _loc5_.push(_loc3_.getDecorationData(_loc7_.itemId));
                  break;
               case Categories.ROAD:
                  _loc5_.push(_loc3_.getRoadData(_loc7_.itemId));
                  break;
               case Categories.STORE:
                  _loc5_.push(_loc3_.getStoreData(_loc7_.itemId));
                  break;
               case Categories.TRASHBIN:
                  _loc5_.push(_loc3_.getTrashBinData(_loc7_.itemId));
                  break;
            }
         }
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CRAFTING_BLUEPRINT_REWARD_WINDOW,"CRAFTING_BLUEPRINT_REWARD_WINDOW",_loc5_));
      }
   }
}

