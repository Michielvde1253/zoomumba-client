package windows.custom.advBreeding
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
   import mx.filters.*;
   import mx.styles.*;
   import windows.core.AbstractWindow;
   import windows.skin.Window50Skin;
   
   public class AdvancedBreedingWindow extends AbstractWindow
   {
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
      
      public function AdvancedBreedingWindow()
      {
         super();
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
            this.skinClass = Window50Skin;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
   }
}

