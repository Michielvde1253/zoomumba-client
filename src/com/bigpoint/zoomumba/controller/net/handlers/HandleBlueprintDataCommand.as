package com.bigpoint.zoomumba.controller.net.handlers
{
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.model.app.items.fieldItems.ItemBlueprintVo;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class HandleBlueprintDataCommand extends SimpleCommand
   {
      public function HandleBlueprintDataCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Vector.<ItemBlueprintVo> = param1.getBody() as Vector.<ItemBlueprintVo>;
         (facade.retrieveProxy(CraftingProxy.NAME) as CraftingProxy).setUserItems(_loc2_);
         sendNotification(SHOP.REFRESH_BLUEPRINTS);
      }
   }
}

