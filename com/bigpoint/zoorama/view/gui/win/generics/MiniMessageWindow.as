package com.bigpoint.zoorama.view.gui.win.generics
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.scrollbars.Scrollbar;
   import com.bigpoint.zoorama.view.gui.win.generals.SizedMiniWindow;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextField;
   
   public class MiniMessageWindow extends SizedMiniWindow
   {
      protected var tfTitle:TextField;
      
      protected var tfInfoTextfield:TextField;
      
      private var titleTxt:String = "";
      
      private var infoTxt:String = "";
      
      private var infoContainer:MovieClip;
      
      private var scrollContainerContent:Sprite;
      
      private var contentScrollbar:Scrollbar;
      
      protected var contentURL:String;
      
      public function MiniMessageWindow(param1:Notifier, param2:String, param3:String, param4:WindowButtonParams = null)
      {
         this.initialize();
         this.titleTxt = param2;
         this.infoTxt = param3;
         super(param1,this.contentURL,param4);
      }
      
      protected function initialize() : void
      {
         this.contentURL = "MiniMessage";
         name = "MiniMessageWindow";
         modal = true;
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         this.tfTitle = loadedContent.getChildByName("txt_title") as TextField;
         StyleModule.setTextFieldStyle(this.tfTitle,StyleModule.HEADER_BOLD_22_CENTER);
         StyleModule.setTextFieldCSS(this.tfTitle);
         if(this.titleTxt)
         {
            this.tfTitle.text = "<span class=\'center18\'>" + this.titleTxt + "</span>";
         }
         this.infoContainer = this.loadedContent.getChildByName("SC_TF_INFO") as MovieClip;
         this.contentScrollbar = getLatebindingSourceComponentByName("SB_SC_TF_INFO") as Scrollbar;
         this.scrollContainerContent = this.infoContainer.getChildByName("content") as Sprite;
         this.tfInfoTextfield = this.scrollContainerContent.getChildByName("TF_INFO") as TextField;
         StyleModule.setTextFieldStyle(this.tfInfoTextfield,StyleModule.HEADER_14);
         StyleModule.setTextFieldCSS(this.tfInfoTextfield);
         if(this.tfInfoTextfield)
         {
            this.tfInfoTextfield.htmlText = "<span class=\'center12\'>" + this.infoTxt + "</span>";
         }
         super.assignLoadedContentGUI();
      }
   }
}

