package windows.custom.events.boardgame
{
   import buttons.simpleButton.InfoButtonBigSkin;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class BoardgameContent extends Group
   {
      private var _314070383animations:UIComponent;
      
      private var _897648112bgGraphics:BitmapImage;
      
      private var _1326704287boardGameContent:UIComponent;
      
      private var _1765359961boardGameContentBlocker:UIComponent;
      
      private var _656595332boardGameContentForeground:UIComponent;
      
      private var _1965619659clickArea:UIComponent;
      
      private var _1853891989collections:UIComponent;
      
      private var _941070890collectionsTween:UIComponent;
      
      private var _1274708295fields:UIComponent;
      
      private var _3237038info:Button;
      
      private var _1721957060outerGroup:OuterGroup;
      
      private var _1438134220outerImageUI:UIComponent;
      
      private var _1100650276rewards:UIComponent;
      
      private var _3556653text:UIComponent;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function BoardgameContent()
      {
         super();
         this.mxmlContent = [this._BoardgameContent_OuterGroup1_i(),this._BoardgameContent_InnerGroup1_c()];
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
      
      private function _BoardgameContent_OuterGroup1_i() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._BoardgameContent_UIComponent1_i(),this._BoardgameContent_UIComponent2_i(),this._BoardgameContent_BitmapImage1_i(),this._BoardgameContent_UIComponent3_i(),this._BoardgameContent_UIComponent4_i(),this._BoardgameContent_UIComponent5_i(),this._BoardgameContent_UIComponent6_i(),this._BoardgameContent_UIComponent7_i(),this._BoardgameContent_UIComponent8_i(),this._BoardgameContent_UIComponent9_i(),this._BoardgameContent_UIComponent10_i(),this._BoardgameContent_Button1_i()];
         _loc1_.id = "outerGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.outerGroup = _loc1_;
         BindingManager.executeBindings(this,"outerGroup",this.outerGroup);
         return _loc1_;
      }
      
      private function _BoardgameContent_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.x = 7;
         _loc1_.id = "boardGameContentForeground";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.boardGameContentForeground = _loc1_;
         BindingManager.executeBindings(this,"boardGameContentForeground",this.boardGameContentForeground);
         return _loc1_;
      }
      
      private function _BoardgameContent_UIComponent2_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "outerImageUI";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.outerImageUI = _loc1_;
         BindingManager.executeBindings(this,"outerImageUI",this.outerImageUI);
         return _loc1_;
      }
      
      private function _BoardgameContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.initialized(this,"bgGraphics");
         this.bgGraphics = _loc1_;
         BindingManager.executeBindings(this,"bgGraphics",this.bgGraphics);
         return _loc1_;
      }
      
      private function _BoardgameContent_UIComponent3_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.x = 0;
         _loc1_.id = "boardGameContentBlocker";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.boardGameContentBlocker = _loc1_;
         BindingManager.executeBindings(this,"boardGameContentBlocker",this.boardGameContentBlocker);
         return _loc1_;
      }
      
      private function _BoardgameContent_UIComponent4_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.x = 10;
         _loc1_.depth = 399;
         _loc1_.id = "fields";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fields = _loc1_;
         BindingManager.executeBindings(this,"fields",this.fields);
         return _loc1_;
      }
      
      private function _BoardgameContent_UIComponent5_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.x = 7;
         _loc1_.depth = 499;
         _loc1_.id = "animations";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.animations = _loc1_;
         BindingManager.executeBindings(this,"animations",this.animations);
         return _loc1_;
      }
      
      private function _BoardgameContent_UIComponent6_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.x = 10;
         _loc1_.depth = 599;
         _loc1_.id = "rewards";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rewards = _loc1_;
         BindingManager.executeBindings(this,"rewards",this.rewards);
         return _loc1_;
      }
      
      private function _BoardgameContent_UIComponent7_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.x = 10;
         _loc1_.depth = 699;
         _loc1_.id = "collections";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.collections = _loc1_;
         BindingManager.executeBindings(this,"collections",this.collections);
         return _loc1_;
      }
      
      private function _BoardgameContent_UIComponent8_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.depth = 799;
         _loc1_.id = "text";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text = _loc1_;
         BindingManager.executeBindings(this,"text",this.text);
         return _loc1_;
      }
      
      private function _BoardgameContent_UIComponent9_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.x = 7;
         _loc1_.depth = 899;
         _loc1_.id = "clickArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.clickArea = _loc1_;
         BindingManager.executeBindings(this,"clickArea",this.clickArea);
         return _loc1_;
      }
      
      private function _BoardgameContent_UIComponent10_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.x = 7;
         _loc1_.depth = 959;
         _loc1_.id = "collectionsTween";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.collectionsTween = _loc1_;
         BindingManager.executeBindings(this,"collectionsTween",this.collectionsTween);
         return _loc1_;
      }
      
      private function _BoardgameContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 40;
         _loc1_.y = 30;
         _loc1_.depth = 999;
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
      
      private function _BoardgameContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.x = 10;
         _loc1_.mxmlContent = [this._BoardgameContent_UIComponent11_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BoardgameContent_UIComponent11_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "boardGameContent";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.boardGameContent = _loc1_;
         BindingManager.executeBindings(this,"boardGameContent",this.boardGameContent);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get animations() : UIComponent
      {
         return this._314070383animations;
      }
      
      public function set animations(param1:UIComponent) : void
      {
         var _loc2_:Object = this._314070383animations;
         if(_loc2_ !== param1)
         {
            this._314070383animations = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animations",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgGraphics() : BitmapImage
      {
         return this._897648112bgGraphics;
      }
      
      public function set bgGraphics(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._897648112bgGraphics;
         if(_loc2_ !== param1)
         {
            this._897648112bgGraphics = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgGraphics",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get boardGameContent() : UIComponent
      {
         return this._1326704287boardGameContent;
      }
      
      public function set boardGameContent(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1326704287boardGameContent;
         if(_loc2_ !== param1)
         {
            this._1326704287boardGameContent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"boardGameContent",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get boardGameContentBlocker() : UIComponent
      {
         return this._1765359961boardGameContentBlocker;
      }
      
      public function set boardGameContentBlocker(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1765359961boardGameContentBlocker;
         if(_loc2_ !== param1)
         {
            this._1765359961boardGameContentBlocker = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"boardGameContentBlocker",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get boardGameContentForeground() : UIComponent
      {
         return this._656595332boardGameContentForeground;
      }
      
      public function set boardGameContentForeground(param1:UIComponent) : void
      {
         var _loc2_:Object = this._656595332boardGameContentForeground;
         if(_loc2_ !== param1)
         {
            this._656595332boardGameContentForeground = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"boardGameContentForeground",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get clickArea() : UIComponent
      {
         return this._1965619659clickArea;
      }
      
      public function set clickArea(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1965619659clickArea;
         if(_loc2_ !== param1)
         {
            this._1965619659clickArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"clickArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get collections() : UIComponent
      {
         return this._1853891989collections;
      }
      
      public function set collections(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1853891989collections;
         if(_loc2_ !== param1)
         {
            this._1853891989collections = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"collections",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get collectionsTween() : UIComponent
      {
         return this._941070890collectionsTween;
      }
      
      public function set collectionsTween(param1:UIComponent) : void
      {
         var _loc2_:Object = this._941070890collectionsTween;
         if(_loc2_ !== param1)
         {
            this._941070890collectionsTween = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"collectionsTween",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fields() : UIComponent
      {
         return this._1274708295fields;
      }
      
      public function set fields(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1274708295fields;
         if(_loc2_ !== param1)
         {
            this._1274708295fields = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fields",_loc2_,param1));
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
      public function get outerGroup() : OuterGroup
      {
         return this._1721957060outerGroup;
      }
      
      public function set outerGroup(param1:OuterGroup) : void
      {
         var _loc2_:Object = this._1721957060outerGroup;
         if(_loc2_ !== param1)
         {
            this._1721957060outerGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outerGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get outerImageUI() : UIComponent
      {
         return this._1438134220outerImageUI;
      }
      
      public function set outerImageUI(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1438134220outerImageUI;
         if(_loc2_ !== param1)
         {
            this._1438134220outerImageUI = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outerImageUI",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewards() : UIComponent
      {
         return this._1100650276rewards;
      }
      
      public function set rewards(param1:UIComponent) : void
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
      public function get text() : UIComponent
      {
         return this._3556653text;
      }
      
      public function set text(param1:UIComponent) : void
      {
         var _loc2_:Object = this._3556653text;
         if(_loc2_ !== param1)
         {
            this._3556653text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text",_loc2_,param1));
            }
         }
      }
   }
}

