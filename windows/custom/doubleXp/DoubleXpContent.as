package windows.custom.doubleXp
{
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class DoubleXpContent extends Group
   {
      private var _1078227478clock_bg:BitmapImage;
      
      private var _934671136clock_red:BitmapImage;
      
      private var _1841416316clockwoodGroup:Group;
      
      private var _506466879gradient_clock:GradientText;
      
      private var _213293257header_bg:BitmapImage;
      
      private var _2132879720special1:UIComponent;
      
      private var _2132879719special2:UIComponent;
      
      private var _2132879718special3:UIComponent;
      
      private var _2132879717special4:UIComponent;
      
      private var _2132879716special5:UIComponent;
      
      private var _1003315511text_end:StandardText;
      
      private var _548916488text_xpinfo:StandardText;
      
      private var _1498983431timebarGroup:VGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function DoubleXpContent()
      {
         super();
         this.mxmlContent = [this._DoubleXpContent_InnerGroup1_c(),this._DoubleXpContent_OuterGroup1_c()];
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
      
      private function _DoubleXpContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._DoubleXpContent_Group2_i(),this._DoubleXpContent_VGroup1_c(),this._DoubleXpContent_Group3_c(),this._DoubleXpContent_Group4_c(),this._DoubleXpContent_Group5_c(),this._DoubleXpContent_Group6_c(),this._DoubleXpContent_Group7_c(),this._DoubleXpContent_VGroup2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DoubleXpContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 360;
         _loc1_.mxmlContent = [this._DoubleXpContent_BitmapImage1_i()];
         _loc1_.id = "clockwoodGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.clockwoodGroup = _loc1_;
         BindingManager.executeBindings(this,"clockwoodGroup",this.clockwoodGroup);
         return _loc1_;
      }
      
      private function _DoubleXpContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"clock_bg");
         this.clock_bg = _loc1_;
         BindingManager.executeBindings(this,"clock_bg",this.clock_bg);
         return _loc1_;
      }
      
      private function _DoubleXpContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 190;
         _loc1_.top = 254;
         _loc1_.maxWidth = 350;
         _loc1_.mxmlContent = [this._DoubleXpContent_StandardText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DoubleXpContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 350;
         _loc1_.id = "text_xpinfo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text_xpinfo = _loc1_;
         BindingManager.executeBindings(this,"text_xpinfo",this.text_xpinfo);
         return _loc1_;
      }
      
      private function _DoubleXpContent_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 330;
         _loc1_.mxmlContent = [this._DoubleXpContent_UIComponent1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DoubleXpContent_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "special1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.special1 = _loc1_;
         BindingManager.executeBindings(this,"special1",this.special1);
         return _loc1_;
      }
      
      private function _DoubleXpContent_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 330;
         _loc1_.mxmlContent = [this._DoubleXpContent_UIComponent2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DoubleXpContent_UIComponent2_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "special2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.special2 = _loc1_;
         BindingManager.executeBindings(this,"special2",this.special2);
         return _loc1_;
      }
      
      private function _DoubleXpContent_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 330;
         _loc1_.mxmlContent = [this._DoubleXpContent_UIComponent3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DoubleXpContent_UIComponent3_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "special3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.special3 = _loc1_;
         BindingManager.executeBindings(this,"special3",this.special3);
         return _loc1_;
      }
      
      private function _DoubleXpContent_Group6_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 330;
         _loc1_.mxmlContent = [this._DoubleXpContent_UIComponent4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DoubleXpContent_UIComponent4_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "special4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.special4 = _loc1_;
         BindingManager.executeBindings(this,"special4",this.special4);
         return _loc1_;
      }
      
      private function _DoubleXpContent_Group7_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 330;
         _loc1_.mxmlContent = [this._DoubleXpContent_UIComponent5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DoubleXpContent_UIComponent5_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "special5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.special5 = _loc1_;
         BindingManager.executeBindings(this,"special5",this.special5);
         return _loc1_;
      }
      
      private function _DoubleXpContent_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.top = 345;
         _loc1_.left = 200;
         _loc1_.gap = 20;
         _loc1_.verticalAlign = "middle";
         _loc1_.maxWidth = 400;
         _loc1_.mxmlContent = [this._DoubleXpContent_StandardText2_i(),this._DoubleXpContent_HGroup1_c()];
         _loc1_.id = "timebarGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timebarGroup = _loc1_;
         BindingManager.executeBindings(this,"timebarGroup",this.timebarGroup);
         return _loc1_;
      }
      
      private function _DoubleXpContent_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 400;
         _loc1_.id = "text_end";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text_end = _loc1_;
         BindingManager.executeBindings(this,"text_end",this.text_end);
         return _loc1_;
      }
      
      private function _DoubleXpContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 240;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._DoubleXpContent_BitmapImage2_i(),this._DoubleXpContent_GradientText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DoubleXpContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"clock_red");
         this.clock_red = _loc1_;
         BindingManager.executeBindings(this,"clock_red",this.clock_red);
         return _loc1_;
      }
      
      private function _DoubleXpContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 16;
         _loc1_.id = "gradient_clock";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.gradient_clock = _loc1_;
         BindingManager.executeBindings(this,"gradient_clock",this.gradient_clock);
         return _loc1_;
      }
      
      private function _DoubleXpContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._DoubleXpContent_BitmapImage3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DoubleXpContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.top = 0;
         _loc1_.left = 20;
         _loc1_.verticalCenter = 0;
         _loc1_.initialized(this,"header_bg");
         this.header_bg = _loc1_;
         BindingManager.executeBindings(this,"header_bg",this.header_bg);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get clock_bg() : BitmapImage
      {
         return this._1078227478clock_bg;
      }
      
      public function set clock_bg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1078227478clock_bg;
         if(_loc2_ !== param1)
         {
            this._1078227478clock_bg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"clock_bg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get clock_red() : BitmapImage
      {
         return this._934671136clock_red;
      }
      
      public function set clock_red(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._934671136clock_red;
         if(_loc2_ !== param1)
         {
            this._934671136clock_red = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"clock_red",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get clockwoodGroup() : Group
      {
         return this._1841416316clockwoodGroup;
      }
      
      public function set clockwoodGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1841416316clockwoodGroup;
         if(_loc2_ !== param1)
         {
            this._1841416316clockwoodGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"clockwoodGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gradient_clock() : GradientText
      {
         return this._506466879gradient_clock;
      }
      
      public function set gradient_clock(param1:GradientText) : void
      {
         var _loc2_:Object = this._506466879gradient_clock;
         if(_loc2_ !== param1)
         {
            this._506466879gradient_clock = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gradient_clock",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get header_bg() : BitmapImage
      {
         return this._213293257header_bg;
      }
      
      public function set header_bg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._213293257header_bg;
         if(_loc2_ !== param1)
         {
            this._213293257header_bg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"header_bg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get special1() : UIComponent
      {
         return this._2132879720special1;
      }
      
      public function set special1(param1:UIComponent) : void
      {
         var _loc2_:Object = this._2132879720special1;
         if(_loc2_ !== param1)
         {
            this._2132879720special1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"special1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get special2() : UIComponent
      {
         return this._2132879719special2;
      }
      
      public function set special2(param1:UIComponent) : void
      {
         var _loc2_:Object = this._2132879719special2;
         if(_loc2_ !== param1)
         {
            this._2132879719special2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"special2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get special3() : UIComponent
      {
         return this._2132879718special3;
      }
      
      public function set special3(param1:UIComponent) : void
      {
         var _loc2_:Object = this._2132879718special3;
         if(_loc2_ !== param1)
         {
            this._2132879718special3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"special3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get special4() : UIComponent
      {
         return this._2132879717special4;
      }
      
      public function set special4(param1:UIComponent) : void
      {
         var _loc2_:Object = this._2132879717special4;
         if(_loc2_ !== param1)
         {
            this._2132879717special4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"special4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get special5() : UIComponent
      {
         return this._2132879716special5;
      }
      
      public function set special5(param1:UIComponent) : void
      {
         var _loc2_:Object = this._2132879716special5;
         if(_loc2_ !== param1)
         {
            this._2132879716special5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"special5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get text_end() : StandardText
      {
         return this._1003315511text_end;
      }
      
      public function set text_end(param1:StandardText) : void
      {
         var _loc2_:Object = this._1003315511text_end;
         if(_loc2_ !== param1)
         {
            this._1003315511text_end = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text_end",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get text_xpinfo() : StandardText
      {
         return this._548916488text_xpinfo;
      }
      
      public function set text_xpinfo(param1:StandardText) : void
      {
         var _loc2_:Object = this._548916488text_xpinfo;
         if(_loc2_ !== param1)
         {
            this._548916488text_xpinfo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text_xpinfo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timebarGroup() : VGroup
      {
         return this._1498983431timebarGroup;
      }
      
      public function set timebarGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._1498983431timebarGroup;
         if(_loc2_ !== param1)
         {
            this._1498983431timebarGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timebarGroup",_loc2_,param1));
            }
         }
      }
   }
}

