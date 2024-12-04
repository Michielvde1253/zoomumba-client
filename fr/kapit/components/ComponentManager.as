package fr.kapit.components
{
   import flash.events.EventDispatcher;
   import fr.kapit.events.KapDebugEventDispatcher;
   import fr.kapit.events.PluginLoadedEvent;
   import fr.kapit.model.PanelHolderObject;
   
   public class ComponentManager extends EventDispatcher
   {
      private static var _instance:ComponentManager;
      
      public static const FACTORY_ATTRIBUTE:String = "factory";
      
      public static const PANEL_NAME:String = "Panels";
      
      private static var _keys:Object = {};
      
      private static var _panelObjects:Object = {};
      
      private var _componentFactories:Object = {};
      
      private var _componentNames:Object = {};
      
      public function ComponentManager(param1:ComponentManagerEnforcer)
      {
         super();
         if(!(param1 is ComponentManagerEnforcer))
         {
            throw new Error("Use ComponentManager get instance implicit method.");
         }
      }
      
      public static function get instance() : ComponentManager
      {
         if(!_instance)
         {
            _instance = new ComponentManager(new ComponentManagerEnforcer());
         }
         return _instance;
      }
      
      public function get componentFactories() : Object
      {
         return this._componentFactories;
      }
      
      public function get componentNames() : Array
      {
         var _loc2_:String = null;
         var _loc1_:Array = [];
         for(_loc2_ in this._componentNames)
         {
            _loc1_ = _loc1_.concat(this._componentNames[_loc2_]);
         }
         return _loc1_;
      }
      
      public function getComponentFactory(param1:String) : KapDebugComponentFactory
      {
         return this._componentFactories[param1] as KapDebugComponentFactory;
      }
      
      public function getComponentNames(param1:String) : Array
      {
         if(!this._componentNames.hasOwnProperty(param1))
         {
            this._componentNames[param1] = [];
         }
         return this._componentNames[param1] as Array;
      }
      
      public function getPanelObject(param1:String) : PanelHolderObject
      {
         var _loc2_:PanelHolderObject = PanelHolderObject(_panelObjects[param1]);
         if(!_loc2_)
         {
            _loc2_ = new PanelHolderObject(param1);
            _panelObjects[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      public function isComponentGlobal(param1:String) : Boolean
      {
         var global:Boolean = false;
         var name:String = param1;
         var factory:KapDebugComponentFactory = this._componentFactories[name] as KapDebugComponentFactory;
         if(factory)
         {
            try
            {
               global = factory.componentClass["IS_GLOBAL"] as Boolean;
            }
            catch(e:Error)
            {
            }
         }
         return global;
      }
      
      public function newComponent(param1:String) : IKapDebugComponent
      {
         var _loc2_:KapDebugComponentFactory = this.getComponentFactory(param1);
         return !!_loc2_ ? _loc2_.newComponent() : null;
      }
      
      public function registerModule(param1:Class, param2:String) : void
      {
         var _loc3_:String = this.registerComponent(param1,param2);
         if(_loc3_)
         {
            KapDebugEventDispatcher.instance.dispatchEvent(new PluginLoadedEvent(PluginLoadedEvent.MODULE_LOADED,_loc3_,param2));
         }
      }
      
      public function registerView(param1:Class, param2:String) : void
      {
         var _loc3_:String = this.registerComponent(param1,param2);
         if(_loc3_)
         {
            KapDebugEventDispatcher.instance.dispatchEvent(new PluginLoadedEvent(PluginLoadedEvent.VIEW_LOADED,_loc3_,param2));
         }
      }
      
      private function registerComponent(param1:Class, param2:String) : String
      {
         var key:String;
         var name:String = null;
         var factory:KapDebugComponentFactory = null;
         var componentClass:Class = param1;
         var consoleName:String = param2;
         try
         {
            name = componentClass["NAME"];
         }
         catch(e:Error)
         {
            throw new Error("Component class: " + componentClass.toString() + " does not implement static NAME attribute");
         }
         key = consoleName + "_" + name;
         if(!_keys.hasOwnProperty(key))
         {
            this.getComponentNames(consoleName).push(name);
            try
            {
               factory = componentClass[FACTORY_ATTRIBUTE] as KapDebugComponentFactory;
               if(!factory)
               {
                  throw new Error("Component class: " + componentClass.toString() + " does not implement factory static method");
               }
            }
            catch(e:Error)
            {
               throw new Error("Component class: " + componentClass.toString() + " does not implement factory static method");
            }
            _keys[key] = null;
            this._componentFactories[name] = factory;
            return name;
         }
         return null;
      }
   }
}

class ComponentManagerEnforcer
{
   public function ComponentManagerEnforcer()
   {
      super();
   }
}
