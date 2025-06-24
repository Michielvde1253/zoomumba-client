package com.bigpoint.zoomumba.model.features.avatar
{
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.avatar.vo.AvatarDescriptionVO;
   import com.bigpoint.zoomumba.view.features.avatar.AvatarComponent;
   import com.bigpoint.zoorama.assets.AssetAutoFiller;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.display.Sprite;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class AvatarGeneratorProxy extends Proxy
   {
      public static const NAME:String = "AvatarGeneratorProxy";
      
      public static const SCALE_AVATAR_CREATOR:Number = 1;
      
      public static const SCALE_AVATAR_CARD:Number = 0.4;
      
      public static const SCALE_AVATAR_INFO_WINDOW:Number = 0.9;
      
      public static const SCALE_AVATAR_VISIT_FRIEND:Number = 0.6;
      
      public function AvatarGeneratorProxy()
      {
         super(NAME,null);
      }
      
      public function getMyAvatarSprite(param1:Number = 1) : Sprite
      {
         var _loc2_:AvatarProxy = facade.retrieveProxy(AvatarProxy.NAME) as AvatarProxy;
         return this.getAvatarSprite(_loc2_.getMyAvatar(),param1);
      }
      
      public function getAvatarSprite(param1:AvatarDescriptionVO, param2:Number = 1) : Sprite
      {
         var _loc3_:Sprite = null;
         var _loc4_:AvatarComponent = null;
         if(Boolean(param1) && param1.bg != 0)
         {
            _loc4_ = new AvatarComponent();
            this.loadPart(AssetAutoFiller.getAvatarId(AvatarProxy.BACKGROUND,param1.bg),_loc4_,"background",AssetConfig.DEFAULT_INFO_SPR);
            this.loadPart(AssetAutoFiller.getAvatarId(AvatarProxy.HAT,param1.ht),_loc4_,"hatBehind",AssetConfig.DEFAULT_INFO_SPR_2);
            this.loadPart(AssetAutoFiller.getAvatarId(AvatarProxy.HAIR,param1.ha),_loc4_,"hairBehind",AssetConfig.DEFAULT_INFO_SPR_2);
            this.loadPart(AssetAutoFiller.getAvatarId(AvatarProxy.CLOTHES,param1.cl),_loc4_,"clothes",AssetConfig.DEFAULT_INFO_SPR);
            this.loadPart(AssetAutoFiller.getAvatarId(AvatarProxy.FACE,param1.fa),_loc4_,"head",AssetConfig.DEFAULT_INFO_SPR);
            this.loadPart(AssetAutoFiller.getAvatarId(AvatarProxy.EYES,param1.ey),_loc4_,"eyes",AssetConfig.DEFAULT_INFO_SPR);
            this.loadPart(AssetAutoFiller.getAvatarId(AvatarProxy.MOUTH,param1.mo),_loc4_,"mouth",AssetConfig.DEFAULT_INFO_SPR);
            this.loadPart(AssetAutoFiller.getAvatarId(AvatarProxy.HAIR,param1.ha),_loc4_,"hairFront",AssetConfig.DEFAULT_INFO_SPR);
            this.loadPart(AssetAutoFiller.getAvatarId(AvatarProxy.HAT,param1.ht),_loc4_,"hatFront",AssetConfig.DEFAULT_INFO_SPR);
            _loc3_ = _loc4_;
         }
         else
         {
            _loc3_ = new WrapedSprite(AssetAutoFiller.getAvatarId(AvatarProxy.BACKGROUND,0),AssetConfig.DEFAULT_INFO_SPR,PreloaderTypes.NORMAL);
         }
         _loc3_.scaleX = _loc3_.scaleY = param2;
         return _loc3_;
      }
      
      private function loadPart(param1:String, param2:AvatarComponent, param3:String, param4:String) : void
      {
         var id:String = param1;
         var preview:AvatarComponent = param2;
         var part:String = param3;
         var linkage:String = param4;
         AssetLibrary.sendAssetToFunction(id,function(param1:SWFAsset, param2:AvatarComponent):void
         {
            param2[part].addChild(param1.getEmbededObject(linkage));
            param2.loaded();
         },preview);
      }
   }
}

