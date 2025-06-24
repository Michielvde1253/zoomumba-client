package windows.custom.safari
{
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.filters.*;
   import mx.styles.*;
   import windows.core.AbstractWindow;
   import windows.skin.Window20Skin;
   
   use namespace mx_internal;
   
   public class SafariBuyFuelWindow extends AbstractWindow implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private static var _skinParts:Object = {
         "tabsContainer":false,
         "viewport":true,
         "preloaderImage":true,
         "dynamicTitle":true,
         "cancelButton":true,
         "modalLayer":true,
         "borderImage":false,
         "innerContainer":true,
         "closeButton":true,
         "outerContainer":true,
         "header":true,
         "okButton":true
      };
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SafariBuyFuelWindow()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._SafariBuyFuelWindow_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_safari_SafariBuyFuelWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SafariBuyFuelWindow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.okButtonVisibility = true;
         this.cancelButtonVisibility = true;
         this.background = 2;
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SafariBuyFuelWindow._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.skinClass = Window20Skin;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function _SafariBuyFuelWindow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Class
         {
            return SafariBuyFuelContent;
         },null,"this.content");
         return result;
      }
   }
}

