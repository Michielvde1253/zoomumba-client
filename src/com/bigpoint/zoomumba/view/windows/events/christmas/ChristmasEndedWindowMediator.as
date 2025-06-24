package com.bigpoint.zoomumba.view.windows.events.christmas
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import windows.custom.events.christmas.ended.ChristmasEndedContent;
   import windows.custom.events.christmas.ended.ChristmasEndedWindow;
   import windows.events.WindowCustomEvent;
   
   public class ChristmasEndedWindowMediator extends WindowMediator
   {
      public static const NAME:String = "ChristmasEndedWindowMediator";
      
      private var _loadedAssets:int = 0;
      
      public function ChristmasEndedWindowMediator(param1:ChristmasEndedWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:Boolean = param1 as Boolean;
         if(_loc2_)
         {
            this.content.header.text = TextResourceModule.getText("zoo.event.christmas.layer.success.title");
            this.content.text.htmlText = TextResourceModule.getText("zoo.event.christmas.layer.success.text");
         }
         else
         {
            this.content.header.text = TextResourceModule.getText("zoo.event.christmas.layer.incomplete.title");
            this.content.text.htmlText = TextResourceModule.getText("zoo.event.christmas.layer.incomplete.text");
         }
         this._loadedAssets = 0;
         this.window.preloaderVisibility = true;
         AssetLibrary.sendAssetToFunction("StarsStaticLeft",this.handleAssets);
         AssetLibrary.sendAssetToFunction("SantaBig",this.handleAssets);
         AssetLibrary.sendAssetToFunction("BubbleSmallSquared",this.handleAssets);
      }
      
      private function handleAssets(param1:SWFAsset) : void
      {
         switch(param1.id)
         {
            case "StarsStaticLeft":
            case "StarsStaticLeft.swf":
               this.content.starsLeft.displayClass = param1.getEmbededBitmapData(param1.id);
               this.content.starsRight.displayClass = param1.getEmbededBitmapData(param1.id);
               ++this._loadedAssets;
               break;
            case "SantaBig.swf":
               this.content.santa.displayClass = param1.getEmbededBitmapData(param1.id);
               ++this._loadedAssets;
               break;
            case "BubbleSmallSquared.swf":
               this.content.bubble.displayClass = param1.getEmbededBitmapData(param1.id);
               ++this._loadedAssets;
         }
         if(this._loadedAssets >= 3)
         {
            this.window.preloaderVisibility = false;
         }
      }
      
      override protected function handleWindowConfirm(param1:WindowCustomEvent = null) : void
      {
         sendNotification(Note.XMAS_START_SANTA_ANIM);
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(windowType,windowUniqueId));
      }
      
      private function get content() : ChristmasEndedContent
      {
         return this.window.getContent() as ChristmasEndedContent;
      }
      
      private function get window() : ChristmasEndedWindow
      {
         return this.viewComponent as ChristmasEndedWindow;
      }
   }
}

