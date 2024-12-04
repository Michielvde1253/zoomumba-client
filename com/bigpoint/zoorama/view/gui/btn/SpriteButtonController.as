package com.bigpoint.zoorama.view.gui.btn
{
   import com.bigpoint.utils.ColorHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class SpriteButtonController
   {
      protected var button:Sprite;
      
      protected var hasRollStates:Boolean;
      
      protected var onClickFunc:Function;
      
      protected var buttonText:String;
      
      protected var toolText:String;
      
      protected var hasGlow:Boolean;
      
      public function SpriteButtonController(param1:Sprite, param2:Boolean, param3:Function, param4:String = null, param5:String = null, param6:Boolean = false)
      {
         super();
         this.button = param1;
         this.hasRollStates = param2;
         this.onClickFunc = param3;
         this.buttonText = param4;
         this.toolText = param5;
         this.hasGlow = param6;
         this.enable = true;
         this.setButtonLabel();
      }
      
      public function set enable(param1:Boolean) : void
      {
         if(param1)
         {
            if(!this.button.hasEventListener(MouseEvent.ROLL_OVER))
            {
               this.button.addEventListener(MouseEvent.ROLL_OVER,this.handleRollOver);
               this.button.addEventListener(MouseEvent.ROLL_OUT,this.handleRollOut);
               this.button.addEventListener(MouseEvent.MOUSE_DOWN,this.handleButtonDown);
               this.button.addEventListener(MouseEvent.MOUSE_UP,this.handleButtonUp);
            }
            ColorHelper.removeColor(this.button);
         }
         else
         {
            if(this.button.hasEventListener(MouseEvent.ROLL_OVER))
            {
               this.button.removeEventListener(MouseEvent.ROLL_OVER,this.handleRollOver);
               this.button.removeEventListener(MouseEvent.ROLL_OUT,this.handleRollOut);
               this.button.removeEventListener(MouseEvent.MOUSE_DOWN,this.handleButtonDown);
               this.button.removeEventListener(MouseEvent.MOUSE_UP,this.handleButtonUp);
            }
            ColorHelper.applyColor(this.button,ColorHelper.SEPIA);
         }
         this.button.buttonMode = this.button.useHandCursor = param1;
      }
      
      protected function setButtonLabel() : void
      {
         var _loc1_:Bitmap = null;
         if(this.buttonText != null)
         {
            _loc1_ = GUITemplates.createMaskedGradientTextfield(TextResourceModule.getText(this.buttonText),StyleModule.HEADER_BOLD_12);
            this.button.addChild(_loc1_);
            _loc1_.x = this.button.width / 2 - _loc1_.width / 2;
            _loc1_.y = 9;
         }
         this.changeCorrectButtonState("out");
      }
      
      private function handleRollOver(param1:MouseEvent) : void
      {
         if(this.toolText != null)
         {
            TooltipNewManager.setToolTip(param1.target as Sprite,TextResourceModule.getText(this.toolText),true);
         }
         if(this.hasRollStates)
         {
            this.changeCorrectButtonState("over");
         }
      }
      
      private function handleRollOut(param1:MouseEvent) : void
      {
         if(this.toolText != null)
         {
            TooltipNewManager.removeToolTip();
         }
         if(this.hasRollStates)
         {
            this.changeCorrectButtonState("out");
         }
      }
      
      private function handleButtonDown(param1:MouseEvent) : void
      {
         if(this.hasRollStates)
         {
            this.changeCorrectButtonState("down");
         }
      }
      
      private function handleButtonUp(param1:MouseEvent) : void
      {
         if(this.hasRollStates)
         {
            this.changeCorrectButtonState("over");
         }
         this.onClickFunc(param1);
      }
      
      public function changeCorrectButtonState(param1:String) : void
      {
         var bOver:Sprite = null;
         var bDown:Sprite = null;
         var type:String = param1;
         var bOut:Sprite = this.button.getChildByName("BTN_OUT") as Sprite;
         try
         {
            bOver = this.button.getChildByName("BTN_OVER") as Sprite;
         }
         catch(error:Error)
         {
         }
         try
         {
            bDown = this.button.getChildByName("BTN_DOWN") as Sprite;
         }
         catch(error:Error)
         {
         }
         switch(type)
         {
            case "over":
               if(bOut)
               {
                  bOut.visible = false;
               }
               if(bOver)
               {
                  bOver.visible = true;
               }
               if(bDown)
               {
                  bDown.visible = false;
               }
               break;
            case "out":
               if(bOut)
               {
                  bOut.visible = true;
               }
               if(bOver)
               {
                  bOver.visible = false;
               }
               if(bDown)
               {
                  bDown.visible = false;
               }
               break;
            case "down":
               if(bOut)
               {
                  bOut.visible = false;
               }
               if(bOver)
               {
                  bOver.visible = false;
               }
               if(bDown)
               {
                  bDown.visible = true;
               }
               else if(bOver)
               {
                  bOver.visible = true;
               }
         }
      }
   }
}

