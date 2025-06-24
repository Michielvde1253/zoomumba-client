package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.notices.core.TypingKeyNotice;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.SizedSmallWindow;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import flash.display.MovieClip;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   
   public class BonusCodeWindow extends SizedSmallWindow
   {
      public var bonusCodeText:TextField;
      
      private var bonusCodeContainer:MovieClip;
      
      private var titleContainer:TextField;
      
      private var infoContainer:MovieClip;
      
      private var titleTxt:String;
      
      private var infoTxt:String;
      
      public function BonusCodeWindow(param1:Notifier, param2:String, param3:String, param4:WindowButtonParams = null)
      {
         var _loc5_:String = "BonusCode";
         modal = true;
         useHeaderLoader = false;
         this.titleTxt = param2;
         this.infoTxt = param3;
         super(param1,_loc5_,param4);
      }
      
      override public function draw() : void
      {
         halign = Coreponent.ALIGN_H_LEFT;
         valign = Coreponent.ALIGN_V_TOP;
         this.x = 300;
         this.y = 115;
         super.draw();
      }
      
      override protected function loadContentFinished() : void
      {
         super.loadContentFinished();
         this.createTextField();
      }
      
      private function createTextField() : void
      {
         this.bonusCodeContainer = loadedContent.getChildByName("bonusText") as MovieClip;
         this.titleContainer = loadedContent.getChildByName("txt_title") as TextField;
         this.infoContainer = loadedContent.getChildByName("SC_TF_ASK") as MovieClip;
         this.titleContainer.text = this.titleTxt;
         StyleModule.setTextFieldStyle(this.titleContainer,StyleModule.HEADER_BOLD_20_CENTER);
         var _loc1_:TextField = TextField(this.infoContainer.content);
         _loc1_.text = this.infoTxt;
         _loc1_.multiline = true;
         _loc1_.selectable = true;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         this.infoContainer.content.antiAliasType = AntiAliasType.ADVANCED;
         StyleModule.setTextFieldStyle(this.infoContainer.content,StyleModule.HEADER_BOLD_12_LEFT);
         this.bonusCodeText = new TextField();
         this.bonusCodeText.width = 200;
         this.bonusCodeText.height = 30;
         this.bonusCodeText.border = false;
         this.bonusCodeText.multiline = false;
         this.bonusCodeText.wordWrap = true;
         this.bonusCodeText.type = TextFieldType.INPUT;
         this.bonusCodeText.textColor = 3480321;
         this.bonusCodeContainer.addChild(this.bonusCodeText);
         StyleModule.setTextFieldStyle(this.bonusCodeText,StyleModule.HEADER_14_LEFT);
         this.bonusCodeText.antiAliasType = AntiAliasType.ADVANCED;
         GUITemplates.redrawText(this.bonusCodeText);
      }
      
      public function resetTextField() : void
      {
         this.bonusCodeText.text = "";
      }
      
      override public function show() : void
      {
         super.show();
         notifier.dispatchNoticeToRoot(new TypingKeyNotice(TypingKeyNotice.DISABLE));
      }
      
      override public function hide() : void
      {
         super.hide();
         notifier.dispatchNoticeToRoot(new TypingKeyNotice(TypingKeyNotice.ENABLE));
      }
   }
}

