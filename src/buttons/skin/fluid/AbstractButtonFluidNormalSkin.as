package buttons.skin.fluid
{
   import buttons.skin.master.AbstractButtonBrightEffectSkin;
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
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class AbstractButtonFluidNormalSkin extends AbstractButtonBrightEffectSkin implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _2927469_bbl:BitmapImage;
      
      private var _90751678_bbml:BitmapImage;
      
      private var _90751682_bbmp:BitmapImage;
      
      private var _90751684_bbmr:BitmapImage;
      
      private var _2927475_bbr:BitmapImage;
      
      private var _1902209773_bitmapTexture:BitmapFill;
      
      private var _90761292_blmp:BitmapImage;
      
      private var _1481367070_blmrp:BitmapImage;
      
      private var _1481188510_brmlp:BitmapImage;
      
      private var _90767058_brmp:BitmapImage;
      
      private var _2928027_btl:BitmapImage;
      
      private var _90768976_btml:BitmapImage;
      
      private var _90768980_btmp:BitmapImage;
      
      private var _90768982_btmr:BitmapImage;
      
      private var _2928033_btr:BitmapImage;
      
      private var _1476760963_glass:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1417816805texture:Class;
      
      private var _embed_mxml__components_Buttons_swf_BTR_1997597543:Class;
      
      private var _embed_mxml__components_Buttons_swf_BLMP_2004749898:Class;
      
      private var _embed_mxml__components_Buttons_swf_BTL_1997597501:Class;
      
      private var _embed_mxml__components_Buttons_swf_BBML_2004805784:Class;
      
      private var _embed_mxml__components_Buttons_swf_BRMLP_2034919782:Class;
      
      private var _embed_mxml__components_Buttons_swf_BBR_1997597141:Class;
      
      private var _embed_mxml__components_Buttons_swf_BBMP_2004805828:Class;
      
      private var _embed_mxml__components_Buttons_swf_BTML_2004757622:Class;
      
      private var _embed_mxml__components_Buttons_swf_BTMR_2004757616:Class;
      
      private var _embed_mxml__components_Buttons_swf_BLMRP_2035593190:Class;
      
      private var _embed_mxml__components_Buttons_swf_BRMP_2004751604:Class;
      
      private var _embed_mxml__components_Buttons_swf_BBL_1997596971:Class;
      
      private var _embed_mxml__components_Buttons_swf_BBMR_2004805826:Class;
      
      private var _embed_mxml__components_Buttons_swf_BTMP_2004757618:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AbstractButtonFluidNormalSkin()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__components_Buttons_swf_BTR_1997597543 = AbstractButtonFluidNormalSkin__embed_mxml__components_Buttons_swf_BTR_1997597543;
         this._embed_mxml__components_Buttons_swf_BLMP_2004749898 = AbstractButtonFluidNormalSkin__embed_mxml__components_Buttons_swf_BLMP_2004749898;
         this._embed_mxml__components_Buttons_swf_BTL_1997597501 = AbstractButtonFluidNormalSkin__embed_mxml__components_Buttons_swf_BTL_1997597501;
         this._embed_mxml__components_Buttons_swf_BBML_2004805784 = AbstractButtonFluidNormalSkin__embed_mxml__components_Buttons_swf_BBML_2004805784;
         this._embed_mxml__components_Buttons_swf_BRMLP_2034919782 = AbstractButtonFluidNormalSkin__embed_mxml__components_Buttons_swf_BRMLP_2034919782;
         this._embed_mxml__components_Buttons_swf_BBR_1997597141 = AbstractButtonFluidNormalSkin__embed_mxml__components_Buttons_swf_BBR_1997597141;
         this._embed_mxml__components_Buttons_swf_BBMP_2004805828 = AbstractButtonFluidNormalSkin__embed_mxml__components_Buttons_swf_BBMP_2004805828;
         this._embed_mxml__components_Buttons_swf_BTML_2004757622 = AbstractButtonFluidNormalSkin__embed_mxml__components_Buttons_swf_BTML_2004757622;
         this._embed_mxml__components_Buttons_swf_BTMR_2004757616 = AbstractButtonFluidNormalSkin__embed_mxml__components_Buttons_swf_BTMR_2004757616;
         this._embed_mxml__components_Buttons_swf_BLMRP_2035593190 = AbstractButtonFluidNormalSkin__embed_mxml__components_Buttons_swf_BLMRP_2035593190;
         this._embed_mxml__components_Buttons_swf_BRMP_2004751604 = AbstractButtonFluidNormalSkin__embed_mxml__components_Buttons_swf_BRMP_2004751604;
         this._embed_mxml__components_Buttons_swf_BBL_1997596971 = AbstractButtonFluidNormalSkin__embed_mxml__components_Buttons_swf_BBL_1997596971;
         this._embed_mxml__components_Buttons_swf_BBMR_2004805826 = AbstractButtonFluidNormalSkin__embed_mxml__components_Buttons_swf_BBMR_2004805826;
         this._embed_mxml__components_Buttons_swf_BTMP_2004757618 = AbstractButtonFluidNormalSkin__embed_mxml__components_Buttons_swf_BTMP_2004757618;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._AbstractButtonFluidNormalSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_buttons_skin_fluid_AbstractButtonFluidNormalSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AbstractButtonFluidNormalSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 112;
         this.height = 30;
         this.minHeight = 23;
         this.minWidth = 112;
         this.mxmlContent = [this._AbstractButtonFluidNormalSkin_Rect1_c(),this._AbstractButtonFluidNormalSkin_Group1_i()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AbstractButtonFluidNormalSkin._watcherSetupUtil = param1;
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
      
      override protected function init() : void
      {
         hostComponent.buttonMode = true;
         hostComponent.useHandCursor = true;
      }
      
      override protected function dispose() : void
      {
      }
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         if(param1 != param2 && Boolean(hostComponent.enabled) && Boolean(this.texture))
         {
            switch(param2)
            {
               case "down":
                  this._glass.scaleX = -1;
                  this._glass.scaleY = -1;
                  this._bitmapTexture.x = -2;
                  this._bitmapTexture.y = -4;
                  break;
               default:
                  this._glass.scaleX = 1;
                  this._glass.scaleY = 1;
                  this._bitmapTexture.x = 0;
                  this._bitmapTexture.y = 0;
            }
         }
         super.stateChanged(param1,param2,param3);
      }
      
      private function _AbstractButtonFluidNormalSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 4;
         _loc1_.right = 4;
         _loc1_.top = 3;
         _loc1_.bottom = 5;
         _loc1_.radiusX = 8;
         _loc1_.radiusY = 8;
         _loc1_.minHeight = 16;
         _loc1_.minWidth = 16;
         _loc1_.fill = this._AbstractButtonFluidNormalSkin_BitmapFill1_i();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_BitmapFill1_i() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         _loc1_.fillMode = "repeat";
         this._bitmapTexture = _loc1_;
         BindingManager.executeBindings(this,"_bitmapTexture",this._bitmapTexture);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.percentHeight = 100;
         _loc1_.minHeight = 23;
         _loc1_.minWidth = 26;
         _loc1_.mxmlContent = [this._AbstractButtonFluidNormalSkin_BitmapImage1_i(),this._AbstractButtonFluidNormalSkin_BitmapImage2_i(),this._AbstractButtonFluidNormalSkin_BitmapImage3_i(),this._AbstractButtonFluidNormalSkin_BitmapImage4_i(),this._AbstractButtonFluidNormalSkin_BitmapImage5_i(),this._AbstractButtonFluidNormalSkin_BitmapImage6_i(),this._AbstractButtonFluidNormalSkin_BitmapImage7_i(),this._AbstractButtonFluidNormalSkin_BitmapImage8_i(),this._AbstractButtonFluidNormalSkin_BitmapImage9_i(),this._AbstractButtonFluidNormalSkin_BitmapImage10_i(),this._AbstractButtonFluidNormalSkin_BitmapImage11_i(),this._AbstractButtonFluidNormalSkin_BitmapImage12_i(),this._AbstractButtonFluidNormalSkin_BitmapImage13_i(),this._AbstractButtonFluidNormalSkin_BitmapImage14_i()];
         _loc1_.id = "_glass";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._glass = _loc1_;
         BindingManager.executeBindings(this,"_glass",this._glass);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Buttons_swf_BTL_1997597501;
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.initialized(this,"_btl");
         this._btl = _loc1_;
         BindingManager.executeBindings(this,"_btl",this._btl);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Buttons_swf_BBL_1997596971;
         _loc1_.left = 0;
         _loc1_.bottom = 0;
         _loc1_.initialized(this,"_bbl");
         this._bbl = _loc1_;
         BindingManager.executeBindings(this,"_bbl",this._bbl);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Buttons_swf_BLMP_2004749898;
         _loc1_.fillMode = "repeat";
         _loc1_.left = 0;
         _loc1_.initialized(this,"_blmp");
         this._blmp = _loc1_;
         BindingManager.executeBindings(this,"_blmp",this._blmp);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_BitmapImage4_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Buttons_swf_BTR_1997597543;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.initialized(this,"_btr");
         this._btr = _loc1_;
         BindingManager.executeBindings(this,"_btr",this._btr);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_BitmapImage5_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Buttons_swf_BBR_1997597141;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.initialized(this,"_bbr");
         this._bbr = _loc1_;
         BindingManager.executeBindings(this,"_bbr",this._bbr);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_BitmapImage6_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Buttons_swf_BRMP_2004751604;
         _loc1_.fillMode = "repeat";
         _loc1_.right = 0;
         _loc1_.initialized(this,"_brmp");
         this._brmp = _loc1_;
         BindingManager.executeBindings(this,"_brmp",this._brmp);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_BitmapImage7_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Buttons_swf_BTML_2004757622;
         _loc1_.top = 0;
         _loc1_.initialized(this,"_btml");
         this._btml = _loc1_;
         BindingManager.executeBindings(this,"_btml",this._btml);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_BitmapImage8_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Buttons_swf_BTMR_2004757616;
         _loc1_.top = 0;
         _loc1_.initialized(this,"_btmr");
         this._btmr = _loc1_;
         BindingManager.executeBindings(this,"_btmr",this._btmr);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_BitmapImage9_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Buttons_swf_BTMP_2004757618;
         _loc1_.fillMode = "repeat";
         _loc1_.minWidth = 0;
         _loc1_.top = 0;
         _loc1_.initialized(this,"_btmp");
         this._btmp = _loc1_;
         BindingManager.executeBindings(this,"_btmp",this._btmp);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_BitmapImage10_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Buttons_swf_BBML_2004805784;
         _loc1_.bottom = 0;
         _loc1_.initialized(this,"_bbml");
         this._bbml = _loc1_;
         BindingManager.executeBindings(this,"_bbml",this._bbml);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_BitmapImage11_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Buttons_swf_BBMR_2004805826;
         _loc1_.bottom = 0;
         _loc1_.initialized(this,"_bbmr");
         this._bbmr = _loc1_;
         BindingManager.executeBindings(this,"_bbmr",this._bbmr);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_BitmapImage12_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Buttons_swf_BBMP_2004805828;
         _loc1_.fillMode = "repeat";
         _loc1_.minWidth = 0;
         _loc1_.bottom = 0;
         _loc1_.initialized(this,"_bbmp");
         this._bbmp = _loc1_;
         BindingManager.executeBindings(this,"_bbmp",this._bbmp);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_BitmapImage13_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Buttons_swf_BLMRP_2035593190;
         _loc1_.fillMode = "scale";
         _loc1_.minHeight = 0;
         _loc1_.initialized(this,"_blmrp");
         this._blmrp = _loc1_;
         BindingManager.executeBindings(this,"_blmrp",this._blmrp);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_BitmapImage14_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Buttons_swf_BRMLP_2034919782;
         _loc1_.fillMode = "scale";
         _loc1_.minHeight = 0;
         _loc1_.initialized(this,"_brmlp");
         this._brmlp = _loc1_;
         BindingManager.executeBindings(this,"_brmlp",this._brmlp);
         return _loc1_;
      }
      
      private function _AbstractButtonFluidNormalSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_bitmapTexture.source","texture");
         result[1] = new Binding(this,function():Object
         {
            return _btl.height;
         },null,"_blmp.top");
         result[2] = new Binding(this,function():Object
         {
            return _bbl.height;
         },null,"_blmp.bottom");
         result[3] = new Binding(this,function():Object
         {
            return _btl.height;
         },null,"_brmp.top");
         result[4] = new Binding(this,function():Object
         {
            return _bbl.height;
         },null,"_brmp.bottom");
         result[5] = new Binding(this,function():Object
         {
            return _btl.width;
         },null,"_btml.left");
         result[6] = new Binding(this,function():Number
         {
            return Math.min(Math.max(this.width * 0.5 - _btl.width,0),43);
         },null,"_btml.width");
         result[7] = new Binding(this,function():Object
         {
            return _btr.width;
         },null,"_btmr.right");
         result[8] = new Binding(this,function():Number
         {
            return Math.min(Math.max(this.width * 0.5 - _btr.width,0),43);
         },null,"_btmr.width");
         result[9] = new Binding(this,function():Object
         {
            return this.minWidth * 0.5;
         },null,"_btmp.left");
         result[10] = new Binding(this,function():Object
         {
            return this.minWidth * 0.5;
         },null,"_btmp.right");
         result[11] = new Binding(this,function():Object
         {
            return _bbl.width;
         },null,"_bbml.left");
         result[12] = new Binding(this,function():Number
         {
            return Math.min(Math.max(this.width * 0.5 - _bbl.width,0),43);
         },null,"_bbml.width");
         result[13] = new Binding(this,function():Object
         {
            return _bbr.width;
         },null,"_bbmr.right");
         result[14] = new Binding(this,function():Number
         {
            return Math.min(Math.max(this.width * 0.5 - _bbr.width,0),43);
         },null,"_bbmr.width");
         result[15] = new Binding(this,function():Object
         {
            return this.minWidth * 0.5;
         },null,"_bbmp.left");
         result[16] = new Binding(this,function():Object
         {
            return this.minWidth * 0.5;
         },null,"_bbmp.right");
         result[17] = new Binding(this,function():Object
         {
            return _blmp.width;
         },null,"_blmrp.left");
         result[18] = new Binding(this,function():Object
         {
            return this.width * 0.5;
         },null,"_blmrp.right");
         result[19] = new Binding(this,function():Object
         {
            return _btl.height;
         },null,"_blmrp.top");
         result[20] = new Binding(this,function():Object
         {
            return _bbl.height;
         },null,"_blmrp.bottom");
         result[21] = new Binding(this,function():Object
         {
            return this.width * 0.5;
         },null,"_brmlp.left");
         result[22] = new Binding(this,function():Object
         {
            return _brmp.width;
         },null,"_brmlp.right");
         result[23] = new Binding(this,function():Object
         {
            return _btr.height;
         },null,"_brmlp.top");
         result[24] = new Binding(this,function():Object
         {
            return _bbr.height;
         },null,"_brmlp.bottom");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _bbl() : BitmapImage
      {
         return this._2927469_bbl;
      }
      
      public function set _bbl(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2927469_bbl;
         if(_loc2_ !== param1)
         {
            this._2927469_bbl = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bbl",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _bbml() : BitmapImage
      {
         return this._90751678_bbml;
      }
      
      public function set _bbml(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._90751678_bbml;
         if(_loc2_ !== param1)
         {
            this._90751678_bbml = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bbml",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _bbmp() : BitmapImage
      {
         return this._90751682_bbmp;
      }
      
      public function set _bbmp(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._90751682_bbmp;
         if(_loc2_ !== param1)
         {
            this._90751682_bbmp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bbmp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _bbmr() : BitmapImage
      {
         return this._90751684_bbmr;
      }
      
      public function set _bbmr(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._90751684_bbmr;
         if(_loc2_ !== param1)
         {
            this._90751684_bbmr = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bbmr",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _bbr() : BitmapImage
      {
         return this._2927475_bbr;
      }
      
      public function set _bbr(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2927475_bbr;
         if(_loc2_ !== param1)
         {
            this._2927475_bbr = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bbr",_loc2_,param1));
            }
         }
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
      public function get _blmp() : BitmapImage
      {
         return this._90761292_blmp;
      }
      
      public function set _blmp(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._90761292_blmp;
         if(_loc2_ !== param1)
         {
            this._90761292_blmp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_blmp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _blmrp() : BitmapImage
      {
         return this._1481367070_blmrp;
      }
      
      public function set _blmrp(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1481367070_blmrp;
         if(_loc2_ !== param1)
         {
            this._1481367070_blmrp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_blmrp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _brmlp() : BitmapImage
      {
         return this._1481188510_brmlp;
      }
      
      public function set _brmlp(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1481188510_brmlp;
         if(_loc2_ !== param1)
         {
            this._1481188510_brmlp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_brmlp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _brmp() : BitmapImage
      {
         return this._90767058_brmp;
      }
      
      public function set _brmp(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._90767058_brmp;
         if(_loc2_ !== param1)
         {
            this._90767058_brmp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_brmp",_loc2_,param1));
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
      public function get _btml() : BitmapImage
      {
         return this._90768976_btml;
      }
      
      public function set _btml(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._90768976_btml;
         if(_loc2_ !== param1)
         {
            this._90768976_btml = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btml",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btmp() : BitmapImage
      {
         return this._90768980_btmp;
      }
      
      public function set _btmp(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._90768980_btmp;
         if(_loc2_ !== param1)
         {
            this._90768980_btmp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btmp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btmr() : BitmapImage
      {
         return this._90768982_btmr;
      }
      
      public function set _btmr(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._90768982_btmr;
         if(_loc2_ !== param1)
         {
            this._90768982_btmr = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btmr",_loc2_,param1));
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
      public function get texture() : Class
      {
         return this._1417816805texture;
      }
      
      public function set texture(param1:Class) : void
      {
         var _loc2_:Object = this._1417816805texture;
         if(_loc2_ !== param1)
         {
            this._1417816805texture = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"texture",_loc2_,param1));
            }
         }
      }
   }
}

