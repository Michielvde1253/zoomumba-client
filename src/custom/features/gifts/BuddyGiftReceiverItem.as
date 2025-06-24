package custom.features.gifts
{
   import components.image.BackgroundImage;
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
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class BuddyGiftReceiverItem extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1939974187deselectedState:Group;
      
      private var _1445481142selectedState:Group;
      
      private var _862299902userIdDeselected:Text;
      
      private var _815054738usernameDeselected:Text;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _265713450username:String;
      
      private var _836030938userID:String;
      
      public var _selected:Boolean = false;
      
      private var _embed_mxml__components_ComponentIcons_swf_OK_473544339:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function BuddyGiftReceiverItem()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__components_ComponentIcons_swf_OK_473544339 = BuddyGiftReceiverItem__embed_mxml__components_ComponentIcons_swf_OK_473544339;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._BuddyGiftReceiverItem_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_gifts_BuddyGiftReceiverItemWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return BuddyGiftReceiverItem[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 400;
         this.mouseEnabledWhereTransparent = true;
         this.height = 37;
         this.mxmlContent = [this._BuddyGiftReceiverItem_Group2_c(),this._BuddyGiftReceiverItem_Group3_i(),this._BuddyGiftReceiverItem_Group4_i()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         BuddyGiftReceiverItem._watcherSetupUtil = param1;
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
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = !param1;
         this.toggle();
      }
      
      public function toggle() : void
      {
         if(this._selected)
         {
            this.selectedState.visible = false;
            this.deselectedState.visible = true;
            this._selected = false;
         }
         else
         {
            this.selectedState.visible = true;
            this.deselectedState.visible = false;
            this._selected = true;
         }
      }
      
      private function _BuddyGiftReceiverItem_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.mxmlContent = [this._BuddyGiftReceiverItem_BackgroundImage1_c(),this._BuddyGiftReceiverItem_Text1_i(),this._BuddyGiftReceiverItem_Text2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BuddyGiftReceiverItem_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.x = 5;
         _loc1_.scale = 0.25;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BuddyGiftReceiverItem_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.width = 270;
         _loc1_.x = 40;
         _loc1_.verticalCenter = 2;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("textAlign","left");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("color",3676672);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "usernameDeselected";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.usernameDeselected = _loc1_;
         BindingManager.executeBindings(this,"usernameDeselected",this.usernameDeselected);
         return _loc1_;
      }
      
      private function _BuddyGiftReceiverItem_Text2_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.x = 275;
         _loc1_.width = 120;
         _loc1_.verticalCenter = 0;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("color",3676672);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "userIdDeselected";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userIdDeselected = _loc1_;
         BindingManager.executeBindings(this,"userIdDeselected",this.userIdDeselected);
         return _loc1_;
      }
      
      private function _BuddyGiftReceiverItem_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.visible = false;
         _loc1_.height = 37;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.mxmlContent = [this._BuddyGiftReceiverItem_BitmapImage1_c()];
         _loc1_.id = "selectedState";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.selectedState = _loc1_;
         BindingManager.executeBindings(this,"selectedState",this.selectedState);
         return _loc1_;
      }
      
      private function _BuddyGiftReceiverItem_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 5;
         _loc1_.scaleX = 0.38;
         _loc1_.scaleY = 0.38;
         _loc1_.source = this._embed_mxml__components_ComponentIcons_swf_OK_473544339;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BuddyGiftReceiverItem_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.height = 37;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.id = "deselectedState";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.deselectedState = _loc1_;
         BindingManager.executeBindings(this,"deselectedState",this.deselectedState);
         return _loc1_;
      }
      
      private function _BuddyGiftReceiverItem_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"usernameDeselected.text","username");
         _loc1_[1] = new Binding(this,null,null,"userIdDeselected.text","userID");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get deselectedState() : Group
      {
         return this._1939974187deselectedState;
      }
      
      public function set deselectedState(param1:Group) : void
      {
         var _loc2_:Object = this._1939974187deselectedState;
         if(_loc2_ !== param1)
         {
            this._1939974187deselectedState = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"deselectedState",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectedState() : Group
      {
         return this._1445481142selectedState;
      }
      
      public function set selectedState(param1:Group) : void
      {
         var _loc2_:Object = this._1445481142selectedState;
         if(_loc2_ !== param1)
         {
            this._1445481142selectedState = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedState",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userIdDeselected() : Text
      {
         return this._862299902userIdDeselected;
      }
      
      public function set userIdDeselected(param1:Text) : void
      {
         var _loc2_:Object = this._862299902userIdDeselected;
         if(_loc2_ !== param1)
         {
            this._862299902userIdDeselected = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userIdDeselected",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get usernameDeselected() : Text
      {
         return this._815054738usernameDeselected;
      }
      
      public function set usernameDeselected(param1:Text) : void
      {
         var _loc2_:Object = this._815054738usernameDeselected;
         if(_loc2_ !== param1)
         {
            this._815054738usernameDeselected = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"usernameDeselected",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get username() : String
      {
         return this._265713450username;
      }
      
      public function set username(param1:String) : void
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
      
      [Bindable(event="propertyChange")]
      public function get userID() : String
      {
         return this._836030938userID;
      }
      
      public function set userID(param1:String) : void
      {
         var _loc2_:Object = this._836030938userID;
         if(_loc2_ !== param1)
         {
            this._836030938userID = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userID",_loc2_,param1));
            }
         }
      }
   }
}

