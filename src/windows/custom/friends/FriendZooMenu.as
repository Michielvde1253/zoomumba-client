package windows.custom.friends
{
   import buttons.extended.ButtonCircularZoomable;
   import buttons.skin.circularZoomable.ButtonCustomCircularSkin;
   import com.bigpoint.zoomumba.constants.FRIENDS;
   import components.textfield.labelBox.LabelBox;
   import components.textfield.labelBox.skin.LabelRectBox;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   
   public class FriendZooMenu extends Group
   {
      private var _428651151avatarPic:SpriteVisualElement;
      
      private var _2000506502btBackToZoo:ButtonCircularZoomable;
      
      private var _265713450username:LabelBox;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function FriendZooMenu()
      {
         super();
         this.right = 0;
         this.top = 0;
         this.mxmlContent = [this._FriendZooMenu_Group2_c()];
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
      
      private function _FriendZooMenu_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 80;
         _loc1_.y = 80;
         _loc1_.mxmlContent = [this._FriendZooMenu_Group3_c(),this._FriendZooMenu_ButtonCircularZoomable1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FriendZooMenu_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 35;
         _loc1_.y = 70;
         _loc1_.mxmlContent = [this._FriendZooMenu_Group4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FriendZooMenu_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._FriendZooMenu_Group5_c(),this._FriendZooMenu_Group6_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FriendZooMenu_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._FriendZooMenu_SpriteVisualElement1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FriendZooMenu_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 35;
         _loc1_.initialized(this,"avatarPic");
         this.avatarPic = _loc1_;
         BindingManager.executeBindings(this,"avatarPic",this.avatarPic);
         return _loc1_;
      }
      
      private function _FriendZooMenu_Group6_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.y = 30;
         _loc1_.mxmlContent = [this._FriendZooMenu_LabelBox1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FriendZooMenu_LabelBox1_i() : LabelBox
      {
         var _loc1_:LabelBox = new LabelBox();
         _loc1_.setStyle("skinClass",LabelRectBox);
         _loc1_.id = "username";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.username = _loc1_;
         BindingManager.executeBindings(this,"username",this.username);
         return _loc1_;
      }
      
      private function _FriendZooMenu_ButtonCircularZoomable1_i() : ButtonCircularZoomable
      {
         var _loc1_:ButtonCircularZoomable = new ButtonCircularZoomable();
         _loc1_.setStyle("skinClass",ButtonCustomCircularSkin);
         _loc1_.addEventListener("click",this.__btBackToZoo_click);
         _loc1_.id = "btBackToZoo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btBackToZoo = _loc1_;
         BindingManager.executeBindings(this,"btBackToZoo",this.btBackToZoo);
         return _loc1_;
      }
      
      public function __btBackToZoo_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(FRIENDS.RETURN_TO_OWN_ZOO,true));
      }
      
      [Bindable(event="propertyChange")]
      public function get avatarPic() : SpriteVisualElement
      {
         return this._428651151avatarPic;
      }
      
      public function set avatarPic(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._428651151avatarPic;
         if(_loc2_ !== param1)
         {
            this._428651151avatarPic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"avatarPic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btBackToZoo() : ButtonCircularZoomable
      {
         return this._2000506502btBackToZoo;
      }
      
      public function set btBackToZoo(param1:ButtonCircularZoomable) : void
      {
         var _loc2_:Object = this._2000506502btBackToZoo;
         if(_loc2_ !== param1)
         {
            this._2000506502btBackToZoo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btBackToZoo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get username() : LabelBox
      {
         return this._265713450username;
      }
      
      public function set username(param1:LabelBox) : void
      {
         var _loc2_:Object = this._265713450username;
         if(_loc2_ !== param1)
         {
            this._265713450username = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"username",_loc2_,param1));
            }
         }
      }
   }
}

