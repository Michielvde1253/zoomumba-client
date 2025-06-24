package windows.custom.mail.tabs
{
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import components.dropDown.DropDownWoodSkin;
   import components.textfield.textArea.StandardTextArea;
   import components.textfield.textArea.TextAreaWoodSkin;
   import components.textfield.textInput.StandardTextInput;
   import components.textfield.textInput.StandardTextInputWoodSkin;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.DropDownList;
   import spark.components.Group;
   import spark.components.VGroup;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class MailNewTabContent extends Group
   {
      private var _206189572btnSend:Button;
      
      private var _1941293277inputMessage:StandardTextArea;
      
      private var _881517054inputSubject:StandardTextInput;
      
      private var _905963485sendTo:DropDownList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function MailNewTabContent()
      {
         super();
         this.mxmlContent = [this._MailNewTabContent_InnerGroup1_c(),this._MailNewTabContent_OuterGroup1_c()];
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
      
      private function _MailNewTabContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._MailNewTabContent_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailNewTabContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.y = 170;
         _loc1_.left = 80;
         _loc1_.right = 67;
         _loc1_.gap = 15;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._MailNewTabContent_DropDownList1_i(),this._MailNewTabContent_StandardTextInput1_i(),this._MailNewTabContent_StandardTextArea1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailNewTabContent_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("skinClass",DropDownWoodSkin);
         _loc1_.id = "sendTo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sendTo = _loc1_;
         BindingManager.executeBindings(this,"sendTo",this.sendTo);
         return _loc1_;
      }
      
      private function _MailNewTabContent_StandardTextInput1_i() : StandardTextInput
      {
         var _loc1_:StandardTextInput = new StandardTextInput();
         _loc1_.percentWidth = 100;
         _loc1_.promptColor = 9590288;
         _loc1_.setStyle("skinClass",StandardTextInputWoodSkin);
         _loc1_.id = "inputSubject";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.inputSubject = _loc1_;
         BindingManager.executeBindings(this,"inputSubject",this.inputSubject);
         return _loc1_;
      }
      
      private function _MailNewTabContent_StandardTextArea1_i() : StandardTextArea
      {
         var _loc1_:StandardTextArea = new StandardTextArea();
         _loc1_.percentWidth = 100;
         _loc1_.height = 180;
         _loc1_.promptColor = 9590288;
         _loc1_.setStyle("skinClass",TextAreaWoodSkin);
         _loc1_.id = "inputMessage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.inputMessage = _loc1_;
         BindingManager.executeBindings(this,"inputMessage",this.inputMessage);
         return _loc1_;
      }
      
      private function _MailNewTabContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._MailNewTabContent_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailNewTabContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.bottom = 25;
         _loc1_.width = 150;
         _loc1_.height = 40;
         _loc1_.label = "Test";
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.addEventListener("click",this.__btnSend_click);
         _loc1_.id = "btnSend";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnSend = _loc1_;
         BindingManager.executeBindings(this,"btnSend",this.btnSend);
         return _loc1_;
      }
      
      public function __btnSend_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("sendMessageClicked",true));
      }
      
      [Bindable(event="propertyChange")]
      public function get btnSend() : Button
      {
         return this._206189572btnSend;
      }
      
      public function set btnSend(param1:Button) : void
      {
         var _loc2_:Object = this._206189572btnSend;
         if(_loc2_ !== param1)
         {
            this._206189572btnSend = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnSend",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get inputMessage() : StandardTextArea
      {
         return this._1941293277inputMessage;
      }
      
      public function set inputMessage(param1:StandardTextArea) : void
      {
         var _loc2_:Object = this._1941293277inputMessage;
         if(_loc2_ !== param1)
         {
            this._1941293277inputMessage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"inputMessage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get inputSubject() : StandardTextInput
      {
         return this._881517054inputSubject;
      }
      
      public function set inputSubject(param1:StandardTextInput) : void
      {
         var _loc2_:Object = this._881517054inputSubject;
         if(_loc2_ !== param1)
         {
            this._881517054inputSubject = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"inputSubject",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sendTo() : DropDownList
      {
         return this._905963485sendTo;
      }
      
      public function set sendTo(param1:DropDownList) : void
      {
         var _loc2_:Object = this._905963485sendTo;
         if(_loc2_ !== param1)
         {
            this._905963485sendTo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sendTo",_loc2_,param1));
            }
         }
      }
   }
}

