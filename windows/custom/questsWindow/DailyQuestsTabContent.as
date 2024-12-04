package windows.custom.questsWindow
{
   import buttons.extended.ButtonZoomable;
   import buttons.simpleButton.BuyButton2LinesSkin;
   import buttons.simpleButton.InfoButtonSkin;
   import components.textfield.gradientText.GradientText;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.events.QuestWindowEvents;
   
   public class DailyQuestsTabContent extends Group
   {
      private var _1332194002background:BitmapImage;
      
      private var _1778494171dailyQuestButton:Button;
      
      private var _1711589350dailyQuestButtonContainer:HGroup;
      
      private var _866989501homeworkText:GradientText;
      
      private var _1197890232mainQuestsInfo:Text;
      
      private var _929096372newQuestsTimeoutCounter:Text;
      
      private var _1829076392newQuestsTimeoutTitle:Text;
      
      private var _2014438210renewQuests:ButtonZoomable;
      
      private var _1691212028rewardText:GradientText;
      
      private var _2136583963rewardsItemsContainer:VGroup;
      
      private var _2145148737selectionFrame:BitmapImage;
      
      private var _1950830202taskItemsContainer:VGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function DailyQuestsTabContent()
      {
         super();
         this.mxmlContent = [this._DailyQuestsTabContent_InnerGroup1_c(),this._DailyQuestsTabContent_OuterGroup1_c()];
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
      
      protected function renewQuests_clickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new QuestWindowEvents(QuestWindowEvents.RENEW_QUESTS_BUTTON_CLICK));
      }
      
      protected function questsAditionalInfo_clickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new QuestWindowEvents(QuestWindowEvents.QUESTS_INFO_BUTTON_CLICK));
      }
      
      protected function dailyQuestButton_clickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new QuestWindowEvents(QuestWindowEvents.QUEST_MAIN_BUTTON_CLICKED));
      }
      
      private function _DailyQuestsTabContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.x = 25;
         _loc1_.y = 144;
         _loc1_.mxmlContent = [this._DailyQuestsTabContent_BitmapImage1_i(),this._DailyQuestsTabContent_Text1_i(),this._DailyQuestsTabContent_Text2_i(),this._DailyQuestsTabContent_ButtonZoomable1_i(),this._DailyQuestsTabContent_Text3_i(),this._DailyQuestsTabContent_Button1_c(),this._DailyQuestsTabContent_GradientText1_i(),this._DailyQuestsTabContent_GradientText2_i(),this._DailyQuestsTabContent_VGroup1_i(),this._DailyQuestsTabContent_VGroup2_i(),this._DailyQuestsTabContent_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DailyQuestsTabContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _DailyQuestsTabContent_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.x = 404;
         _loc1_.y = 17;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("color",3676672);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "newQuestsTimeoutTitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.newQuestsTimeoutTitle = _loc1_;
         BindingManager.executeBindings(this,"newQuestsTimeoutTitle",this.newQuestsTimeoutTitle);
         return _loc1_;
      }
      
      private function _DailyQuestsTabContent_Text2_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.x = 404;
         _loc1_.y = 30;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("color",3676672);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "newQuestsTimeoutCounter";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.newQuestsTimeoutCounter = _loc1_;
         BindingManager.executeBindings(this,"newQuestsTimeoutCounter",this.newQuestsTimeoutCounter);
         return _loc1_;
      }
      
      private function _DailyQuestsTabContent_ButtonZoomable1_i() : ButtonZoomable
      {
         var _loc1_:ButtonZoomable = new ButtonZoomable();
         _loc1_.x = 570;
         _loc1_.y = 5;
         _loc1_.bgScale = 0.42;
         _loc1_.addEventListener("click",this.__renewQuests_click);
         _loc1_.id = "renewQuests";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.renewQuests = _loc1_;
         BindingManager.executeBindings(this,"renewQuests",this.renewQuests);
         return _loc1_;
      }
      
      public function __renewQuests_click(param1:MouseEvent) : void
      {
         this.renewQuests_clickHandler(param1);
      }
      
      private function _DailyQuestsTabContent_Text3_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.x = 40;
         _loc1_.y = 80;
         _loc1_.width = 535;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("color",3676672);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.id = "mainQuestsInfo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainQuestsInfo = _loc1_;
         BindingManager.executeBindings(this,"mainQuestsInfo",this.mainQuestsInfo);
         return _loc1_;
      }
      
      private function _DailyQuestsTabContent_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 605;
         _loc1_.y = 86;
         _loc1_.setStyle("skinClass",InfoButtonSkin);
         _loc1_.addEventListener("click",this.___DailyQuestsTabContent_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      public function ___DailyQuestsTabContent_Button1_click(param1:MouseEvent) : void
      {
         this.questsAditionalInfo_clickHandler(param1);
      }
      
      private function _DailyQuestsTabContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 14;
         _loc1_.fontFamily = "Tahoma";
         _loc1_.fontWeight = "bold";
         _loc1_.text = "Aufgabe";
         _loc1_.x = 173;
         _loc1_.y = 120;
         _loc1_.id = "homeworkText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.homeworkText = _loc1_;
         BindingManager.executeBindings(this,"homeworkText",this.homeworkText);
         return _loc1_;
      }
      
      private function _DailyQuestsTabContent_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 14;
         _loc1_.fontFamily = "Tahoma";
         _loc1_.fontWeight = "bold";
         _loc1_.text = "Belohnung";
         _loc1_.x = 442;
         _loc1_.y = 120;
         _loc1_.id = "rewardText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rewardText = _loc1_;
         BindingManager.executeBindings(this,"rewardText",this.rewardText);
         return _loc1_;
      }
      
      private function _DailyQuestsTabContent_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 60;
         _loc1_.y = 135;
         _loc1_.width = 310;
         _loc1_.height = 180;
         _loc1_.gap = 0;
         _loc1_.id = "taskItemsContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.taskItemsContainer = _loc1_;
         BindingManager.executeBindings(this,"taskItemsContainer",this.taskItemsContainer);
         return _loc1_;
      }
      
      private function _DailyQuestsTabContent_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 460;
         _loc1_.y = 155;
         _loc1_.width = 185;
         _loc1_.height = 180;
         _loc1_.gap = 10;
         _loc1_.id = "rewardsItemsContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rewardsItemsContainer = _loc1_;
         BindingManager.executeBindings(this,"rewardsItemsContainer",this.rewardsItemsContainer);
         return _loc1_;
      }
      
      private function _DailyQuestsTabContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.x = 22;
         _loc1_.y = -8;
         _loc1_.mxmlContent = [this._DailyQuestsTabContent_BitmapImage2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DailyQuestsTabContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 87;
         _loc1_.height = 91;
         _loc1_.initialized(this,"selectionFrame");
         this.selectionFrame = _loc1_;
         BindingManager.executeBindings(this,"selectionFrame",this.selectionFrame);
         return _loc1_;
      }
      
      private function _DailyQuestsTabContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.x = 25;
         _loc1_.y = 140;
         _loc1_.mxmlContent = [this._DailyQuestsTabContent_HGroup1_i(),this._DailyQuestsTabContent_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DailyQuestsTabContent_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.x = 31;
         _loc1_.y = -10;
         _loc1_.width = 385;
         _loc1_.height = 75;
         _loc1_.id = "dailyQuestButtonContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dailyQuestButtonContainer = _loc1_;
         BindingManager.executeBindings(this,"dailyQuestButtonContainer",this.dailyQuestButtonContainer);
         return _loc1_;
      }
      
      private function _DailyQuestsTabContent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.bottom = 5;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("skinClass",BuyButton2LinesSkin);
         _loc1_.addEventListener("click",this.__dailyQuestButton_click);
         _loc1_.id = "dailyQuestButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dailyQuestButton = _loc1_;
         BindingManager.executeBindings(this,"dailyQuestButton",this.dailyQuestButton);
         return _loc1_;
      }
      
      public function __dailyQuestButton_click(param1:MouseEvent) : void
      {
         this.dailyQuestButton_clickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : BitmapImage
      {
         return this._1332194002background;
      }
      
      public function set background(param1:BitmapImage) : void
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
      public function get dailyQuestButton() : Button
      {
         return this._1778494171dailyQuestButton;
      }
      
      public function set dailyQuestButton(param1:Button) : void
      {
         var _loc2_:Object = this._1778494171dailyQuestButton;
         if(_loc2_ !== param1)
         {
            this._1778494171dailyQuestButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dailyQuestButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dailyQuestButtonContainer() : HGroup
      {
         return this._1711589350dailyQuestButtonContainer;
      }
      
      public function set dailyQuestButtonContainer(param1:HGroup) : void
      {
         var _loc2_:Object = this._1711589350dailyQuestButtonContainer;
         if(_loc2_ !== param1)
         {
            this._1711589350dailyQuestButtonContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dailyQuestButtonContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get homeworkText() : GradientText
      {
         return this._866989501homeworkText;
      }
      
      public function set homeworkText(param1:GradientText) : void
      {
         var _loc2_:Object = this._866989501homeworkText;
         if(_loc2_ !== param1)
         {
            this._866989501homeworkText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"homeworkText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainQuestsInfo() : Text
      {
         return this._1197890232mainQuestsInfo;
      }
      
      public function set mainQuestsInfo(param1:Text) : void
      {
         var _loc2_:Object = this._1197890232mainQuestsInfo;
         if(_loc2_ !== param1)
         {
            this._1197890232mainQuestsInfo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainQuestsInfo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get newQuestsTimeoutCounter() : Text
      {
         return this._929096372newQuestsTimeoutCounter;
      }
      
      public function set newQuestsTimeoutCounter(param1:Text) : void
      {
         var _loc2_:Object = this._929096372newQuestsTimeoutCounter;
         if(_loc2_ !== param1)
         {
            this._929096372newQuestsTimeoutCounter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newQuestsTimeoutCounter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get newQuestsTimeoutTitle() : Text
      {
         return this._1829076392newQuestsTimeoutTitle;
      }
      
      public function set newQuestsTimeoutTitle(param1:Text) : void
      {
         var _loc2_:Object = this._1829076392newQuestsTimeoutTitle;
         if(_loc2_ !== param1)
         {
            this._1829076392newQuestsTimeoutTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newQuestsTimeoutTitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get renewQuests() : ButtonZoomable
      {
         return this._2014438210renewQuests;
      }
      
      public function set renewQuests(param1:ButtonZoomable) : void
      {
         var _loc2_:Object = this._2014438210renewQuests;
         if(_loc2_ !== param1)
         {
            this._2014438210renewQuests = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"renewQuests",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewardText() : GradientText
      {
         return this._1691212028rewardText;
      }
      
      public function set rewardText(param1:GradientText) : void
      {
         var _loc2_:Object = this._1691212028rewardText;
         if(_loc2_ !== param1)
         {
            this._1691212028rewardText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewardText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewardsItemsContainer() : VGroup
      {
         return this._2136583963rewardsItemsContainer;
      }
      
      public function set rewardsItemsContainer(param1:VGroup) : void
      {
         var _loc2_:Object = this._2136583963rewardsItemsContainer;
         if(_loc2_ !== param1)
         {
            this._2136583963rewardsItemsContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewardsItemsContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectionFrame() : BitmapImage
      {
         return this._2145148737selectionFrame;
      }
      
      public function set selectionFrame(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2145148737selectionFrame;
         if(_loc2_ !== param1)
         {
            this._2145148737selectionFrame = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectionFrame",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get taskItemsContainer() : VGroup
      {
         return this._1950830202taskItemsContainer;
      }
      
      public function set taskItemsContainer(param1:VGroup) : void
      {
         var _loc2_:Object = this._1950830202taskItemsContainer;
         if(_loc2_ !== param1)
         {
            this._1950830202taskItemsContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"taskItemsContainer",_loc2_,param1));
            }
         }
      }
   }
}

