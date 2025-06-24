package custom.mainMenu
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
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.BitmapFill;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Path;
   
   use namespace mx_internal;
   
   public class MainMenu extends HGroup implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1902209773_bitmapTexture:BitmapFill;
      
      private var _2927810_bml:BitmapImage;
      
      private var _2927816_bmr:BitmapImage;
      
      private var _2928027_btl:BitmapImage;
      
      private var _2928033_btr:BitmapImage;
      
      private var _1476760963_glass:Group;
      
      private var _201073350bgGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Patterns_swf_PatternNormal_213163820:Class;
      
      private var _embed_mxml__components_Buttons_swf_MMBGM_1928395311:Class;
      
      private var _embed_mxml__components_Buttons_swf_MMBGL_1928395296:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function MainMenu()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Patterns_swf_PatternNormal_213163820 = MainMenu__embed_mxml__general_Patterns_swf_PatternNormal_213163820;
         this._embed_mxml__components_Buttons_swf_MMBGM_1928395311 = MainMenu__embed_mxml__components_Buttons_swf_MMBGM_1928395311;
         this._embed_mxml__components_Buttons_swf_MMBGL_1928395296 = MainMenu__embed_mxml__components_Buttons_swf_MMBGL_1928395296;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._MainMenu_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_mainMenu_MainMenuWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return MainMenu[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._MainMenu_Group1_i()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         MainMenu._watcherSetupUtil = param1;
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
      
      private function _MainMenu_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 486;
         _loc1_.height = 59;
         _loc1_.x = -30;
         _loc1_.includeInLayout = false;
         _loc1_.mxmlContent = [this._MainMenu_Path1_c(),this._MainMenu_Group2_i()];
         _loc1_.id = "bgGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bgGroup = _loc1_;
         BindingManager.executeBindings(this,"bgGroup",this.bgGroup);
         return _loc1_;
      }
      
      private function _MainMenu_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.y = -172.45;
         _loc1_.left = 0;
         _loc1_.top = 3;
         _loc1_.data = "M470.4 172.45 477.4 177.45 482.4 198.45 486.4 228.45 0 228.45 4 198.45 9 177.45 16 172.45 470.4 172.45";
         _loc1_.fill = this._MainMenu_BitmapFill1_i();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MainMenu_BitmapFill1_i() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         _loc1_.fillMode = "repeat";
         _loc1_.source = this._embed_mxml__general_Patterns_swf_PatternNormal_213163820;
         this._bitmapTexture = _loc1_;
         BindingManager.executeBindings(this,"_bitmapTexture",this._bitmapTexture);
         return _loc1_;
      }
      
      private function _MainMenu_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.minWidth = 26;
         _loc1_.minHeight = 23;
         _loc1_.mxmlContent = [this._MainMenu_BitmapImage1_i(),this._MainMenu_BitmapImage2_i(),this._MainMenu_BitmapImage3_i(),this._MainMenu_BitmapImage4_i()];
         _loc1_.id = "_glass";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._glass = _loc1_;
         BindingManager.executeBindings(this,"_glass",this._glass);
         return _loc1_;
      }
      
      private function _MainMenu_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.source = this._embed_mxml__components_Buttons_swf_MMBGL_1928395296;
         _loc1_.initialized(this,"_btl");
         this._btl = _loc1_;
         BindingManager.executeBindings(this,"_btl",this._btl);
         return _loc1_;
      }
      
      private function _MainMenu_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.top = 0;
         _loc1_.fillMode = "scale";
         _loc1_.smooth = true;
         _loc1_.source = this._embed_mxml__components_Buttons_swf_MMBGM_1928395311;
         _loc1_.initialized(this,"_bml");
         this._bml = _loc1_;
         BindingManager.executeBindings(this,"_bml",this._bml);
         return _loc1_;
      }
      
      private function _MainMenu_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.scaleX = -1;
         _loc1_.source = this._embed_mxml__components_Buttons_swf_MMBGL_1928395296;
         _loc1_.initialized(this,"_btr");
         this._btr = _loc1_;
         BindingManager.executeBindings(this,"_btr",this._btr);
         return _loc1_;
      }
      
      private function _MainMenu_BitmapImage4_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.top = 0;
         _loc1_.scaleX = -1;
         _loc1_.smooth = true;
         _loc1_.source = this._embed_mxml__components_Buttons_swf_MMBGM_1928395311;
         _loc1_.initialized(this,"_bmr");
         this._bmr = _loc1_;
         BindingManager.executeBindings(this,"_bmr",this._bmr);
         return _loc1_;
      }
      
      private function _MainMenu_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return _btl.width;
         },null,"_bml.left");
         result[1] = new Binding(this,function():Object
         {
            return bgGroup.width / 2;
         },null,"_bml.right");
         result[2] = new Binding(this,function():Object
         {
            return bgGroup.width / 2;
         },null,"_bmr.left");
         result[3] = new Binding(this,function():Object
         {
            return _btr.width;
         },null,"_bmr.right");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _bitmapTexture() : BitmapFill
      {
         return this._1902209773_bitmapTexture;
      }
      
      public function set _bitmapTexture(param1:BitmapFill) : void
      {
         var _loc2_:Object = this._1902209773_bitmapTexture;
         if(_loc2_ !== param1)
         {
            this._1902209773_bitmapTexture = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bitmapTexture",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _bml() : BitmapImage
      {
         return this._2927810_bml;
      }
      
      public function set _bml(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2927810_bml;
         if(_loc2_ !== param1)
         {
            this._2927810_bml = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bml",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _bmr() : BitmapImage
      {
         return this._2927816_bmr;
      }
      
      public function set _bmr(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2927816_bmr;
         if(_loc2_ !== param1)
         {
            this._2927816_bmr = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bmr",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btl() : BitmapImage
      {
         return this._2928027_btl;
      }
      
      public function set _btl(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2928027_btl;
         if(_loc2_ !== param1)
         {
            this._2928027_btl = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btl",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btr() : BitmapImage
      {
         return this._2928033_btr;
      }
      
      public function set _btr(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2928033_btr;
         if(_loc2_ !== param1)
         {
            this._2928033_btr = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btr",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _glass() : Group
      {
         return this._1476760963_glass;
      }
      
      public function set _glass(param1:Group) : void
      {
         var _loc2_:Object = this._1476760963_glass;
         if(_loc2_ !== param1)
         {
            this._1476760963_glass = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_glass",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgGroup() : Group
      {
         return this._201073350bgGroup;
      }
      
      public function set bgGroup(param1:Group) : void
      {
         var _loc2_:Object = this._201073350bgGroup;
         if(_loc2_ !== param1)
         {
            this._201073350bgGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgGroup",_loc2_,param1));
            }
         }
      }
   }
}

