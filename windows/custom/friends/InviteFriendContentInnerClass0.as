package windows.custom.friends
{
   import buttons.simpleButton.OKButtonSkin;
   import components.textfield.StandardText;
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
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.DataRenderer;
   import spark.components.HGroup;
   
   public class InviteFriendContentInnerClass0 extends DataRenderer
   {
      private var _102865796level:StandardText;
      
      private var _1641788370okButton:Button;
      
      private var _88844982outerDocument:InviteFriendContent;
      
      private var _836030906userId:StandardText;
      
      private var _265713450username:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function InviteFriendContentInnerClass0()
      {
         super();
         this.mxmlContent = [this._InviteFriendContentInnerClass0_HGroup1_c()];
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
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(data == null)
         {
            return;
         }
         this.username.text = data.uName;
         this.level.text = data.uLvl;
         this.userId.text = data.uId;
      }
      
      private function _InviteFriendContentInnerClass0_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._InviteFriendContentInnerClass0_StandardText1_i(),this._InviteFriendContentInnerClass0_StandardText2_i(),this._InviteFriendContentInnerClass0_StandardText3_i(),this._InviteFriendContentInnerClass0_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InviteFriendContentInnerClass0_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 140;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "username";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.username = _loc1_;
         BindingManager.executeBindings(this,"username",this.username);
         return _loc1_;
      }
      
      private function _InviteFriendContentInnerClass0_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 45;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "level";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.level = _loc1_;
         BindingManager.executeBindings(this,"level",this.level);
         return _loc1_;
      }
      
      private function _InviteFriendContentInnerClass0_StandardText3_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 80;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "userId";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userId = _loc1_;
         BindingManager.executeBindings(this,"userId",this.userId);
         return _loc1_;
      }
      
      private function _InviteFriendContentInnerClass0_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.scaleX = 0.5;
         _loc1_.scaleY = 0.5;
         _loc1_.setStyle("skinClass",OKButtonSkin);
         _loc1_.addEventListener("click",this.__okButton_click);
         _loc1_.id = "okButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.okButton = _loc1_;
         BindingManager.executeBindings(this,"okButton",this.okButton);
         return _loc1_;
      }
      
      public function __okButton_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("addUserById",true));
      }
      
      [Bindable(event="propertyChange")]
      public function get level() : StandardText
      {
         return this._102865796level;
      }
      
      public function set level(param1:StandardText) : void
      {
         var _loc2_:Object = this._102865796level;
         if(_loc2_ !== param1)
         {
            this._102865796level = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"level",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get okButton() : Button
      {
         return this._1641788370okButton;
      }
      
      public function set okButton(param1:Button) : void
      {
         var _loc2_:Object = this._1641788370okButton;
         if(_loc2_ !== param1)
         {
            this._1641788370okButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"okButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get outerDocument() : InviteFriendContent
      {
         return this._88844982outerDocument;
      }
      
      public function set outerDocument(param1:InviteFriendContent) : void
      {
         var _loc2_:Object = this._88844982outerDocument;
         if(_loc2_ !== param1)
         {
            this._88844982outerDocument = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outerDocument",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userId() : StandardText
      {
         return this._836030906userId;
      }
      
      public function set userId(param1:StandardText) : void
      {
         var _loc2_:Object = this._836030906userId;
         if(_loc2_ !== param1)
         {
            this._836030906userId = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userId",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get username() : StandardText
      {
         return this._265713450username;
      }
      
      public function set username(param1:StandardText) : void
      {
         var _loc2_:Object = this._265713450username;
         if(_loc2_ !== param1)
         {
            this._265713450username = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"username",_loc2_,param1));
            }
         }
      }
   }
}

