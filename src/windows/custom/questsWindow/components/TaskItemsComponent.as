package windows.custom.questsWindow.components
{
   import components.image.BackgroundImage;
   import components.textfield.gradientText.GradientText;
   import flash.display.MovieClip;
   import mx.binding.BindingManager;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   
   public class TaskItemsComponent extends Group
   {
      private static const EMPTY_ACTION:String = "empty";
      
      private var _1851532239actionIcon:Image;
      
      private var _1698508100actionMultiplayer:GradientText;
      
      private var _1004005791owicon:BitmapImage;
      
      private var _1774005744targetContainer:SpriteVisualElement;
      
      private var _72229641targetMultiplayer:GradientText;
      
      private var _410615129taskDone:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _action:String = "";
      
      public var animalId:int;
      
      private var _embed_mxml__components_ComponentIcons_swf_ArrowRight_460786940:Class = TaskItemsComponent__embed_mxml__components_ComponentIcons_swf_ArrowRight_460786940;
      
      private var _embed_mxml__components_ComponentIcons_swf_owicon_1608429778:Class = TaskItemsComponent__embed_mxml__components_ComponentIcons_swf_owicon_1608429778;
      
      private var _embed_mxml__removeFromHere_icons_swf_actionIcons_842570147:Class = TaskItemsComponent__embed_mxml__removeFromHere_icons_swf_actionIcons_842570147;
      
      public function TaskItemsComponent()
      {
         super();
         this.width = 300;
         this.height = 65;
         this.mxmlContent = [this._TaskItemsComponent_Group2_c(),this._TaskItemsComponent_GradientText1_i(),this._TaskItemsComponent_BitmapImage1_c(),this._TaskItemsComponent_BitmapImage2_i(),this._TaskItemsComponent_BitmapImage3_i(),this._TaskItemsComponent_GradientText2_i(),this._TaskItemsComponent_SpriteVisualElement1_i()];
         this.addEventListener("creationComplete",this.___TaskItemsComponent_Group1_creationComplete);
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
      
      public function get action() : String
      {
         return this._action;
      }
      
      public function set action(param1:String) : void
      {
         this._action = param1;
         if(this._action == "breed" || this._action == "clean_0" || this._action == "clean_1" || this._action == "heal" || this._action == "cuddle_0" || this._action == "cuddle_1" || this._action == "water" || this._action == "feed_all" || this._action == "feed_2" || this._action == "feed_3" || this._action == "feed_4" || this._action == "feed_5" || this._action == "feed_6" || this._action == "feed_16" || this._action == "feed_17" || this._action == "feed_18" || this._action == "feed_19")
         {
            (this.actionIcon.content as MovieClip).gotoAndStop(this._action);
         }
         else
         {
            (this.actionIcon.content as MovieClip).gotoAndStop(TaskItemsComponent.EMPTY_ACTION);
         }
      }
      
      protected function handleUpdateCompleate(param1:FlexEvent) : void
      {
      }
      
      public function set actionCount(param1:int) : void
      {
         if(param1 > 0)
         {
            this.targetMultiplayer.visible = true;
            this.targetMultiplayer.text = param1.toString() + "x";
         }
         else
         {
            this.taskDone.visible = true;
         }
      }
      
      private function _TaskItemsComponent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 62;
         _loc1_.y = 45;
         _loc1_.width = 50;
         _loc1_.height = 50;
         _loc1_.maxWidth = 50;
         _loc1_.maxHeight = 50;
         _loc1_.mxmlContent = [this._TaskItemsComponent_BackgroundImage1_c(),this._TaskItemsComponent_Image1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _TaskItemsComponent_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = null;
         _loc1_ = new BackgroundImage();
         _loc1_.currentState = "inner";
         _loc1_.x = -55;
         _loc1_.y = -48;
         _loc1_.scale = 0.57;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _TaskItemsComponent_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.horizontalCenter = 0;
         _loc1_.source = this._embed_mxml__removeFromHere_icons_swf_actionIcons_842570147;
         _loc1_.verticalCenter = 0;
         _loc1_.id = "actionIcon";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.actionIcon = _loc1_;
         BindingManager.executeBindings(this,"actionIcon",this.actionIcon);
         return _loc1_;
      }
      
      private function _TaskItemsComponent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.x = -25;
         _loc1_.y = 22;
         _loc1_.width = 60;
         _loc1_.fontFamily = "Tahoma";
         _loc1_.fontSize = 14;
         _loc1_.fontWeight = "bold";
         _loc1_.text = "";
         _loc1_.textAlign = "left";
         _loc1_.id = "actionMultiplayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.actionMultiplayer = _loc1_;
         BindingManager.executeBindings(this,"actionMultiplayer",this.actionMultiplayer);
         return _loc1_;
      }
      
      private function _TaskItemsComponent_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 125;
         _loc1_.y = 14;
         _loc1_.scaleX = 0.49;
         _loc1_.scaleY = 0.49;
         _loc1_.source = this._embed_mxml__components_ComponentIcons_swf_ArrowRight_460786940;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _TaskItemsComponent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.visible = false;
         _loc1_.x = 294;
         _loc1_.y = 20;
         _loc1_.initialized(this,"taskDone");
         this.taskDone = _loc1_;
         BindingManager.executeBindings(this,"taskDone",this.taskDone);
         return _loc1_;
      }
      
      private function _TaskItemsComponent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 255;
         _loc1_.y = 37;
         _loc1_.visible = false;
         _loc1_.depth = 999;
         _loc1_.source = this._embed_mxml__components_ComponentIcons_swf_owicon_1608429778;
         _loc1_.initialized(this,"owicon");
         this.owicon = _loc1_;
         BindingManager.executeBindings(this,"owicon",this.owicon);
         return _loc1_;
      }
      
      private function _TaskItemsComponent_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.visible = false;
         _loc1_.x = 170;
         _loc1_.y = 22;
         _loc1_.width = 60;
         _loc1_.fontFamily = "Tahoma";
         _loc1_.fontSize = 14;
         _loc1_.fontWeight = "bold";
         _loc1_.text = "";
         _loc1_.textAlign = "left";
         _loc1_.id = "targetMultiplayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.targetMultiplayer = _loc1_;
         BindingManager.executeBindings(this,"targetMultiplayer",this.targetMultiplayer);
         return _loc1_;
      }
      
      private function _TaskItemsComponent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 246;
         _loc1_.y = 33;
         _loc1_.scaleX = 0.8;
         _loc1_.scaleY = 0.8;
         _loc1_.initialized(this,"targetContainer");
         this.targetContainer = _loc1_;
         BindingManager.executeBindings(this,"targetContainer",this.targetContainer);
         return _loc1_;
      }
      
      public function ___TaskItemsComponent_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.handleUpdateCompleate(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get actionIcon() : Image
      {
         return this._1851532239actionIcon;
      }
      
      public function set actionIcon(param1:Image) : void
      {
         var _loc2_:Object = this._1851532239actionIcon;
         if(_loc2_ !== param1)
         {
            this._1851532239actionIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actionIcon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get actionMultiplayer() : GradientText
      {
         return this._1698508100actionMultiplayer;
      }
      
      public function set actionMultiplayer(param1:GradientText) : void
      {
         var _loc2_:Object = this._1698508100actionMultiplayer;
         if(_loc2_ !== param1)
         {
            this._1698508100actionMultiplayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actionMultiplayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get owicon() : BitmapImage
      {
         return this._1004005791owicon;
      }
      
      public function set owicon(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1004005791owicon;
         if(_loc2_ !== param1)
         {
            this._1004005791owicon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"owicon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get targetContainer() : SpriteVisualElement
      {
         return this._1774005744targetContainer;
      }
      
      public function set targetContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1774005744targetContainer;
         if(_loc2_ !== param1)
         {
            this._1774005744targetContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"targetContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get targetMultiplayer() : GradientText
      {
         return this._72229641targetMultiplayer;
      }
      
      public function set targetMultiplayer(param1:GradientText) : void
      {
         var _loc2_:Object = this._72229641targetMultiplayer;
         if(_loc2_ !== param1)
         {
            this._72229641targetMultiplayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"targetMultiplayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get taskDone() : BitmapImage
      {
         return this._410615129taskDone;
      }
      
      public function set taskDone(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._410615129taskDone;
         if(_loc2_ !== param1)
         {
            this._410615129taskDone = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"taskDone",_loc2_,param1));
            }
         }
      }
   }
}

