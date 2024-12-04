package com.bigpoint.zoomumba.controller.startup
{
   import com.bigpoint.zoomumba.model.app.resources.ResourceLoaderProxy;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.user.assistances.AssistancesProxy;
   import com.bigpoint.zoomumba.view.app.ApplicationMediator;
   import com.bigpoint.zoorama.assets.AssetAutoFiller;
   import com.bigpoint.zoorama.core.GameManager;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.greensock.plugins.AutoAlphaPlugin;
   import com.greensock.plugins.BezierPlugin;
   import com.greensock.plugins.ColorMatrixFilterPlugin;
   import com.greensock.plugins.ColorTransformPlugin;
   import com.greensock.plugins.DropShadowFilterPlugin;
   import com.greensock.plugins.FramePlugin;
   import com.greensock.plugins.GlowFilterPlugin;
   import com.greensock.plugins.RemoveTintPlugin;
   import com.greensock.plugins.TintPlugin;
   import com.greensock.plugins.TweenPlugin;
   import com.greensock.plugins.VisiblePlugin;
   import com.greensock.plugins.VolumePlugin;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class LounchGameCommand extends SimpleCommand
   {
      public function LounchGameCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:ApplicationMediator = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         var _loc3_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         StyleModule.init();
         this.initTweenLite();
         AssetAutoFiller.fillAssetLibrary(ConfigurationModule.getInstance());
         var _loc4_:GameManager = new GameManager(_loc2_.gameContainer);
         facade.registerMediator(_loc4_);
         var _loc5_:AssistancesProxy = facade.retrieveProxy(AssistancesProxy.NAME) as AssistancesProxy;
         _loc5_.initAssistants();
         _loc4_.initGame();
         var _loc6_:ResourceLoaderProxy = facade.retrieveProxy(ResourceLoaderProxy.NAME) as ResourceLoaderProxy;
         if(_loc6_.localStoragedEnabled && !_loc6_.hasUserAnsweredPermissionForLocalCache)
         {
            _loc6_.localStoragedEnabled = false;
         }
         _loc2_.resizeViewPort();
      }
      
      private function initTweenLite() : void
      {
         TweenPlugin.activate([AutoAlphaPlugin,FramePlugin,RemoveTintPlugin,TintPlugin,VisiblePlugin,VolumePlugin,BezierPlugin,ColorMatrixFilterPlugin,DropShadowFilterPlugin,GlowFilterPlugin,ColorTransformPlugin]);
      }
   }
}

