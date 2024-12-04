package windows.custom.friends
{
   import buttons.extended.ButtonCircularZoomable;
   import buttons.skin.circularZoomable.ButtonCustomCircularSkin;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import windows.core.InnerGroup;
   
   public class RefreshFriendList extends Group
   {
      private var _949408085refreshListButton:ButtonCircularZoomable;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_ComponentIcons_swf_Refresh_2120242164:Class = RefreshFriendList__embed_mxml__components_ComponentIcons_swf_Refresh_2120242164;
      
      public function RefreshFriendList()
      {
         super();
         this.width = 400;
         this.height = 300;
         this.mxmlContent = [this._RefreshFriendList_InnerGroup1_c()];
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
      
      private function _RefreshFriendList_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._RefreshFriendList_ButtonCircularZoomable1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RefreshFriendList_ButtonCircularZoomable1_i() : ButtonCircularZoomable
      {
         var _loc1_:ButtonCircularZoomable = new ButtonCircularZoomable();
         _loc1_.iconClass = this._embed_mxml__components_ComponentIcons_swf_Refresh_2120242164;
         _loc1_.x = 100;
         _loc1_.y = 77;
         _loc1_.bgScale = 0.4;
         _loc1_.setStyle("skinClass",ButtonCustomCircularSkin);
         _loc1_.addEventListener("click",this.__refreshListButton_click);
         _loc1_.id = "refreshListButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.refreshListButton = _loc1_;
         BindingManager.executeBindings(this,"refreshListButton",this.refreshListButton);
         return _loc1_;
      }
      
      public function __refreshListButton_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("refreshFriendList",true));
      }
      
      [Bindable(event="propertyChange")]
      public function get refreshListButton() : ButtonCircularZoomable
      {
         return this._949408085refreshListButton;
      }
      
      public function set refreshListButton(param1:ButtonCircularZoomable) : void
      {
         var _loc2_:Object = this._949408085refreshListButton;
         if(_loc2_ !== param1)
         {
            this._949408085refreshListButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"refreshListButton",_loc2_,param1));
            }
         }
      }
   }
}

