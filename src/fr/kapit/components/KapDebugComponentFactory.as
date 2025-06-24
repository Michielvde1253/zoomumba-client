package fr.kapit.components
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class KapDebugComponentFactory implements IEventDispatcher
   {
      private static var _681586406_iconDefaultOff:Class = KapDebugComponentFactory__iconDefaultOff;
      
      private static var _1130365320_iconDefaultOn:Class = KapDebugComponentFactory__iconDefaultOn;
      
      private static var _345642435_iconDefaultOver:Class = KapDebugComponentFactory__iconDefaultOver;
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      public var componentClass:Class;
      
      public var iconOff:Class;
      
      public var iconOn:Class;
      
      public var iconOver:Class;
      
      public var label:String;
      
      public var name:String;
      
      public var shortcut:KapDebugShortcut;
      
      private var _isAcceptable:Function;
      
      private var _bindingEventDispatcher:EventDispatcher = new EventDispatcher(IEventDispatcher(this));
      
      public function KapDebugComponentFactory(param1:String, param2:String, param3:Class, param4:Class = null, param5:Class = null, param6:Class = null, param7:Function = null, param8:KapDebugShortcut = null)
      {
         super();
         this.name = param1;
         this.label = param2;
         this.iconOn = param4 || _iconDefaultOn;
         this.iconOff = param5 || _iconDefaultOff;
         this.iconOver = param6 || _iconDefaultOver;
         this.componentClass = param3;
         this.shortcut = param8;
         this._isAcceptable = param7;
      }
      
      [Bindable(event="propertyChange")]
      private static function get _iconDefaultOff() : Class
      {
         return KapDebugComponentFactory._681586406_iconDefaultOff;
      }
      
      private static function set _iconDefaultOff(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = KapDebugComponentFactory._681586406_iconDefaultOff;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(KapDebugComponentFactory,"_iconDefaultOff",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      private static function get _iconDefaultOn() : Class
      {
         return KapDebugComponentFactory._1130365320_iconDefaultOn;
      }
      
      private static function set _iconDefaultOn(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = KapDebugComponentFactory._1130365320_iconDefaultOn;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(KapDebugComponentFactory,"_iconDefaultOn",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      private static function get _iconDefaultOver() : Class
      {
         return KapDebugComponentFactory._345642435_iconDefaultOver;
      }
      
      private static function set _iconDefaultOver(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = KapDebugComponentFactory._345642435_iconDefaultOver;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(KapDebugComponentFactory,"_iconDefaultOver",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      public static function get staticEventDispatcher() : IEventDispatcher
      {
         return _staticBindingEventDispatcher;
      }
      
      public function canAccept(param1:Object) : Boolean
      {
         if(this._isAcceptable is Function)
         {
            return this._isAcceptable(param1);
         }
         return true;
      }
      
      public function newComponent() : IKapDebugComponent
      {
         return new this.componentClass();
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

