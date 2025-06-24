package com.bigpoint.zoorama.assets
{
   import com.bigpoint.zoomumba.model.features.avatar.AvatarProxy;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   
   public class AssetAutoFiller
   {
      public function AssetAutoFiller()
      {
         super();
      }
      
      public static function fillAssetLibrary(param1:ConfigurationModule) : void
      {
      }
      
      public static function getAvatarId(param1:String, param2:int) : String
      {
         switch(param1)
         {
            case AvatarProxy.BACKGROUND:
               return "avatarBg_preview_" + param2;
            case AvatarProxy.CLOTHES:
               return "avatarCloth_preview_" + param2;
            case AvatarProxy.EYES:
               return "avatarEye_preview_" + param2;
            case AvatarProxy.FACE:
               return "avatarFace_preview_" + param2;
            case AvatarProxy.HAIR:
               return "avatarHair_preview_" + param2;
            case AvatarProxy.HAT:
               return "avatarHat_preview_" + param2;
            case AvatarProxy.MOUTH:
               return "avatarMouth_preview_" + param2;
            default:
               return null;
         }
      }
      
      public static function addNewsId(param1:int) : void
      {
      }
   }
}

