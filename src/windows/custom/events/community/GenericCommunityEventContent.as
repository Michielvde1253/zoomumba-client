package windows.custom.events.community
{
   import buttons.simpleButton.InfoButtonBigSkin;
   import components.textfield.StandardText;
   import custom.card.component.CardGroupHolder;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.Label;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class GenericCommunityEventContent extends Group
   {
      private var _1292595405backgroundImage:BitmapImage;
      
      private var _171849691cardGroupHolder:CardGroupHolder;
      
      private var _1265176294fieldStep:Group;
      
      private var _635592232foregroundImage:BitmapImage;
      
      private var _3237038info:Button;
      
      private var _1001078227progress:SpriteVisualElement;
      
      private var _178373roundDbg:Label;
      
      private var _1365610521textBubble:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function GenericCommunityEventContent()
      {
         super();
         this.mxmlContent = [this._GenericCommunityEventContent_InnerGroup1_c(),this._GenericCommunityEventContent_OuterGroup1_c()];
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
      
      private function _GenericCommunityEventContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._GenericCommunityEventContent_BitmapImage1_i(),this._GenericCommunityEventContent_SpriteVisualElement1_i(),this._GenericCommunityEventContent_Button1_i(),this._GenericCommunityEventContent_Label1_i(),this._GenericCommunityEventContent_StandardText1_i(),this._GenericCommunityEventContent_CardGroupHolder1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _GenericCommunityEventContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 30;
         _loc1_.top = 20;
         _loc1_.initialized(this,"backgroundImage");
         this.backgroundImage = _loc1_;
         BindingManager.executeBindings(this,"backgroundImage",this.backgroundImage);
         return _loc1_;
      }
      
      private function _GenericCommunityEventContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.left = 190;
         _loc1_.top = 110;
         _loc1_.initialized(this,"progress");
         this.progress = _loc1_;
         BindingManager.executeBindings(this,"progress",this.progress);
         return _loc1_;
      }
      
      private function _GenericCommunityEventContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.left = 55;
         _loc1_.top = 70;
         _loc1_.setStyle("skinClass",InfoButtonBigSkin);
         _loc1_.addEventListener("click",this.__info_click);
         _loc1_.id = "info";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.info = _loc1_;
         BindingManager.executeBindings(this,"info",this.info);
         return _loc1_;
      }
      
      public function __info_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("infoComicClick"));
      }
      
      private function _GenericCommunityEventContent_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = 310;
         _loc1_.top = 50;
         _loc1_.id = "roundDbg";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.roundDbg = _loc1_;
         BindingManager.executeBindings(this,"roundDbg",this.roundDbg);
         return _loc1_;
      }
      
      private function _GenericCommunityEventContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 200;
         _loc1_.left = 390;
         _loc1_.top = 110;
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
      
      private function _GenericCommunityEventContent_CardGroupHolder1_i() : CardGroupHolder
      {
         var _loc1_:CardGroupHolder = new CardGroupHolder();
         _loc1_.width = 260;
         _loc1_.height = 200;
         _loc1_.left = 340;
         _loc1_.top = 210;
         _loc1_.entriesPerPage = 2;
         _loc1_.id = "cardGroupHolder";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cardGroupHolder = _loc1_;
         BindingManager.executeBindings(this,"cardGroupHolder",this.cardGroupHolder);
         return _loc1_;
      }
      
      private function _GenericCommunityEventContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._GenericCommunityEventContent_BitmapImage2_i(),this._GenericCommunityEventContent_Group2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _GenericCommunityEventContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 35;
         _loc1_.bottom = 45;
         _loc1_.initialized(this,"foregroundImage");
         this.foregroundImage = _loc1_;
         BindingManager.executeBindings(this,"foregroundImage",this.foregroundImage);
         return _loc1_;
      }
      
      private function _GenericCommunityEventContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.left = 175;
         _loc1_.top = 120;
         _loc1_.id = "fieldStep";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fieldStep = _loc1_;
         BindingManager.executeBindings(this,"fieldStep",this.fieldStep);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundImage() : BitmapImage
      {
         return this._1292595405backgroundImage;
      }
      
      public function set backgroundImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1292595405backgroundImage;
         if(_loc2_ !== param1)
         {
            this._1292595405backgroundImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundImage",_loc2_,param1));
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
      public function get fieldStep() : Group
      {
         return this._1265176294fieldStep;
      }
      
      public function set fieldStep(param1:Group) : void
      {
         var _loc2_:Object = this._1265176294fieldStep;
         if(_loc2_ !== param1)
         {
            this._1265176294fieldStep = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fieldStep",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get foregroundImage() : BitmapImage
      {
         return this._635592232foregroundImage;
      }
      
      public function set foregroundImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._635592232foregroundImage;
         if(_loc2_ !== param1)
         {
            this._635592232foregroundImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"foregroundImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get info() : Button
      {
         return this._3237038info;
      }
      
      public function set info(param1:Button) : void
      {
         var _loc2_:Object = this._3237038info;
         if(_loc2_ !== param1)
         {
            this._3237038info = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"info",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get progress() : SpriteVisualElement
      {
         return this._1001078227progress;
      }
      
      public function set progress(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1001078227progress;
         if(_loc2_ !== param1)
         {
            this._1001078227progress = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"progress",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get roundDbg() : Label
      {
         return this._178373roundDbg;
      }
      
      public function set roundDbg(param1:Label) : void
      {
         var _loc2_:Object = this._178373roundDbg;
         if(_loc2_ !== param1)
         {
            this._178373roundDbg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"roundDbg",_loc2_,param1));
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

