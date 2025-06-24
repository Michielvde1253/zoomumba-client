package com.bigpoint.zoorama.view.gui.mainmenu
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.btn.BasicButton;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class MainMenuButton extends BasicButton
   {
      public var tweeningDuration:Number = 0.18;
      
      private const ANIMATION_NONE:int = 1;
      
      private const ANIMATION_TO_MAX:int = 2;
      
      private const ANIMATION_TO_MIN:int = 3;
      
      private var animationState:int = 1;
      
      private var isMouseOver:Boolean = false;
      
      private var scaleMinX:Number;
      
      private var scaleMinY:Number;
      
      private var label:TextField;
      
      private var labelInvalidate:Boolean = false;
      
      private var _labelStyle:int;
      
      private var _text:String;
      
      public function MainMenuButton(param1:Notifier)
      {
         super(param1);
      }
      
      override public function set skin(param1:Sprite) : void
      {
         super.skin = param1;
         if(s1)
         {
            s1.visible = false;
         }
         this.initLabel();
      }
      
      override public function draw() : void
      {
         super.draw();
         if(this.label)
         {
            if(this.labelInvalidate)
            {
               if(this._labelStyle)
               {
                  StyleModule.setTextFieldStyle(this.label,this._labelStyle);
               }
               if(this._text)
               {
                  this.label.text = this._text;
               }
               else
               {
                  this.label.text = "";
               }
            }
         }
      }
      
      protected function initLabel() : void
      {
         this.label = skin.getChildByName("label") as TextField;
      }
      
      public function set labelStyle(param1:int) : void
      {
         this._labelStyle = param1;
         this.labelInvalidate = true;
         this.draw();
      }
      
      public function set text(param1:String) : void
      {
         this._text = param1;
         this.labelInvalidate = true;
         this.draw();
      }
      
      override protected function handleMouseDown(param1:MouseEvent) : void
      {
         super.handleMouseDown(param1);
         TweenLite.to(this,this.tweeningDuration,{"colorMatrixFilter":{
            "contrast":1.2,
            "brightness":1.1
         }});
      }
      
      override protected function handleMouseUp(param1:MouseEvent) : void
      {
         super.handleMouseUp(param1);
         TweenLite.to(this,this.tweeningDuration,{"colorMatrixFilter":{
            "contrast":1,
            "brightness":1
         }});
      }
      
      override protected function handleMouseClickHit(param1:MouseEvent) : void
      {
         super.handleMouseClickHit(param1);
      }
      
      override protected function handleMouseOutHit(param1:MouseEvent) : void
      {
         this.isMouseOver = false;
         super.handleMouseOutHit(param1);
         if(this.animationState == this.ANIMATION_NONE)
         {
            this.animationToMinState();
         }
      }
      
      override protected function handleMouseOverHit(param1:MouseEvent) : void
      {
         this.isMouseOver = true;
         super.handleMouseOverHit(param1);
         if(this.animationState == this.ANIMATION_NONE)
         {
            this.animationToMaxState();
         }
      }
      
      private function animationToMaxState() : void
      {
         this.animationState = this.ANIMATION_TO_MAX;
         s0.visible = false;
         s1.visible = true;
         s1.width = s0.width;
         s1.height = s0.height;
         this.scaleMinX = s1.scaleX;
         this.scaleMinY = s1.scaleY;
         TweenLite.to(s1,this.tweeningDuration,{
            "scaleX":1,
            "scaleY":1,
            "ease":Cubic.easeOut,
            "onComplete":this.animationToMaxFinished
         });
      }
      
      private function animationToMinState() : void
      {
         this.animationState = this.ANIMATION_TO_MIN;
         TweenLite.to(s1,this.tweeningDuration,{
            "scaleX":this.scaleMinX,
            "scaleY":this.scaleMinY,
            "ease":Cubic.easeOut,
            "onComplete":this.animationToMinFinished
         });
      }
      
      private function animationToMaxFinished() : void
      {
         if(!this.isMouseOver)
         {
            this.animationToMinState();
         }
         else
         {
            this.animationState = this.ANIMATION_NONE;
         }
      }
      
      private function animationToMinFinished() : void
      {
         if(this.isMouseOver)
         {
            this.animationToMaxState();
         }
         else
         {
            s0.visible = true;
            s1.visible = false;
            this.animationState = this.ANIMATION_NONE;
         }
      }
   }
}

