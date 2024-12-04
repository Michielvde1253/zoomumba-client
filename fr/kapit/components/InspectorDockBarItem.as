package fr.kapit.components
{
   import flash.events.MouseEvent;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   
   public class InspectorDockBarItem extends Image
   {
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _iconOn:Class;
      
      private var _iconOff:Class;
      
      private var _iconOver:Class;
      
      private var _activated:Boolean = false;
      
      public function InspectorDockBarItem()
      {
         super();
         this.buttonMode = true;
         this.useHandCursor = true;
         this.addEventListener("rollOut",this.___InspectorDockBarItem_Image1_rollOut);
         this.addEventListener("rollOver",this.___InspectorDockBarItem_Image1_rollOver);
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
      
      public function set iconOn(param1:Class) : void
      {
         this._iconOn = param1;
      }
      
      public function set iconOff(param1:Class) : void
      {
         this._iconOff = param1;
         this.source = this._iconOff;
      }
      
      public function set iconOver(param1:Class) : void
      {
         this._iconOver = param1;
      }
      
      public function rollOver() : void
      {
         this.source = this._iconOver;
      }
      
      public function rollOut() : void
      {
         this.source = this._activated ? this._iconOn : this._iconOff;
      }
      
      public function set activate(param1:Boolean) : void
      {
         this._activated = param1;
         if(this._activated)
         {
            this.source = this._iconOn;
         }
         else
         {
            this.source = this._iconOff;
         }
      }
      
      public function ___InspectorDockBarItem_Image1_rollOut(param1:MouseEvent) : void
      {
         this.rollOut();
      }
      
      public function ___InspectorDockBarItem_Image1_rollOver(param1:MouseEvent) : void
      {
         this.rollOver();
      }
   }
}

