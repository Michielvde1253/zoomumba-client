package windows.custom.friends
{
   import buttons.customButtons.CustomizableCircularButton;
   import components.counter.Counter;
   import components.counter.CounterCircleSkin;
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
   import mx.graphics.GradientEntry;
   import mx.graphics.RadialGradient;
   import mx.styles.*;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   import spark.primitives.Graphic;
   import spark.primitives.Rect;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderInfoMarkSkin;
   
   use namespace mx_internal;
   
   public class FriendInfoContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _FriendInfoContent_BitmapImage1:BitmapImage;
      
      public var _FriendInfoContent_BitmapImage2:BitmapImage;
      
      private var _428651151avatarPic:SpriteVisualElement;
      
      private var _1332194002background:Group;
      
      private var _1245745987deleteButton:CustomizableCircularButton;
      
      private var _1221270899header:WindowHeader;
      
      private var _102865796level:Counter;
      
      private var _2042777063messageButton:CustomizableCircularButton;
      
      private var _836030906userId:StandardText;
      
      private var _1180256607visitZooButton:CustomizableCircularButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _3321844line:*;
      
      private var SpriteClass:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FriendInfoContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.SpriteClass = FriendInfoContent_SpriteClass;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._FriendInfoContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_friends_FriendInfoContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FriendInfoContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._FriendInfoContent_InnerGroup1_c(),this._FriendInfoContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         FriendInfoContent._watcherSetupUtil = param1;
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
      
      private function _FriendInfoContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._FriendInfoContent_Group2_i(),this._FriendInfoContent_SpriteVisualElement1_i(),this._FriendInfoContent_Counter1_i(),this._FriendInfoContent_CustomizableCircularButton1_i(),this._FriendInfoContent_CustomizableCircularButton2_i(),this._FriendInfoContent_CustomizableCircularButton3_i(),this._FriendInfoContent_StandardText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FriendInfoContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 24;
         _loc1_.y = 160;
         _loc1_.mxmlContent = [this._FriendInfoContent_BitmapImage1_i(),this._FriendInfoContent_Graphic1_c(),this._FriendInfoContent_BitmapImage2_i()];
         _loc1_.id = "background";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _FriendInfoContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 400;
         _loc1_.initialized(this,"_FriendInfoContent_BitmapImage1");
         this._FriendInfoContent_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_FriendInfoContent_BitmapImage1",this._FriendInfoContent_BitmapImage1);
         return _loc1_;
      }
      
      private function _FriendInfoContent_Graphic1_c() : Graphic
      {
         var _loc1_:Graphic = new Graphic();
         _loc1_.x = 0;
         _loc1_.y = 3;
         _loc1_.mxmlContent = [this._FriendInfoContent_Rect1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FriendInfoContent_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.height = 103;
         _loc1_.width = 400;
         _loc1_.fill = this._FriendInfoContent_RadialGradient1_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FriendInfoContent_RadialGradient1_c() : RadialGradient
      {
         var _loc1_:RadialGradient = new RadialGradient();
         _loc1_.entries = [this._FriendInfoContent_GradientEntry1_c(),this._FriendInfoContent_GradientEntry2_c(),this._FriendInfoContent_GradientEntry3_c()];
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FriendInfoContent_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 11368244;
         _loc1_.ratio = 1;
         _loc1_.alpha = 0.6;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FriendInfoContent_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 11368244;
         _loc1_.ratio = 1;
         _loc1_.alpha = 0.7;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FriendInfoContent_GradientEntry3_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 11368244;
         _loc1_.ratio = 1;
         _loc1_.alpha = 0.6;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FriendInfoContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 400;
         _loc1_.y = 105;
         _loc1_.initialized(this,"_FriendInfoContent_BitmapImage2");
         this._FriendInfoContent_BitmapImage2 = _loc1_;
         BindingManager.executeBindings(this,"_FriendInfoContent_BitmapImage2",this._FriendInfoContent_BitmapImage2);
         return _loc1_;
      }
      
      private function _FriendInfoContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 326;
         _loc1_.y = 217;
         _loc1_.initialized(this,"avatarPic");
         this.avatarPic = _loc1_;
         BindingManager.executeBindings(this,"avatarPic",this.avatarPic);
         return _loc1_;
      }
      
      private function _FriendInfoContent_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.backgroundScale = 0.38;
         _loc1_.fontSize = 16;
         _loc1_.x = 355;
         _loc1_.y = 132;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "level";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.level = _loc1_;
         BindingManager.executeBindings(this,"level",this.level);
         return _loc1_;
      }
      
      private function _FriendInfoContent_CustomizableCircularButton1_i() : CustomizableCircularButton
      {
         var _loc1_:CustomizableCircularButton = new CustomizableCircularButton();
         _loc1_.x = 58;
         _loc1_.y = 200;
         _loc1_.enabled = true;
         _loc1_.backgroundScale = 0.6;
         _loc1_.addEventListener("click",this.__deleteButton_click);
         _loc1_.id = "deleteButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.deleteButton = _loc1_;
         BindingManager.executeBindings(this,"deleteButton",this.deleteButton);
         return _loc1_;
      }
      
      public function __deleteButton_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("deleteFriend",true));
      }
      
      private function _FriendInfoContent_CustomizableCircularButton2_i() : CustomizableCircularButton
      {
         var _loc1_:CustomizableCircularButton = new CustomizableCircularButton();
         _loc1_.x = 133;
         _loc1_.y = 200;
         _loc1_.enabled = true;
         _loc1_.backgroundScale = 0.6;
         _loc1_.addEventListener("click",this.__messageButton_click);
         _loc1_.id = "messageButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.messageButton = _loc1_;
         BindingManager.executeBindings(this,"messageButton",this.messageButton);
         return _loc1_;
      }
      
      public function __messageButton_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("messageFriend",true));
      }
      
      private function _FriendInfoContent_CustomizableCircularButton3_i() : CustomizableCircularButton
      {
         var _loc1_:CustomizableCircularButton = new CustomizableCircularButton();
         _loc1_.x = 209;
         _loc1_.y = 200;
         _loc1_.enabled = true;
         _loc1_.backgroundScale = 0.6;
         _loc1_.addEventListener("click",this.__visitZooButton_click);
         _loc1_.id = "visitZooButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.visitZooButton = _loc1_;
         BindingManager.executeBindings(this,"visitZooButton",this.visitZooButton);
         return _loc1_;
      }
      
      public function __visitZooButton_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("visitFriend",true));
      }
      
      private function _FriendInfoContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.x = 186;
         _loc1_.y = 96;
         _loc1_.id = "userId";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userId = _loc1_;
         BindingManager.executeBindings(this,"userId",this.userId);
         return _loc1_;
      }
      
      private function _FriendInfoContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._FriendInfoContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FriendInfoContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 14;
         _loc1_.setStyle("skinClass",WindowHeaderInfoMarkSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _FriendInfoContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_FriendInfoContent_BitmapImage1.source","line");
         result[1] = new Binding(this,null,null,"_FriendInfoContent_BitmapImage2.source","line");
         result[2] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_20;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get avatarPic() : SpriteVisualElement
      {
         return this._428651151avatarPic;
      }
      
      public function set avatarPic(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._428651151avatarPic;
         if(_loc2_ !== param1)
         {
            this._428651151avatarPic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"avatarPic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : Group
      {
         return this._1332194002background;
      }
      
      public function set background(param1:Group) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get deleteButton() : CustomizableCircularButton
      {
         return this._1245745987deleteButton;
      }
      
      public function set deleteButton(param1:CustomizableCircularButton) : void
      {
         var _loc2_:Object = this._1245745987deleteButton;
         if(_loc2_ !== param1)
         {
            this._1245745987deleteButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"deleteButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get header() : WindowHeader
      {
         return this._1221270899header;
      }
      
      public function set header(param1:WindowHeader) : void
      {
         var _loc2_:Object = this._1221270899header;
         if(_loc2_ !== param1)
         {
            this._1221270899header = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"header",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get level() : Counter
      {
         return this._102865796level;
      }
      
      public function set level(param1:Counter) : void
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
      public function get messageButton() : CustomizableCircularButton
      {
         return this._2042777063messageButton;
      }
      
      public function set messageButton(param1:CustomizableCircularButton) : void
      {
         var _loc2_:Object = this._2042777063messageButton;
         if(_loc2_ !== param1)
         {
            this._2042777063messageButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageButton",_loc2_,param1));
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
      public function get visitZooButton() : CustomizableCircularButton
      {
         return this._1180256607visitZooButton;
      }
      
      public function set visitZooButton(param1:CustomizableCircularButton) : void
      {
         var _loc2_:Object = this._1180256607visitZooButton;
         if(_loc2_ !== param1)
         {
            this._1180256607visitZooButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"visitZooButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get line() : *
      {
         return this._3321844line;
      }
      
      public function set line(param1:*) : void
      {
         var _loc2_:Object = this._3321844line;
         if(_loc2_ !== param1)
         {
            this._3321844line = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"line",_loc2_,param1));
            }
         }
      }
   }
}

