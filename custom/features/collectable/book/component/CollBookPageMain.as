package custom.features.collectable.book.component
{
   import components.textfield.gradientText.GradientText;
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
   import mx.graphics.SolidColor;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.VGroup;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class CollBookPageMain extends Group implements IBindingClient
   {
      public static var _1636177682$lineVMainSource:*;
      
      public static var _1023692932$lineHMainSource:*;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      public var _CollBookPageMain_BitmapImage1:BitmapImage;
      
      public var _CollBookPageMain_BitmapImage2:BitmapImage;
      
      public var _CollBookPageMain_BitmapImage3:BitmapImage;
      
      public var _CollBookPageMain_BitmapImage4:BitmapImage;
      
      public var _CollBookPageMain_GradientText1:GradientText;
      
      public var _CollBookPageMain_GradientText2:GradientText;
      
      public var _CollBookPageMain_Text1:Text;
      
      private var _410956671container:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _110371416title:String = "";
      
      private var _3556653text:String = "";
      
      private var _3357525more:String = "";
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CollBookPageMain()
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
         bindings = this._CollBookPageMain_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_collectable_book_component_CollBookPageMainWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CollBookPageMain[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 207;
         this.height = 86;
         this.mxmlContent = [this._CollBookPageMain_Rect1_c(),this._CollBookPageMain_VGroup1_c(),this._CollBookPageMain_SpriteVisualElement1_i(),this._CollBookPageMain_BitmapImage1_i(),this._CollBookPageMain_BitmapImage2_i(),this._CollBookPageMain_BitmapImage3_i(),this._CollBookPageMain_BitmapImage4_i()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CollBookPageMain._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public static function get $lineVMainSource() : *
      {
         return CollBookPageMain._1636177682$lineVMainSource;
      }
      
      public static function set $lineVMainSource(param1:*) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = CollBookPageMain._1636177682$lineVMainSource;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(CollBookPageMain,"$lineVMainSource",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get $lineHMainSource() : *
      {
         return CollBookPageMain._1023692932$lineHMainSource;
      }
      
      public static function set $lineHMainSource(param1:*) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = CollBookPageMain._1023692932$lineHMainSource;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(CollBookPageMain,"$lineHMainSource",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      public static function get staticEventDispatcher() : IEventDispatcher
      {
         return _staticBindingEventDispatcher;
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
      
      private function _CollBookPageMain_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._CollBookPageMain_SolidColor1_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollBookPageMain_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 13689211;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollBookPageMain_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 70;
         _loc1_.y = 10;
         _loc1_.width = 126;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._CollBookPageMain_GradientText1_i(),this._CollBookPageMain_Text1_i(),this._CollBookPageMain_GradientText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollBookPageMain_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 12;
         _loc1_.percentWidth = 100;
         _loc1_.align = "LB";
         _loc1_.id = "_CollBookPageMain_GradientText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollBookPageMain_GradientText1 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageMain_GradientText1",this._CollBookPageMain_GradientText1);
         return _loc1_;
      }
      
      private function _CollBookPageMain_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.width = 126;
         _loc1_.height = 27;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("paddingTop",-5);
         _loc1_.setStyle("paddingBottom",-5);
         _loc1_.setStyle("fontSize",9);
         _loc1_.setStyle("leading",-2);
         _loc1_.setStyle("fontGridFitType","none");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_CollBookPageMain_Text1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollBookPageMain_Text1 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageMain_Text1",this._CollBookPageMain_Text1);
         return _loc1_;
      }
      
      private function _CollBookPageMain_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 9;
         _loc1_.percentWidth = 100;
         _loc1_.align = "LT";
         _loc1_.buttonMode = true;
         _loc1_.mouseEnabled = true;
         _loc1_.useHandCursor = true;
         _loc1_.addEventListener("click",this.___CollBookPageMain_GradientText2_click);
         _loc1_.id = "_CollBookPageMain_GradientText2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollBookPageMain_GradientText2 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageMain_GradientText2",this._CollBookPageMain_GradientText2);
         return _loc1_;
      }
      
      public function ___CollBookPageMain_GradientText2_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("moreCliked"));
      }
      
      private function _CollBookPageMain_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 35;
         _loc1_.y = 43;
         _loc1_.initialized(this,"container");
         this.container = _loc1_;
         BindingManager.executeBindings(this,"container",this.container);
         return _loc1_;
      }
      
      private function _CollBookPageMain_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.initialized(this,"_CollBookPageMain_BitmapImage1");
         this._CollBookPageMain_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageMain_BitmapImage1",this._CollBookPageMain_BitmapImage1);
         return _loc1_;
      }
      
      private function _CollBookPageMain_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.right = 0;
         _loc1_.initialized(this,"_CollBookPageMain_BitmapImage2");
         this._CollBookPageMain_BitmapImage2 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageMain_BitmapImage2",this._CollBookPageMain_BitmapImage2);
         return _loc1_;
      }
      
      private function _CollBookPageMain_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.top = 0;
         _loc1_.initialized(this,"_CollBookPageMain_BitmapImage3");
         this._CollBookPageMain_BitmapImage3 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageMain_BitmapImage3",this._CollBookPageMain_BitmapImage3);
         return _loc1_;
      }
      
      private function _CollBookPageMain_BitmapImage4_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.bottom = 0;
         _loc1_.initialized(this,"_CollBookPageMain_BitmapImage4");
         this._CollBookPageMain_BitmapImage4 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageMain_BitmapImage4",this._CollBookPageMain_BitmapImage4);
         return _loc1_;
      }
      
      private function _CollBookPageMain_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_CollBookPageMain_GradientText1.text","title");
         result[1] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_BROWN;
         },function(param1:uint):void
         {
            _CollBookPageMain_Text1.setStyle("color",param1);
         },"_CollBookPageMain_Text1.color");
         result[2] = new Binding(this,null,null,"_CollBookPageMain_Text1.text","text");
         result[3] = new Binding(this,null,null,"_CollBookPageMain_GradientText2.text","more");
         result[4] = new Binding(this,function():Object
         {
            return $lineVMainSource;
         },null,"_CollBookPageMain_BitmapImage1.source");
         result[5] = new Binding(this,function():Object
         {
            return $lineVMainSource;
         },null,"_CollBookPageMain_BitmapImage2.source");
         result[6] = new Binding(this,function():Object
         {
            return $lineHMainSource;
         },null,"_CollBookPageMain_BitmapImage3.source");
         result[7] = new Binding(this,function():Object
         {
            return $lineHMainSource;
         },null,"_CollBookPageMain_BitmapImage4.source");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get container() : SpriteVisualElement
      {
         return this._410956671container;
      }
      
      public function set container(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._410956671container;
         if(_loc2_ !== param1)
         {
            this._410956671container = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"container",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get title() : String
      {
         return this._110371416title;
      }
      
      public function set title(param1:String) : void
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
      public function get text() : String
      {
         return this._3556653text;
      }
      
      public function set text(param1:String) : void
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
      
      [Bindable(event="propertyChange")]
      public function get more() : String
      {
         return this._3357525more;
      }
      
      public function set more(param1:String) : void
      {
         var _loc2_:Object = this._3357525more;
         if(_loc2_ !== param1)
         {
            this._3357525more = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"more",_loc2_,param1));
            }
         }
      }
   }
}

