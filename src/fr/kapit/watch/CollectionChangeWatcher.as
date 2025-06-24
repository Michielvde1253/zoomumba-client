package fr.kapit.watch
{
   import flash.debugger.enterDebugger;
   import flash.system.Capabilities;
   import mx.collections.ListCollectionView;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   
   public class CollectionChangeWatcher
   {
      public var host:*;
      
      public var propertyName:String;
      
      public var propertyChain:String;
      
      public var collection:ListCollectionView;
      
      private var _observer:ChangeObserver;
      
      public function CollectionChangeWatcher(param1:*, param2:String, param3:String, param4:ChangeObserver, param5:ListCollectionView)
      {
         super();
         this.host = param1;
         this.propertyName = param2;
         this.propertyChain = param3;
         this._observer = param4;
         this.collection = param5;
         param5.addEventListener(CollectionEvent.COLLECTION_CHANGE,this._onCollectionChange,false,0,true);
      }
      
      public function dispose() : void
      {
         this.collection.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this._onCollectionChange);
         this.collection = null;
      }
      
      private function _onCollectionChange(param1:CollectionEvent) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:String = null;
         if(!this._observer.isActive)
         {
            return;
         }
         if(param1.kind == CollectionEventKind.ADD)
         {
            _loc3_ = ChangeLogItem.KIND_COLLECTION_ADD;
         }
         else if(param1.kind == CollectionEventKind.REMOVE)
         {
            _loc3_ = ChangeLogItem.KIND_COLLECTION_REMOVE;
         }
         else if(param1.kind == CollectionEventKind.REPLACE)
         {
            _loc3_ = ChangeLogItem.KIND_COLLECTION_REPLACE;
         }
         _loc2_ = param1.items;
         var _loc4_:ChangeLogItem = new ChangeLogItem(_loc3_,_loc2_);
         _loc4_.propertyName = this.propertyName;
         _loc4_.propertyChain = this.propertyChain;
         _loc4_.event = param1;
         this._observer.addLogItem(_loc4_);
         if(Capabilities.isDebugger && this._observer.hasWatchPoint(this.propertyChain))
         {
            enterDebugger();
         }
      }
   }
}

