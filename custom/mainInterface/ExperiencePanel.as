package custom.mainInterface
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
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.BitmapFill;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.styles.*;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class ExperiencePanel extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _ExperiencePanel_BitmapImage1:BitmapImage;
      
      public var _ExperiencePanel_GradientText1:GradientText;
      
      public var _ExperiencePanel_GradientText2:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _3832xp:String = "";
      
      private var _102865796level:String = "";
      
      private var _678927291percent:Number = 0;
      
      private var _embed_mxml__custom_HUD_swf_XPForeground_57799402:Class;
      
      private var _embed_mxml__general_Patterns_swf_PatternNormal_213163820:Class;
      
      private var _embed_mxml__custom_HUD_swf_ProgressBar_1735862715:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ExperiencePanel()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__custom_HUD_swf_XPForeground_57799402 = ExperiencePanel__embed_mxml__custom_HUD_swf_XPForeground_57799402;
         this._embed_mxml__general_Patterns_swf_PatternNormal_213163820 = ExperiencePanel__embed_mxml__general_Patterns_swf_PatternNormal_213163820;
         this._embed_mxml__custom_HUD_swf_ProgressBar_1735862715 = ExperiencePanel__embed_mxml__custom_HUD_swf_ProgressBar_1735862715;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._ExperiencePanel_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_mainInterface_ExperiencePanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ExperiencePanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mouseEnabled = true;
         this.mouseChildren = false;
         this.buttonMode = true;
         this.useHandCursor = true;
         this.cacheAsBitmap = true;
         this.mxmlContent = [this._ExperiencePanel_Group2_c(),this._ExperiencePanel_Group6_i()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ExperiencePanel._watcherSetupUtil = param1;
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
      
      private function _ExperiencePanel_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.maxWidth = 176;
         _loc1_.mxmlContent = [this._ExperiencePanel_Path1_c(),this._ExperiencePanel_Group3_c(),this._ExperiencePanel_Image1_c(),this._ExperiencePanel_GradientText1_i(),this._ExperiencePanel_GradientText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ExperiencePanel_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.data = "M122.7 0.05 133.7 6.95 144 0 148.65 12.1 160.45 12.6 157.6 25.45 166.35 33.15 157.6 41.6 159.7 52.45 148.15 53.5 143.75 65.45 133.45 58.85 121.65 64.4 117.05 52.6 103.75 54.65 104.25 50.8 11.25 50.8Q7 50.8 5.3 50.35L5.35 50.35Q2.6 49.55 1 46.85     -0.6 44.15 0.3 38.65 1.15 33.3 3.85 28.6 7 23.15 10.05 19.65 14.4 14.7 17.7 14.75L66 14.8 66 14.65 105.5 14.7 104.4 10.75 117.05 12 122.7 0.05";
         _loc1_.fill = this._ExperiencePanel_BitmapFill1_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ExperiencePanel_BitmapFill1_c() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         _loc1_.source = this._embed_mxml__general_Patterns_swf_PatternNormal_213163820;
         _loc1_.fillMode = "repeat";
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ExperiencePanel_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 14;
         _loc1_.y = 23;
         _loc1_.mxmlContent = [this._ExperiencePanel_Rect1_c(),this._ExperiencePanel_Group4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ExperiencePanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 94;
         _loc1_.height = 18;
         _loc1_.radiusX = 14;
         _loc1_.radiusY = 14;
         _loc1_.fill = this._ExperiencePanel_SolidColor1_c();
         _loc1_.stroke = this._ExperiencePanel_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ExperiencePanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4597760;
         _loc1_.alpha = 1;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ExperiencePanel_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 1;
         _loc1_.pixelHinting = true;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ExperiencePanel_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.maskType = "clip";
         _loc1_.mask = this._ExperiencePanel_Group5_c();
         _loc1_.mxmlContent = [this._ExperiencePanel_BitmapImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ExperiencePanel_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ExperiencePanel_Rect2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ExperiencePanel_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.x = 2;
         _loc1_.width = 94;
         _loc1_.height = 18;
         _loc1_.radiusX = 14;
         _loc1_.radiusY = 14;
         _loc1_.fill = this._ExperiencePanel_SolidColor2_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ExperiencePanel_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4597760;
         _loc1_.alpha = 1;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ExperiencePanel_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.y = 2;
         _loc1_.height = 15;
         _loc1_.width = 90;
         _loc1_.source = this._embed_mxml__custom_HUD_swf_ProgressBar_1735862715;
         _loc1_.initialized(this,"_ExperiencePanel_BitmapImage1");
         this._ExperiencePanel_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_ExperiencePanel_BitmapImage1",this._ExperiencePanel_BitmapImage1);
         return _loc1_;
      }
      
      private function _ExperiencePanel_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__custom_HUD_swf_XPForeground_57799402;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ExperiencePanel_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.width = 130;
         _loc1_.fontSize = 11;
         _loc1_.left = -4;
         _loc1_.verticalCenter = -1;
         _loc1_.id = "_ExperiencePanel_GradientText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ExperiencePanel_GradientText1 = _loc1_;
         BindingManager.executeBindings(this,"_ExperiencePanel_GradientText1",this._ExperiencePanel_GradientText1);
         return _loc1_;
      }
      
      private function _ExperiencePanel_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.width = 80;
         _loc1_.fontSize = 30;
         _loc1_.right = -5;
         _loc1_.verticalCenter = -2;
         _loc1_.id = "_ExperiencePanel_GradientText2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ExperiencePanel_GradientText2 = _loc1_;
         BindingManager.executeBindings(this,"_ExperiencePanel_GradientText2",this._ExperiencePanel_GradientText2);
         return _loc1_;
      }
      
      private function _ExperiencePanel_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ExperiencePanel_Path2_c()];
         _loc1_.id = "hitArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         hitArea = _loc1_;
         BindingManager.executeBindings(this,"hitArea",hitArea);
         return _loc1_;
      }
      
      private function _ExperiencePanel_Path2_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.x = 3;
         _loc1_.y = -169;
         _loc1_.scaleX = 1.01;
         _loc1_.scaleY = 1.01;
         _loc1_.data = "M172.9 183.3 170.55 194 177.85 200.4 170.55 207.4 172.25 216.35 162.65 217.2 159 227.15 150.5 221.75 140.65 226.35 136.8 216.35 126.6 215.5 129.5 208.3 3.1 208.3Q1.7 208.15 0.8 206.8 -1.15 203.85 1.6 197.2 4.4 190.4 8.5 188.35 8.65 188.25 8.85     188.15 10.5 187.45 13.2 187.45L127.95 187.45 127.2 183.5 136.75 182.85 141.45 172.8 150.7 178.6 159.25 172.85 163.05 182.85 172.9 183.3";
         _loc1_.fill = this._ExperiencePanel_SolidColor3_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ExperiencePanel_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711680;
         _loc1_.alpha = 0;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ExperiencePanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return -88 + percent * 90;
         },null,"_ExperiencePanel_BitmapImage1.x");
         result[1] = new Binding(this,null,null,"_ExperiencePanel_GradientText1.text","xp");
         result[2] = new Binding(this,null,null,"_ExperiencePanel_GradientText2.text","level");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get xp() : String
      {
         return this._3832xp;
      }
      
      public function set xp(param1:String) : void
      {
         var _loc2_:Object = this._3832xp;
         if(_loc2_ !== param1)
         {
            this._3832xp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get level() : String
      {
         return this._102865796level;
      }
      
      public function set level(param1:String) : void
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
      public function get percent() : Number
      {
         return this._678927291percent;
      }
      
      public function set percent(param1:Number) : void
      {
         var _loc2_:Object = this._678927291percent;
         if(_loc2_ !== param1)
         {
            this._678927291percent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"percent",_loc2_,param1));
            }
         }
      }
   }
}

