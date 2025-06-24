package windows.custom.babyCaravan
{
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import components.image.BackgroundImage;
   import components.textfield.StandardText;
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplaySkin;
   import custom.card.component.CardGroupHolder;
   import custom.generic.GenericCircularCounter;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class BabyCaravanContent extends Group
   {
      private var _1615457376animalCounter:GenericCircularCounter;
      
      private var _306950163animalsPic:BitmapImage;
      
      private var _2117595714borrowAnimals:Button;
      
      private var _330672348cardHolder:CardGroupHolder;
      
      private var _795439315circleImg:BackgroundImage;
      
      private var _1352226353countdown:LabelDisplay;
      
      private var _988928889eventStarted:Group;
      
      private var _1537532672soniaPic:BitmapImage;
      
      private var _1716520946speechBubble:BitmapImage;
      
      private var _773784997speechBubbleText:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function BabyCaravanContent()
      {
         super();
         this.width = 400;
         this.height = 300;
         this.mxmlContent = [this._BabyCaravanContent_InnerGroup1_c(),this._BabyCaravanContent_OuterGroup1_c()];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function _BabyCaravanContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._BabyCaravanContent_BackgroundImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BabyCaravanContent_BackgroundImage1_i() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 1.4;
         _loc1_.x = -5;
         _loc1_.y = 50;
         _loc1_.id = "circleImg";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.circleImg = _loc1_;
         BindingManager.executeBindings(this,"circleImg",this.circleImg);
         return _loc1_;
      }
      
      private function _BabyCaravanContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._BabyCaravanContent_BitmapImage1_i(),this._BabyCaravanContent_BitmapImage2_i(),this._BabyCaravanContent_BitmapImage3_i(),this._BabyCaravanContent_StandardText1_i(),this._BabyCaravanContent_Button1_i(),this._BabyCaravanContent_Group2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BabyCaravanContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 30;
         _loc1_.y = 37;
         _loc1_.initialized(this,"soniaPic");
         this.soniaPic = _loc1_;
         BindingManager.executeBindings(this,"soniaPic",this.soniaPic);
         return _loc1_;
      }
      
      private function _BabyCaravanContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 205;
         _loc1_.initialized(this,"animalsPic");
         this.animalsPic = _loc1_;
         BindingManager.executeBindings(this,"animalsPic",this.animalsPic);
         return _loc1_;
      }
      
      private function _BabyCaravanContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 175;
         _loc1_.y = 45;
         _loc1_.initialized(this,"speechBubble");
         this.speechBubble = _loc1_;
         BindingManager.executeBindings(this,"speechBubble",this.speechBubble);
         return _loc1_;
      }
      
      private function _BabyCaravanContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 330;
         _loc1_.height = 130;
         _loc1_.x = 217;
         _loc1_.y = 78;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "speechBubbleText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.speechBubbleText = _loc1_;
         BindingManager.executeBindings(this,"speechBubbleText",this.speechBubbleText);
         return _loc1_;
      }
      
      private function _BabyCaravanContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 260;
         _loc1_.y = 386;
         _loc1_.width = 140;
         _loc1_.height = 53;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.addEventListener("click",this.__borrowAnimals_click);
         _loc1_.id = "borrowAnimals";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.borrowAnimals = _loc1_;
         BindingManager.executeBindings(this,"borrowAnimals",this.borrowAnimals);
         return _loc1_;
      }
      
      public function __borrowAnimals_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("borrowCaravanAnimals"));
      }
      
      private function _BabyCaravanContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._BabyCaravanContent_LabelDisplay1_i(),this._BabyCaravanContent_GenericCircularCounter1_i(),this._BabyCaravanContent_CardGroupHolder1_i()];
         _loc1_.id = "eventStarted";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.eventStarted = _loc1_;
         BindingManager.executeBindings(this,"eventStarted",this.eventStarted);
         return _loc1_;
      }
      
      private function _BabyCaravanContent_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.x = 66;
         _loc1_.y = 244;
         _loc1_.text = "00:00:00";
         _loc1_.type = "clock_red";
         _loc1_.setStyle("skinClass",LabelDisplaySkin);
         _loc1_.id = "countdown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.countdown = _loc1_;
         BindingManager.executeBindings(this,"countdown",this.countdown);
         return _loc1_;
      }
      
      private function _BabyCaravanContent_GenericCircularCounter1_i() : GenericCircularCounter
      {
         var _loc1_:GenericCircularCounter = new GenericCircularCounter();
         _loc1_.x = 96;
         _loc1_.y = 310;
         _loc1_.id = "animalCounter";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.animalCounter = _loc1_;
         BindingManager.executeBindings(this,"animalCounter",this.animalCounter);
         return _loc1_;
      }
      
      private function _BabyCaravanContent_CardGroupHolder1_i() : CardGroupHolder
      {
         var _loc1_:CardGroupHolder = new CardGroupHolder();
         _loc1_.x = 196;
         _loc1_.y = 221;
         _loc1_.id = "cardHolder";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cardHolder = _loc1_;
         BindingManager.executeBindings(this,"cardHolder",this.cardHolder);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get animalCounter() : GenericCircularCounter
      {
         return this._1615457376animalCounter;
      }
      
      public function set animalCounter(param1:GenericCircularCounter) : void
      {
         var _loc2_:Object = this._1615457376animalCounter;
         if(_loc2_ !== param1)
         {
            this._1615457376animalCounter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animalCounter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get animalsPic() : BitmapImage
      {
         return this._306950163animalsPic;
      }
      
      public function set animalsPic(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._306950163animalsPic;
         if(_loc2_ !== param1)
         {
            this._306950163animalsPic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animalsPic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get borrowAnimals() : Button
      {
         return this._2117595714borrowAnimals;
      }
      
      public function set borrowAnimals(param1:Button) : void
      {
         var _loc2_:Object = this._2117595714borrowAnimals;
         if(_loc2_ !== param1)
         {
            this._2117595714borrowAnimals = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borrowAnimals",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cardHolder() : CardGroupHolder
      {
         return this._330672348cardHolder;
      }
      
      public function set cardHolder(param1:CardGroupHolder) : void
      {
         var _loc2_:Object = this._330672348cardHolder;
         if(_loc2_ !== param1)
         {
            this._330672348cardHolder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cardHolder",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get circleImg() : BackgroundImage
      {
         return this._795439315circleImg;
      }
      
      public function set circleImg(param1:BackgroundImage) : void
      {
         var _loc2_:Object = this._795439315circleImg;
         if(_loc2_ !== param1)
         {
            this._795439315circleImg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"circleImg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get countdown() : LabelDisplay
      {
         return this._1352226353countdown;
      }
      
      public function set countdown(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1352226353countdown;
         if(_loc2_ !== param1)
         {
            this._1352226353countdown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"countdown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get eventStarted() : Group
      {
         return this._988928889eventStarted;
      }
      
      public function set eventStarted(param1:Group) : void
      {
         var _loc2_:Object = this._988928889eventStarted;
         if(_loc2_ !== param1)
         {
            this._988928889eventStarted = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"eventStarted",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soniaPic() : BitmapImage
      {
         return this._1537532672soniaPic;
      }
      
      public function set soniaPic(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1537532672soniaPic;
         if(_loc2_ !== param1)
         {
            this._1537532672soniaPic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soniaPic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get speechBubble() : BitmapImage
      {
         return this._1716520946speechBubble;
      }
      
      public function set speechBubble(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1716520946speechBubble;
         if(_loc2_ !== param1)
         {
            this._1716520946speechBubble = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"speechBubble",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get speechBubbleText() : StandardText
      {
         return this._773784997speechBubbleText;
      }
      
      public function set speechBubbleText(param1:StandardText) : void
      {
         var _loc2_:Object = this._773784997speechBubbleText;
         if(_loc2_ !== param1)
         {
            this._773784997speechBubbleText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"speechBubbleText",_loc2_,param1));
            }
         }
      }
   }
}

