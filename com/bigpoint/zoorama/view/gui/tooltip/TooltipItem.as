package com.bigpoint.zoorama.view.gui.tooltip
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.utils.Scale9Helper;
   import flash.display.Sprite;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class TooltipItem extends Sprite
   {
      private var toolSprite:Sprite;
      
      private var background:Sprite;
      
      private var textColor:int = 16770223;
      
      private var marginX:int = 4;
      
      private var marginY:int = 4;
      
      private var toolWidth:int;
      
      private var toolHeight:int;
      
      private var textField:TextField;
      
      public function TooltipItem(param1:String)
      {
         super();
         this.mouseEnabled = false;
         this.mouseChildren = false;
         this.setSkin();
         this.setText(param1);
      }
      
      private function setSkin() : void
      {
         this.toolSprite = AssetLibrary.getSprite("commons",AssetConfig.COMMONS_TOOLTIP);
         this.addChild(this.toolSprite);
         this.background = this.toolSprite.getChildByName("bgnd") as Sprite;
      }
      
      public function updateText(param1:String) : void
      {
         if(this.textField)
         {
            this.textField.htmlText = param1;
            GUITemplates.redrawText(this.textField);
            this.toolWidth = this.textField.width + this.marginX * 2;
            this.toolHeight = this.textField.height + this.marginY * 2;
            this.setBackgroundDims();
         }
      }
      
      private function setText(param1:String) : void
      {
         this.textField = new TextField();
         this.textField.x = this.marginX;
         this.textField.y = this.marginY;
         this.textField.multiline = true;
         this.textField.autoSize = TextFieldAutoSize.LEFT;
         this.textField.antiAliasType = AntiAliasType.ADVANCED;
         this.textField.textColor = this.textColor;
         this.textField.htmlText = param1.length > 0 ? param1 : " ";
         GUITemplates.redrawText(this.textField);
         StyleModule.setTextFieldStyle(this.textField,StyleModule.TOOLTIP_12_CENTER);
         this.toolSprite.addChild(this.textField);
         this.toolWidth = this.textField.width + this.marginX * 2;
         this.toolHeight = this.textField.height + this.marginY * 2;
         this.setBackgroundDims();
      }
      
      private function setBackgroundDims() : void
      {
         Scale9Helper.setWidth(this.background,this.toolWidth);
         Scale9Helper.setHeight(this.background,this.toolHeight);
      }
   }
}

