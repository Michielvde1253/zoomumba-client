package com.bigpoint.zoomumba.view.windows.events.advBreeding
{
   import com.bigpoint.zoomumba.model.app.resources.ResourceLoaderProxy;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import windows.custom.events.advBreeding.AdvBreedingEventEndContent;
   import windows.custom.events.advBreeding.AdvBreedingEventEndWindow;
   
   public class AdvBreedingEventEndWindowMediator extends WindowMediator
   {
      public static const NAME:String = "AdvBreedingEventEndWindowMediator";
      
      public function AdvBreedingEventEndWindowMediator(param1:AdvBreedingEventEndWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:ResourceLoaderProxy = facade.retrieveProxy(ResourceLoaderProxy.NAME) as ResourceLoaderProxy;
         _loc2_.singleLoad("JeanBig.swf",this.handleResource);
         this.content.header.text = TextResourceModule.getText("zoo.window.general.goodbye");
         this.content.message.text = TextResourceModule.getText("zoo.eventABtrade.layer.end");
      }
      
      private function handleResource(param1:SWFAsset) : void
      {
         this.content.jean.displayClass = param1.getEmbededBitmapData("JeanBig");
      }
      
      private function get content() : AdvBreedingEventEndContent
      {
         return this.window.getContent() as AdvBreedingEventEndContent;
      }
      
      private function get window() : AdvBreedingEventEndWindow
      {
         return this.viewComponent as AdvBreedingEventEndWindow;
      }
   }
}

