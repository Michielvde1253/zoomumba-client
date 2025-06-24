package com.bigpoint.zoomumba.model.features.avatar
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.features.avatar.vo.AvatarDescriptionVO;
   import com.bigpoint.zoomumba.model.features.avatar.vo.AvatarPartConfigVO;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class AvatarProxy extends Proxy
   {
      public static const NAME:String = "AvatarProxy";
      
      private static const MALE:int = 0;
      
      private static const FEMALE:int = 1;
      
      public static const BACKGROUND:String = "bg";
      
      public static const FACE:String = "fa";
      
      public static const HAIR:String = "ha";
      
      public static const EYES:String = "ey";
      
      public static const MOUTH:String = "mo";
      
      public static const HAT:String = "ht";
      
      public static const CLOTHES:String = "cl";
      
      private var loadConfig:Boolean = true;
      
      private var avatarConfig:Vector.<AvatarPartConfigVO>;
      
      private var avatarInventory:Vector.<AvatarPartConfigVO> = new Vector.<AvatarPartConfigVO>();
      
      private var _myAvatar:AvatarDescriptionVO;
      
      private var requestedSex:int;
      
      private var requestedPart:String;
      
      public function AvatarProxy()
      {
         super(NAME,null);
      }
      
      public function parseConfig(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:AvatarPartConfigVO = null;
         this.avatarConfig = new Vector.<AvatarPartConfigVO>();
         for(_loc2_ in param1)
         {
            for(_loc3_ in param1[_loc2_])
            {
               _loc4_ = new AvatarPartConfigVO();
               ObjectHelper.copyData(_loc4_,param1[_loc2_][_loc3_]);
               _loc4_.id = int(_loc3_);
               _loc4_.partType = _loc2_;
               this.avatarConfig.push(_loc4_);
            }
         }
         this.requestConfig(this.requestedSex,this.requestedPart);
      }
      
      public function parseInventory(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:AvatarPartConfigVO = null;
         for(_loc2_ in param1)
         {
            for(_loc3_ in param1[_loc2_])
            {
               _loc4_ = new AvatarPartConfigVO();
               _loc4_.partType = _loc2_;
               _loc4_.id = int(param1[_loc2_][_loc3_]);
               this.avatarInventory.push(_loc4_);
            }
         }
      }
      
      public function parseAvatar(param1:Object) : void
      {
         this._myAvatar = new AvatarDescriptionVO();
         ObjectHelper.copyData(this._myAvatar,param1);
      }
      
      public function retrieverConfig(param1:int, param2:String) : Vector.<AvatarPartConfigVO>
      {
         var _loc4_:int = 0;
         var _loc3_:Vector.<AvatarPartConfigVO> = null;
         if(this.avatarConfig)
         {
            _loc3_ = new Vector.<AvatarPartConfigVO>();
            _loc4_ = 0;
            while(_loc4_ < this.avatarConfig.length)
            {
               if((this.avatarConfig[_loc4_].gender == param1 || this.avatarConfig[_loc4_].gender == 2) && this.avatarConfig[_loc4_].partType == param2 && this.canUse(this.avatarConfig[_loc4_]))
               {
                  _loc3_.push(this.avatarConfig[_loc4_]);
               }
               _loc4_++;
            }
         }
         return _loc3_;
      }
      
      private function canUse(param1:AvatarPartConfigVO) : Boolean
      {
         return param1.free == 1 || this.hasPartInInventory(param1);
      }
      
      private function hasPartInInventory(param1:AvatarPartConfigVO) : Boolean
      {
         var _loc2_:int = 0;
         if(this.avatarInventory)
         {
            _loc2_ = 0;
            while(_loc2_ < this.avatarInventory.length)
            {
               if(this.avatarInventory[_loc2_].partType == param1.partType && this.avatarInventory[_loc2_].id == param1.id)
               {
                  return true;
               }
               _loc2_++;
            }
         }
         return false;
      }
      
      public function requestConfig(param1:int, param2:String) : void
      {
         if(this.loadConfig)
         {
            this.requestedSex = param1;
            this.requestedPart = param2;
            sendNotification(NET.AVATAR_GET_CONFIG);
            this.loadConfig = false;
         }
         else
         {
            sendNotification(Note.AVATAR_CONFIG_DATA,this.retrieverConfig(param1,param2));
         }
      }
      
      public function getMyAvatar() : AvatarDescriptionVO
      {
         return this._myAvatar;
      }
      
      public function saveMyAvatar(param1:AvatarDescriptionVO) : void
      {
         var _loc2_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         _loc2_.callServer(NET.AVATAR_SAVE,[param1.fa,param1.ha,param1.ey,param1.mo,param1.ht,param1.cl,param1.gender + 1]).addCallbackIfTrue(Note.AVATAR_SAVED).addCallbackIfTrue(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.window.infoLayers.collectables.firstFinish.title"),TextResourceModule.getText("zoo.window.infoLayers.avatar.Check")))).sendNow();
         this.avatarConfig = null;
         this.loadConfig = true;
      }
   }
}

