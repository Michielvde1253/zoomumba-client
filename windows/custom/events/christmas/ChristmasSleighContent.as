package windows.custom.events.christmas
{
   import components.image.BackgroundImage;
   import components.image.StandardImage;
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplaySkin;
   import custom.card.component.CardGroupHolder;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.HGroup;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class ChristmasSleighContent extends Group
   {
      private var _1378241396bubble:StandardImage;
      
      private var _171849691cardGroupHolder:CardGroupHolder;
      
      private var _94755854clock:LabelDisplay;
      
      private var _743235348noReindeers:StandardImage;
      
      private var _109204045santa:StandardImage;
      
      private var _1365610521textBubble:StandardText;
      
      private var _2077368934timeText:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ChristmasSleighContent()
      {
         super();
         this.mxmlContent = [this._ChristmasSleighContent_InnerGroup1_c(),this._ChristmasSleighContent_OuterGroup1_c()];
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
      
      private function _ChristmasSleighContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._ChristmasSleighContent_BackgroundImage1_c(),this._ChristmasSleighContent_StandardImage1_i(),this._ChristmasSleighContent_StandardText1_i(),this._ChristmasSleighContent_StandardImage2_i(),this._ChristmasSleighContent_CardGroupHolder1_i(),this._ChristmasSleighContent_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ChristmasSleighContent_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.y = 75;
         _loc1_.scale = 1.4;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ChristmasSleighContent_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.x = 165;
         _loc1_.y = 60;
         _loc1_.id = "bubble";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bubble = _loc1_;
         BindingManager.executeBindings(this,"bubble",this.bubble);
         return _loc1_;
      }
      
      private function _ChristmasSleighContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.x = 225;
         _loc1_.y = 96;
         _loc1_.width = 350;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "textBubble";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textBubble = _loc1_;
         BindingManager.executeBindings(this,"textBubble",this.textBubble);
         return _loc1_;
      }
      
      private function _ChristmasSleighContent_StandardImage2_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 60;
         _loc1_.id = "noReindeers";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.noReindeers = _loc1_;
         BindingManager.executeBindings(this,"noReindeers",this.noReindeers);
         return _loc1_;
      }
      
      private function _ChristmasSleighContent_CardGroupHolder1_i() : CardGroupHolder
      {
         var _loc1_:CardGroupHolder = null;
         _loc1_ = new CardGroupHolder();
         _loc1_.horizontalTileCenter = 0;
         _loc1_.entriesPerPage = 4;
         _loc1_.currentState = "noForwardArrows";
         _loc1_.height = 175;
         _loc1_.left = 95;
         _loc1_.right = 100;
         _loc1_.y = 250;
         _loc1_.id = "cardGroupHolder";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cardGroupHolder = _loc1_;
         BindingManager.executeBindings(this,"cardGroupHolder",this.cardGroupHolder);
         return _loc1_;
      }
      
      private function _ChristmasSleighContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = 60;
         _loc1_.mxmlContent = [this._ChristmasSleighContent_GradientText1_i(),this._ChristmasSleighContent_LabelDisplay1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ChristmasSleighContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.height = 20;
         _loc1_.id = "timeText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timeText = _loc1_;
         BindingManager.executeBindings(this,"timeText",this.timeText);
         return _loc1_;
      }
      
      private function _ChristmasSleighContent_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.right = 100;
         _loc1_.type = "clock_red";
         _loc1_.verticalCenter = -7;
         _loc1_.setStyle("skinClass",LabelDisplaySkin);
         _loc1_.id = "clock";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.clock = _loc1_;
         BindingManager.executeBindings(this,"clock",this.clock);
         return _loc1_;
      }
      
      private function _ChristmasSleighContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._ChristmasSleighContent_StandardImage3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ChristmasSleighContent_StandardImage3_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.x = 25;
         _loc1_.y = 76;
         _loc1_.id = "santa";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.santa = _loc1_;
         BindingManager.executeBindings(this,"santa",this.santa);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get bubble() : StandardImage
      {
         return this._1378241396bubble;
      }
      
      public function set bubble(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1378241396bubble;
         if(_loc2_ !== param1)
         {
            this._1378241396bubble = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubble",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cardGroupHolder() : CardGroupHolder
      {
         return this._171849691cardGroupHolder;
      }
      
      public function set cardGroupHolder(param1:CardGroupHolder) : void
      {
         var _loc2_:Object = this._171849691cardGroupHolder;
         if(_loc2_ !== param1)
         {
            this._171849691cardGroupHolder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cardGroupHolder",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get clock() : LabelDisplay
      {
         return this._94755854clock;
      }
      
      public function set clock(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._94755854clock;
         if(_loc2_ !== param1)
         {
            this._94755854clock = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"clock",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get noReindeers() : StandardImage
      {
         return this._743235348noReindeers;
      }
      
      public function set noReindeers(param1:StandardImage) : void
      {
         var _loc2_:Object = this._743235348noReindeers;
         if(_loc2_ !== param1)
         {
            this._743235348noReindeers = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"noReindeers",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get santa() : StandardImage
      {
         return this._109204045santa;
      }
      
      public function set santa(param1:StandardImage) : void
      {
         var _loc2_:Object = this._109204045santa;
         if(_loc2_ !== param1)
         {
            this._109204045santa = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"santa",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textBubble() : StandardText
      {
         return this._1365610521textBubble;
      }
      
      public function set textBubble(param1:StandardText) : void
      {
         var _loc2_:Object = this._1365610521textBubble;
         if(_loc2_ !== param1)
         {
            this._1365610521textBubble = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textBubble",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timeText() : GradientText
      {
         return this._2077368934timeText;
      }
      
      public function set timeText(param1:GradientText) : void
      {
         var _loc2_:Object = this._2077368934timeText;
         if(_loc2_ !== param1)
         {
            this._2077368934timeText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timeText",_loc2_,param1));
            }
         }
      }
   }
}

