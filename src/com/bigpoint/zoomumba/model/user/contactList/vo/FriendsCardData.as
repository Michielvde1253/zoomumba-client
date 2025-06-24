package com.bigpoint.zoomumba.model.user.contactList.vo
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.model.features.avatar.vo.AvatarDescriptionVO;
   import com.bigpoint.zoorama.data.settings.InheritedShopData;
   
   public class FriendsCardData extends InheritedShopData
   {
      public var name:String = "";
      
      public var id:int = -1;
      
      public var lvl:int = -1;
      
      public var xp:int = -1;
      
      public var _avatar:AvatarDescriptionVO;
      
      public function FriendsCardData()
      {
         super();
      }
      
      public function set uEp(param1:int) : void
      {
         this.xp = param1;
      }
      
      public function set uId(param1:int) : void
      {
         this.id = param1;
      }
      
      public function set uLvl(param1:int) : void
      {
         this.lvl = param1;
      }
      
      public function set uName(param1:String) : void
      {
         this.name = param1;
      }
      
      public function set uAva(param1:Object) : void
      {
         this._avatar = new AvatarDescriptionVO();
         ObjectHelper.copyData(this._avatar,param1);
      }
      
      public function get userAvatar() : AvatarDescriptionVO
      {
         return this._avatar;
      }
      
      public function get uEp() : int
      {
         return this.xp;
      }
      
      public function get uId() : int
      {
         return this.id;
      }
      
      public function get uLvl() : int
      {
         return this.lvl;
      }
      
      public function get uName() : String
      {
         return this.name;
      }
      
      public function get label() : String
      {
         return this.name;
      }
   }
}

