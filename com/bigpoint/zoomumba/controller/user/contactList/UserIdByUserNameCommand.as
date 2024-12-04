package com.bigpoint.zoomumba.controller.user.contactList
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.user.contactList.vo.FriendsCardData;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class UserIdByUserNameCommand extends SimpleCommand
   {
      public function UserIdByUserNameCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:String = null;
         var _loc5_:FriendsCardData = null;
         var _loc2_:Object = param1.getBody();
         var _loc3_:Vector.<FriendsCardData> = new Vector.<FriendsCardData>();
         for(_loc4_ in _loc2_)
         {
            _loc5_ = new FriendsCardData();
            ObjectHelper.copyData(_loc5_,_loc2_[_loc4_]);
            _loc3_.push(_loc5_);
         }
         sendNotification(Note.SEARCH_USER_BY_NAME_RESPONSE,_loc3_);
      }
   }
}

