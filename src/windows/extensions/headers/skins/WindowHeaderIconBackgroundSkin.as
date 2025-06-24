package windows.extensions.headers.skins
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
   import spark.components.supportClasses.Skin;
   import spark.primitives.BitmapImage;
   import utils.Color;
   import windows.extensions.headers.WindowHeader;
   
   use namespace mx_internal;
   
   public class WindowHeaderIconBackgroundSkin extends Skin implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _WindowHeaderIconBackgroundSkin_BackgroundImage1:BackgroundImage;
      
      public var _WindowHeaderIconBackgroundSkin_Group1:Group;
      
      private var _1808401784lineRight:BitmapImage;
      
      private var _110371416title:Text;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Patterns_swf_HPatternLine_1769938539:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:WindowHeader;
      
      public function WindowHeaderIconBackgroundSkin()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Patterns_swf_HPatternLine_1769938539 = WindowHeaderIconBackgroundSkin__embed_mxml__general_Patterns_swf_HPatternLine_1769938539;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._WindowHeaderIconBackgroundSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_extensions_headers_skins_WindowHeaderIconBackgroundSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return WindowHeaderIconBackgroundSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._WindowHeaderIconBackgroundSkin_Group1_i(),this._WindowHeaderIconBackgroundSkin_BackgroundImage1_i(),this._WindowHeaderIconBackgroundSkin_BitmapImage1_i()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         WindowHeaderIconBackgroundSkin._watcherSetupUtil = param1;
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
      
      private function _WindowHeaderIconBackgroundSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.mxmlContent = [this._WindowHeaderIconBackgroundSkin_Text1_i()];
         _loc1_.id = "_WindowHeaderIconBackgroundSkin_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._WindowHeaderIconBackgroundSkin_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_WindowHeaderIconBackgroundSkin_Group1",this._WindowHeaderIconBackgroundSkin_Group1);
         return _loc1_;
      }
      
      private function _WindowHeaderIconBackgroundSkin_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.percentWidth = 83;
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = false;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.bottom = 2;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "title";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.title = _loc1_;
         BindingManager.executeBindings(this,"title",this.title);
         return _loc1_;
      }
      
      private function _WindowHeaderIconBackgroundSkin_BackgroundImage1_i() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.id = "_WindowHeaderIconBackgroundSkin_BackgroundImage1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._WindowHeaderIconBackgroundSkin_BackgroundImage1 = _loc1_;
         BindingManager.executeBindings(this,"_WindowHeaderIconBackgroundSkin_BackgroundImage1",this._WindowHeaderIconBackgroundSkin_BackgroundImage1);
         return _loc1_;
      }
      
      private function _WindowHeaderIconBackgroundSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.right = 5;
         _loc1_.height = 8;
         _loc1_.fillMode = "repeat";
         _loc1_.source = this._embed_mxml__general_Patterns_swf_HPatternLine_1769938539;
         _loc1_.initialized(this,"lineRight");
         this.lineRight = _loc1_;
         BindingManager.executeBindings(this,"lineRight",this.lineRight);
         return _loc1_;
      }
      
      private function _WindowHeaderIconBackgroundSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return WindowHeader.TOP_DISTANCE;
         },null,"_WindowHeaderIconBackgroundSkin_Group1.height");
         result[1] = new Binding(this,function():Object
         {
            return WindowHeader.LEFT_WIDTH + WindowHeader.HORIZONTAL_GAP + WindowHeader.HORIZONTAL_GAP * (hostComponent.skinSize * 0.015);
         },null,"_WindowHeaderIconBackgroundSkin_Group1.left");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.text;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"title.text");
         result[3] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_DARKER;
         },function(param1:uint):void
         {
            title.setStyle("color",param1);
         },"title.color");
         result[4] = new Binding(this,function():Number
         {
            return hostComponent.fontSize;
         },function(param1:Number):void
         {
            title.setStyle("fontSize",param1);
         },"title.fontSize");
         result[5] = new Binding(this,function():Object
         {
            return hostComponent.bgLeft != 0 ? hostComponent.bgLeft : -50;
         },null,"_WindowHeaderIconBackgroundSkin_BackgroundImage1.left");
         result[6] = new Binding(this,function():Object
         {
            return hostComponent.bgTop != 0 ? hostComponent.bgTop : -25;
         },null,"_WindowHeaderIconBackgroundSkin_BackgroundImage1.top");
         result[7] = new Binding(this,function():Number
         {
            return hostComponent.bgScale != 0 ? hostComponent.bgScale : 1 + hostComponent.skinSize * 0.01;
         },null,"_WindowHeaderIconBackgroundSkin_BackgroundImage1.scale");
         result[8] = new Binding(this,function():Object
         {
            return WindowHeader.TOP_DISTANCE;
         },null,"lineRight.top");
         result[9] = new Binding(this,function():Object
         {
            return WindowHeader.LEFT_WIDTH + WindowHeader.HORIZONTAL_GAP + WindowHeader.HORIZONTAL_GAP * (hostComponent.skinSize * 0.015);
         },null,"lineRight.left");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get lineRight() : BitmapImage
      {
         return this._1808401784lineRight;
      }
      
      public function set lineRight(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1808401784lineRight;
         if(_loc2_ !== param1)
         {
            this._1808401784lineRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lineRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get title() : Text
      {
         return this._110371416title;
      }
      
      public function set title(param1:Text) : void
      {
         var _loc2_:Object = this._110371416title;
         if(_loc2_ !== param1)
         {
            this._110371416title = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"title",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : WindowHeader
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:WindowHeader) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}

