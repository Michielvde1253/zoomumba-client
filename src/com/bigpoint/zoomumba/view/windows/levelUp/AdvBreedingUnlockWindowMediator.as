package com.bigpoint.zoomumba.view.windows.levelUp
{
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import windows.custom.levelUp.AdvBreedingUnlockContent;
   import windows.custom.levelUp.AdvBreedingUnlockWindow;
   
   public class AdvBreedingUnlockWindowMediator extends WindowMediator
   {
      public static const NAME:String = "AdvBreedingUnlockWindowMediator";
      
      public function AdvBreedingUnlockWindowMediator(param1:AdvBreedingUnlockWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         this.content.header.text = TextResourceModule.getText("zoo.window.general.congrats");
         this.content.message.text = TextResourceModule.getText("zoo.window.infoLayers.breedingLabNursery.info");
         this.content.advBreedingBuiding.addChild(new WrapedSprite("advBreeding_preview","InfoSPR"));
         this.content.nurseryBuiding.addChild(new WrapedSprite("nursery_preview","InfoSPR"));
      }
      
      private function get content() : AdvBreedingUnlockContent
      {
         return this.window.getContent(0) as AdvBreedingUnlockContent;
      }
      
      private function get window() : AdvBreedingUnlockWindow
      {
         return this.viewComponent as AdvBreedingUnlockWindow;
      }
   }
}

