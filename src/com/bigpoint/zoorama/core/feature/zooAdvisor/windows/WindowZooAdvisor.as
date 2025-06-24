package com.bigpoint.zoorama.core.feature.zooAdvisor.windows
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.feature.zooAdvisor.states.AdvisorState;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.components.scrollbar.ScollingComponent;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.objects.createTextFieldItem;
   import com.bigpoint.zoorama.view.windows.WindowAbstract;
   import com.greensock.*;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class WindowZooAdvisor extends WindowAbstract
   {
      private var buttons:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var icons:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var smileys:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var bubble:Sprite;
      
      private var bubbleArrowLeft:Sprite;
      
      private var bubbleArrowRight:Sprite;
      
      private var _help:Sprite;
      
      private var arrowPointer:Sprite;
      
      private var activeCategory:int = 1;
      
      private var activeHelpItem:int = 1;
      
      private var numberHelpItems:int = 30;
      
      private var helpText:TextField;
      
      private var infoText:TextField;
      
      private var topScroller:ScollingComponent;
      
      private var mainScroller:ScollingComponent;
      
      private var cat1:int = 1;
      
      private var cat2:int = 1;
      
      private var cat3:int = 1;
      
      private var cat4:int = 1;
      
      private var cat5:int = 1;
      
      private var allSpecies:int = 0;
      
      private var currentSpecies:int = 0;
      
      private var totalSpecies:int = 0;
      
      private var percentageHappiness:int = 0;
      
      private var maxDecor:int = 0;
      
      private var babiesCurrent:int = 0;
      
      private var babiesAvailable:int = 0;
      
      private var percentageTrash:int = 0;
      
      public function WindowZooAdvisor()
      {
         super();
         this._isPrimary = true;
      }
      
      override public function startWindow() : void
      {
         super.offsetY = 30;
         super.headerFileName = "header_zoometer";
         super.setWindowPosition();
         this.setContent();
      }
      
      private function setContent() : void
      {
         super.headerFileName = "header_zoometer";
         setHeader();
         this.setOuterContent();
         this.setInnerContent();
      }
      
      override public function setOuterContent() : void
      {
         this.bubble = AssetLibrary.getSprite("WindowGeneralHeaders",AssetConfig.HEADER_ZOO_ADVISOR_WINDOW);
         this.bubble.x = 33;
         this.bubble.y = -8;
         super.outer.addChild(this.bubble);
         this._help = this.bubble.getChildByName("clickArea") as Sprite;
         this.bubbleArrowLeft = AssetLibrary.getSprite("commons",AssetConfig.COMMONS_ARROW_POINTER);
         this.bubbleArrowLeft.x = 120;
         this.bubbleArrowLeft.y = 160;
         this.bubbleArrowLeft.name = "leftArrow";
         this.bubbleArrowLeft.scaleX = 1;
         this.bubbleArrowLeft.scaleY = 1;
         this.bubble.addChild(this.bubbleArrowLeft);
         this.bubbleArrowRight = AssetLibrary.getSprite("commons",AssetConfig.COMMONS_ARROW_POINTER);
         this.bubbleArrowRight.x = 170;
         this.bubbleArrowRight.y = 160;
         this.bubbleArrowRight.name = "rightArrow";
         this.bubbleArrowRight.scaleX = -1;
         this.bubbleArrowRight.scaleY = 1;
         this.bubble.addChild(this.bubbleArrowRight);
      }
      
      override public function setInnerContent() : void
      {
         var _loc3_:Sprite = null;
         var _loc4_:Sprite = null;
         var _loc5_:Sprite = null;
         var _loc1_:Sprite = AssetLibrary.getSprite("WindowSectionBars",AssetConfig.SECTION_TYPE1);
         _loc1_.x = 15;
         _loc1_.y = 130;
         super.inner.addChild(_loc1_);
         var _loc2_:int = 0;
         while(_loc2_ < 5)
         {
            _loc3_ = AssetLibrary.getSprite("commons",AssetConfig.COMMONS_LARGE_STANDARD_BUTTON);
            _loc3_.x = 70;
            _loc3_.y = 168 + _loc2_ * 50;
            _loc3_.name = String(_loc2_);
            _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,this.handleButtonDown);
            _loc3_.addEventListener(MouseEvent.MOUSE_OVER,this.handleButtonOver);
            _loc3_.addEventListener(MouseEvent.MOUSE_OUT,this.handleButtonOut);
            this.addBitmapTextToButtons(_loc3_,_loc2_);
            super.inner.addChild(_loc3_);
            this.buttons.push(_loc3_);
            if(_loc2_ == 0)
            {
               this.setButtonState(_loc3_,"active");
            }
            else
            {
               this.setButtonState(_loc3_,"out");
            }
            switch(_loc2_)
            {
               case 0:
                  _loc4_ = AssetLibrary.getSprite("commons",AssetConfig.COMMONS_CAT1);
                  break;
               case 1:
                  _loc4_ = AssetLibrary.getSprite("commons",AssetConfig.COMMONS_CAT2);
                  break;
               case 2:
                  _loc4_ = AssetLibrary.getSprite("commons",AssetConfig.COMMONS_CAT3);
                  break;
               case 3:
                  _loc4_ = AssetLibrary.getSprite("commons",AssetConfig.COMMONS_CAT4);
                  break;
               case 4:
                  _loc4_ = AssetLibrary.getSprite("commons",AssetConfig.COMMONS_CAT5);
                  break;
            }
            _loc4_.x = _loc3_.x + 5;
            _loc4_.y = _loc3_.y + 20;
            super.inner.addChild(_loc4_);
            this.icons.push(_loc4_);
            this.setIconState(_loc2_,"out");
            _loc5_ = AssetLibrary.getSprite("commons",AssetConfig.COMMONS_HAPPYNESS_ICON);
            _loc5_.x = _loc3_.x + _loc3_.width;
            _loc5_.y = _loc3_.y + 2;
            super.inner.addChild(_loc5_);
            this.smileys.push(_loc5_);
            _loc2_++;
         }
         this.arrowPointer = AssetLibrary.getSprite("commons",AssetConfig.COMMONS_ARROW_POINTER);
         this.arrowPointer.x = this.buttons[0].x + this.buttons[0].width + 45;
         this.arrowPointer.y = this.buttons[0].y + 5;
         super.inner.addChild(this.arrowPointer);
         this.createBubbleTextField();
      }
      
      private function addBitmapTextToButtons(param1:Sprite, param2:int) : void
      {
         var _loc3_:String = "zoo.advisor.buttons." + String(param2 + 1);
         var _loc4_:Bitmap = GUITemplates.createMaskedGradientTextfield(TextResourceModule.getText(_loc3_),StyleModule.HEADER_BOLD_12);
         param1.addChild(_loc4_);
         _loc4_.x = param1.width / 2 - _loc4_.width / 2;
         _loc4_.y = 11;
      }
      
      private function createBubbleTextField() : void
      {
         this.helpText = createTextFieldItem.createNewTextField(180,100,360,70,false,true,"tf",TextFieldType.DYNAMIC,StyleModule.HEADER_BOLD_12_LEFT,3480321,this.bubble,false);
         var _loc1_:int = Math.floor(Math.random() * (1 + this.numberHelpItems - 1)) + 1;
         this.helpText.text = TextResourceModule.getText("zoo.advisor.help." + String(_loc1_));
         this.activeHelpItem = _loc1_;
         this.topScroller = new ScollingComponent(570,90,this.helpText,90,90,5);
         this.bubble.addChild(this.topScroller);
         this.resetTextFields(this.helpText);
         this.topScroller.updateScroller();
         this.enableButtonHeader();
         this.createMainTextField();
      }
      
      private function createMainTextField() : void
      {
         this.infoText = createTextFieldItem.createNewTextField(340,180,250,220,false,true,"tf",TextFieldType.DYNAMIC,StyleModule.HEADER_BOLD_12_LEFT,3480321,super.inner,false);
         this.mainScroller = new ScollingComponent(610,180,this.infoText,210,210,14);
         super.inner.addChild(this.mainScroller);
         this.resetTextFields(this.infoText);
         this.mainScroller.updateScroller();
      }
      
      private function setButtonState(param1:Sprite, param2:String) : void
      {
         var _loc3_:Sprite = param1.getChildByName("BTN_DOWN") as Sprite;
         var _loc4_:Sprite = param1.getChildByName("BTN_OUT") as Sprite;
         var _loc5_:Sprite = param1.getChildByName("BTN_ACTIVE") as Sprite;
         _loc3_.visible = false;
         switch(param2)
         {
            case "out":
               _loc4_.visible = true;
               _loc5_.visible = false;
               param1.addEventListener(MouseEvent.MOUSE_DOWN,this.handleButtonDown);
               param1.addEventListener(MouseEvent.MOUSE_OVER,this.handleButtonOver);
               param1.addEventListener(MouseEvent.MOUSE_OUT,this.handleButtonOut);
               param1.buttonMode = true;
               param1.useHandCursor = true;
               break;
            case "active":
               _loc4_.visible = false;
               _loc5_.visible = true;
               param1.removeEventListener(MouseEvent.MOUSE_DOWN,this.handleButtonDown);
               param1.removeEventListener(MouseEvent.MOUSE_OVER,this.handleButtonOver);
               param1.removeEventListener(MouseEvent.MOUSE_OUT,this.handleButtonOut);
               param1.buttonMode = true;
               param1.useHandCursor = true;
         }
      }
      
      private function handleButtonDown(param1:MouseEvent) : void
      {
         this.resetButtonStates();
         var _loc2_:Sprite = param1.target.parent;
         var _loc3_:int = int(_loc2_.name) + 1;
         this.activeCategory = _loc3_;
         this.setButtonState(param1.target.parent,"active");
         this.setArrowPosition(param1.target.parent);
         this.changeDescriptionTextData();
      }
      
      private function handleButtonOver(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = param1.target.parent;
         var _loc3_:int = int(_loc2_.name) + 1;
         if(_loc3_ != this.activeCategory)
         {
            TweenMax.to(_loc2_,0.5,{"colorTransform":{
               "tint":16777164,
               "tintAmount":0.2
            }});
            this.setIconState(int(_loc2_.name),"over");
         }
      }
      
      private function handleButtonOut(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = param1.target.parent;
         var _loc3_:int = int(_loc2_.name) + 1;
         if(_loc3_ != this.activeCategory)
         {
            TweenMax.to(_loc2_,0.5,{"colorTransform":{
               "tint":16777164,
               "tintAmount":0
            }});
            this.setIconState(int(_loc2_.name),"out");
         }
      }
      
      private function resetButtonStates() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.buttons.length)
         {
            this.setButtonState(this.buttons[_loc1_],"out");
            TweenMax.to(this.buttons[_loc1_],0.5,{"colorTransform":{
               "tint":16777164,
               "tintAmount":0
            }});
            _loc1_++;
         }
      }
      
      private function enableButtonHeader() : void
      {
         this._help.addEventListener(MouseEvent.MOUSE_DOWN,this.changeHelpTextData);
         this._help.buttonMode = true;
         this._help.useHandCursor = true;
         this.bubbleArrowLeft.addEventListener(MouseEvent.MOUSE_DOWN,this.changeHelpTextDataUsingArrows);
         this.bubbleArrowRight.addEventListener(MouseEvent.MOUSE_DOWN,this.changeHelpTextDataUsingArrows);
         this.bubbleArrowLeft.buttonMode = true;
         this.bubbleArrowLeft.useHandCursor = true;
         this.bubbleArrowRight.buttonMode = true;
         this.bubbleArrowRight.useHandCursor = true;
      }
      
      private function setIconState(param1:int, param2:String) : void
      {
         var _loc3_:Sprite = this.icons[param1].getChildByName("over") as Sprite;
         var _loc4_:Sprite = this.icons[param1].getChildByName("out") as Sprite;
         switch(param2)
         {
            case "out":
               _loc3_.visible = false;
               _loc4_.visible = true;
               break;
            case "over":
               _loc3_.visible = true;
               _loc4_.visible = false;
         }
      }
      
      private function setArrowPosition(param1:Sprite) : void
      {
         var _loc2_:int = param1.y + 5;
         TweenMax.to(this.arrowPointer,0.5,{"y":_loc2_});
      }
      
      private function changeHelpTextData(param1:MouseEvent) : void
      {
         if(this.activeHelpItem < this.numberHelpItems)
         {
            ++this.activeHelpItem;
         }
         else if(this.activeHelpItem == this.numberHelpItems)
         {
            this.activeHelpItem = 1;
         }
         this.helpText.text = TextResourceModule.getText("zoo.advisor.help." + String(this.activeHelpItem));
         this.resetTextFields(this.helpText);
         this.topScroller.updateScroller();
      }
      
      private function changeHelpTextDataUsingArrows(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = param1.target as Sprite;
         switch(_loc2_.name)
         {
            case "leftArrow":
               if(this.activeHelpItem > 1)
               {
                  --this.activeHelpItem;
               }
               else if(this.activeHelpItem == 1)
               {
                  this.activeHelpItem = this.numberHelpItems;
               }
               break;
            case "rightArrow":
               if(this.activeHelpItem < this.numberHelpItems)
               {
                  ++this.activeHelpItem;
               }
               else
               {
                  this.activeHelpItem = 1;
               }
         }
         this.helpText.text = TextResourceModule.getText("zoo.advisor.help." + String(this.activeHelpItem));
         this.resetTextFields(this.helpText);
         this.topScroller.updateScroller();
      }
      
      private function changeDescriptionTextData() : void
      {
         var _loc1_:int = 0;
         var _loc2_:String = null;
         var _loc4_:TextReplace = null;
         var _loc5_:TextReplace = null;
         var _loc7_:int = 0;
         var _loc3_:Vector.<TextReplace> = new Vector.<TextReplace>();
         switch(this.activeCategory)
         {
            case 1:
               _loc1_ = this.cat1;
               _loc7_ = this.totalSpecies - this.currentSpecies;
               _loc4_ = new TextReplace("%missingspecies%",String(_loc7_));
               _loc5_ = new TextReplace("%currentspecies%",String(this.allSpecies));
               break;
            case 2:
               _loc1_ = this.cat2;
               _loc4_ = new TextReplace("%none%",String("none"));
               break;
            case 3:
               _loc1_ = this.cat3;
               _loc4_ = new TextReplace("%none%",String("none"));
               break;
            case 4:
               _loc1_ = this.cat4;
               _loc4_ = new TextReplace("%missingbabies%",String(this.babiesAvailable - this.babiesCurrent));
               break;
            case 5:
               _loc1_ = this.cat5;
               _loc4_ = new TextReplace("%none%",String("none"));
         }
         switch(_loc1_)
         {
            case 1:
               _loc2_ = "E";
               break;
            case 2:
               _loc2_ = "D";
               break;
            case 3:
               _loc2_ = "C";
               break;
            case 4:
               _loc2_ = "B";
               break;
            case 5:
               _loc2_ = "A";
         }
         var _loc6_:String = "zoo.advisor.descriptions." + String(this.activeCategory) + "." + _loc2_;
         if(_loc4_)
         {
            _loc3_.push(_loc4_);
         }
         if(_loc5_)
         {
            _loc3_.push(_loc5_);
         }
         this.infoText.text = TextResourceModule.getTextReplaced(_loc6_,_loc3_);
         this.resetTextFields(this.infoText);
         this.mainScroller.updateScroller();
      }
      
      private function resetTextFields(param1:TextField) : void
      {
         var _loc2_:int = param1.width;
         param1.width = _loc2_ + 1;
         param1.width = _loc2_;
         if(this.topScroller)
         {
            this.topScroller.updateScroller();
         }
         if(this.mainScroller)
         {
            this.mainScroller.updateScroller();
         }
      }
      
      public function update(param1:AdvisorState) : void
      {
         this.cat1 = param1.cat1;
         this.cat2 = param1.cat2;
         this.cat3 = param1.cat3;
         this.cat4 = param1.cat4;
         this.cat5 = param1.cat5;
         var _loc2_:MovieClip = this.smileys[0].getChildByName("icons") as MovieClip;
         var _loc3_:MovieClip = this.smileys[1].getChildByName("icons") as MovieClip;
         var _loc4_:MovieClip = this.smileys[2].getChildByName("icons") as MovieClip;
         var _loc5_:MovieClip = this.smileys[3].getChildByName("icons") as MovieClip;
         var _loc6_:MovieClip = this.smileys[4].getChildByName("icons") as MovieClip;
         _loc2_.gotoAndStop(this.cat1);
         _loc3_.gotoAndStop(this.cat2);
         _loc4_.gotoAndStop(this.cat3);
         _loc5_.gotoAndStop(this.cat4);
         _loc6_.gotoAndStop(this.cat5);
         this.allSpecies = param1.allSpecies;
         this.currentSpecies = param1.currentSpecies;
         this.totalSpecies = param1.totalSpecies;
         this.percentageHappiness = param1.percentageHappiness;
         this.maxDecor = param1.maxDecor;
         this.babiesCurrent = param1.babiesCurrent;
         this.babiesAvailable = param1.babiesAvailable;
         this.percentageTrash = param1.percentageTrash;
         this.changeDescriptionTextData();
      }
   }
}

