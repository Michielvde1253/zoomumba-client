package windows.custom.cinema
{
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import components.image.StandardImage;
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import custom.features.cinema.RewardOption;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class CinemaContent extends Group
   {
      private var _1332194002background:StandardImage;
      
      private var _100361836intro:StandardText;
      
      private var _1857272540leftPenguim:StandardImage;
      
      private var _1097557894playButton:Button;
      
      private var _880436485rewardLabel:GradientText;
      
      private var _1100650276rewards:HGroup;
      
      private var _1356173679rightPenguim:StandardImage;
      
      private var _873960692ticket:Group;
      
      private var _343485256ticketLabel:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _selectedValue:int;
      
      public function CinemaContent()
      {
         super();
         this.mxmlContent = [this._CinemaContent_InnerGroup1_c(),this._CinemaContent_OuterGroup1_c()];
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
      
      public function get selectedValue() : int
      {
         return this._selectedValue;
      }
      
      public function selectReward(param1:RewardOption) : int
      {
         var _loc2_:int = this.rewards.numElements - 1;
         while(_loc2_ >= 0)
         {
            (this.rewards.getElementAt(_loc2_) as RewardOption).currentState = "default";
            _loc2_--;
         }
         param1.currentState = "selected";
         this._selectedValue = param1.value;
         return param1.value;
      }
      
      public function addReward(param1:int, param2:int, param3:Sprite, param4:String = null, param5:String = "default") : RewardOption
      {
         var _loc6_:RewardOption = null;
         _loc6_ = new RewardOption();
         _loc6_.reward.thumb.addChild(param3);
         _loc6_.value = param1;
         _loc6_.amount = param2.toString();
         _loc6_.currentState = param5;
         _loc6_.toolTip = param4;
         this.rewards.addElement(_loc6_);
         if(param5 == "selected")
         {
            this.selectReward(_loc6_);
         }
         return _loc6_;
      }
      
      private function _CinemaContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._CinemaContent_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CinemaContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.y = 20;
         _loc1_.mxmlContent = [this._CinemaContent_Group2_c(),this._CinemaContent_VGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CinemaContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._CinemaContent_StandardImage1_i(),this._CinemaContent_Group3_i(),this._CinemaContent_StandardText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CinemaContent_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "background";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _CinemaContent_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._CinemaContent_GradientText1_i()];
         _loc1_.id = "ticket";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ticket = _loc1_;
         BindingManager.executeBindings(this,"ticket",this.ticket);
         return _loc1_;
      }
      
      private function _CinemaContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.x = 112;
         _loc1_.y = 57;
         _loc1_.width = 30;
         _loc1_.id = "ticketLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ticketLabel = _loc1_;
         BindingManager.executeBindings(this,"ticketLabel",this.ticketLabel);
         return _loc1_;
      }
      
      private function _CinemaContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.y = 110;
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 410;
         _loc1_.setStyle("fontSize",11);
         _loc1_.id = "intro";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.intro = _loc1_;
         BindingManager.executeBindings(this,"intro",this.intro);
         return _loc1_;
      }
      
      private function _CinemaContent_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 10;
         _loc1_.horizontalCenter = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._CinemaContent_GradientText2_i(),this._CinemaContent_HGroup1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CinemaContent_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 14;
         _loc1_.id = "rewardLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rewardLabel = _loc1_;
         BindingManager.executeBindings(this,"rewardLabel",this.rewardLabel);
         return _loc1_;
      }
      
      private function _CinemaContent_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 20;
         _loc1_.id = "rewards";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rewards = _loc1_;
         BindingManager.executeBindings(this,"rewards",this.rewards);
         return _loc1_;
      }
      
      private function _CinemaContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._CinemaContent_Group4_c(),this._CinemaContent_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CinemaContent_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.y = 270;
         _loc1_.mxmlContent = [this._CinemaContent_StandardImage2_i(),this._CinemaContent_StandardImage3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CinemaContent_StandardImage2_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.x = 30;
         _loc1_.id = "leftPenguim";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.leftPenguim = _loc1_;
         BindingManager.executeBindings(this,"leftPenguim",this.leftPenguim);
         return _loc1_;
      }
      
      private function _CinemaContent_StandardImage3_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.x = 450;
         _loc1_.y = 45;
         _loc1_.id = "rightPenguim";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rightPenguim = _loc1_;
         BindingManager.executeBindings(this,"rightPenguim",this.rightPenguim);
         return _loc1_;
      }
      
      private function _CinemaContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.y = 340;
         _loc1_.width = 120;
         _loc1_.height = 50;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("fontSize",40);
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.addEventListener("click",this.__playButton_click);
         _loc1_.id = "playButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.playButton = _loc1_;
         BindingManager.executeBindings(this,"playButton",this.playButton);
         return _loc1_;
      }
      
      public function __playButton_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("playVideo",true));
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : StandardImage
      {
         return this._1332194002background;
      }
      
      public function set background(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get intro() : StandardText
      {
         return this._100361836intro;
      }
      
      public function set intro(param1:StandardText) : void
      {
         var _loc2_:Object = this._100361836intro;
         if(_loc2_ !== param1)
         {
            this._100361836intro = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"intro",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get leftPenguim() : StandardImage
      {
         return this._1857272540leftPenguim;
      }
      
      public function set leftPenguim(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1857272540leftPenguim;
         if(_loc2_ !== param1)
         {
            this._1857272540leftPenguim = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"leftPenguim",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get playButton() : Button
      {
         return this._1097557894playButton;
      }
      
      public function set playButton(param1:Button) : void
      {
         var _loc2_:Object = this._1097557894playButton;
         if(_loc2_ !== param1)
         {
            this._1097557894playButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewardLabel() : GradientText
      {
         return this._880436485rewardLabel;
      }
      
      public function set rewardLabel(param1:GradientText) : void
      {
         var _loc2_:Object = this._880436485rewardLabel;
         if(_loc2_ !== param1)
         {
            this._880436485rewardLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewardLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewards() : HGroup
      {
         return this._1100650276rewards;
      }
      
      public function set rewards(param1:HGroup) : void
      {
         var _loc2_:Object = this._1100650276rewards;
         if(_loc2_ !== param1)
         {
            this._1100650276rewards = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewards",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rightPenguim() : StandardImage
      {
         return this._1356173679rightPenguim;
      }
      
      public function set rightPenguim(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1356173679rightPenguim;
         if(_loc2_ !== param1)
         {
            this._1356173679rightPenguim = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rightPenguim",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ticket() : Group
      {
         return this._873960692ticket;
      }
      
      public function set ticket(param1:Group) : void
      {
         var _loc2_:Object = this._873960692ticket;
         if(_loc2_ !== param1)
         {
            this._873960692ticket = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ticket",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ticketLabel() : GradientText
      {
         return this._343485256ticketLabel;
      }
      
      public function set ticketLabel(param1:GradientText) : void
      {
         var _loc2_:Object = this._343485256ticketLabel;
         if(_loc2_ !== param1)
         {
            this._343485256ticketLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ticketLabel",_loc2_,param1));
            }
         }
      }
   }
}

