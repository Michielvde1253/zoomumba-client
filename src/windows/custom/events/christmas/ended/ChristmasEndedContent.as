package windows.custom.events.christmas.ended
{
   import components.image.StandardImage;
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
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderExclamationMarkSkin;
   
   use namespace mx_internal;
   
   public class ChristmasEndedContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1378241396bubble:StandardImage;
      
      private var _1221270899header:WindowHeader;
      
      private var _109204045santa:StandardImage;
      
      private var _2130460664starsLeft:StandardImage;
      
      private var _1614110149starsRight:StandardImage;
      
      private var _3556653text:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ChristmasEndedContent()
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
         bindings = this._ChristmasEndedContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_events_christmas_ended_ChristmasEndedContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ChristmasEndedContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._ChristmasEndedContent_InnerGroup1_c(),this._ChristmasEndedContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ChristmasEndedContent._watcherSetupUtil = param1;
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
      
      private function _ChristmasEndedContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._ChristmasEndedContent_StandardImage1_i(),this._ChristmasEndedContent_StandardText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ChristmasEndedContent_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.verticalCenter = 25;
         _loc1_.right = 30;
         _loc1_.id = "bubble";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bubble = _loc1_;
         BindingManager.executeBindings(this,"bubble",this.bubble);
         return _loc1_;
      }
      
      private function _ChristmasEndedContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.verticalCenter = 25;
         _loc1_.width = 250;
         _loc1_.right = 45;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "text";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text = _loc1_;
         BindingManager.executeBindings(this,"text",this.text);
         return _loc1_;
      }
      
      private function _ChristmasEndedContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._ChristmasEndedContent_WindowHeader1_i(),this._ChristmasEndedContent_StandardImage2_i(),this._ChristmasEndedContent_StandardImage3_i(),this._ChristmasEndedContent_StandardImage4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ChristmasEndedContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 18;
         _loc1_.setStyle("skinClass",WindowHeaderExclamationMarkSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _ChristmasEndedContent_StandardImage2_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.bottom = 30;
         _loc1_.left = 5;
         _loc1_.id = "santa";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.santa = _loc1_;
         BindingManager.executeBindings(this,"santa",this.santa);
         return _loc1_;
      }
      
      private function _ChristmasEndedContent_StandardImage3_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.left = -20;
         _loc1_.bottom = -20;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.id = "starsLeft";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.starsLeft = _loc1_;
         BindingManager.executeBindings(this,"starsLeft",this.starsLeft);
         return _loc1_;
      }
      
      private function _ChristmasEndedContent_StandardImage4_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.right = -20;
         _loc1_.bottom = -20;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.scaleX = -1;
         _loc1_.id = "starsRight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.starsRight = _loc1_;
         BindingManager.executeBindings(this,"starsRight",this.starsRight);
         return _loc1_;
      }
      
      private function _ChristmasEndedContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_20;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get bubble() : StandardImage
      {
         return this._1378241396bubble;
      }
      
      public function set bubble(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1378241396bubble;
         if(_loc2_ !== param1)
         {
            this._1378241396bubble = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubble",_loc2_,param1));
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
      public function get santa() : StandardImage
      {
         return this._109204045santa;
      }
      
      public function set santa(param1:StandardImage) : void
      {
         var _loc2_:Object = this._109204045santa;
         if(_loc2_ !== param1)
         {
            this._109204045santa = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"santa",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get starsLeft() : StandardImage
      {
         return this._2130460664starsLeft;
      }
      
      public function set starsLeft(param1:StandardImage) : void
      {
         var _loc2_:Object = this._2130460664starsLeft;
         if(_loc2_ !== param1)
         {
            this._2130460664starsLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"starsLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get starsRight() : StandardImage
      {
         return this._1614110149starsRight;
      }
      
      public function set starsRight(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1614110149starsRight;
         if(_loc2_ !== param1)
         {
            this._1614110149starsRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"starsRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get text() : StandardText
      {
         return this._3556653text;
      }
      
      public function set text(param1:StandardText) : void
      {
         var _loc2_:Object = this._3556653text;
         if(_loc2_ !== param1)
         {
            this._3556653text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text",_loc2_,param1));
            }
         }
      }
   }
}

