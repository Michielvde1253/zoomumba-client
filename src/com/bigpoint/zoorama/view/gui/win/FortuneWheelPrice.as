package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fortuneWheel.RewardData;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.fortuneWheel.FortuneWheelRewardItem;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.SizedSmallWindow;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class FortuneWheelPrice extends SizedSmallWindow
   {
      private var tfTitle:TextField;
      
      private var tfInfo1:TextField;
      
      private var tfWonItem:TextField;
      
      private var tfInfo2:TextField;
      
      private var titleTxt:String = "";
      
      private var infoTxt1:String = "";
      
      private var wonItemName:String = "";
      
      private var infoTxt2:String = "";
      
      private var rewardData:RewardData;
      
      public function FortuneWheelPrice(param1:Notifier, param2:RewardData, param3:String = null, param4:WindowButtonParams = null)
      {
         this.rewardData = param2;
         param3 = "FortuneWheelPrice";
         this.titleTxt = TextResourceModule.getText("zoo.wheel.price.title");
         this.infoTxt1 = TextResourceModule.getText("zoo.wheel.price.text.1");
         this.infoTxt2 = TextResourceModule.getText("zoo.wheel.price.text.2");
         name = param3.toString();
         modal = true;
         super(param1,param3,param4);
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         this.tfTitle = loadedContent.getChildByName("txt_title") as TextField;
         StyleModule.setTextFieldStyle(this.tfTitle,StyleModule.HEADER_16);
         StyleModule.setTextFieldCSS(this.tfTitle);
         if(this.titleTxt)
         {
            this.tfTitle.text = "<span class=\'center16\'>" + this.titleTxt + "</span>";
         }
         this.tfInfo1 = loadedContent.getChildByName("txt_1") as TextField;
         StyleModule.setTextFieldStyle(this.tfInfo1,StyleModule.HEADER_12);
         StyleModule.setTextFieldCSS(this.tfInfo1);
         if(this.infoTxt1)
         {
            this.tfInfo1.text = "<span class=\'size11\'>" + this.infoTxt1 + "</span>";
            this.tfInfo1.autoSize = TextFieldAutoSize.LEFT;
         }
         this.showRewardItem();
      }
      
      private function showRewardItem() : void
      {
         var _loc7_:Bitmap = null;
         var _loc1_:Sprite = loadedContent.getChildByName("price_item_container") as Sprite;
         var _loc2_:FortuneWheelRewardItem = new FortuneWheelRewardItem(this.rewardData);
         _loc2_.showSex = true;
         this.wonItemName = _loc2_.tooltipText;
         this.tfWonItem = loadedContent.getChildByName("won_item_txt") as TextField;
         if(this.tfWonItem)
         {
            StyleModule.setTextFieldStyle(this.tfWonItem,StyleModule.HEADER_BOLD_12);
            StyleModule.setTextFieldCSS(this.tfWonItem);
            this.tfWonItem.text = "<span class=\'size11\'>" + this.wonItemName + "</span>";
            _loc7_ = GUITemplates.createMaskedGradientTextfield(this.tfWonItem.text,StyleModule.HEADER_BOLD_12,this.tfWonItem);
            _loc7_.x = this.tfWonItem.x;
            _loc7_.y = this.tfInfo1.y + this.tfInfo1.height + 4;
            addChild(_loc7_);
            this.tfWonItem.visible = false;
         }
         this.tfInfo2 = loadedContent.getChildByName("txt_3") as TextField;
         StyleModule.setTextFieldStyle(this.tfInfo2,StyleModule.HEADER_12);
         StyleModule.setTextFieldCSS(this.tfInfo2);
         if(this.infoTxt2)
         {
            this.tfInfo2.text = "<span class=\'size11\'>" + this.infoTxt2 + "</span>";
            this.tfInfo2.y = this.tfWonItem.y + this.tfWonItem.height + 16;
         }
         var _loc3_:Sprite = new Sprite();
         var _loc4_:Rectangle = _loc2_.getBounds(_loc3_);
         _loc2_.x = -_loc4_.x;
         _loc2_.y = -_loc4_.y;
         _loc2_.x -= _loc4_.width / 2;
         _loc2_.y -= _loc4_.height / 2;
         _loc3_.addChild(_loc2_);
         _loc1_.addChild(_loc3_);
         traceAllChilds();
         super.assignLoadedContentGUI();
         GUITemplates.redrawText(this.tfTitle);
         var _loc5_:Sprite = loadedContent.getChildByName("bear") as Sprite;
         loadedContent.removeChild(_loc5_);
         var _loc6_:MovieClip = windowSkin.getChildByName("background_container") as MovieClip;
         _loc6_.addChild(_loc5_);
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

