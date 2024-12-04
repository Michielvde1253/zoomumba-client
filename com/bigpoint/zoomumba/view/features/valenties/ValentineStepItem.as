package com.bigpoint.zoomumba.view.features.valenties
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.features.valenties.vo.ValentinesStepEvent;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import components.textfield.gradientText.GradientText;
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.GlowFilter;
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
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   
   public class ValentineStepItem extends Group
   {
      public static const START:int = 0;
      
      public static const NORMAL:int = 1;
      
      public static const REWARD:int = 2;
      
      public static const AVATAR:int = 3;
      
      public static const REWARD_IMAGE:int = 4;
      
      private var _1265073601multiplier:GradientText;
      
      private var _1324487151stepImage:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var tileId:int;
      
      private var _type:int;
      
      public var cr:int;
      
      public var rewardId:int;
      
      public var rewardCategory:String;
      
      public var canMoveHere:Boolean = true;
      
      public function ValentineStepItem()
      {
         super();
         this.mxmlContent = [this._ValentineStepItem_Image1_i(),this._ValentineStepItem_GradientText1_i()];
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
      
      public function set type(param1:int) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Number = NaN;
         this._type = param1;
         switch(this._type)
         {
            case START:
               this.stepImage.alpha = 0;
               this.stepImage.mouseEnabled = true;
               this.stepImage.buttonMode = true;
               this.stepImage.mouseChildren = true;
               this.stepImage.addEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOver);
               this.stepImage.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
               this.stepImage.addEventListener(MouseEvent.CLICK,this.handleMouseClick);
               this.canMoveHere = true;
               break;
            case NORMAL:
               this.stepImage.alpha = 0;
               this.stepImage.mouseEnabled = true;
               this.stepImage.buttonMode = true;
               this.stepImage.mouseChildren = true;
               this.stepImage.addEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOver);
               this.stepImage.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
               this.stepImage.addEventListener(MouseEvent.CLICK,this.handleMouseClick);
               break;
            case REWARD_IMAGE:
               _loc2_ = new WrapedSprite(AssetIds.getPreviewAssetId(ItemTypeHelper.typeToCategory(this.rewardCategory),this.rewardId),AssetConfig.DEFAULT_INFO_SPR);
               this.stepImage.source = _loc2_;
               _loc3_ = 1;
               if(ItemTypeHelper.typeToCategory(this.rewardCategory) == Categories.ANIMAL)
               {
                  _loc3_ = 0.5;
                  this.stepImage.x = -12;
                  this.stepImage.y = 27;
               }
               else
               {
                  _loc3_ = 0.4;
               }
               this.stepImage.scaleX = _loc3_;
               this.stepImage.scaleY = _loc3_;
               if(ItemTypeHelper.typeToCategory(this.rewardCategory) == Categories.RESOURCES)
               {
                  this.multiplier.text = "5x";
               }
               break;
            case REWARD:
               this.stepImage.alpha = 0;
               this.stepImage.mouseEnabled = true;
               this.stepImage.buttonMode = true;
               this.stepImage.mouseChildren = true;
               this.stepImage.addEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOver);
               this.stepImage.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
               this.stepImage.addEventListener(MouseEvent.CLICK,this.handleMouseClick);
               break;
            case AVATAR:
         }
      }
      
      public function set tileSource(param1:*) : void
      {
         this.stepImage.source = param1;
      }
      
      public function setAvatarSource(param1:*, param2:Sprite) : void
      {
         var _loc3_:Sprite = new Sprite();
         _loc3_.addChild(param1);
         param1.y = 7;
         _loc3_.addChild(param2);
         this.stepImage.source = _loc3_;
      }
      
      protected function handleMouseOver(param1:MouseEvent) : void
      {
         var _loc2_:GlowFilter = new GlowFilter();
         if(this.canMoveHere || this._type == START)
         {
            _loc2_.color = 39168;
         }
         else if(this._type != REWARD)
         {
            _loc2_.color = 16763904;
         }
         else
         {
            _loc2_.color = 16711680;
         }
         _loc2_.blurX = 20;
         _loc2_.blurY = 20;
         _loc2_.strength = 3;
         _loc2_.knockout = true;
         this.stepImage.filters = [_loc2_];
         this.stepImage.alpha = 1;
      }
      
      protected function handleMouseOut(param1:MouseEvent) : void
      {
         this.stepImage.alpha = 0;
         this.stepImage.filters = [];
      }
      
      protected function handleMouseClick(param1:MouseEvent) : void
      {
         switch(this._type)
         {
            case START:
            case NORMAL:
               if(this.canMoveHere)
               {
                  dispatchEvent(new ValentinesStepEvent(ValentinesStepEvent.VALENTINES_FIELD_CLICK,this.tileId,0,true));
               }
               else
               {
                  dispatchEvent(new ValentinesStepEvent(ValentinesStepEvent.VALENTINES_FIELD_CLICK,this.tileId,this.cr,true));
               }
               break;
            case REWARD:
               if(this.canMoveHere)
               {
                  dispatchEvent(new ValentinesStepEvent(ValentinesStepEvent.VALENTINES_REWARD_CLICK,this.tileId,0,true));
               }
         }
      }
      
      public function dispose() : void
      {
         switch(this._type)
         {
            case START:
            case REWARD:
            case NORMAL:
               this.stepImage.removeEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOver);
               this.stepImage.removeEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
               this.stepImage.removeEventListener(MouseEvent.CLICK,this.handleMouseClick);
         }
      }
      
      public function get fieldType() : int
      {
         return this._type;
      }
      
      private function _ValentineStepItem_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.id = "stepImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.stepImage = _loc1_;
         BindingManager.executeBindings(this,"stepImage",this.stepImage);
         return _loc1_;
      }
      
      private function _ValentineStepItem_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.x = -41;
         _loc1_.y = -7;
         _loc1_.fontSize = 25;
         _loc1_.id = "multiplier";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.multiplier = _loc1_;
         BindingManager.executeBindings(this,"multiplier",this.multiplier);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get multiplier() : GradientText
      {
         return this._1265073601multiplier;
      }
      
      public function set multiplier(param1:GradientText) : void
      {
         var _loc2_:Object = this._1265073601multiplier;
         if(_loc2_ !== param1)
         {
            this._1265073601multiplier = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"multiplier",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get stepImage() : Image
      {
         return this._1324487151stepImage;
      }
      
      public function set stepImage(param1:Image) : void
      {
         var _loc2_:Object = this._1324487151stepImage;
         if(_loc2_ !== param1)
         {
            this._1324487151stepImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stepImage",_loc2_,param1));
            }
         }
      }
   }
}

