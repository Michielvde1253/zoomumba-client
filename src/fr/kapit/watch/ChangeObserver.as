package fr.kapit.watch
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   import fr.kapit.introspection.AccessorDescriptor;
   import fr.kapit.introspection.ClassDescriptor;
   import fr.kapit.introspection.ClassProxy;
   import fr.kapit.introspection.ConstantDescriptor;
   import fr.kapit.utils.ClassUtils;
   import mx.binding.utils.ChangeWatcher;
   import mx.collections.ArrayCollection;
   import mx.events.PropertyChangeEvent;
   
   public class ChangeObserver implements IEventDispatcher
   {
      public var target:*;
      
      private var _748916528isActive:Boolean = true;
      
      private var _107332log:ArrayCollection = new ArrayCollection();
      
      private var _1628147125rootTargetNode:ChangeTargetNode;
      
      public var watchPoints:Object = {};
      
      private var _watchersMap:Dictionary = new Dictionary(true);
      
      private var _watchers:Array = [];
      
      private var _callStack:Array;
      
      private var _bindingEventDispatcher:EventDispatcher = new EventDispatcher(IEventDispatcher(this));
      
      public function ChangeObserver(param1:*, param2:String = "", param3:Boolean = true)
      {
         super();
         this.target = param1;
         this.rootTargetNode = new ChangeTargetNode(this,param2,ClassUtils.getObjectClass(param1));
         this._buildWatches(param1);
      }
      
      public function addLogItem(param1:ChangeLogItem) : void
      {
         this.log.addItem(param1);
      }
      
      public function flush() : void
      {
         this.log.removeAll();
      }
      
      public function setWatchPoint(param1:String, param2:Boolean) : void
      {
         if(param2)
         {
            this.watchPoints[param1] = true;
         }
         else
         {
            delete this.watchPoints[param1];
         }
      }
      
      public function toggleWatchPoint(param1:String) : Boolean
      {
         if(this.watchPoints[param1])
         {
            delete this.watchPoints[param1];
            return false;
         }
         this.watchPoints[param1] = true;
         return true;
      }
      
      public function hasWatchPoint(param1:String) : Boolean
      {
         return this.watchPoints[param1] == true;
      }
      
      private function _updateWatcherMap(param1:*, param2:String, param3:ChangeTargetNode) : void
      {
         var _loc4_:Object = this._watchersMap[param1];
         if(!_loc4_)
         {
            _loc4_ = {};
            this._watchersMap[param1] = _loc4_;
         }
         _loc4_[param2] = param3;
      }
      
      private function _getNode(param1:*, param2:String) : ChangeTargetNode
      {
         var _loc3_:ChangeTargetNode = null;
         var _loc4_:Object = this._watchersMap[param1];
         if(_loc4_)
         {
            _loc3_ = _loc4_[param2] as ChangeTargetNode;
         }
         return _loc3_;
      }
      
      public function updateWatches(param1:*, param2:String) : void
      {
         var _loc3_:ChangeTargetNode = this._getNode(param1,param2);
         if(_loc3_)
         {
            this._buildWatches(param1,_loc3_,[],0,param1);
         }
      }
      
      private function _buildWatches(param1:*, param2:ChangeTargetNode = null, param3:Array = null, param4:int = 0, param5:* = null) : void
      {
         var accessors:ArrayCollection;
         var parentDescriptor:ClassDescriptor = null;
         var accessor:AccessorDescriptor = null;
         var name:String = null;
         var accessorNode:ChangeTargetNode = null;
         var watcher:PropertyChangeWatcher = null;
         var accessorValue:* = undefined;
         var desc:ClassDescriptor = null;
         var host:* = param1;
         var parentTargetNode:ChangeTargetNode = param2;
         var propertyChain:Array = param3;
         var level:int = param4;
         var parent:* = param5;
         if(!parent)
         {
            parent = host;
            propertyChain = [];
            parentTargetNode = this.rootTargetNode;
            this._callStack = [];
         }
         parentDescriptor = ClassProxy.getInstance().getDescriptor(parent);
         accessors = parentDescriptor.allVariables;
         for each(accessor in accessors)
         {
            if(!(accessor is ConstantDescriptor))
            {
               name = accessor.name;
               if(accessor.isBindable || Boolean(ChangeWatcher.canWatch(parent,name)))
               {
                  try
                  {
                     accessorValue = parent[name];
                  }
                  catch(e:Error)
                  {
                     continue;
                  }
                  propertyChain[level] = name;
                  accessorNode = new ChangeTargetNode(this,name,accessor.type.type,parentTargetNode);
                  watcher = new PropertyChangeWatcher(parent,name,propertyChain.join("."),this);
                  this._watchers.push(watcher);
                  this._updateWatcherMap(parent,name,accessorNode);
                  if(!(accessorValue is DisplayObject))
                  {
                     if(host != accessorValue)
                     {
                        if(accessorValue)
                        {
                           if(!(accessorValue is Array || accessorValue is XML))
                           {
                              desc = ClassProxy.getInstance().getDescriptor(accessorValue);
                              if(desc.accessors.length != 0)
                              {
                                 if(this._callStack.indexOf(accessorValue) < 0)
                                 {
                                    this._callStack.push(parent);
                                    this._buildWatches(host,accessorNode,propertyChain,level + 1,accessorValue);
                                    this._callStack.pop();
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         propertyChain.pop();
      }
      
      [Bindable(event="propertyChange")]
      public function get isActive() : Boolean
      {
         return this._748916528isActive;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         var _loc2_:Object = this._748916528isActive;
         if(_loc2_ !== param1)
         {
            this._748916528isActive = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isActive",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get log() : ArrayCollection
      {
         return this._107332log;
      }
      
      public function set log(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._107332log;
         if(_loc2_ !== param1)
         {
            this._107332log = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"log",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rootTargetNode() : ChangeTargetNode
      {
         return this._1628147125rootTargetNode;
      }
      
      public function set rootTargetNode(param1:ChangeTargetNode) : void
      {
         var _loc2_:Object = this._1628147125rootTargetNode;
         if(_loc2_ !== param1)
         {
            this._1628147125rootTargetNode = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rootTargetNode",_loc2_,param1));
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
   }
}

