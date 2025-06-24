package fr.kapit.introspection.oldnodes
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import fr.kapit.introspection.AccessorDescriptor;
   import fr.kapit.introspection.ILanguageElement;
   import mx.collections.ArrayCollection;
   import mx.collections.ICollectionView;
   import mx.core.IPropertyChangeNotifier;
   import mx.events.PropertyChangeEvent;
   
   public class VariableNode extends AbstractNode implements IEventDispatcher
   {
      public var index:int = -1;
      
      private var _children:AbstractNode;
      
      private var simpleDisplay:Boolean = true;
      
      private var _bindingEventDispatcher:EventDispatcher = new EventDispatcher(IEventDispatcher(this));
      
      public function VariableNode(param1:ILanguageElement, param2:Object = null)
      {
         super(param1,param2);
         if(param2 is IPropertyChangeNotifier)
         {
            if(!IPropertyChangeNotifier(param2).willTrigger(PropertyChangeEvent.PROPERTY_CHANGE))
            {
               IPropertyChangeNotifier(param2).addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.onPropertyChange);
            }
         }
      }
      
      override public function get children() : ICollectionView
      {
         var allVars:ArrayCollection = null;
         var variables:ArrayCollection = null;
         var item:Object = null;
         var data:Object = this.getData();
         if(!this._children && Boolean(this.variableDescriptor.type))
         {
            allVars = this.variableDescriptor.type.allVariables;
            if(allVars != null)
            {
               variables = new ArrayCollection();
               for each(item in allVars)
               {
                  variables.addItem(item);
               }
            }
            try
            {
               if(!variables)
               {
                  variables = new ArrayCollection();
               }
            }
            catch(e:Error)
            {
            }
            if(this.simpleDisplay)
            {
               this._children = new CollectionNode("variables",variables,data);
            }
            else
            {
               this._children = new ClassNode(this.variableDescriptor.type,data);
            }
         }
         return !!this._children ? this._children.children : null;
      }
      
      override public function getData() : Object
      {
         var value:Object = null;
         try
         {
            if(this.index >= 0)
            {
               value = target[this.index];
            }
            else
            {
               value = !!target ? target[this.variableDescriptor.name] : null;
            }
         }
         catch(e:Error)
         {
         }
         return value;
      }
      
      override public function hasChildren() : Boolean
      {
         var hasDynamic:Boolean = false;
         var hasAccessors:Boolean = this.variableDescriptor.type.accessors.length != 0;
         var data:Object = this.getData();
         try
         {
            hasDynamic = data.length != 0;
         }
         catch(e:Error)
         {
         }
         return hasAccessors || hasDynamic;
      }
      
      override public function get label() : String
      {
         var _loc1_:Object = this.getData();
         var _loc2_:* = this.variableDescriptor.name + " (" + this.variableDescriptor.typeName + ")";
         if(target)
         {
            _loc2_ += " = " + _loc1_;
         }
         return _loc2_;
      }
      
      private function set _102727412label(param1:String) : void
      {
      }
      
      public function get variableDescriptor() : AccessorDescriptor
      {
         return descriptor as AccessorDescriptor;
      }
      
      private function onPropertyChange(param1:Event) : void
      {
         this.label = "";
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

