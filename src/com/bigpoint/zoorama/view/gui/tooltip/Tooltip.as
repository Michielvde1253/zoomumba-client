package com.bigpoint.zoorama.view.gui.tooltip
{
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.utils.Scale9Helper;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class Tooltip extends Coreponent implements ITooltip
   {
      public var followMouse:Boolean = true;
      
      public var marginX:int = 4;
      
      public var marginY:int = 4;
      
      public var textColor:int = 16770223;
      
      public var target:DisplayObject;
      
      protected var textfield:TextField;
      
      protected var background:MovieClip;
      
      public function Tooltip()
      {
         super();
         this.mouseEnabled = false;
         this.mouseChildren = false;
      }
      
      override public function set skin(param1:Sprite) : void
      {
         super.skin = param1;
         this.textfield = new TextField();
         this.textfield.x = this.marginX;
         this.textfield.y = this.marginY;
         this.textfield.antiAliasType = AntiAliasType.ADVANCED;
         skin.addChild(this.textfield);
         this.background = skin.getChildByName("bgnd") as MovieClip;
         if(Settings.SCALE_TEST)
         {
            skin.scaleX = 1.5;
            skin.scaleY = 1.5;
         }
      }
      
      public function show() : void
      {
         visible = true;
      }
      
      public function hide() : void
      {
         visible = false;
      }
      
      override public function set width(param1:Number) : void
      {
         Scale9Helper.setWidth(this.background,param1);
      }
      
      override public function set height(param1:Number) : void
      {
         Scale9Helper.setHeight(this.background,param1);
      }
      
      public function set text(param1:String) : void
      {
         if(this.textfield)
         {
            StyleModule.setTextFieldStyle(this.textfield,StyleModule.TOOLTIP_12_CENTER);
            this.textfield.autoSize = TextFieldAutoSize.LEFT;
            this.textfield.multiline = true;
            this.textfield.textColor = this.textColor;
            this.textfield.htmlText = param1;
            this.width = this.textfield.width + (this.marginX << 1);
            this.height = this.textfield.height + (this.marginY << 1);
         }
      }
   }
}

