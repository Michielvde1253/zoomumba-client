package com.bigpoint.zoomumba.view.features.adamPenguin
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.features.adamPenguin.AdamProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.adam.AdamWindowInitParams;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import mx.controls.Image;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import spark.components.Group;
   
   public class AdamMediator extends Mediator
   {
      public static const NAME:String = "AdamMediator";
      
      private var adamAnimOne:Group;
      
      private var adamAnimTwo:Group;
      
      private var animOne:Image;
      
      private var animTwo:Image;
      
      private var adImage:Image;
      
      public function AdamMediator(param1:Group)
      {
         super(NAME,param1);
         this.adamAnimOne = new Group();
         this.adamAnimTwo = new Group();
         this.layer.addElement(this.adamAnimOne);
         this.layer.addElement(this.adamAnimTwo);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.SHOW_ADAM];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.SHOW_ADAM:
               if(!Settings.TUTORIAL_ACTIVE)
               {
                  this.initAdamMC();
               }
         }
      }
      
      private function initAdamMC() : void
      {
         AssetLibrary.sendAssetToFunction(AssetConfig.ADAM_FILE,this.handleAdamMC);
      }
      
      private function handleAdamMC(param1:SWFAsset) : void
      {
         this.animOne = new Image();
         this.animOne.buttonMode = true;
         this.animOne.addEventListener(MouseEvent.CLICK,this.handleUpsellClick);
         this.adamAnimOne.addElement(this.animOne);
         this.animOne.source = param1.getEmbededMovieClip(AssetConfig.ADAM_ANIM_ONE);
         this.adamAnimOne.left = -90;
         this.adamAnimOne.bottom = 100;
         var _loc2_:MovieClip = param1.getEmbededMovieClip(AssetConfig.ADAM_ANIM_TWO) as MovieClip;
         this.animTwo = new Image();
         this.animTwo.buttonMode = true;
         this.animTwo.addEventListener(MouseEvent.CLICK,this.handleUpsellClick);
         this.adamAnimTwo.addElement(this.animTwo);
         this.animTwo.addEventListener("adamAnimComplete",this.handleAnimationComplete);
         this.animTwo.source = _loc2_;
         this.adamAnimTwo.right = 500;
         this.adamAnimTwo.bottom = 90;
         var _loc3_:MovieClip = _loc2_.board.adMC;
         _loc3_.visible = true;
         while(_loc3_.numChildren)
         {
            _loc3_.removeChildAt(0);
         }
         var _loc4_:AdamProxy = facade.retrieveProxy(AdamProxy.NAME) as AdamProxy;
         var _loc5_:String = "advertising_" + _loc4_.adamData.type;
         if(_loc4_.adamData.type == "starterpack" && _loc4_.adamData.itemId == 14)
         {
            _loc5_ = "advertising_starterpack_14";
         }
         if(_loc4_.adamData.type == "starterpack" && _loc4_.adamData.itemId == 15)
         {
            _loc5_ = "advertising_starterpack_15";
         }
         var _loc6_:Bitmap = new Bitmap(param1.getEmbededBitmapData(_loc5_));
         _loc3_.addChild(_loc6_);
      }
      
      private function handleUpsellClick(param1:MouseEvent) : void
      {
         var _loc2_:AdamProxy = facade.retrieveProxy(AdamProxy.NAME) as AdamProxy;
         var _loc3_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         switch(_loc2_.adamData.type)
         {
            case "pantherpack":
            case "upselling":
            case "starterpack":
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ADAM_WINDOW,"",new AdamWindowInitParams(_loc2_.adamData)));
               break;
            case "pawpremium":
               if(!_loc3_.open_social && _loc2_.adamData.ajax && _loc2_.adamData.ajax.length > 2)
               {
                  ExternalInterface.call("faLoadPage(\'" + _loc2_.adamData.ajax + "\')");
               }
               else
               {
                  navigateToURL(new URLRequest(_loc2_.adamData.url),"_blank");
               }
               break;
            case "xppremium":
               if(!_loc3_.open_social && _loc2_.adamData.ajax && _loc2_.adamData.ajax.length > 2)
               {
                  ExternalInterface.call("faLoadPage(\'" + _loc2_.adamData.ajax + "\')");
               }
               else
               {
                  navigateToURL(new URLRequest(_loc2_.adamData.url),"_blank");
               }
               break;
            case "toolbar":
               if(!_loc3_.open_social && _loc2_.adamData.ajax && _loc2_.adamData.ajax.length > 2)
               {
                  ExternalInterface.call("faLoadPage(\'" + _loc2_.adamData.ajax + "\')");
               }
               else
               {
                  navigateToURL(new URLRequest(_loc2_.adamData.url),"_blank");
               }
         }
         this.handleAnimationComplete(null);
      }
      
      private function handleAnimationComplete(param1:Event) : void
      {
         this.animTwo.removeEventListener("adamAnimComplete",this.handleAnimationComplete);
         this.animOne.removeEventListener(MouseEvent.CLICK,this.handleUpsellClick);
         this.animTwo.removeEventListener(MouseEvent.CLICK,this.handleUpsellClick);
         this.adamAnimOne.removeElement(this.animOne);
         this.adamAnimTwo.removeElement(this.animTwo);
         this.animOne = null;
         this.animTwo = null;
      }
      
      override public function onRegister() : void
      {
      }
      
      private function get layer() : Group
      {
         return this.viewComponent as Group;
      }
   }
}

