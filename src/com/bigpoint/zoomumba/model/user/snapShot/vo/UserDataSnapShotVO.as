package com.bigpoint.zoomumba.model.user.snapShot.vo
{
   import com.bigpoint.zoomumba.constants.Resources;
   
   public class UserDataSnapShotVO
   {
      public var snapShotCommandId:int = -1;
      
      public var userExperience:Number = -1;
      
      public var realAmount:int = -1;
      
      public var virtualAmount:int = -1;
      
      public var petPaws:int = -1;
      
      public var pearls:int = -1;
      
      public var userResourses:Vector.<int> = new Vector.<int>(Resources.MAX_RESOURCE_ID + 1);
      
      public function UserDataSnapShotVO()
      {
         super();
      }
      
      public function toString() : String
      {
         return "[UserDataSnapShot snapShotCommandId=" + this.snapShotCommandId + " userExperience=" + this.userExperience + " realAmount=" + this.realAmount + " virtualAmount=" + this.virtualAmount + " petPaws=" + this.petPaws + " userResourses=" + this.userResourses + "]";
      }
   }
}

