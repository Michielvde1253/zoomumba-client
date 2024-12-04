package custom.info.component
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
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.HGroup;
   import spark.filters.ShaderFilter;
   
   public class InfoDisplayExoticness extends HGroup
   {
      private var _892484221star_0:Image;
      
      private var _892484220star_1:Image;
      
      private var _892484219star_2:Image;
      
      private var _892484218star_3:Image;
      
      private var _892484217star_4:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private const MAX_STARS:int = 5;
      
      private var _created:Boolean = false;
      
      private var _stars:int = 0;
      
      private var MyShaderClass:Class = InfoDisplayExoticness_MyShaderClass;
      
      private var shaderFilter:ShaderFilter;
      
      private var _embed_mxml__general_Decorations_swf_Solitaire_735508405:Class = InfoDisplayExoticness__embed_mxml__general_Decorations_swf_Solitaire_735508405;
      
      public function InfoDisplayExoticness()
      {
         super();
         this.gap = 2;
         this.mxmlContent = [this._InfoDisplayExoticness_Image1_i(),this._InfoDisplayExoticness_Image2_i(),this._InfoDisplayExoticness_Image3_i(),this._InfoDisplayExoticness_Image4_i(),this._InfoDisplayExoticness_Image5_i()];
         this.addEventListener("creationComplete",this.___InfoDisplayExoticness_HGroup1_creationComplete);
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
      
      private function init(param1:FlexEvent) : void
      {
         var _loc2_:Shader = new Shader();
         _loc2_.byteCode = new this.MyShaderClass();
         _loc2_.data.colorRGB.value = [0,0,0];
         this.shaderFilter = new ShaderFilter(_loc2_);
         this._created = true;
         this.stars = this._stars;
      }
      
      public function set stars(param1:int) : void
      {
         var _loc2_:int = 0;
         this._stars = Math.min(Math.max(param1,0),this.MAX_STARS);
         if(this._created)
         {
            _loc2_ = 0;
            while(_loc2_ < this.MAX_STARS)
            {
               if(_loc2_ < this._stars)
               {
                  (this["star_" + _loc2_] as Image).filters = [];
               }
               else
               {
                  (this["star_" + _loc2_] as Image).filters = [this.shaderFilter];
               }
               _loc2_++;
            }
         }
      }
      
      private function _InfoDisplayExoticness_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__general_Decorations_swf_Solitaire_735508405;
         _loc1_.id = "star_0";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.star_0 = _loc1_;
         BindingManager.executeBindings(this,"star_0",this.star_0);
         return _loc1_;
      }
      
      private function _InfoDisplayExoticness_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__general_Decorations_swf_Solitaire_735508405;
         _loc1_.id = "star_1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.star_1 = _loc1_;
         BindingManager.executeBindings(this,"star_1",this.star_1);
         return _loc1_;
      }
      
      private function _InfoDisplayExoticness_Image3_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__general_Decorations_swf_Solitaire_735508405;
         _loc1_.id = "star_2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.star_2 = _loc1_;
         BindingManager.executeBindings(this,"star_2",this.star_2);
         return _loc1_;
      }
      
      private function _InfoDisplayExoticness_Image4_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__general_Decorations_swf_Solitaire_735508405;
         _loc1_.id = "star_3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.star_3 = _loc1_;
         BindingManager.executeBindings(this,"star_3",this.star_3);
         return _loc1_;
      }
      
      private function _InfoDisplayExoticness_Image5_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__general_Decorations_swf_Solitaire_735508405;
         _loc1_.id = "star_4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.star_4 = _loc1_;
         BindingManager.executeBindings(this,"star_4",this.star_4);
         return _loc1_;
      }
      
      public function ___InfoDisplayExoticness_HGroup1_creationComplete(param1:FlexEvent) : void
      {
         this.init(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get star_0() : Image
      {
         return this._892484221star_0;
      }
      
      public function set star_0(param1:Image) : void
      {
         var _loc2_:Object = this._892484221star_0;
         if(_loc2_ !== param1)
         {
            this._892484221star_0 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"star_0",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get star_1() : Image
      {
         return this._892484220star_1;
      }
      
      public function set star_1(param1:Image) : void
      {
         var _loc2_:Object = this._892484220star_1;
         if(_loc2_ !== param1)
         {
            this._892484220star_1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"star_1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get star_2() : Image
      {
         return this._892484219star_2;
      }
      
      public function set star_2(param1:Image) : void
      {
         var _loc2_:Object = this._892484219star_2;
         if(_loc2_ !== param1)
         {
            this._892484219star_2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"star_2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get star_3() : Image
      {
         return this._892484218star_3;
      }
      
      public function set star_3(param1:Image) : void
      {
         var _loc2_:Object = this._892484218star_3;
         if(_loc2_ !== param1)
         {
            this._892484218star_3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"star_3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get star_4() : Image
      {
         return this._892484217star_4;
      }
      
      public function set star_4(param1:Image) : void
      {
         var _loc2_:Object = this._892484217star_4;
         if(_loc2_ !== param1)
         {
            this._892484217star_4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"star_4",_loc2_,param1));
            }
         }
      }
   }
}

