package com.bigpoint.zoorama.view.gui.core
{
   import com.bigpoint.zoorama.Settings;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class Coreponent extends Sprite
   {
      public static var SIZE_V_ALL:int = 7;
      
      public static var ALIGN_V_TOP:int = 1;
      
      public static var ALIGN_V_CENTER:int = 2;
      
      public static var ALIGN_V_BOTTOM:int = 4;
      
      public static var SIZE_H_ALL:int = 7;
      
      public static var ALIGN_H_LEFT:int = 1;
      
      public static var ALIGN_H_CENTER:int = 2;
      
      public static var ALIGN_H_RIGHT:int = 4;
      
      public var valign:uint = 1;
      
      public var halign:uint = 1;
      
      public var id:Object;
      
      protected var isOnStage:Boolean;
      
      protected var hit:Sprite;
      
      protected var _skin:Sprite;
      
      private var _sizer:Sprite;
      
      private var _x:Number = 0;
      
      private var _x__:Number = -1;
      
      private var _y:Number = 0;
      
      private var _y__:Number = -1;
      
      public function Coreponent()
      {
         super();
         this.createSizer();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedToStage,false,0,true);
      }
      
      private function createSizer() : void
      {
         this._sizer = new Sprite();
         this._sizer.visible = false;
         var _loc1_:Graphics = this._sizer.graphics;
         _loc1_.beginFill(0);
         _loc1_.drawRect(0,0,10,10);
         _loc1_.endFill();
         addChild(this._sizer);
      }
      
      protected function onAddedToStage(param1:Event) : void
      {
         this.isOnStage = true;
         this.draw();
      }
      
      protected function onRemovedToStage(param1:Event) : void
      {
         this.isOnStage = false;
      }
      
      public function draw() : void
      {
         if(this.valign == SIZE_V_ALL)
         {
            this._sizer.width = this.parentWidth;
            if(this.skin)
            {
               this.skin.width = this.parentWidth;
               if(Settings.SCALE_TEST)
               {
               }
            }
         }
         if(this.halign == SIZE_H_ALL)
         {
            this._sizer.height = this.parentHeight;
            this.height = this.parentHeight;
            if(this.skin)
            {
               this.skin.height = this.parentHeight;
               if(Settings.SCALE_TEST)
               {
               }
            }
         }
         if(this._x != this._x__)
         {
            this._setX();
         }
         if(this._y != this._y__)
         {
            this._setY();
         }
      }
      
      override public function get numChildren() : int
      {
         var _loc1_:int = super.numChildren - 1;
         return _loc1_ > 0 ? _loc1_ : 0;
      }
      
      public function get parentWidth() : Number
      {
         var _loc1_:Number = 0;
         if(this.isOnStage)
         {
            _loc1_ = parent.width;
         }
         return _loc1_;
      }
      
      public function get parentHeight() : Number
      {
         var _loc1_:Number = 0;
         if(this.isOnStage)
         {
            _loc1_ = parent.height;
         }
         return _loc1_;
      }
      
      override public function set x(param1:Number) : void
      {
         this._x = param1;
      }
      
      protected function _setX() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:Coreponent = parent as Coreponent;
         switch(this.valign)
         {
            case ALIGN_H_LEFT:
               _loc1_ = this._x;
               break;
            case ALIGN_H_CENTER:
               if(_loc2_)
               {
                  _loc1_ = _loc2_.sizer.width - width >> 1;
               }
               else
               {
                  _loc1_ = this.parentWidth - width >> 1;
               }
               break;
            case ALIGN_H_RIGHT:
               if(_loc2_)
               {
                  _loc1_ = _loc2_.sizer.width - this._x;
               }
               else
               {
                  _loc1_ = this.parentWidth - this._x;
               }
               break;
            default:
               _loc1_ = this._x;
         }
         super.x = _loc1_;
      }
      
      override public function set y(param1:Number) : void
      {
         this._y = param1;
      }
      
      protected function _setY() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:Coreponent = parent as Coreponent;
         switch(this.valign)
         {
            case ALIGN_V_TOP:
               _loc1_ = this._y;
               break;
            case ALIGN_V_CENTER:
               if(_loc2_)
               {
                  _loc1_ = _loc2_.sizer.height - height >> 1;
               }
               else
               {
                  _loc1_ = this.parentHeight - height >> 1;
               }
               break;
            case ALIGN_V_BOTTOM:
               if(_loc2_)
               {
                  _loc1_ = _loc2_.sizer.height - this._y;
               }
               else
               {
                  _loc1_ = this.parentHeight - this._y;
               }
               break;
            default:
               _loc1_ = this._y;
         }
         super.y = _loc1_;
      }
      
      public function get sizer() : Sprite
      {
         return this._sizer;
      }
      
      public function set skin(param1:Sprite) : void
      {
         if(this._skin)
         {
            removeChild(this._skin);
         }
         this._skin = param1;
         if(this._skin.x != 0)
         {
            this.x = this._skin.x;
            this._skin.x = -x;
         }
         if(this._skin.y != 0)
         {
            this.y = this._skin.y;
            this._skin.y = -y;
         }
         addChild(this._skin);
      }
      
      public function get skin() : Sprite
      {
         return this._skin;
      }
      
      public function dispose() : void
      {
         if(this._sizer)
         {
            this.removeChild(this.sizer);
            this._sizer = null;
         }
      }
      
      override public function set width(param1:Number) : void
      {
         this._sizer.width = param1;
      }
      
      override public function set height(param1:Number) : void
      {
         this._sizer.height = param1;
      }
      
      public function getHit() : Sprite
      {
         return this.hit;
      }
      
      public function get normalX() : Number
      {
         return super.x;
      }
      
      public function set normalX(param1:Number) : void
      {
         super.x = param1;
      }
      
      public function get normalY() : Number
      {
         return super.y;
      }
      
      public function set normalY(param1:Number) : void
      {
         super.y = param1;
      }
   }
}

