package com.bigpoint.zoorama.core.feature.safari.windows
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class SafariMiniGameInfoWindow extends SafariSizedMediumWindow
   {
      private static const TEXTFIELD_MAX_WIDTH:int = 350;
      
      private static const MARGIN_WIDTH:int = 10;
      
      private static const MARGIN_HEIGHT:int = 5;
      
      private var scrollContainer:Sprite;
      
      private var container:Sprite;
      
      private var tfTitle:TextField;
      
      private var txtField:TextField;
      
      private var titleTxt:String = "";
      
      private var infoTxt:String = "";
      
      public function SafariMiniGameInfoWindow(param1:Notifier, param2:WindowButtonParams = null)
      {
         var _loc3_:String = null;
         name = "SafariMediumInfoWindow";
         _loc3_ = "SafariInfo";
         this.titleTxt = TextResourceModule.getText("zoo.safari.minigameInfo.title");
         modal = true;
         super(param1,_loc3_,param2);
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         var _loc1_:Sprite = null;
         this.tfTitle = loadedContent.getChildByName("txt_title") as TextField;
         StyleModule.setTextFieldStyle(this.tfTitle,StyleModule.HEADER_22_CENTER);
         StyleModule.setTextFieldCSS(this.tfTitle);
         if(this.titleTxt)
         {
            this.tfTitle.text = "<span class=\'center22\'>" + this.titleTxt + "</span>";
         }
         this.scrollContainer = loadedContent.getChildByName("SC_TF_INFO") as Sprite;
         if(this.scrollContainer)
         {
            this.container = this.scrollContainer.getChildByName("content") as Sprite;
            this.txtField = this.createTextfield();
            this.container.addChild(this.txtField);
            this.infoTxt = TextResourceModule.getText("zoo.safari.minigameInfo.1") + "\n\n";
            this.infoTxt += this.createBulletText("zoo.safari.minigameInfo.2") + "\n";
            this.infoTxt += this.createBulletText("zoo.safari.minigameInfo.3") + "\n";
            this.infoTxt += this.createBulletText("zoo.safari.minigameInfo.4");
            this.txtField.htmlText = "<span class=\'size12\'>" + this.infoTxt + "</span>";
            this.setBulletStyle(this.txtField);
            this.infoTxt = this.createBulletText("zoo.safari.minigameInfo.terains");
            this.txtField = this.createTextfield(this.txtField.height + MARGIN_HEIGHT * 4);
            this.container.addChild(this.txtField);
            this.txtField.htmlText = "<span class=\'size12\'>" + this.infoTxt + "</span>";
            this.setBulletStyle(this.txtField);
            this.infoTxt = TextResourceModule.getText("zoo.safari.minigameInfo.terains.1.name") + "\n";
            this.infoTxt += TextResourceModule.getText("zoo.safari.minigameInfo.terains.1.info");
            _loc1_ = this.attachVisualAndText(AssetLibrary.getSprite("safari_gui","TileEasySPR"),this.infoTxt);
            this.container.addChild(_loc1_);
            this.infoTxt = TextResourceModule.getText("zoo.safari.minigameInfo.terains.2.name") + "\n";
            this.infoTxt += TextResourceModule.getText("zoo.safari.minigameInfo.terains.2.info");
            _loc1_ = this.attachVisualAndText(AssetLibrary.getSprite("safari_gui","TileHardSPR"),this.infoTxt);
            this.container.addChild(_loc1_);
            this.infoTxt = TextResourceModule.getText("zoo.safari.minigameInfo.terains.3.name") + "\n";
            this.infoTxt += TextResourceModule.getText("zoo.safari.minigameInfo.terains.3.info");
            _loc1_ = this.attachVisualAndText(AssetLibrary.getSprite("safari_gui","TileInpassibleSPR"),this.infoTxt);
            this.container.addChild(_loc1_);
            this.infoTxt = TextResourceModule.getText("zoo.safari.minigameInfo.terains.4.name") + "\n";
            this.infoTxt += TextResourceModule.getText("zoo.safari.minigameInfo.terains.4.info");
            _loc1_ = this.attachVisualAndText(AssetLibrary.getSprite("safari_gui","TileOpenSPR"),this.infoTxt);
            this.container.addChild(_loc1_);
            this.infoTxt = this.createBulletText("zoo.safari.minigameInfo.events");
            this.txtField = this.createTextfield(this.container.height + MARGIN_HEIGHT * 4);
            this.container.addChild(this.txtField);
            this.txtField.htmlText = "<span class=\'size12\'>" + this.infoTxt + "</span>";
            this.setBulletStyle(this.txtField);
            this.infoTxt = TextResourceModule.getText("zoo.safari.minigameInfo.events.1.name") + "\n";
            this.infoTxt += TextResourceModule.getText("zoo.safari.minigameInfo.events.1.info");
            _loc1_ = this.attachVisualAndText(AssetLibrary.getSprite("safari_gui","ContentTracksSPR"),this.infoTxt);
            this.container.addChild(_loc1_);
            this.infoTxt = TextResourceModule.getText("zoo.safari.minigameInfo.events.2.name") + "\n";
            this.infoTxt += TextResourceModule.getText("zoo.safari.minigameInfo.events.2.info");
            _loc1_ = this.attachVisualAndText(AssetLibrary.getSprite("safari_gui","ContentTreasureSPR"),this.infoTxt);
            this.container.addChild(_loc1_);
            this.infoTxt = TextResourceModule.getText("zoo.safari.minigameInfo.events.3.name") + "\n";
            this.infoTxt += TextResourceModule.getText("zoo.safari.minigameInfo.events.3.info");
            _loc1_ = this.attachVisualAndText(AssetLibrary.getSprite("safari_gui","ContentTrapSPR"),this.infoTxt);
            this.container.addChild(_loc1_);
            this.infoTxt = TextResourceModule.getText("zoo.safari.minigameInfo.events.4.name") + "\n";
            this.infoTxt += TextResourceModule.getText("zoo.safari.minigameInfo.events.4.info");
            _loc1_ = this.attachVisualAndText(AssetLibrary.getSprite("safari_gui","ContentAnimalSPR"),this.infoTxt);
            this.container.addChild(_loc1_);
         }
         traceAllChilds();
         super.assignLoadedContentGUI();
      }
      
      override public function draw() : void
      {
         if(Settings.SCALE_TEST)
         {
            halign = Coreponent.ALIGN_H_LEFT;
            valign = Coreponent.ALIGN_V_TOP;
            this.x = 243;
            this.y = 110;
         }
         super.draw();
      }
      
      private function createBulletText(param1:String) : String
      {
         return "<LI>" + TextResourceModule.getText(param1) + "</LI>";
      }
      
      private function attachVisualAndText(param1:Sprite, param2:String) : Sprite
      {
         var _loc3_:Sprite = new Sprite();
         var _loc4_:int = this.container.height + MARGIN_HEIGHT;
         _loc3_.y = _loc4_;
         _loc3_.addChild(param1);
         var _loc5_:TextField = this.createTextfield(0,TEXTFIELD_MAX_WIDTH - param1.width - MARGIN_WIDTH);
         _loc5_.htmlText = "<span class=\'size12\'>" + param2 + "</span>";
         _loc5_.x = param1.width + MARGIN_WIDTH;
         _loc3_.addChild(_loc5_);
         return _loc3_;
      }
      
      private function createTextfield(param1:int = 0, param2:int = 350) : TextField
      {
         var _loc3_:TextField = new TextField();
         _loc3_.y = param1;
         _loc3_.width = param2;
         _loc3_.multiline = true;
         _loc3_.wordWrap = true;
         _loc3_.autoSize = TextFieldAutoSize.LEFT;
         StyleModule.setTextFieldStyle(_loc3_,StyleModule.HEADER_12_LEFT);
         StyleModule.setTextFieldCSS(_loc3_);
         return _loc3_;
      }
      
      private function setBulletStyle(param1:TextField, param2:Number = NaN, param3:Number = NaN, param4:String = null, param5:Number = -16) : void
      {
         var _loc6_:String = param1.htmlText;
         var _loc7_:String;
         var _loc8_:* = _loc7_ = "<LI>";
         var _loc9_:String = String.fromCharCode(1);
         if(!isNaN(param5))
         {
            _loc8_ = "<TEXTFORMAT LEFTMARGIN=\"" + param5 + "\">" + _loc7_;
         }
         _loc8_ += "<FONT";
         if(param4)
         {
            _loc8_ += " FACE=\'" + param4 + "\'";
         }
         if(!isNaN(param3))
         {
            _loc8_ += " SIZE=\'" + param3.toString() + "\'";
         }
         _loc8_ += ">" + _loc9_ + "</FONT>";
         if(!isNaN(param2))
         {
            _loc8_ += "<FONT COLOR=\'" + this.getColorWebFormat(param2) + "\'>" + _loc9_ + "</FONT>";
         }
         _loc6_ = _loc6_.split(_loc7_).join(_loc8_);
         if(!isNaN(param5))
         {
            _loc7_ = "</LI>";
            _loc8_ = _loc7_ + "</TEXTFORMAT>";
            _loc6_ = _loc6_.split(_loc7_).join(_loc8_);
         }
         param1.htmlText = _loc6_;
      }
      
      private function getColorWebFormat(param1:uint) : String
      {
         var _loc2_:String = param1.toString(16).toUpperCase();
         while(_loc2_.length < 6)
         {
            _loc2_ = "0" + _loc2_;
         }
         return "#" + _loc2_;
      }
   }
}

