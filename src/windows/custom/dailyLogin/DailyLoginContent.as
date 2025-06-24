package windows.custom.dailyLogin
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class DailyLoginContent extends Group
   {
      private var _1509427408dailyLogin:UIComponent;
      
      private var _2030561337fron1Group:Group;
      
      private var _2059190488fron2Group:Group;
      
      private var _1266096344front1:UIComponent;
      
      private var _1266096343front2:UIComponent;
      
      private var _7423010mainview:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _selectedValue:int;
      
      public function DailyLoginContent()
      {
         super();
         this.mxmlContent = [this._DailyLoginContent_InnerGroup1_c(),this._DailyLoginContent_OuterGroup1_c()];
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
      
      private function _DailyLoginContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._DailyLoginContent_Group2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DailyLoginContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.mxmlContent = [this._DailyLoginContent_UIComponent1_i()];
         _loc1_.id = "mainview";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainview = _loc1_;
         BindingManager.executeBindings(this,"mainview",this.mainview);
         return _loc1_;
      }
      
      private function _DailyLoginContent_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "dailyLogin";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dailyLogin = _loc1_;
         BindingManager.executeBindings(this,"dailyLogin",this.dailyLogin);
         return _loc1_;
      }
      
      private function _DailyLoginContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._DailyLoginContent_Group3_i(),this._DailyLoginContent_Group4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DailyLoginContent_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.mxmlContent = [this._DailyLoginContent_UIComponent2_i()];
         _loc1_.id = "fron1Group";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fron1Group = _loc1_;
         BindingManager.executeBindings(this,"fron1Group",this.fron1Group);
         return _loc1_;
      }
      
      private function _DailyLoginContent_UIComponent2_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "front1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.front1 = _loc1_;
         BindingManager.executeBindings(this,"front1",this.front1);
         return _loc1_;
      }
      
      private function _DailyLoginContent_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.mxmlContent = [this._DailyLoginContent_UIComponent3_i()];
         _loc1_.id = "fron2Group";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fron2Group = _loc1_;
         BindingManager.executeBindings(this,"fron2Group",this.fron2Group);
         return _loc1_;
      }
      
      private function _DailyLoginContent_UIComponent3_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "front2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.front2 = _loc1_;
         BindingManager.executeBindings(this,"front2",this.front2);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get dailyLogin() : UIComponent
      {
         return this._1509427408dailyLogin;
      }
      
      public function set dailyLogin(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1509427408dailyLogin;
         if(_loc2_ !== param1)
         {
            this._1509427408dailyLogin = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dailyLogin",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fron1Group() : Group
      {
         return this._2030561337fron1Group;
      }
      
      public function set fron1Group(param1:Group) : void
      {
         var _loc2_:Object = this._2030561337fron1Group;
         if(_loc2_ !== param1)
         {
            this._2030561337fron1Group = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fron1Group",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fron2Group() : Group
      {
         return this._2059190488fron2Group;
      }
      
      public function set fron2Group(param1:Group) : void
      {
         var _loc2_:Object = this._2059190488fron2Group;
         if(_loc2_ !== param1)
         {
            this._2059190488fron2Group = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fron2Group",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get front1() : UIComponent
      {
         return this._1266096344front1;
      }
      
      public function set front1(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1266096344front1;
         if(_loc2_ !== param1)
         {
            this._1266096344front1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"front1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get front2() : UIComponent
      {
         return this._1266096343front2;
      }
      
      public function set front2(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1266096343front2;
         if(_loc2_ !== param1)
         {
            this._1266096343front2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"front2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainview() : Group
      {
         return this._7423010mainview;
      }
      
      public function set mainview(param1:Group) : void
      {
         var _loc2_:Object = this._7423010mainview;
         if(_loc2_ !== param1)
         {
            this._7423010mainview = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainview",_loc2_,param1));
            }
         }
      }
   }
}

