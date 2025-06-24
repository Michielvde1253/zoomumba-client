package fr.kapit.components
{
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
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
   import fr.kapit.assets.EmbeddedAssets;
   import mx.binding.*;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class KapITPopupWindow extends ResizableTitleWindow implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _KapITPopupWindow_StylesInit_done:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function KapITPopupWindow()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":ResizableTitleWindow,
            "stylesFactory":function():void
            {
               this.headerColors = ["0xCCE11D,0xA3C10E"];
               this.borderColor = 10731790;
               this.titleStyleName = "popupTitle";
               this.borderThicknessBottom = 15;
               this.borderThicknessLeft = 1;
               this.borderThicknessRight = 1;
            }
         });
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._KapITPopupWindow_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_fr_kapit_components_KapITPopupWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return KapITPopupWindow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         KapITPopupWindow._watcherSetupUtil = param1;
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
            this.headerColors = ["0xCCE11D,0xA3C10E"];
            this.borderColor = 10731790;
            this.titleStyleName = "popupTitle";
            this.borderThicknessBottom = 15;
            this.borderThicknessLeft = 1;
            this.borderThicknessRight = 1;
         };
         mx_internal::_KapITPopupWindow_StylesInit();
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      private function _KapITPopupWindow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Class
         {
            return EmbeddedAssets.miniLogo;
         },null,"this.titleIcon");
         return result;
      }
      
      mx_internal function _KapITPopupWindow_StylesInit() : void
      {
         var style:CSSStyleDeclaration = null;
         var effects:Array = null;
         var conditions:Array = null;
         var condition:CSSCondition = null;
         var selector:CSSSelector = null;
         if(mx_internal::_KapITPopupWindow_StylesInit_done)
         {
            return;
         }
         mx_internal::_KapITPopupWindow_StylesInit_done = true;
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","popupTitle");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".popupTitle");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.color = 16777215;
               this.textAlign = "left";
               this.fontFamily = "Arial";
               this.fontSize = 14;
            };
         }
      }
   }
}

