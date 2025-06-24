package com.bigpoint.zoomumba.controller.shop
{
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.shop.ShopProxy;
   import com.bigpoint.zoomumba.model.shop.vo.ShopTabs;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OpenShopOnTabCommand extends SimpleCommand
   {
      public function OpenShopOnTabCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:int = int(param1.getBody());
         var _loc3_:ShopProxy = facade.retrieveProxy(ShopProxy.NAME) as ShopProxy;
         _loc3_.currentTab = _loc2_;
         if(Settings.TUTORIAL_ACTIVE)
         {
            switch(TutorialInjectionManager.getInstance().currentActiveStep)
            {
               case 4:
                  _loc3_.currentTab = ShopTabs.CAGES;
                  break;
               case 5:
                  _loc3_.currentTab = ShopTabs.ANIMALS;
                  break;
               case 6:
                  _loc3_.currentTab = ShopTabs.ROADS;
                  break;
               case 8:
                  _loc3_.currentTab = ShopTabs.RESOURCES;
            }
         }
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.SHOP_WINDOW));
      }
   }
}

