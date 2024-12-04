package com.bigpoint.zoorama.core.feature.safari.windows
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import flash.display.Sprite;
   import flash.text.TextField;
   
   public class SafariWelcomeWindow extends SafariSizedSmallWindow
   {
      private var scrollContainer:Sprite;
      
      private var tfTitle:TextField;
      
      private var tfInfo:TextField;
      
      private var titleTxt:String = "";
      
      private var infoTxt:String = "";
      
      public function SafariWelcomeWindow(param1:Notifier, param2:WindowButtonParams = null)
      {
         var _loc3_:String = null;
         _loc3_ = "SafariWelcome";
         this.titleTxt = TextResourceModule.getText("zoo.safari.title");
         this.infoTxt = TextResourceModule.getText("zoo.safari.welcomeWindow.infoText");
         name = _loc3_.toString();
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
            _loc1_ = this.scrollContainer.getChildByName("content") as Sprite;
            this.tfInfo = _loc1_.getChildByName("TF_INFO") as TextField;
            StyleModule.setTextFieldStyle(this.tfInfo,StyleModule.HEADER_12_CENTER);
            StyleModule.setTextFieldCSS(this.tfInfo);
            if(this.infoTxt)
            {
               this.tfInfo.text = "<span class=\'center11\'>" + this.infoTxt + "</span>";
            }
         }
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
   }
}

