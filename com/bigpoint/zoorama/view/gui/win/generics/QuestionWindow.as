package com.bigpoint.zoorama.view.gui.win.generics
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.win.generals.SizedMiniWindow;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextField;
   
   public class QuestionWindow extends SizedMiniWindow
   {
      private var scrollContainer:Sprite;
      
      private var tfTitle:TextField;
      
      private var tfInfo:TextField;
      
      private var sellPrice:MovieClip;
      
      private var titleTxt:String = "";
      
      private var infoTxt:String = "";
      
      private var sellAmount:int = 0;
      
      public function QuestionWindow(param1:Notifier, param2:String, param3:String, param4:WindowButtonParams = null, param5:int = 0)
      {
         var _loc6_:String = null;
         _loc6_ = "Ask";
         this.titleTxt = param2;
         this.infoTxt = param3;
         name = "QuestionWindow";
         modal = true;
         this.sellAmount = param5;
         super(param1,_loc6_,param4);
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         var _loc1_:TextField = null;
         this.tfTitle = loadedContent.getChildByName("txt_title") as TextField;
         this.sellPrice = loadedContent.getChildByName("sellPrice") as MovieClip;
         this.sellPrice.visible = false;
         if(this.sellAmount > 0)
         {
            this.sellPrice.visible = true;
            _loc1_ = TextField(this.sellPrice.moneyText);
            StyleModule.setTextFieldStyle(_loc1_,StyleModule.HEADER_BOLD_12_RIGHT);
            _loc1_.text = String(this.sellAmount);
            GUITemplates.redrawText(_loc1_);
         }
         StyleModule.setTextFieldStyle(this.tfTitle,StyleModule.HEADER_22_CENTER);
         StyleModule.setTextFieldCSS(this.tfTitle);
         if(this.titleTxt)
         {
            this.tfTitle.text = "<span class=\'center18\'>" + this.titleTxt + "</span>";
         }
         this.scrollContainer = loadedContent.getChildByName("SC_TF_ASK") as Sprite;
         if(this.scrollContainer)
         {
            this.tfInfo = this.scrollContainer.getChildByName("content") as TextField;
            StyleModule.setTextFieldStyle(this.tfInfo,StyleModule.HEADER_12_CENTER);
            StyleModule.setTextFieldCSS(this.tfInfo);
            if(this.infoTxt)
            {
               this.tfInfo.text = "<span class=\'center12\'>" + this.infoTxt + "</span>";
            }
         }
         super.assignLoadedContentGUI();
      }
   }
}

