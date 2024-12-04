package com.bigpoint.zoomumba.model.app.core
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.core.vo.LoadingProcessVO;
   import com.bigpoint.zoomumba.view.app.ApplicationMediator;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class LoadingProcessProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "LoadingProcessProxy";
      
      private var _loadingProcess:LoadingProcessVO;
      
      public function LoadingProcessProxy(param1:LoadingProcessVO = null)
      {
         super(NAME,param1);
         this._loadingProcess = new LoadingProcessVO();
      }
      
      public function setGameConfigLoaded() : void
      {
         this.loadingProcess.gameConfigLoaded = true;
         this.checkLoadComplete();
      }
      
      public function setResourcesLoaded() : void
      {
         this._loadingProcess.resourcesLoaded = true;
         this.checkLoadComplete();
      }
      
      private function checkLoadComplete() : void
      {
         var _loc1_:ApplicationMediator = null;
         if(this.loadingProcess.resourcesLoaded && this.loadingProcess.gameConfigLoaded)
         {
            sendNotification(Note.SHOW_TEST_GUI);
            sendNotification(Note.LAUNCH_GAME);
            _loc1_ = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
            sendNotification(Note.APP_RESIZED,_loc1_.application);
         }
      }
      
      public function get loadingProcess() : LoadingProcessVO
      {
         return this._loadingProcess as LoadingProcessVO;
      }
   }
}

