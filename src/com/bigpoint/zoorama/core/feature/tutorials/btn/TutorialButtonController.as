package com.bigpoint.zoorama.core.feature.tutorials.btn
{
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.btn.SpriteButtonController;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class TutorialButtonController extends SpriteButtonController
   {
      public function TutorialButtonController(param1:Sprite, param2:Boolean, param3:Function, param4:String = null, param5:String = null, param6:Boolean = false)
      {
         super(param1,param2,param3,param4,param5,param6);
      }
      
      override protected function setButtonLabel() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Bitmap = null;
         if(buttonText != null)
         {
            _loc1_ = -4;
            _loc2_ = -5;
            _loc3_ = GUITemplates.createMaskedGradientTextfield(TextResourceModule.getText(buttonText),StyleModule.HEADER_BOLD_12);
            button.addChild(_loc3_);
            _loc3_.x = button.width / 2 - _loc3_.width / 2 + _loc1_;
            _loc3_.y = button.height / 2 - _loc3_.height / 2 + _loc2_;
         }
         super.changeCorrectButtonState("out");
      }
   }
}

