package com.bigpoint.zoomumba.controller.features.valentines
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.features.valenties.ValentinesProxy;
   import com.bigpoint.zoomumba.model.features.valenties.vo.ValentineStepVO;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ParseValentinesCommand extends SimpleCommand
   {
      public function ParseValentinesCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc5_:String = null;
         var _loc6_:ValentineStepVO = null;
         var _loc2_:Object = param1.getBody();
         var _loc3_:Vector.<ValentineStepVO> = new Vector.<ValentineStepVO>();
         var _loc4_:ValentinesProxy = facade.retrieveProxy(ValentinesProxy.NAME) as ValentinesProxy;
         for(_loc5_ in _loc2_)
         {
            _loc6_ = new ValentineStepVO();
            ObjectHelper.copyData(_loc6_,_loc2_[_loc5_]);
            _loc3_.push(_loc6_);
            --_loc6_.rewardId;
         }
         _loc4_.config = _loc3_;
         sendNotification(Note.VALENTINE_CONFIG_PARSED);
      }
   }
}

