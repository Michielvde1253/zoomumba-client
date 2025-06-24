package components.textfield
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
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.filters.*;
   import mx.styles.*;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class StandardText extends Text implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public static const LIPSUM_SHORT:String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam dictum, diam at bibendum interdum, neque velit faucibus tellus, vel luctus urna risus quis metus.";
      
      public static const LIPSUM_LONG:String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam dictum, diam at bibendum interdum, neque velit faucibus tellus, vel luctus urna risus quis metus. Aliquam facilisis enim id odio cursus euismod. Cras erat tortor, fringilla eget mattis a, vestibulum et est.";
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function StandardText()
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
         bindings = this._StandardText_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_components_textfield_StandardTextWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return StandardText[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.cachePolicy = "auto";
         this.truncateToFit = false;
         this.selectable = false;
         this.mouseEnabled = false;
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         StandardText._watcherSetupUtil = param1;
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
            this.fontAntiAliasType = "advanced";
            this.fontFamily = "Tahoma";
            this.fontWeight = "bold";
            this.paddingBottom = 0;
            this.paddingLeft = 0;
            this.paddingRight = 0;
            this.paddingTop = 0;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function _StandardText_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_DARKER;
         },function(param1:uint):void
         {
            this.setStyle("color",param1);
         },"this.color");
         return result;
      }
   }
}

