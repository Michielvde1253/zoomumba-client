package com.bigpoint.zoomumba.model.events.xmas
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.core.vo.CurrencyVO;
   import com.bigpoint.zoomumba.model.events.xmas.vo.XMas2012StepVo;
   import com.bigpoint.zoomumba.model.events.xmas.vo.XMas2012Vo;
   import com.bigpoint.zoomumba.model.events.xmas.vo.Xmas2012CommunityVo;
   import com.bigpoint.zoomumba.model.events.xmas.vo.Xmas2012FieldVo;
   import com.bigpoint.zoomumba.model.events.xmas.vo.Xmas2012RewardVo;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.RewardInfoInitParams;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class XMas2012Proxy extends Proxy
   {
      public static const NAME:String = "XMas2012Proxy.as";
      
      public var xmasFieldPositions:Array;
      
      public var communityRewardPositions:Array;
      
      public var rewardsDic:Dictionary;
      
      public function XMas2012Proxy(param1:Object = null)
      {
         var _loc3_:XMas2012StepVo = null;
         var _loc4_:Object = null;
         this.xmasFieldPositions = [new Point(20,430),new Point(115,333),new Point(135,425),new Point(195,330),new Point(240,430),new Point(300,335),new Point(343,430),new Point(375,335),new Point(415,285),new Point(450,305)];
         this.communityRewardPositions = [new Point(140,370),new Point(140,290),new Point(140,200),new Point(140,90)];
         var _loc2_:XMas2012Vo = new XMas2012Vo();
         _loc2_.xmasCommunity = new Xmas2012CommunityVo();
         _loc2_.xmasCommunity.steps = new Vector.<XMas2012StepVo>();
         for each(_loc4_ in param1["xmas2012Community"])
         {
            _loc3_ = new XMas2012StepVo();
            _loc3_.progress = parseInt(_loc4_["progress"]);
            _loc3_.step = parseInt(_loc4_["step"]);
            _loc2_.xmasCommunity.steps.push(_loc3_);
         }
         if(param1["xmas2012Drops"])
         {
            _loc2_.basket1Amount = parseInt(param1["xmas2012Drops"][0]["amount"]);
            _loc2_.basket1Costs = parseInt(param1["xmas2012Drops"][0]["currencyReal"]);
            _loc2_.basket2Amount = parseInt(param1["xmas2012Drops"][1]["amount"]);
            _loc2_.basket2Costs = parseInt(param1["xmas2012Drops"][1]["currencyReal"]);
         }
         _loc2_.xmasField = new Xmas2012FieldVo();
         if(param1["community2012Obj"])
         {
            _loc2_.xmasCommunity.progress = param1["community2012Obj"]["progress"];
            _loc2_.xmasCommunity.currentStep = param1["community2012Obj"]["step"];
            _loc2_.xmasCommunity.neededAmount = param1["community2012Obj"]["neededAmount"];
         }
         super(XMas2012Proxy.NAME,_loc2_);
         super.facade.sendNotification(Note.XMAS2012_DATA_PARSED);
      }
      
      public function parseEventData(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:Xmas2012RewardVo = null;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:XMas2012StepVo = null;
         var _loc7_:String = null;
         var _loc8_:Object = null;
         var _loc9_:CurrencyVO = null;
         if(param1["xmas2012Obj"])
         {
            this.proxyData.xmasField.round = param1["xmas2012Obj"]["round"];
            this.proxyData.xmasField.currentStep = param1["xmas2012Obj"]["step"];
            this.proxyData.xmasField.progress = param1["xmas2012Obj"]["progress"];
            this.proxyData.xmasField.neededAmount = param1["xmas2012Obj"]["neededAmount"];
            this.proxyData.xmasField.uid = param1["xmas2012Obj"]["userId"];
            this.proxyData.xmasField.type = param1["xmas2012Obj"]["type"];
            this.proxyData.xmasField.displayIds = [];
            this.proxyData.xmasField.displayIdWeight = new Dictionary();
            for(_loc2_ in param1["xmas2012Obj"]["ids"])
            {
               _loc5_ = parseInt(param1["xmas2012Obj"]["ids"][_loc2_]);
               this.proxyData.xmasField.displayIds.push(parseInt(_loc2_));
               this.proxyData.xmasField.displayIdWeight[parseInt(_loc2_)] = _loc5_;
            }
            this.proxyData.xmasField.rewards = new Vector.<Xmas2012RewardVo>();
            if(param1["xmas2012Obj"]["rewards"])
            {
               for(_loc2_ in param1["xmas2012Obj"]["rewards"])
               {
                  var _loc12_:int = 0;
                  var _loc13_:* = param1["xmas2012Obj"]["rewards"][_loc2_];
                  for each(_loc4_ in _loc13_)
                  {
                     _loc3_ = new Xmas2012RewardVo();
                     _loc3_.amount = parseInt(_loc4_["amount"]);
                     _loc3_.id = parseInt(_loc4_["id"]);
                     _loc3_.displayId = parseInt(_loc4_["displayId"]);
                     _loc3_.type = _loc4_["type"];
                     if(this.xmasFieldPositions[parseInt(_loc2_)])
                     {
                        _loc3_.position = this.xmasFieldPositions[parseInt(_loc2_)];
                     }
                     this.proxyData.xmasField.rewards.push(_loc3_);
                  }
               }
            }
         }
         if(param1["community2012Obj"])
         {
            this.proxyData.xmasCommunity.progress = param1["community2012Obj"]["progress"];
            this.proxyData.xmasCommunity.currentStep = param1["community2012Obj"]["step"];
            this.proxyData.xmasCommunity.neededAmount = param1["community2012Obj"]["neededAmount"];
            this.proxyData.xmasCommunity.displayIds = [];
            if(param1["community2012Obj"]["rewards"])
            {
               for(_loc2_ in param1["community2012Obj"]["rewards"])
               {
                  if(this.proxyData.xmasCommunity.steps[_loc2_])
                  {
                     _loc6_ = this.proxyData.xmasCommunity.steps[_loc2_];
                     _loc12_ = 0;
                     _loc13_ = param1["community2012Obj"]["rewards"][_loc2_];
                     for each(_loc4_ in _loc13_)
                     {
                        _loc3_ = new Xmas2012RewardVo();
                        _loc3_.amount = parseInt(_loc4_["amount"]);
                        _loc3_.id = parseInt(_loc4_["id"]);
                        _loc3_.displayId = parseInt(_loc4_["displayId"]);
                        _loc3_.type = _loc4_["type"];
                        if(this.communityRewardPositions[_loc6_.step])
                        {
                           _loc3_.position = this.communityRewardPositions[_loc6_.step];
                        }
                        _loc6_.reward = _loc3_;
                     }
                  }
               }
            }
            if(param1["community2012Obj"]["hasRewards"])
            {
               this.rewardsDic = new Dictionary();
               for(_loc2_ in param1["community2012Obj"]["hasRewards"])
               {
                  this.rewardsDic[_loc2_] = parseInt(param1["community2012Obj"]["hasRewards"][_loc2_]);
               }
            }
         }
         if(param1["xmas2012ObjRwd"])
         {
            for(_loc7_ in param1["xmas2012ObjRwd"])
            {
               _loc8_ = param1["xmas2012ObjRwd"][_loc7_];
               _loc9_ = new CurrencyVO();
               _loc9_.amount = _loc8_["amount"];
               _loc9_.id = _loc8_["id"];
               _loc9_.type = ItemTypeHelper.typeToCategory(_loc8_["type"]);
               if(_loc9_.type == Categories.SPECIES)
               {
                  _loc9_.id = this.getDisplayId(_loc9_.id,_loc9_.type);
                  _loc9_.type = Categories.ANIMAL;
                  _loc9_.amount *= 2;
               }
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.REWARD_INFO_WINDOW,"",new RewardInfoInitParams(TextResourceModule.getText("zoo.window.general.congrats"),TextResourceModule.getText("zoo.window.infoLayers.frog2012.success1"),_loc9_,"")));
            }
         }
         super.facade.sendNotification(Note.XMAS2012_DATA_PARSED);
      }
      
      public function canRedeem(param1:uint) : Boolean
      {
         if(!this.rewardsDic)
         {
            return false;
         }
         return this.rewardsDic[param1] == 0;
      }
      
      public function hasUsed(param1:uint) : Boolean
      {
         if(!this.rewardsDic)
         {
            return false;
         }
         if(this.rewardsDic[param1])
         {
            return this.rewardsDic[param1];
         }
         return false;
      }
      
      public function getDisplayId(param1:int, param2:int) : uint
      {
         var _loc3_:Xmas2012RewardVo = null;
         var _loc4_:XMas2012StepVo = null;
         for each(_loc3_ in this.proxyData.xmasField.rewards)
         {
            if(_loc3_)
            {
               if(_loc3_.id == param1 && ItemTypeHelper.typeToCategory(_loc3_.type) == param2)
               {
                  return _loc3_.displayId;
               }
            }
         }
         for each(_loc4_ in this.proxyData.xmasCommunity.steps)
         {
            if(_loc4_)
            {
               if(_loc4_.reward.id == param1 && ItemTypeHelper.typeToCategory(_loc4_.reward.type) == param2)
               {
                  return _loc4_.reward.displayId;
               }
            }
         }
         return 0;
      }
      
      public function getCurrentXMasStep() : uint
      {
         return [93,94,96,97][this.currentCommunityProgress];
      }
      
      public function get currentCommunityProgress() : uint
      {
         if(this.proxyData.xmasCommunity.currentStep > 0)
         {
            return this.proxyData.xmasCommunity.currentStep - 1;
         }
         return 0;
      }
      
      public function get proxyData() : XMas2012Vo
      {
         return super.data as XMas2012Vo;
      }
   }
}

