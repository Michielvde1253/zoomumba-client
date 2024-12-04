package fr.kapit.introspection.nodes
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import fr.kapit.introspection.AccessorDescriptor;
   import fr.kapit.introspection.ClassDescriptor;
   import fr.kapit.introspection.ClassProxy;
   import fr.kapit.introspection.nodes.complex.XMLDebugNode;
   import fr.kapit.utils.ClassUtils;
   import mx.binding.utils.ChangeWatcher;
   import mx.collections.ArrayCollection;
   import mx.collections.ListCollectionView;
   import mx.controls.Alert;
   import mx.controls.listClasses.BaseListData;
   import mx.events.CollectionEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.PropertyChangeEventKind;
   
   public class DebugNode extends EventDispatcher
   {
      public var accessDescriptor:AccessorDescriptor;
      
      public var firstIndex:int = -1;
      
      public var host:Object;
      
      public var index:int = -1;
      
      public var isDirectAttribute:Boolean;
      
      public var isDynamicAttribute:Boolean;
      
      public var key:Object;
      
      public var listData:BaseListData;
      
      public var name:String;
      
      public var target:Object;
      
      public var type:Class;
      
      public var typeDescriptor:ClassDescriptor;
      
      protected var _children:NodeCollection;
      
      protected var initialized:Boolean = false;
      
      public function DebugNode(param1:Object, param2:String, param3:Object = null)
      {
         var _loc4_:ClassDescriptor = null;
         var _loc5_:Boolean = false;
         super();
         this.target = param1;
         this.name = param2;
         this.host = param3;
         if(param1 != null)
         {
            this.type = ClassUtils.getObjectClass(param1);
            this.typeDescriptor = ClassProxy.getInstance().getDescriptor(this.type);
            if(param3 != null)
            {
               _loc4_ = ClassProxy.getInstance().getDescriptor(param3);
               if(_loc4_ != null)
               {
                  this.accessDescriptor = _loc4_.getAccessorDescriptor(param2);
               }
            }
         }
         else if(param3 != null)
         {
            _loc4_ = ClassProxy.getInstance().getDescriptor(param3);
            if(_loc4_ != null)
            {
               this.accessDescriptor = _loc4_.getAccessorDescriptor(param2);
               if(this.accessDescriptor)
               {
                  this.typeDescriptor = this.accessDescriptor.type;
                  this.type = this.typeDescriptor.type;
               }
            }
         }
         if(this.accessDescriptor)
         {
            _loc5_ = !!param3 ? Boolean(ClassProxy.getInstance().getDescriptor(param3).accessors.contains(this.accessDescriptor)) : true;
         }
         this.isDirectAttribute = !this.accessDescriptor || _loc5_;
         if(param3)
         {
            if(ChangeWatcher.canWatch(param3,param2))
            {
               ChangeWatcher.watch(param3,param2,this.onPropertyChange);
            }
         }
      }
      
      public function canBeWatched() : Boolean
      {
         return true;
      }
      
      public function get children() : ArrayCollection
      {
         var i:int = 0;
         if(this.target == null)
         {
            return null;
         }
         if(!this.initialized)
         {
            this.initialized = true;
            this._children = this.getChildNodes();
            if(!(this is XMLDebugNode) && !(this is ArrayCollection))
            {
               this.buildDynamicAttributes();
            }
            if(this._children)
            {
               try
               {
                  this._children.refresh();
               }
               catch(e:Error)
               {
                  i = 0;
               }
            }
            this.children.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onCollectionChange);
         }
         return this._children;
      }
      
      public function get classFilter() : Class
      {
         return !!this._children ? this._children.typeFilter : null;
      }
      
      public function set classFilter(param1:Class) : void
      {
         if(this._children)
         {
            this._children.typeFilter = param1;
         }
      }
      
      public function clone() : DebugNode
      {
         return NodeFactory.newNode(this.target,this.name,this.host);
      }
      
      public function get data() : Object
      {
         return this.name;
      }
      
      public function get displayValue() : String
      {
         if(this.target != null)
         {
            if(this.host)
            {
               if(this.index < 0)
               {
                  if(this.host is ArrayCollection)
                  {
                     return this.target.toString();
                  }
                  if(this.key)
                  {
                     return this.host[this.key];
                  }
                  return this.host[this.name];
               }
               return this.host[this.index];
            }
            return this.target.toString();
         }
         return "null";
      }
      
      public function get label() : String
      {
         var _loc1_:String = this.labelPrefix;
         if(this is XMLDebugNode)
         {
            return _loc1_;
         }
         return !!_loc1_ ? _loc1_ + " = " + this.displayValue : this.displayValue;
      }
      
      private function set _102727412label(param1:String) : void
      {
      }
      
      public function get labelPrefix() : String
      {
         var _loc1_:* = null;
         var _loc2_:String = null;
         if(this.index < 0)
         {
            if(this.key != null)
            {
               if(this.key is int || this.key is Number || this.key is String || this.key is Boolean)
               {
                  _loc2_ = this.key.toString();
               }
               else
               {
                  _loc2_ = ClassUtils.getShortClassName(this.key);
               }
               _loc1_ = "[" + _loc2_ + "]";
            }
            else
            {
               _loc1_ = this.name;
            }
         }
         else
         {
            _loc1_ = "[" + this.index + "]";
         }
         return _loc1_;
      }
      
      public function get nameFilter() : String
      {
         return !!this._children ? this._children.nameFilter : "";
      }
      
      public function set nameFilter(param1:String) : void
      {
         if(this._children)
         {
            this._children.nameFilter = param1;
         }
      }
      
      public function set rawValue(param1:Object) : void
      {
         this.value = param1;
      }
      
      public function get rawValueAsString() : String
      {
         var _loc1_:Object = this.value;
         if(_loc1_ is ListCollectionView)
         {
            return "Collection";
         }
         if(_loc1_ is Array)
         {
            return "Array";
         }
         return !!_loc1_ ? _loc1_.toString() : "";
      }
      
      public function get showInherited() : Boolean
      {
         return !!this._children ? this._children.showInherited : true;
      }
      
      public function set showInherited(param1:Boolean) : void
      {
         if(this._children)
         {
            this._children.showInherited = param1;
         }
      }
      
      public function get value() : Object
      {
         if(!this.host)
         {
            return this.target;
         }
         try
         {
            if(this.index >= 0)
            {
               return this.host[this.index];
            }
            if(this.key)
            {
               return this.host[this.key];
            }
            if(this.name)
            {
               if(this.target is XML)
               {
                  return this.target;
               }
               return this.host[this.name];
            }
         }
         catch(e:Error)
         {
         }
         return null;
      }
      
      public function set value(param1:Object) : void
      {
         var newValue:Object = param1;
         if(this.host)
         {
            try
            {
               if(this.index >= 0)
               {
                  this.host[this.index] = newValue;
               }
               else if(this.key)
               {
                  this.host[this.key] = newValue;
               }
               else if(this.name)
               {
                  this.host[this.name] = newValue;
               }
            }
            catch(e:Error)
            {
               Alert.show("DebugNode error, cannot set value: " + newValue.toString() + ", error is: " + e.message);
            }
         }
      }
      
      protected function buildDynamicAttributes() : void
      {
         var _loc1_:String = null;
         var _loc2_:Object = null;
         var _loc3_:ClassDescriptor = null;
         var _loc4_:DebugNode = null;
         for(_loc1_ in this.target)
         {
            _loc2_ = this.target[_loc1_];
            _loc3_ = ClassProxy.getInstance().getDescriptor(_loc2_);
            _loc4_ = NodeFactory.newNode(_loc2_,_loc1_,this.target);
            _loc4_.isDynamicAttribute = true;
            this._children.addItem(_loc4_);
         }
      }
      
      protected function getChildNodes() : NodeCollection
      {
         return null;
      }
      
      private function onCollectionChange(param1:CollectionEvent) : void
      {
         if(this.listData)
         {
            this.listData.owner.dispatchEvent(param1.clone());
         }
      }
      
      private function onPropertyChange(param1:Event) : void
      {
         var _loc3_:Object = null;
         var _loc2_:PropertyChangeEvent = param1 as PropertyChangeEvent;
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.kind == PropertyChangeEventKind.UPDATE)
         {
            if(Boolean(this.host) && Boolean(this.name))
            {
               _loc3_ = this.host[this.name];
               if(_loc3_ != this.target)
               {
                  this.target = _loc3_;
                  this.type = ClassUtils.getObjectClass(this.target);
                  this.typeDescriptor = ClassProxy.getInstance().getDescriptor(this.type);
               }
            }
         }
         this.label = "";
         dispatchEvent(_loc2_.clone());
      }
      
      [Bindable(event="propertyChange")]
      public function set label(param1:String) : void
      {
         var _loc2_:Object = this.label;
         if(_loc2_ !== param1)
         {
            this._102727412label = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label",_loc2_,param1));
            }
         }
      }
   }
}

