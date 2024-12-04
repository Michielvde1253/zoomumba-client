package com.bigpoint.zoomumba.view.admin.components
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.TextArea;
   import spark.components.TitleWindow;
   
   public class NetDebugger extends TitleWindow
   {
      private static var _skinParts:Object = {
         "contentGroup":false,
         "moveArea":false,
         "closeButton":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _1363012386netDebugger:TextArea;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function NetDebugger()
      {
         super();
         this.width = 500;
         this.height = 400;
         this.title = "Net Debugger panel";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._NetDebugger_Array1_c);
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function _NetDebugger_Array1_c() : Array
      {
         var _loc1_:Array = [this._NetDebugger_TextArea1_i()];
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NetDebugger_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.width = 500;
         _loc1_.height = 400;
         _loc1_.id = "netDebugger";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.netDebugger = _loc1_;
         BindingManager.executeBindings(this,"netDebugger",this.netDebugger);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get netDebugger() : TextArea
      {
         return this._1363012386netDebugger;
      }
      
      public function set netDebugger(param1:TextArea) : void
      {
         var _loc2_:Object = this._1363012386netDebugger;
         if(_loc2_ !== param1)
         {
            this._1363012386netDebugger = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"netDebugger",_loc2_,param1));
            }
         }
      }
   }
}

