package com.bigpoint.zoomumba.model.user.snapShot
{
   import com.bigpoint.zoomumba.model.user.snapShot.vo.UserDataSnapShotVO;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class SnapShotProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "SnapShotProxy";
      
      private var snapShots:Vector.<UserDataSnapShotVO> = new Vector.<UserDataSnapShotVO>();
      
      public function SnapShotProxy()
      {
         super(NAME);
      }
      
      public function getSnapShotForCommandId(param1:int) : UserDataSnapShotVO
      {
         var _loc2_:UserDataSnapShotVO = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.snapShots.length)
         {
            if(this.snapShots[_loc3_].snapShotCommandId == param1)
            {
               _loc2_ = this.snapShots[_loc3_];
               this.snapShots.splice(_loc3_,1);
               break;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function addSnapShot(param1:UserDataSnapShotVO) : void
      {
         this.snapShots.push(param1);
      }
   }
}

