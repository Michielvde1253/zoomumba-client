package windows.custom.adam
{
   import buttons.simpleButton.BuyButtonBigSkin;
   import custom.previews.reward.RewardItemPreview;
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
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderIconBackgroundSkin;
   
   use namespace mx_internal;
   
   public class AdamContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _679068903bitmapImageHeader:BitmapImage;
      
      private var _1271589544buyButton:Button;
      
      private var _1221270899header:WindowHeader;
      
      private var _954925063message:Label;
      
      private var _1513062495rewardContainer1:HGroup;
      
      private var _1513062496rewardContainer2:HGroup;
      
      private var _1513062497rewardContainer3:HGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private const MAX_COLL_AMMOUNT:int = 6;
      
      private var _currentAmmount:int = 0;
      
      private var _rewards:Array;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AdamContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._rewards = [];
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._AdamContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_adam_AdamContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AdamContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._AdamContent_InnerGroup1_c(),this._AdamContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AdamContent._watcherSetupUtil = param1;
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
      
      public function addReward(param1:DisplayObject, param2:String) : RewardItemPreview
      {
         var _loc3_:RewardItemPreview = new RewardItemPreview();
         var _loc4_:HGroup = this["rewardContainer" + (int(this._currentAmmount / this.MAX_COLL_AMMOUNT) + 1)];
         _loc3_.addContent(param1);
         _loc3_.text = param2;
         _loc4_.addElement(_loc3_);
         this._rewards.push(_loc3_);
         ++this._currentAmmount;
         return _loc3_;
      }
      
      public function dispose() : void
      {
         var _loc1_:RewardItemPreview = null;
         var _loc2_:RewardItemPreview = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         for each(_loc2_ in this._rewards)
         {
            _loc2_.clean();
         }
         _loc3_ = int(this._currentAmmount / this.MAX_COLL_AMMOUNT) + 1;
         _loc4_ = 1;
         while(_loc4_ < _loc3_)
         {
            (this["rewardContainer" + _loc4_] as Group).removeAllElements();
            _loc4_++;
         }
      }
      
      private function _AdamContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._AdamContent_Group2_c(),this._AdamContent_VGroup1_c(),this._AdamContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdamContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 220;
         _loc1_.top = 125;
         _loc1_.mxmlContent = [this._AdamContent_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdamContent_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus facilisis lacinia ultrices. Ut tincidunt dapibus felis, non consectetur neque mattis.";
         _loc1_.width = 400;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("color",3611397);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "message";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.message = _loc1_;
         BindingManager.executeBindings(this,"message",this.message);
         return _loc1_;
      }
      
      private function _AdamContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.top = 210;
         _loc1_.bottom = 80;
         _loc1_.left = 63;
         _loc1_.right = 50;
         _loc1_.gap = 20;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._AdamContent_HGroup1_i(),this._AdamContent_HGroup2_i(),this._AdamContent_HGroup3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdamContent_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 12;
         _loc1_.id = "rewardContainer1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rewardContainer1 = _loc1_;
         BindingManager.executeBindings(this,"rewardContainer1",this.rewardContainer1);
         return _loc1_;
      }
      
      private function _AdamContent_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 12;
         _loc1_.id = "rewardContainer2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rewardContainer2 = _loc1_;
         BindingManager.executeBindings(this,"rewardContainer2",this.rewardContainer2);
         return _loc1_;
      }
      
      private function _AdamContent_HGroup3_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 12;
         _loc1_.id = "rewardContainer3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rewardContainer3 = _loc1_;
         BindingManager.executeBindings(this,"rewardContainer3",this.rewardContainer3);
         return _loc1_;
      }
      
      private function _AdamContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.text = "Schwarzer panther Paket";
         _loc1_.fontSize = 22;
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
      
      private function _AdamContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._AdamContent_BitmapImage1_i(),this._AdamContent_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdamContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"bitmapImageHeader");
         this.bitmapImageHeader = _loc1_;
         BindingManager.executeBindings(this,"bitmapImageHeader",this.bitmapImageHeader);
         return _loc1_;
      }
      
      private function _AdamContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = 27;
         _loc1_.setStyle("skinClass",BuyButtonBigSkin);
         _loc1_.id = "buyButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buyButton = _loc1_;
         BindingManager.executeBindings(this,"buyButton",this.buyButton);
         return _loc1_;
      }
      
      private function _AdamContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_50;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapImageHeader() : BitmapImage
      {
         return this._679068903bitmapImageHeader;
      }
      
      public function set bitmapImageHeader(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._679068903bitmapImageHeader;
         if(_loc2_ !== param1)
         {
            this._679068903bitmapImageHeader = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapImageHeader",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buyButton() : Button
      {
         return this._1271589544buyButton;
      }
      
      public function set buyButton(param1:Button) : void
      {
         var _loc2_:Object = this._1271589544buyButton;
         if(_loc2_ !== param1)
         {
            this._1271589544buyButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buyButton",_loc2_,param1));
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
      public function get message() : Label
      {
         return this._954925063message;
      }
      
      public function set message(param1:Label) : void
      {
         var _loc2_:Object = this._954925063message;
         if(_loc2_ !== param1)
         {
            this._954925063message = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"message",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewardContainer1() : HGroup
      {
         return this._1513062495rewardContainer1;
      }
      
      public function set rewardContainer1(param1:HGroup) : void
      {
         var _loc2_:Object = this._1513062495rewardContainer1;
         if(_loc2_ !== param1)
         {
            this._1513062495rewardContainer1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewardContainer1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewardContainer2() : HGroup
      {
         return this._1513062496rewardContainer2;
      }
      
      public function set rewardContainer2(param1:HGroup) : void
      {
         var _loc2_:Object = this._1513062496rewardContainer2;
         if(_loc2_ !== param1)
         {
            this._1513062496rewardContainer2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewardContainer2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewardContainer3() : HGroup
      {
         return this._1513062497rewardContainer3;
      }
      
      public function set rewardContainer3(param1:HGroup) : void
      {
         var _loc2_:Object = this._1513062497rewardContainer3;
         if(_loc2_ !== param1)
         {
            this._1513062497rewardContainer3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewardContainer3",_loc2_,param1));
            }
         }
      }
   }
}

