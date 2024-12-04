package fr.kapit.watch
{
   import flash.debugger.enterDebugger;
   import flash.events.Event;
   import flash.system.Capabilities;
   import mx.binding.utils.ChangeWatcher;
   import mx.collections.ListCollectionView;
   
   public class PropertyChangeWatcher
   {
      public var host:*;
      
      public var lastValue:*;
      
      public var propertyName:String;
      
      public var propertyChain:String;
      
      private var _watcher:ChangeWatcher;
      
      private var _observer:ChangeObserver;
      
      private var _collectionWatcher:CollectionChangeWatcher;
      
      public function PropertyChangeWatcher(param1:*, param2:String, param3:String, param4:ChangeObserver)
      {
         var value:* = undefined;
         var host:* = param1;
         var propertyName:String = param2;
         var propertyChain:String = param3;
         var observer:ChangeObserver = param4;
         super();
         this.host = host;
         this.propertyName = propertyName;
         this.propertyChain = propertyChain;
         this._observer = observer;
         this._watcher = ChangeWatcher.watch(host,propertyName,this._onPropertyChange,true);
         this.lastValue = host[propertyName];
         try
         {
            value = host[propertyName];
            if(value && value is ListCollectionView)
            {
               this._updateCollectionWatcher(value as ListCollectionView);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      public function dispose() : void
      {
         this._watcher.unwatch();
         this._watcher = null;
         this.host = null;
      }
      
      private function _updateCollectionWatcher(param1:ListCollectionView) : void
      {
         if(this._collectionWatcher)
         {
            this._collectionWatcher.dispose();
         }
         this._collectionWatcher = new CollectionChangeWatcher(this.host,this.propertyName,this.propertyChain,this._observer,param1);
      }
      
      private function _onPropertyChange(param1:Event) : void
      {
         var logItem:ChangeLogItem;
         var value:* = undefined;
         var e:Event = param1;
         if(!this._observer.isActive)
         {
            return;
         }
         try
         {
            value = this.host[this.propertyName];
            if(value && value is ListCollectionView)
            {
               this._updateCollectionWatcher(value as ListCollectionView);
            }
            this.lastValue = value;
         }
         catch(e:Error)
         {
         }
         logItem = new ChangeLogItem(ChangeLogItem.KIND_PROPERTY_CHANGE,value);
         logItem.propertyName = this.propertyName;
         logItem.propertyChain = this.propertyChain;
         logItem.event = e;
         this._observer.addLogItem(logItem);
         if(Capabilities.isDebugger && this._observer.hasWatchPoint(this.propertyChain))
         {
            enterDebugger();
         }
      }
   }
}

