package com.bigpoint.zoomumba.model.windows.collectienSets
{
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   
   public class CollectionSetRewordInitParams
   {
      public var canPickReword:Boolean;
      
      public var rewordItomPacks:Vector.<ItemPackVO>;
      
      public var handlePickReward1:Function;
      
      public var handlePickReward2:Function;
      
      public function CollectionSetRewordInitParams(param1:Vector.<ItemPackVO>, param2:Boolean, param3:Function, param4:Function)
      {
         super();
         this.rewordItomPacks = param1;
         this.canPickReword = param2;
         this.handlePickReward1 = param3;
         this.handlePickReward2 = param4;
      }
   }
}

