package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.notices.gui.window.WindowNotice;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.SizedSmallWindow;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class FortuneWheelFreeTurn extends SizedSmallWindow
   {
      private var tfTitle:TextField;
      
      private var tfInfo1:TextField;
      
      private var tfInfo2:TextField;
      
      private var tfInfo3:TextField;
      
      private var titleTxt:String = "";
      
      private var infoTxt1:String = "";
      
      private var infoTxt2:String = "";
      
      private var infoTxt3:String = "";
      
      public function FortuneWheelFreeTurn(param1:Notifier, param2:String = null, param3:WindowButtonParams = null)
      {
         param2 = "FortuneWheelFreeTurn";
         this.titleTxt = TextResourceModule.getText("zoo.wheel.freeturn.title");
         this.infoTxt1 = TextResourceModule.getText("zoo.wheel.freeturn.text.1");
         this.infoTxt2 = TextResourceModule.getText("zoo.wheel.freeturn.text.2");
         this.infoTxt3 = TextResourceModule.getText("zoo.wheel.freeturn.text.3");
         name = param2.toString();
         modal = true;
         super(param1,param2,param3);
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         var _loc1_:Sprite = null;
         var _loc2_:Bitmap = null;
         this.tfTitle = loadedContent.getChildByName("txt_title") as TextField;
         StyleModule.setTextFieldStyle(this.tfTitle,StyleModule.HEADER_22_CENTER);
         StyleModule.setTextFieldCSS(this.tfTitle);
         if(this.titleTxt)
         {
            this.tfTitle.text = "<span class=\'center22\'>" + this.titleTxt + "</span>";
         }
         this.tfInfo1 = loadedContent.getChildByName("txt_content_1") as TextField;
         StyleModule.setTextFieldStyle(this.tfInfo1,StyleModule.HEADER_12_CENTER);
         StyleModule.setTextFieldCSS(this.tfInfo1);
         if(this.infoTxt1)
         {
            this.tfInfo1.text = "<span class=\'center11\'>" + this.infoTxt1 + "</span>";
         }
         this.tfInfo2 = loadedContent.getChildByName("txt_content_2") as TextField;
         if(this.tfInfo2)
         {
            StyleModule.setTextFieldStyle(this.tfInfo2,StyleModule.HEADER_12_CENTER);
            StyleModule.setTextFieldCSS(this.tfInfo2);
            this.tfInfo2.text = "<span class=\'center11\'>" + this.infoTxt2 + "</span>";
            _loc1_ = new Sprite();
            _loc2_ = GUITemplates.createMaskedGradientTextfield(this.tfInfo2.text,StyleModule.HEADER_12_CENTER,this.tfInfo2);
            _loc2_.x = this.tfInfo2.x;
            _loc2_.y = this.tfInfo2.y;
            this.tfInfo2.visible = false;
            _loc1_.addChild(_loc2_);
            addChild(_loc1_);
            _loc1_.buttonMode = true;
            _loc1_.useHandCursor = true;
            _loc1_.addEventListener(MouseEvent.CLICK,this.linkButtonClickHandler);
         }
         this.tfInfo3 = loadedContent.getChildByName("txt_content_3") as TextField;
         StyleModule.setTextFieldStyle(this.tfInfo3,StyleModule.HEADER_12_CENTER);
         StyleModule.setTextFieldCSS(this.tfInfo3);
         if(this.infoTxt3)
         {
            this.tfInfo3.text = "<span class=\'center11\'>" + this.infoTxt3 + "</span>";
         }
         traceAllChilds();
         super.assignLoadedContentGUI();
         GUITemplates.redrawText(this.tfInfo1,this.tfInfo3);
      }
      
      private function linkButtonClickHandler(param1:MouseEvent) : void
      {
         notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.MINIGAME_FORTUNE_WHEEL,null));
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
   }
}

