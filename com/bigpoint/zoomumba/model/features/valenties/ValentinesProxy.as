package com.bigpoint.zoomumba.model.features.valenties
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.features.valenties.vo.ValentineStepVO;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyConfirmationInitParams;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class ValentinesProxy extends Proxy
   {
      public static const NAME:String = "ValentinesProxy";
      
      public var config:Vector.<ValentineStepVO>;
      
      public var currentPosition:int = 0;
      
      public var oldPosition:int = 0;
      
      public var rewards:Array;
      
      public var loop:int = 0;
      
      public function ValentinesProxy()
      {
         super(NAME);
      }
      
      public function get showRefresh() : Boolean
      {
         return false;
      }
      
      public function makeAMove(param1:int, param2:int) : void
      {
         var _loc3_:NetProxy = null;
         this.oldPosition = this.currentPosition;
         if(param2 == 0)
         {
            _loc3_ = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
            _loc3_.callServer(NET.VALENTINES_MAKE_A_MOVE,[param1,0]).addCallbackIfTrue(Note.VALENTINE_MOVED_OK,param1).addCallbackIfFalse(Note.VALENTINE_MOVED_ERROR,param1).sendNow();
         }
         else
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.window.confirmation.shop.buyMove.title"),TextResourceModule.getText("zoo.window.confirmation.shop.buyMove.info"),param2),new WindowParams("",null,Note.VALENTINE_REFRESH_BOARD,null,Note.VALENTINE_MOVE_CR,[param1,param2],Note.VALENTINE_REFRESH_BOARD)));
         }
      }
      
      public function redeemReward(param1:int) : void
      {
         var _loc2_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         _loc2_.callServer(NET.VALENTINES_REDEEM,[param1]).addCallbackIfTrue(Note.VALENTINE_REDEEM_OK,param1).addCallbackIfFalse(Note.VALENTINE_REDEEM_ERROR,param1).sendNow();
      }
      
      public function getRewardById(param1:int) : ValentineStepVO
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.config.length)
         {
            if(this.config[_loc2_].rewardId == param1)
            {
               return this.config[_loc2_];
            }
            _loc2_++;
         }
         return this.config[0];
      }
   }
}

