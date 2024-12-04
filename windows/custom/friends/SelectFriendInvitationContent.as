package windows.custom.friends
{
   import buttons.simpleButton.BuyButtonNormalSkin;
   import components.image.BackgroundImage;
   import components.image.CircularDisplayImage;
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
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   use namespace mx_internal;
   
   public class SelectFriendInvitationContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _2988976add1:Button;
      
      private var _2988978add3:Button;
      
      private var _1525575093addFriendImage1:CircularDisplayImage;
      
      private var _1525575095addFriendImage3:CircularDisplayImage;
      
      private var _497130182facebook:Group;
      
      private var _100348227info1:StandardText;
      
      private var _100348229info3:StandardText;
      
      private var _2116847124separator1:BitmapImage;
      
      private var _1537532672soniaPic:BitmapImage;
      
      private var _1716520946speechBubble:BitmapImage;
      
      private var _773784997speechBubbleText:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _2119152573separatorGraphic:*;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SelectFriendInvitationContent()
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
         bindings = this._SelectFriendInvitationContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_friends_SelectFriendInvitationContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SelectFriendInvitationContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._SelectFriendInvitationContent_InnerGroup1_c(),this._SelectFriendInvitationContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SelectFriendInvitationContent._watcherSetupUtil = param1;
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
      
      private function _SelectFriendInvitationContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._SelectFriendInvitationContent_BackgroundImage1_c(),this._SelectFriendInvitationContent_BitmapImage1_i(),this._SelectFriendInvitationContent_StandardText1_i(),this._SelectFriendInvitationContent_Group2_c(),this._SelectFriendInvitationContent_BitmapImage2_i(),this._SelectFriendInvitationContent_Group3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SelectFriendInvitationContent_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 1.5;
         _loc1_.x = -15;
         _loc1_.y = 140;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SelectFriendInvitationContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 150;
         _loc1_.y = 140;
         _loc1_.initialized(this,"speechBubble");
         this.speechBubble = _loc1_;
         BindingManager.executeBindings(this,"speechBubble",this.speechBubble);
         return _loc1_;
      }
      
      private function _SelectFriendInvitationContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 280;
         _loc1_.height = 82;
         _loc1_.x = 225;
         _loc1_.y = 185;
         _loc1_.id = "speechBubbleText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.speechBubbleText = _loc1_;
         BindingManager.executeBindings(this,"speechBubbleText",this.speechBubbleText);
         return _loc1_;
      }
      
      private function _SelectFriendInvitationContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 160;
         _loc1_.height = 220;
         _loc1_.x = 150;
         _loc1_.y = 300;
         _loc1_.mxmlContent = [this._SelectFriendInvitationContent_BackgroundImage2_c(),this._SelectFriendInvitationContent_CircularDisplayImage1_i(),this._SelectFriendInvitationContent_StandardText2_i(),this._SelectFriendInvitationContent_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SelectFriendInvitationContent_BackgroundImage2_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 0.65;
         _loc1_.x = 30;
         _loc1_.y = -15;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SelectFriendInvitationContent_CircularDisplayImage1_i() : CircularDisplayImage
      {
         var _loc1_:CircularDisplayImage = new CircularDisplayImage();
         _loc1_.x = 7;
         _loc1_.y = -38;
         _loc1_.paddingDisplayX = 1;
         _loc1_.paddingDisplayY = -3;
         _loc1_.id = "addFriendImage1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.addFriendImage1 = _loc1_;
         BindingManager.executeBindings(this,"addFriendImage1",this.addFriendImage1);
         return _loc1_;
      }
      
      private function _SelectFriendInvitationContent_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 145;
         _loc1_.maxHeight = 35;
         _loc1_.y = 70;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "info1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.info1 = _loc1_;
         BindingManager.executeBindings(this,"info1",this.info1);
         return _loc1_;
      }
      
      private function _SelectFriendInvitationContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 17;
         _loc1_.y = 117;
         _loc1_.setStyle("skinClass",BuyButtonNormalSkin);
         _loc1_.addEventListener("click",this.__add1_click);
         _loc1_.id = "add1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.add1 = _loc1_;
         BindingManager.executeBindings(this,"add1",this.add1);
         return _loc1_;
      }
      
      public function __add1_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("addZoomumbaFriend",true));
      }
      
      private function _SelectFriendInvitationContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 365;
         _loc1_.y = 303;
         _loc1_.initialized(this,"separator1");
         this.separator1 = _loc1_;
         BindingManager.executeBindings(this,"separator1",this.separator1);
         return _loc1_;
      }
      
      private function _SelectFriendInvitationContent_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 160;
         _loc1_.height = 160;
         _loc1_.x = 430;
         _loc1_.y = 300;
         _loc1_.mxmlContent = [this._SelectFriendInvitationContent_BackgroundImage3_c(),this._SelectFriendInvitationContent_CircularDisplayImage2_i(),this._SelectFriendInvitationContent_StandardText3_i(),this._SelectFriendInvitationContent_Button2_i()];
         _loc1_.id = "facebook";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.facebook = _loc1_;
         BindingManager.executeBindings(this,"facebook",this.facebook);
         return _loc1_;
      }
      
      private function _SelectFriendInvitationContent_BackgroundImage3_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 0.65;
         _loc1_.x = 30;
         _loc1_.y = -15;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SelectFriendInvitationContent_CircularDisplayImage2_i() : CircularDisplayImage
      {
         var _loc1_:CircularDisplayImage = new CircularDisplayImage();
         _loc1_.x = 7;
         _loc1_.y = -38;
         _loc1_.paddingDisplayY = -2;
         _loc1_.id = "addFriendImage3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.addFriendImage3 = _loc1_;
         BindingManager.executeBindings(this,"addFriendImage3",this.addFriendImage3);
         return _loc1_;
      }
      
      private function _SelectFriendInvitationContent_StandardText3_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 145;
         _loc1_.maxHeight = 35;
         _loc1_.y = 70;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "info3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.info3 = _loc1_;
         BindingManager.executeBindings(this,"info3",this.info3);
         return _loc1_;
      }
      
      private function _SelectFriendInvitationContent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 17;
         _loc1_.y = 117;
         _loc1_.setStyle("skinClass",BuyButtonNormalSkin);
         _loc1_.id = "add3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.add3 = _loc1_;
         BindingManager.executeBindings(this,"add3",this.add3);
         return _loc1_;
      }
      
      private function _SelectFriendInvitationContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._SelectFriendInvitationContent_BitmapImage3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SelectFriendInvitationContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 37;
         _loc1_.y = 118;
         _loc1_.initialized(this,"soniaPic");
         this.soniaPic = _loc1_;
         BindingManager.executeBindings(this,"soniaPic",this.soniaPic);
         return _loc1_;
      }
      
      private function _SelectFriendInvitationContent_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"separator1.source","separatorGraphic");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get add1() : Button
      {
         return this._2988976add1;
      }
      
      public function set add1(param1:Button) : void
      {
         var _loc2_:Object = this._2988976add1;
         if(_loc2_ !== param1)
         {
            this._2988976add1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"add1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get add3() : Button
      {
         return this._2988978add3;
      }
      
      public function set add3(param1:Button) : void
      {
         var _loc2_:Object = this._2988978add3;
         if(_loc2_ !== param1)
         {
            this._2988978add3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"add3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get addFriendImage1() : CircularDisplayImage
      {
         return this._1525575093addFriendImage1;
      }
      
      public function set addFriendImage1(param1:CircularDisplayImage) : void
      {
         var _loc2_:Object = this._1525575093addFriendImage1;
         if(_loc2_ !== param1)
         {
            this._1525575093addFriendImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addFriendImage1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get addFriendImage3() : CircularDisplayImage
      {
         return this._1525575095addFriendImage3;
      }
      
      public function set addFriendImage3(param1:CircularDisplayImage) : void
      {
         var _loc2_:Object = this._1525575095addFriendImage3;
         if(_loc2_ !== param1)
         {
            this._1525575095addFriendImage3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addFriendImage3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get facebook() : Group
      {
         return this._497130182facebook;
      }
      
      public function set facebook(param1:Group) : void
      {
         var _loc2_:Object = this._497130182facebook;
         if(_loc2_ !== param1)
         {
            this._497130182facebook = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"facebook",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get info1() : StandardText
      {
         return this._100348227info1;
      }
      
      public function set info1(param1:StandardText) : void
      {
         var _loc2_:Object = this._100348227info1;
         if(_loc2_ !== param1)
         {
            this._100348227info1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"info1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get info3() : StandardText
      {
         return this._100348229info3;
      }
      
      public function set info3(param1:StandardText) : void
      {
         var _loc2_:Object = this._100348229info3;
         if(_loc2_ !== param1)
         {
            this._100348229info3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"info3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get separator1() : BitmapImage
      {
         return this._2116847124separator1;
      }
      
      public function set separator1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2116847124separator1;
         if(_loc2_ !== param1)
         {
            this._2116847124separator1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"separator1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soniaPic() : BitmapImage
      {
         return this._1537532672soniaPic;
      }
      
      public function set soniaPic(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1537532672soniaPic;
         if(_loc2_ !== param1)
         {
            this._1537532672soniaPic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soniaPic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get speechBubble() : BitmapImage
      {
         return this._1716520946speechBubble;
      }
      
      public function set speechBubble(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1716520946speechBubble;
         if(_loc2_ !== param1)
         {
            this._1716520946speechBubble = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"speechBubble",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get speechBubbleText() : StandardText
      {
         return this._773784997speechBubbleText;
      }
      
      public function set speechBubbleText(param1:StandardText) : void
      {
         var _loc2_:Object = this._773784997speechBubbleText;
         if(_loc2_ !== param1)
         {
            this._773784997speechBubbleText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"speechBubbleText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get separatorGraphic() : *
      {
         return this._2119152573separatorGraphic;
      }
      
      public function set separatorGraphic(param1:*) : void
      {
         var _loc2_:Object = this._2119152573separatorGraphic;
         if(_loc2_ !== param1)
         {
            this._2119152573separatorGraphic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"separatorGraphic",_loc2_,param1));
            }
         }
      }
   }
}

