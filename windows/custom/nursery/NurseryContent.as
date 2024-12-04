package windows.custom.nursery
{
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import components.image.BackgroundImage;
   import components.image.StandardImage;
   import components.textfield.StandardText;
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplayGoldSkin;
   import components.textfield.labelDisplay.skin.LabelDisplaySkin;
   import custom.card.component.CardGroupHolder;
   import custom.generic.FillableSpot;
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
   
   public class NurseryContent extends Group
   {
      private var _2097344358btnStart:Button;
      
      private var _1378241396bubble:StandardImage;
      
      private var _171849691cardGroupHolder:CardGroupHolder;
      
      private var _94755854clock:LabelDisplay;
      
      private var _104079552money:LabelDisplay;
      
      private var _109620778sonia:StandardImage;
      
      private var _109651822spot0:FillableSpot;
      
      private var _1365610521textBubble:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function NurseryContent()
      {
         super();
         this.mxmlContent = [this._NurseryContent_InnerGroup1_c(),this._NurseryContent_OuterGroup1_c()];
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
      
      private function _NurseryContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._NurseryContent_BackgroundImage1_c(),this._NurseryContent_StandardImage1_i(),this._NurseryContent_StandardText1_i(),this._NurseryContent_FillableSpot1_i(),this._NurseryContent_VGroup1_c(),this._NurseryContent_CardGroupHolder1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NurseryContent_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 1.3;
         _loc1_.y = 75;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NurseryContent_StandardImage1_i() : StandardImage
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
      
      private function _NurseryContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 350;
         _loc1_.x = 225;
         _loc1_.y = 96;
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
      
      private function _NurseryContent_FillableSpot1_i() : FillableSpot
      {
         var _loc1_:FillableSpot = new FillableSpot();
         _loc1_.horizontalCenter = -10;
         _loc1_.verticalCenter = -20;
         _loc1_.id = "spot0";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.spot0 = _loc1_;
         BindingManager.executeBindings(this,"spot0",this.spot0);
         return _loc1_;
      }
      
      private function _NurseryContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.verticalCenter = -8;
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "right";
         _loc1_.right = 200;
         _loc1_.mxmlContent = [this._NurseryContent_LabelDisplay1_i(),this._NurseryContent_LabelDisplay2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NurseryContent_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.type = "clock_red";
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
      
      private function _NurseryContent_LabelDisplay2_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.visible = false;
         _loc1_.setStyle("skinClass",LabelDisplayGoldSkin);
         _loc1_.id = "money";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.money = _loc1_;
         BindingManager.executeBindings(this,"money",this.money);
         return _loc1_;
      }
      
      private function _NurseryContent_CardGroupHolder1_i() : CardGroupHolder
      {
         var _loc1_:CardGroupHolder = null;
         _loc1_ = new CardGroupHolder();
         _loc1_.horizontalTileCenter = 0;
         _loc1_.entriesPerPage = 4;
         _loc1_.currentState = "noForwardArrows";
         _loc1_.height = 175;
         _loc1_.left = 95;
         _loc1_.right = 100;
         _loc1_.y = 285;
         _loc1_.id = "cardGroupHolder";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cardGroupHolder = _loc1_;
         BindingManager.executeBindings(this,"cardGroupHolder",this.cardGroupHolder);
         return _loc1_;
      }
      
      private function _NurseryContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._NurseryContent_StandardImage2_i(),this._NurseryContent_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NurseryContent_StandardImage2_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.x = 37;
         _loc1_.y = 94;
         _loc1_.id = "sonia";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sonia = _loc1_;
         BindingManager.executeBindings(this,"sonia",this.sonia);
         return _loc1_;
      }
      
      private function _NurseryContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.bottom = 22;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._NurseryContent_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NurseryContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "#start#";
         _loc1_.width = 136;
         _loc1_.height = 42;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.addEventListener("click",this.__btnStart_click);
         _loc1_.id = "btnStart";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnStart = _loc1_;
         BindingManager.executeBindings(this,"btnStart",this.btnStart);
         return _loc1_;
      }
      
      public function __btnStart_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("startClicked"));
      }
      
      [Bindable(event="propertyChange")]
      public function get btnStart() : Button
      {
         return this._2097344358btnStart;
      }
      
      public function set btnStart(param1:Button) : void
      {
         var _loc2_:Object = this._2097344358btnStart;
         if(_loc2_ !== param1)
         {
            this._2097344358btnStart = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnStart",_loc2_,param1));
            }
         }
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
      public function get money() : LabelDisplay
      {
         return this._104079552money;
      }
      
      public function set money(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._104079552money;
         if(_loc2_ !== param1)
         {
            this._104079552money = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"money",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sonia() : StandardImage
      {
         return this._109620778sonia;
      }
      
      public function set sonia(param1:StandardImage) : void
      {
         var _loc2_:Object = this._109620778sonia;
         if(_loc2_ !== param1)
         {
            this._109620778sonia = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sonia",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spot0() : FillableSpot
      {
         return this._109651822spot0;
      }
      
      public function set spot0(param1:FillableSpot) : void
      {
         var _loc2_:Object = this._109651822spot0;
         if(_loc2_ !== param1)
         {
            this._109651822spot0 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spot0",_loc2_,param1));
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
   }
}

