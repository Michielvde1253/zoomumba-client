package windows.custom.friends
{
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
   import mx.styles.*;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderInfoMarkSkin;
   
   use namespace mx_internal;
   
   public class DeleteFriendContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _428651151avatarPic:SpriteVisualElement;
      
      private var _1221270899header:WindowHeader;
      
      private var _102865796level:Counter;
      
      private var _1165870106question:StandardText;
      
      private var _836030906userId:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _3321844line:*;
      
      private var SpriteClass:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function DeleteFriendContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.SpriteClass = DeleteFriendContent_SpriteClass;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._DeleteFriendContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_friends_DeleteFriendContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DeleteFriendContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._DeleteFriendContent_InnerGroup1_c(),this._DeleteFriendContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         DeleteFriendContent._watcherSetupUtil = param1;
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
      
      private function _DeleteFriendContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._DeleteFriendContent_SpriteVisualElement1_i(),this._DeleteFriendContent_Counter1_i(),this._DeleteFriendContent_StandardText1_i(),this._DeleteFriendContent_StandardText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DeleteFriendContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 326;
         _loc1_.y = 217;
         _loc1_.initialized(this,"avatarPic");
         this.avatarPic = _loc1_;
         BindingManager.executeBindings(this,"avatarPic",this.avatarPic);
         return _loc1_;
      }
      
      private function _DeleteFriendContent_Counter1_i() : Counter
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
      
      private function _DeleteFriendContent_StandardText1_i() : StandardText
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
      
      private function _DeleteFriendContent_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.x = 51;
         _loc1_.y = 141;
         _loc1_.width = 180;
         _loc1_.id = "question";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.question = _loc1_;
         BindingManager.executeBindings(this,"question",this.question);
         return _loc1_;
      }
      
      private function _DeleteFriendContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._DeleteFriendContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DeleteFriendContent_WindowHeader1_i() : WindowHeader
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
      
      private function _DeleteFriendContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
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
      public function get question() : StandardText
      {
         return this._1165870106question;
      }
      
      public function set question(param1:StandardText) : void
      {
         var _loc2_:Object = this._1165870106question;
         if(_loc2_ !== param1)
         {
            this._1165870106question = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"question",_loc2_,param1));
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

