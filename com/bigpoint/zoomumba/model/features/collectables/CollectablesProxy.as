package com.bigpoint.zoomumba.model.features.collectables
{
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.model.features.collectables.vo.CollectableItemVO;
   import flash.utils.Dictionary;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class CollectablesProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "CollectablesProxy";
      
      public function CollectablesProxy()
      {
         super(NAME,new Dictionary());
      }
      
      override public function onRegister() : void
      {
      }
      
      public function addCollectable(param1:CollectableItemVO) : void
      {
         if(this.collectablesList[param1.itemId])
         {
            this.updateCollectable(param1);
         }
         else
         {
            this.createCollectable(param1);
         }
      }
      
      private function updateCollectable(param1:CollectableItemVO) : void
      {
         var _loc2_:CollectableItemVO = this.collectablesList[param1.itemId] as CollectableItemVO;
         _loc2_.amount = param1.amount;
         sendNotification(DataNote.COLLECTABLE_UPDATED,param1.itemId);
      }
      
      private function createCollectable(param1:CollectableItemVO) : void
      {
         this.collectablesList[param1.itemId] = param1;
         sendNotification(DataNote.COLLECTABLE_UPDATED,param1.itemId);
      }
      
      public function decreaseCollectableAmount(param1:int, param2:int) : int
      {
         this.initCollectable(param1);
         var _loc3_:int = (this.collectablesList[param1] as CollectableItemVO).amount = (this.collectablesList[param1] as CollectableItemVO).amount - param2;
         sendNotification(DataNote.COLLECTABLE_UPDATED,param1);
         return _loc3_;
      }
      
      public function increaseCollectableAmount(param1:int, param2:int) : int
      {
         this.initCollectable(param1);
         var _loc3_:int = (this.collectablesList[param1] as CollectableItemVO).amount = (this.collectablesList[param1] as CollectableItemVO).amount + param2;
         sendNotification(DataNote.COLLECTABLE_UPDATED,param1);
         return _loc3_;
      }
      
      public function getCollectableAmmount(param1:int) : int
      {
         this.initCollectable(param1);
         return (this.collectablesList[param1] as CollectableItemVO).amount;
      }
      
      public function isCollectableCollected(param1:int) : Boolean
      {
         this.initCollectable(param1);
         if((this.collectablesList[param1] as CollectableItemVO).amount > 0)
         {
            (this.collectablesList[param1] as CollectableItemVO).isCollected = true;
         }
         return (this.collectablesList[param1] as CollectableItemVO).isCollected;
      }
      
      private function get collectablesList() : Dictionary
      {
         return data as Dictionary;
      }
      
      private function initCollectable(param1:int) : void
      {
         if(!this.collectablesList[param1])
         {
            this.collectablesList[param1] = new CollectableItemVO();
            (this.collectablesList[param1] as CollectableItemVO).itemId = param1;
            (this.collectablesList[param1] as CollectableItemVO).amount = 0;
         }
      }
   }
}

