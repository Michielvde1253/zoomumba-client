package com.bigpoint.zoomumba.model.features.safari
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariConfigData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariData;
   import com.bigpoint.zoorama.data.settings.SafariShopData;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class SafariProxy extends Proxy
   {
      public static const NAME:String = "SafariProxy";
      
      private var safariConfigData:SafariConfigData;
      
      private var safariData:SafariData;
      
      public function SafariProxy()
      {
         super(NAME,null);
      }
      
      public function set config(param1:SafariConfigData) : void
      {
         this.safariConfigData = param1;
      }
      
      public function updateSafariData(param1:SafariData) : void
      {
         this.safariData = param1;
         sendNotification(Note.SAFARI_UPDATE_JOKERS);
      }
      
      public function getActiveJokersDataProvider() : Vector.<Object>
      {
         var _loc2_:int = 0;
         var _loc1_:Vector.<Object> = new Vector.<Object>();
         if(this.safariData.jokers)
         {
            _loc2_ = 0;
            while(_loc2_ < this.safariData.jokers.length)
            {
               _loc1_.push(this.getJokerForUse(this.safariData.jokers[_loc2_] - 1));
               _loc2_++;
            }
         }
         return _loc1_;
      }
      
      private function getJokerForUse(param1:int) : SafariShopData
      {
         var _loc2_:SafariShopData = new SafariShopData();
         _loc2_.itemId = this.safariConfigData.jokerConfig[param1].id;
         _loc2_.buyReal = this.safariConfigData.jokerConfig[param1].realPrice;
         _loc2_.buyVirtual = this.safariConfigData.jokerConfig[param1].virtualPrice;
         _loc2_.groupId = this.safariConfigData.jokerConfig[param1].groupId;
         _loc2_.useMode = true;
         _loc2_.active = this.isActive(_loc2_.itemId);
         return _loc2_;
      }
      
      public function getJokersDataProvider() : Vector.<Object>
      {
         var _loc4_:SafariShopData = null;
         var _loc1_:Vector.<Object> = new Vector.<Object>();
         var _loc2_:int = 0;
         while(_loc2_ < this.safariConfigData.jokerConfig.length)
         {
            _loc4_ = new SafariShopData();
            _loc4_.itemId = this.safariConfigData.jokerConfig[_loc2_].id;
            _loc4_.buyReal = this.safariConfigData.jokerConfig[_loc2_].realPrice;
            _loc4_.buyVirtual = this.safariConfigData.jokerConfig[_loc2_].virtualPrice;
            _loc4_.groupId = this.safariConfigData.jokerConfig[_loc2_].groupId;
            _loc4_.active = this.isActive(_loc4_.itemId);
            _loc1_.push(_loc4_);
            _loc2_++;
         }
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc1_[_loc3_].canActivate = this.isGroupBuyable(SafariShopData(_loc1_[_loc3_]));
            _loc3_++;
         }
         return _loc1_;
      }
      
      private function isGroupBuyable(param1:SafariShopData) : Boolean
      {
         var _loc2_:Boolean = true;
         var _loc3_:Boolean = true;
         if(this.isActive(1) || this.isActive(2))
         {
            _loc2_ = false;
         }
         if(this.isActive(3) || this.isActive(4))
         {
            _loc3_ = false;
         }
         if(param1.groupId == 1)
         {
            return _loc2_;
         }
         if(param1.groupId == 2)
         {
            return _loc3_;
         }
         return true;
      }
      
      private function isActive(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         if(this.safariData)
         {
            if(this.safariData.jokers)
            {
               _loc2_ = 0;
               while(_loc2_ < this.safariData.jokers.length)
               {
                  if(this.safariData.jokers[_loc2_] == param1)
                  {
                     return true;
                  }
                  _loc2_++;
               }
            }
         }
         return false;
      }
   }
}

