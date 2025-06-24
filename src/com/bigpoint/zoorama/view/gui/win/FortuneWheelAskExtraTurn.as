package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.notices.gui.window.WindowNotice;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.SizedMiniWindow;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import flash.text.TextField;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class FortuneWheelAskExtraTurn extends SizedMiniWindow
   {
      private const VALUE:int = 2;
      
      private var tfTitle:TextField;
      
      private var tfInfo:TextField;
      
      private var price:TextField;
      
      private var titleTxt:String = "";
      
      private var infoTxt:String = "";
      
      private var confirmation:Function;
      
      public function FortuneWheelAskExtraTurn(param1:Notifier, param2:String = null, param3:WindowButtonParams = null)
      {
         param2 = "FortuneWheelAskExtraTurn";
         this.titleTxt = TextResourceModule.getText("zoo.wheel.extraturn.title");
         this.infoTxt = TextResourceModule.getText("zoo.wheel.extraturn.text");
         name = param2.toString();
         modal = true;
         this.confirmation = param3.confirmationFunction;
         super(param1,param2,param3);
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         var _loc1_:UserProxy = Facade.getInstance().getProxy(UserProxy);
         this.tfTitle = loadedContent.getChildByName("txt_title") as TextField;
         StyleModule.setTextFieldStyle(this.tfTitle,StyleModule.HEADER_22_CENTER);
         StyleModule.setTextFieldCSS(this.tfTitle);
         if(this.titleTxt)
         {
            this.tfTitle.text = "<span class=\'center22\'>" + this.titleTxt + "</span>";
         }
         this.tfInfo = loadedContent.getChildByName("txt_content") as TextField;
         StyleModule.setTextFieldStyle(this.tfInfo,StyleModule.HEADER_12_CENTER);
         StyleModule.setTextFieldCSS(this.tfInfo);
         if(this.tfInfo)
         {
            this.tfInfo.text = "<span class=\'center14\'>" + this.infoTxt + "</span>";
         }
         this.price = loadedContent.getChildByName("txt_price") as TextField;
         this.price.textColor = _loc1_.realAmount >= this.VALUE ? MainConfig.PRICE_TXT_COLOR_ENABLE : MainConfig.PRICE_TXT_COLOR_DISABLE;
         StyleModule.setTextFieldStyle(this.price,StyleModule.HEADER_12_RIGHT);
         StyleModule.setTextFieldCSS(this.price);
         if(this.price)
         {
            this.price.text = "<span class=\'right12\'>" + this.VALUE + "</span>";
         }
         GUITemplates.redrawText(this.tfTitle);
         windowButtonsParams.confirmationFunction = _loc1_.realAmount >= this.VALUE ? this.confirmation : this.bank;
         super.assignLoadedContentGUI();
      }
      
      private function bank() : void
      {
         notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.BANK));
      }
      
      override public function draw() : void
      {
         if(Settings.SCALE_TEST)
         {
            halign = Coreponent.ALIGN_H_LEFT;
            valign = Coreponent.ALIGN_V_TOP;
            this.x = 310;
            this.y = 110;
         }
         super.draw();
      }
   }
}

