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
   import flash.text.TextFieldAutoSize;
   
   public class SafariRegionInfoWindow extends SafariSizedMediumWindow
   {
      private static const TEXTFIELD_MAX_WIDTH:int = 200;
      
      private var scrollContainer:Sprite;
      
      private var container:Sprite;
      
      private var tfTitle:TextField;
      
      private var txtField:TextField;
      
      private var titleTxt:String = "";
      
      private var infoTxt:String = "";
      
      public function SafariRegionInfoWindow(param1:Notifier, param2:WindowButtonParams = null)
      {
         var _loc3_:String = null;
         name = "SafariRegionInfoWindow";
         _loc3_ = "SafariRegionInfo";
         modal = true;
         super(param1,_loc3_,param2);
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         this.titleTxt = TextResourceModule.getText("zoo.safari.startWindow.infoTitle");
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
            this.txtField = this.createTextfield(this.container.height);
            this.infoTxt = TextResourceModule.getText("zoo.safari.startWindow.infoText");
            this.txtField.text = "<span class=\'size12\'>" + this.infoTxt + "</span>";
            this.container.addChild(this.txtField);
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
      
      private function createTextfield(param1:int = 0, param2:int = 200) : TextField
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
   }
}

