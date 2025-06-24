package com.bigpoint.zoomumba.model.events.frog
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.core.vo.CurrencyVO;
   import com.bigpoint.zoomumba.model.events.frog.vo.FrogFieldVo;
   import com.bigpoint.zoomumba.model.events.frog.vo.FrogObjectVo;
   import com.bigpoint.zoomumba.model.events.frog.vo.FrogRewardVo;
   import com.bigpoint.zoomumba.model.events.frog.vo.FrogVo;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.RewardInfoInitParams;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.geom.Point;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class FrogProxy extends Proxy
   {
      public static const NAME:String = "FrogProxy";
      
      private var cageData:CageShopData;
      
      public var stepPositions:Array;
      
      public var rewardPositions:Array;
      
      public function FrogProxy(param1:Object = null)
      {
         var _loc3_:FrogFieldVo = null;
         var _loc4_:Object = null;
         this.stepPositions = [new Point(301.75,351.75),new Point(270.95,325.75),new Point(245.75,297.75),new Point(215,261.75),new Point(194,223.8),new Point(176,185.8),new Point(176,140.8),new Point(213,120.8),new Point(250.75,147.8),new Point(287.25,166.8),new Point(328.25,165.8),new Point(367.75,139.8),new Point(415.25,125.8),new Point(428.25,171.8),new Point(410.25,213.75),new Point(390.25,252.8),new Point(362.75,288.8),new Point(332.75,321.8)];
         this.rewardPositions = [new Point(237.5,383.65),new Point(199.2,336.65),new Point(157,288.7),new Point(0,0),new Point(112.55,215.15),new Point(0,0),new Point(163.25,59.7),new Point(0,0),new Point(283,96.7),new Point(0,0),new Point(0,0),new Point(371.5,54.7),new Point(0,0),new Point(0,0),new Point(457.5,258.2),new Point(0,0),new Point(0,0),new Point(357,373.15)];
         var _loc2_:FrogVo = new FrogVo();
         _loc2_.fields = new Vector.<FrogFieldVo>();
         for each(_loc4_ in param1["valentine2013Step"])
         {
            _loc3_ = new FrogFieldVo();
            _loc3_.putAmount = parseInt(_loc4_["putAmount"]);
            _loc3_.putDrop = parseInt(_loc4_["putDrop"]);
            _loc3_.step = parseInt(_loc4_["step"]);
            if(this.stepPositions[_loc3_.step])
            {
               _loc3_.position = this.stepPositions[_loc3_.step];
            }
            _loc2_.fields.push(_loc3_);
         }
         if(param1["frogBasket"])
         {
            if(!param1["frogBasket"]["amount"])
            {
            }
            if(!param1["frogBasket"]["currencyReal"])
            {
            }
         }
         super(FrogProxy.NAME,_loc2_);
      }
      
      public function parseFrogObject(param1:Object) : void
      {
         var _loc2_:FrogRewardVo = null;
         var _loc3_:String = null;
         var _loc4_:FrogFieldVo = null;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc7_:Object = null;
         var _loc8_:CurrencyVO = null;
         if(this.proxyData)
         {
            this.proxyData.frogObj = new FrogObjectVo();
            if(param1["frogObj"])
            {
               this.proxyData.frogObj.round = param1["frogObj"]["round"];
               this.proxyData.frogObj.currentStep = param1["frogObj"]["step"];
               if(param1["frogObj"]["rewards"])
               {
                  this.proxyData.frogObj.rewards = new Vector.<FrogRewardVo>();
                  for(_loc3_ in param1["frogObj"]["rewards"])
                  {
                     if(this.proxyData.fields[_loc3_])
                     {
                        _loc4_ = this.proxyData.fields[_loc3_];
                        _loc4_.rewards = new Vector.<FrogRewardVo>();
                        for each(_loc5_ in param1["frogObj"]["rewards"][_loc3_])
                        {
                           _loc2_ = new FrogRewardVo();
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
            if(param1["frogObjRwd"])
            {
               for(_loc6_ in param1["frogObjRwd"])
               {
                  _loc7_ = param1["frogObjRwd"][_loc6_];
                  _loc8_ = new CurrencyVO();
                  _loc8_.amount = _loc7_["amount"];
                  _loc8_.id = _loc7_["id"];
                  _loc8_.type = Categories.getCategoryIdFromName(_loc7_["type"]);
                  sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.REWARD_INFO_WINDOW,"",new RewardInfoInitParams(TextResourceModule.getText("zoo.window.general.congrats"),TextResourceModule.getText("zoo.window.infoLayers.frog2012.success1"),_loc8_,TextResourceModule.getText("zoo.window.infoLayers.frog2012.success2"))));
               }
            }
         }
      }
      
      public function get proxyData() : FrogVo
      {
         return super.data as FrogVo;
      }
   }
}

