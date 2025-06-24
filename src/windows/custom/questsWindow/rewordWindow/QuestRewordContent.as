package windows.custom.questsWindow.rewordWindow
{
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
   import spark.core.SpriteVisualElement;
   import utils.Color;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.custom.questsWindow.components.RewardItemComponent;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderIconBackgroundSkin;
   
   use namespace mx_internal;
   
   public class QuestRewordContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1221270899header:WindowHeader;
      
      private var _3237038info:Text;
      
      private var _100525950item1:RewardItemComponent;
      
      private var _100525951item2:RewardItemComponent;
      
      private var _100525952item3:RewardItemComponent;
      
      private var _1476672158starHolder:SpriteVisualElement;
      
      private var _1862311355windowLogo:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function QuestRewordContent()
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
         bindings = this._QuestRewordContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_questsWindow_rewordWindow_QuestRewordContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return QuestRewordContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._QuestRewordContent_InnerGroup1_c(),this._QuestRewordContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         QuestRewordContent._watcherSetupUtil = param1;
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
      
      private function _QuestRewordContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._QuestRewordContent_Text1_i(),this._QuestRewordContent_RewardItemComponent1_i(),this._QuestRewordContent_RewardItemComponent2_i(),this._QuestRewordContent_RewardItemComponent3_i(),this._QuestRewordContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _QuestRewordContent_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.mouseEnabled = false;
         _loc1_.top = 100;
         _loc1_.horizontalCenter = 60;
         _loc1_.width = 260;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "info";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.info = _loc1_;
         BindingManager.executeBindings(this,"info",this.info);
         return _loc1_;
      }
      
      private function _QuestRewordContent_RewardItemComponent1_i() : RewardItemComponent
      {
         var _loc1_:RewardItemComponent = new RewardItemComponent();
         _loc1_.id = "item3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.item3 = _loc1_;
         BindingManager.executeBindings(this,"item3",this.item3);
         return _loc1_;
      }
      
      private function _QuestRewordContent_RewardItemComponent2_i() : RewardItemComponent
      {
         var _loc1_:RewardItemComponent = new RewardItemComponent();
         _loc1_.id = "item1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.item1 = _loc1_;
         BindingManager.executeBindings(this,"item1",this.item1);
         return _loc1_;
      }
      
      private function _QuestRewordContent_RewardItemComponent3_i() : RewardItemComponent
      {
         var _loc1_:RewardItemComponent = new RewardItemComponent();
         _loc1_.id = "item2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.item2 = _loc1_;
         BindingManager.executeBindings(this,"item2",this.item2);
         return _loc1_;
      }
      
      private function _QuestRewordContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 18;
         _loc1_.setStyle("skinClass",WindowHeaderIconBackgroundSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _QuestRewordContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._QuestRewordContent_SpriteVisualElement1_i(),this._QuestRewordContent_SpriteVisualElement2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _QuestRewordContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 90;
         _loc1_.y = 85;
         _loc1_.initialized(this,"windowLogo");
         this.windowLogo = _loc1_;
         BindingManager.executeBindings(this,"windowLogo",this.windowLogo);
         return _loc1_;
      }
      
      private function _QuestRewordContent_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"starHolder");
         this.starHolder = _loc1_;
         BindingManager.executeBindings(this,"starHolder",this.starHolder);
         return _loc1_;
      }
      
      private function _QuestRewordContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_BROWN;
         },function(param1:uint):void
         {
            info.setStyle("color",param1);
         },"info.color");
         result[1] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_20;
         },null,"header.skinSize");
         return result;
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
      public function get info() : Text
      {
         return this._3237038info;
      }
      
      public function set info(param1:Text) : void
      {
         var _loc2_:Object = this._3237038info;
         if(_loc2_ !== param1)
         {
            this._3237038info = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"info",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get item1() : RewardItemComponent
      {
         return this._100525950item1;
      }
      
      public function set item1(param1:RewardItemComponent) : void
      {
         var _loc2_:Object = this._100525950item1;
         if(_loc2_ !== param1)
         {
            this._100525950item1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"item1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get item2() : RewardItemComponent
      {
         return this._100525951item2;
      }
      
      public function set item2(param1:RewardItemComponent) : void
      {
         var _loc2_:Object = this._100525951item2;
         if(_loc2_ !== param1)
         {
            this._100525951item2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"item2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get item3() : RewardItemComponent
      {
         return this._100525952item3;
      }
      
      public function set item3(param1:RewardItemComponent) : void
      {
         var _loc2_:Object = this._100525952item3;
         if(_loc2_ !== param1)
         {
            this._100525952item3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"item3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get starHolder() : SpriteVisualElement
      {
         return this._1476672158starHolder;
      }
      
      public function set starHolder(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1476672158starHolder;
         if(_loc2_ !== param1)
         {
            this._1476672158starHolder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"starHolder",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get windowLogo() : SpriteVisualElement
      {
         return this._1862311355windowLogo;
      }
      
      public function set windowLogo(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1862311355windowLogo;
         if(_loc2_ !== param1)
         {
            this._1862311355windowLogo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"windowLogo",_loc2_,param1));
            }
         }
      }
   }
}

