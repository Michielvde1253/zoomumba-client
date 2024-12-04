package windows.custom.friends
{
   import components.image.BackgroundImage;
   import components.textfield.StandardText;
   import custom.card.component.CardGroupHolder;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class FriendsContentCardGroup extends Group
   {
      private var _171849691cardGroupHolder:CardGroupHolder;
      
      private var _795439315circleImg:BackgroundImage;
      
      private var _8517484noFriends:BitmapImage;
      
      private var _1537532672soniaPic:BitmapImage;
      
      private var _1716520946speechBubble:BitmapImage;
      
      private var _773784997speechBubbleText:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function FriendsContentCardGroup()
      {
         super();
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._FriendsContentCardGroup_InnerGroup1_c(),this._FriendsContentCardGroup_OuterGroup1_c()];
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
      
      private function _FriendsContentCardGroup_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._FriendsContentCardGroup_CardGroupHolder1_i(),this._FriendsContentCardGroup_BackgroundImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FriendsContentCardGroup_CardGroupHolder1_i() : CardGroupHolder
      {
         var _loc1_:CardGroupHolder = new CardGroupHolder();
         _loc1_.width = 526;
         _loc1_.horizontalCenter = 6;
         _loc1_.height = 332;
         _loc1_.top = 133;
         _loc1_.id = "cardGroupHolder";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cardGroupHolder = _loc1_;
         BindingManager.executeBindings(this,"cardGroupHolder",this.cardGroupHolder);
         return _loc1_;
      }
      
      private function _FriendsContentCardGroup_BackgroundImage1_i() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 1.5;
         _loc1_.x = 0;
         _loc1_.y = 150;
         _loc1_.visible = false;
         _loc1_.id = "circleImg";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.circleImg = _loc1_;
         BindingManager.executeBindings(this,"circleImg",this.circleImg);
         return _loc1_;
      }
      
      private function _FriendsContentCardGroup_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._FriendsContentCardGroup_BitmapImage1_i(),this._FriendsContentCardGroup_StandardText1_i(),this._FriendsContentCardGroup_BitmapImage2_i(),this._FriendsContentCardGroup_BitmapImage3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FriendsContentCardGroup_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 170;
         _loc1_.y = 150;
         _loc1_.visible = false;
         _loc1_.initialized(this,"speechBubble");
         this.speechBubble = _loc1_;
         BindingManager.executeBindings(this,"speechBubble",this.speechBubble);
         return _loc1_;
      }
      
      private function _FriendsContentCardGroup_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 290;
         _loc1_.height = 82;
         _loc1_.x = 240;
         _loc1_.y = 188;
         _loc1_.visible = false;
         _loc1_.id = "speechBubbleText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.speechBubbleText = _loc1_;
         BindingManager.executeBindings(this,"speechBubbleText",this.speechBubbleText);
         return _loc1_;
      }
      
      private function _FriendsContentCardGroup_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 44;
         _loc1_.y = 160;
         _loc1_.visible = false;
         _loc1_.initialized(this,"soniaPic");
         this.soniaPic = _loc1_;
         BindingManager.executeBindings(this,"soniaPic",this.soniaPic);
         return _loc1_;
      }
      
      private function _FriendsContentCardGroup_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 270;
         _loc1_.y = 365;
         _loc1_.visible = false;
         _loc1_.initialized(this,"noFriends");
         this.noFriends = _loc1_;
         BindingManager.executeBindings(this,"noFriends",this.noFriends);
         return _loc1_;
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
      public function get noFriends() : BitmapImage
      {
         return this._8517484noFriends;
      }
      
      public function set noFriends(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._8517484noFriends;
         if(_loc2_ !== param1)
         {
            this._8517484noFriends = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"noFriends",_loc2_,param1));
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

