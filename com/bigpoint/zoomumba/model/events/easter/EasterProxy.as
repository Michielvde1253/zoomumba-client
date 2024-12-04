package com.bigpoint.zoomumba.model.events.easter
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.core.vo.CurrencyVO;
   import com.bigpoint.zoomumba.model.events.easter.vo.EasterFieldVo;
   import com.bigpoint.zoomumba.model.events.easter.vo.EasterObjectVo;
   import com.bigpoint.zoomumba.model.events.easter.vo.EasterRewardVo;
   import com.bigpoint.zoomumba.model.events.easter.vo.EasterVo;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.RewardInfoInitParams;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.geom.Point;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class EasterProxy extends Proxy
   {
      public static const NAME:String = "EasterProxy";
      
      public var stepPositions:Array;
      
      public var rewardPositions:Array;
      
      public function EasterProxy(param1:Object = null)
      {
         var _loc3_:EasterFieldVo = null;
         var _loc4_:Object = null;
         this.stepPositions = [new Point(234.5,365),new Point(203.5,348),new Point(180.5,326),new Point(171,311),new Point(160,263.5),new Point(160,250.5),new Point(161.5,197.5),new Point(175.5,181.5),new Point(182.5,129.5),new Point(221,110),new Point(252.5,106.5),new Point(327.45,154.5),new Point(334.45,169.5),new Point(344.45,196),new Point(355,272.5),new Point(349,286.5),new Point(288.5,311.5),new Point(269.5,369.5)];
         this.rewardPositions = [new Point(199.25,404.55),new Point(147.3,404.55),new Point(204.25,278.4),new Point(0,0),new Point(94.3,250.9),new Point(0,0),new Point(108.25,148.9),new Point(0,0),new Point(223.75,162.9),new Point(0,0),new Point(0,0),new Point(369.2,115.4),new Point(0,0),new Point(0,0),new Point(397.2,286.9),new Point(0,0),new Point(0,0),new Point(247.25,311.9)];
         var _loc2_:EasterVo = new EasterVo();
         _loc2_.fields = new Vector.<EasterFieldVo>();
         for each(_loc4_ in param1["easterField"])
         {
            _loc3_ = new EasterFieldVo();
            _loc3_.putAmount = parseInt(_loc4_["putAmount"]);
            _loc3_.putEgg = parseInt(_loc4_["putEgg"]);
            _loc3_.step = parseInt(_loc4_["step"]);
            if(this.stepPositions[_loc3_.step])
            {
               _loc3_.position = this.stepPositions[_loc3_.step];
            }
            _loc2_.fields.push(_loc3_);
         }
         if(param1["easterBasket"])
         {
            if(param1["easterBasket"]["amount"])
            {
               _loc2_.basketAmount = parseInt(param1["easterBasket"]["amount"]);
            }
            if(param1["easterBasket"]["currencyReal"])
            {
               _loc2_.basketCR = parseInt(param1["easterBasket"]["currencyReal"]);
            }
         }
         super(EasterProxy.NAME,_loc2_);
      }
      
      public function parseEasterObject(param1:Object) : void
      {
         var _loc2_:EasterRewardVo = null;
         var _loc3_:String = null;
         var _loc4_:EasterFieldVo = null;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc7_:Object = null;
         var _loc8_:CurrencyVO = null;
         if(this.proxyData)
         {
            this.proxyData.easterObj = new EasterObjectVo();
            if(param1["easterObj"])
            {
               this.proxyData.easterObj.round = param1["easterObj"]["round"];
               this.proxyData.easterObj.currentStep = param1["easterObj"]["step"];
               if(param1["easterObj"]["rewards"])
               {
                  this.proxyData.easterObj.rewards = new Vector.<EasterRewardVo>();
                  for(_loc3_ in param1["easterObj"]["rewards"])
                  {
                     if(this.proxyData.fields[_loc3_])
                     {
                        _loc4_ = this.proxyData.fields[_loc3_];
                        _loc4_.rewards = new Vector.<EasterRewardVo>();
                        for each(_loc5_ in param1["easterObj"]["rewards"][_loc3_])
                        {
                           _loc2_ = new EasterRewardVo();
                           _loc2_.amount = parseInt(_loc5_["amount"]);
                           _loc2_.id = parseInt(_loc5_["id"]);
                           _loc2_.type = _loc5_["type"];
                           if(this.rewardPositions[_loc4_.step])
                           {
                              _loc2_.position = this.rewardPositions[_loc4_.step];
                           }
                           _loc4_.rewards.push(_loc2_);
                        }
                     }
                  }
               }
            }
            if(param1["easterObjRwd"])
            {
               for(_loc6_ in param1["easterObjRwd"])
               {
                  _loc7_ = param1["easterObjRwd"][_loc6_];
                  _loc8_ = new CurrencyVO();
                  _loc8_.amount = _loc7_["amount"];
                  _loc8_.id = _loc7_["id"];
                  _loc8_.type = Categories.getCategoryIdFromName(_loc7_["type"]);
                  sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.REWARD_INFO_WINDOW,"",new RewardInfoInitParams(TextResourceModule.getText("zoo.window.general.congrats"),TextResourceModule.getText("zoo.window.infoLayers.easter2012.success1"),_loc8_,TextResourceModule.getText("zoo.window.infoLayers.easter2012.success2"))));
               }
            }
         }
      }
      
      public function get proxyData() : EasterVo
      {
         return super.data as EasterVo;
      }
   }
}

