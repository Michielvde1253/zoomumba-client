package com.bigpoint.zoomumba.controller.user.snapShot
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.Resources;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.model.user.snapShot.SnapShotProxy;
   import com.bigpoint.zoomumba.model.user.snapShot.vo.UserDataSnapShotVO;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class MakeUserDataSnapShotCommand extends SimpleCommand
   {
      public function MakeUserDataSnapShotCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:UserDataSnapShotVO = null;
         var _loc3_:CurrencyProxy = null;
         var _loc7_:int = 0;
         if(param1.getBody())
         {
            _loc7_ = int(param1.getBody());
         }
         else
         {
            sendNotification(Note.ERROR_REPORT,"MakeUserDataSnapShotCommand must get commandId number as body.");
         }
         _loc2_ = new UserDataSnapShotVO();
         _loc3_ = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         var _loc4_:ResourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         _loc2_.snapShotCommandId = _loc7_;
         _loc2_.userExperience = _loc3_.experience;
         _loc2_.virtualAmount = _loc3_.virtualMoney;
         _loc2_.realAmount = _loc3_.realMoney;
         _loc2_.petPaws = _loc3_.petPowns;
         var _loc5_:int = 0;
         while(_loc5_ < Resources.MAX_RESOURCE_ID)
         {
            _loc2_.userResourses[_loc5_] = _loc4_.getResourseAmmount(_loc5_);
            _loc5_++;
         }
         var _loc6_:SnapShotProxy = facade.retrieveProxy(SnapShotProxy.NAME) as SnapShotProxy;
         _loc6_.addSnapShot(_loc2_);
      }
   }
}

