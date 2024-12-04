package com.bigpoint.zoomumba.view.admin.components
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   
   public class CageId extends Group
   {
      private var _1367931913cageId:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function CageId()
      {
         super();
         this.width = 400;
         this.height = 300;
         this.mxmlContent = [this._CageId_Button1_i()];
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
      
      private function _CageId_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.id = "cageId";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cageId = _loc1_;
         BindingManager.executeBindings(this,"cageId",this.cageId);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get cageId() : Button
      {
         return this._1367931913cageId;
      }
      
      public function set cageId(param1:Button) : void
      {
         var _loc2_:Object = this._1367931913cageId;
         if(_loc2_ !== param1)
         {
            this._1367931913cageId = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cageId",_loc2_,param1));
            }
         }
      }
   }
}

