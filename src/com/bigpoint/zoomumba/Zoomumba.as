package com.bigpoint.zoomumba
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
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.filters.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class Zoomumba extends Main
   {
      private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
         "type":Main,
         "stylesFactory":function():void
         {
            this.backgroundColor = 6042114;
         }
      });
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _Zoomumba_StylesInit_done:Boolean = false;
      
      public function Zoomumba()
      {
         super();
         mx_internal::_document = this;
         this.layout = "absolute";
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
         this.verticalCenter = 0;
         this.horizontalCenter = 0;
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
            this.backgroundColor = 6042114;
         };
         mx_internal::_Zoomumba_StylesInit();
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      mx_internal function _Zoomumba_StylesInit() : void
      {
         var style:CSSStyleDeclaration = null;
         var effects:Array = null;
         var conditions:Array = null;
         var condition:CSSCondition = null;
         var selector:CSSSelector = null;
         if(mx_internal::_Zoomumba_StylesInit_done)
         {
            return;
         }
         mx_internal::_Zoomumba_StylesInit_done = true;
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("global",conditions,selector);
         style = styleManager.getStyleDeclaration("global");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.focusAlpha = 0;
            };
         }
         styleManager.initProtoChainRoots();
      }
   }
}

