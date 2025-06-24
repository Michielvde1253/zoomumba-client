package com.bigpoint.zoorama.view.bank
{
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.btn.BasicButton;
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class BankActionButton extends BasicButton
   {
      private var tfTitle:TextField;
      
      private var tfInfo:TextField;
      
      private var selectionArea:MovieClip;
      
      public function BankActionButton()
      {
         super();
      }
      
      override public function set skin(param1:Sprite) : void
      {
         super.skin = param1;
         this.tfTitle = skin.getChildByName("TF_TITLE") as TextField;
         this.tfInfo = skin.getChildByName("TF_INFO") as TextField;
         StyleModule.setTextFieldStyle(this.tfTitle,StyleModule.HEADER_BOLD_9);
         StyleModule.setTextFieldStyle(this.tfInfo,StyleModule.HEADER_BOLD_9);
         StyleModule.setTextFieldCSS(this.tfTitle);
         StyleModule.setTextFieldCSS(this.tfInfo);
         var _loc2_:String = this.tfTitle.text.split(";")[0];
         this.tfTitle.htmlText = "<span class=\'center12\'>" + TextResourceModule.getText(_loc2_) + "</span>";
         var _loc3_:String = this.tfInfo.text.split(";")[0];
         this.tfInfo.text = "<span class=\'center10\'>" + TextResourceModule.getText(_loc3_) + "</span>";
         this.selectionArea = skin.getChildByName("selectedArea") as MovieClip;
         this.selectionArea.alpha = 0;
         s0.visible = true;
         s0.alpha = 1;
         s1.visible = false;
         s1.alpha = 1;
      }
      
      override protected function handleMouseOutHit(param1:MouseEvent) : void
      {
         if(isEnabled)
         {
            super.handleMouseOutHit(param1);
            TweenLite.to(this.selectionArea,0.6,{"alpha":0});
            s0.visible = true;
            s1.visible = false;
         }
      }
      
      override protected function handleMouseOverHit(param1:MouseEvent) : void
      {
         if(isEnabled)
         {
            super.handleMouseOverHit(param1);
            TweenLite.to(this.selectionArea,0.3,{"alpha":1});
            s0.visible = false;
            s1.visible = true;
         }
      }
   }
}

