package com.bigpoint.zoomumba.view.admin.components
{
   import mx.binding.BindingManager;
   import mx.controls.HRule;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.ComboBox;
   import spark.components.Label;
   import spark.components.TextInput;
   import spark.components.TileGroup;
   import spark.components.TitleWindow;
   
   public class CommandSendWindow extends TitleWindow
   {
      private static var _skinParts:Object = {
         "contentGroup":false,
         "moveArea":false,
         "closeButton":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _950394699command:TextInput;
      
      private var _1461492087commandList:ComboBox;
      
      private var _1953705675paramList:TileGroup;
      
      private var _713510sendButton:Button;
      
      private var _1425944229updateButton:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function CommandSendWindow()
      {
         super();
         this.title = "Net Commands";
         this.width = 400;
         this.height = 300;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._CommandSendWindow_Array1_c);
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
      
      private function _CommandSendWindow_Array1_c() : Array
      {
         var _loc1_:Array = [this._CommandSendWindow_ComboBox1_i(),this._CommandSendWindow_Button1_i(),this._CommandSendWindow_TextInput1_i(),this._CommandSendWindow_Label1_c(),this._CommandSendWindow_HRule1_c(),this._CommandSendWindow_HRule2_c(),this._CommandSendWindow_TileGroup1_i(),this._CommandSendWindow_Button2_i()];
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CommandSendWindow_ComboBox1_i() : ComboBox
      {
         var _loc1_:ComboBox = new ComboBox();
         _loc1_.width = 398;
         _loc1_.id = "commandList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.commandList = _loc1_;
         BindingManager.executeBindings(this,"commandList",this.commandList);
         return _loc1_;
      }
      
      private function _CommandSendWindow_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 318;
         _loc1_.y = 236;
         _loc1_.label = "Send";
         _loc1_.id = "sendButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sendButton = _loc1_;
         BindingManager.executeBindings(this,"sendButton",this.sendButton);
         return _loc1_;
      }
      
      private function _CommandSendWindow_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.x = 9;
         _loc1_.y = 165;
         _loc1_.height = 65;
         _loc1_.width = 379;
         _loc1_.id = "command";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.command = _loc1_;
         BindingManager.executeBindings(this,"command",this.command);
         return _loc1_;
      }
      
      private function _CommandSendWindow_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 10;
         _loc1_.y = 31;
         _loc1_.text = "Param List:";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CommandSendWindow_HRule1_c() : HRule
      {
         var _loc1_:HRule = new HRule();
         _loc1_.x = 10;
         _loc1_.y = 51;
         _loc1_.width = 378;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CommandSendWindow_HRule2_c() : HRule
      {
         var _loc1_:HRule = new HRule();
         _loc1_.x = 10;
         _loc1_.y = 145;
         _loc1_.width = 378;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CommandSendWindow_TileGroup1_i() : TileGroup
      {
         var _loc1_:TileGroup = new TileGroup();
         _loc1_.x = 10;
         _loc1_.y = 51;
         _loc1_.width = 378;
         _loc1_.height = 96;
         _loc1_.id = "paramList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.paramList = _loc1_;
         BindingManager.executeBindings(this,"paramList",this.paramList);
         return _loc1_;
      }
      
      private function _CommandSendWindow_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 237;
         _loc1_.y = 236;
         _loc1_.label = "Update";
         _loc1_.id = "updateButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.updateButton = _loc1_;
         BindingManager.executeBindings(this,"updateButton",this.updateButton);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get command() : TextInput
      {
         return this._950394699command;
      }
      
      public function set command(param1:TextInput) : void
      {
         var _loc2_:Object = this._950394699command;
         if(_loc2_ !== param1)
         {
            this._950394699command = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"command",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get commandList() : ComboBox
      {
         return this._1461492087commandList;
      }
      
      public function set commandList(param1:ComboBox) : void
      {
         var _loc2_:Object = this._1461492087commandList;
         if(_loc2_ !== param1)
         {
            this._1461492087commandList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"commandList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get paramList() : TileGroup
      {
         return this._1953705675paramList;
      }
      
      public function set paramList(param1:TileGroup) : void
      {
         var _loc2_:Object = this._1953705675paramList;
         if(_loc2_ !== param1)
         {
            this._1953705675paramList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"paramList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sendButton() : Button
      {
         return this._713510sendButton;
      }
      
      public function set sendButton(param1:Button) : void
      {
         var _loc2_:Object = this._713510sendButton;
         if(_loc2_ !== param1)
         {
            this._713510sendButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sendButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get updateButton() : Button
      {
         return this._1425944229updateButton;
      }
      
      public function set updateButton(param1:Button) : void
      {
         var _loc2_:Object = this._1425944229updateButton;
         if(_loc2_ !== param1)
         {
            this._1425944229updateButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"updateButton",_loc2_,param1));
            }
         }
      }
   }
}

