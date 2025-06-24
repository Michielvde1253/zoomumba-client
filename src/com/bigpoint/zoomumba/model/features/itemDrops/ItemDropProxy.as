package com.bigpoint.zoomumba.model.features.itemDrops
{
   import com.bigpoint.zoomumba.model.gameConfig.CollectionPoolSetProxy;
   import com.bigpoint.zoorama.view.itemDrop.items.DropItem;
   import flash.display.Sprite;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class ItemDropProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "ItemDropProxy";
      
      public var currentRunning:int = -1;
      
      private var _stackedPaws:int = 0;
      
      private var _stackedPearls:int = 0;
      
      private var collectQueue:Vector.<DropItem> = new Vector.<DropItem>();
      
      public var pawMultiplier:int = 1;
      
      public var pearlMultiplier:int = 1;
      
      private var _collectionPoolProxy:CollectionPoolSetProxy;
      
      public function ItemDropProxy()
      {
         super(NAME);
      }
      
      public function getCollectionIconById(param1:int) : Sprite
      {
         return this.collectionPoolProxy.getCollectionItemById(param1);
      }
      
      public function addToQueue(param1:DropItem) : void
      {
         this.collectQueue.push(param1);
      }
      
      public function get queue() : Vector.<DropItem>
      {
         return this.collectQueue;
      }
      
      public function removeFromQueue(param1:DropItem) : void
      {
         this.collectQueue.splice(this.collectQueue.indexOf(param1),1);
      }
      
      public function get stackedPaws() : int
      {
         return this._stackedPaws;
      }
      
      public function get stackedPearls() : int
      {
         return this._stackedPearls;
      }
      
      public function get collectionPoolProxy() : CollectionPoolSetProxy
      {
         if(this._collectionPoolProxy == null)
         {
            this._collectionPoolProxy = facade.getProxy(CollectionPoolSetProxy) as CollectionPoolSetProxy;
         }
         return this._collectionPoolProxy;
      }
      
      public function clearStackedPaws() : void
      {
         this._stackedPaws = 0;
      }
      
      public function clearStackedPearls() : void
      {
         this._stackedPearls = 0;
      }
      
      public function stackPaws(param1:int) : void
      {
         this._stackedPaws += param1;
      }
      
      public function stackPearls(param1:int) : void
      {
         this._stackedPearls += param1;
      }
      
      public function getCollectionIconsById(param1:int) : Vector.<Sprite>
      {
         return this.collectionPoolProxy.getCollectionsItemById(param1);
      }
   }
}

