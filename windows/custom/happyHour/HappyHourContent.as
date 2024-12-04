package windows.custom.happyHour
{
   import buttons.simpleButton.BuyButton2LinesSkin;
   import components.image.BackgroundImage;
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class HappyHourContent extends Group
   {
      private var _1271589544buyButton:Button;
      
      private var _934671136clock_red:BitmapImage;
      
      private var _506466879gradient_clock:GradientText;
      
      private var _1343131012gradient_header:GradientText;
      
      private var _213293257header_bg:BitmapImage;
      
      private var _109620778sonia:BitmapImage;
      
      private var _892484220star_1:BitmapImage;
      
      private var _892484219star_2:BitmapImage;
      
      private var _892484218star_3:BitmapImage;
      
      private var _1003315511text_end:StandardText;
      
      private var _1037783669text_main:StandardText;
      
      private var _886093839text_topic_1:StandardText;
      
      private var _886093840text_topic_2:StandardText;
      
      private var _886093841text_topic_3:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function HappyHourContent()
      {
         super();
         this.mxmlContent = [this._HappyHourContent_InnerGroup1_c(),this._HappyHourContent_OuterGroup1_c()];
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
      
      private function _HappyHourContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._HappyHourContent_Group2_c(),this._HappyHourContent_VGroup1_c(),this._HappyHourContent_BackgroundImage1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _HappyHourContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 120;
         _loc1_.mxmlContent = [this._HappyHourContent_BitmapImage1_i(),this._HappyHourContent_GradientText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _HappyHourContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"header_bg");
         this.header_bg = _loc1_;
         BindingManager.executeBindings(this,"header_bg",this.header_bg);
         return _loc1_;
      }
      
      private function _HappyHourContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.fontSize = 22;
         _loc1_.id = "gradient_header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.gradient_header = _loc1_;
         BindingManager.executeBindings(this,"gradient_header",this.gradient_header);
         return _loc1_;
      }
      
      private function _HappyHourContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.top = 180;
         _loc1_.left = 200;
         _loc1_.gap = 16;
         _loc1_.verticalAlign = "middle";
         _loc1_.maxWidth = 400;
         _loc1_.mxmlContent = [this._HappyHourContent_StandardText1_i(),this._HappyHourContent_VGroup2_c(),this._HappyHourContent_StandardText5_i(),this._HappyHourContent_HGroup4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _HappyHourContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 400;
         _loc1_.id = "text_main";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text_main = _loc1_;
         BindingManager.executeBindings(this,"text_main",this.text_main);
         return _loc1_;
      }
      
      private function _HappyHourContent_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 0;
         _loc1_.maxWidth = 400;
         _loc1_.mxmlContent = [this._HappyHourContent_HGroup1_c(),this._HappyHourContent_HGroup2_c(),this._HappyHourContent_HGroup3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _HappyHourContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._HappyHourContent_BitmapImage2_i(),this._HappyHourContent_StandardText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _HappyHourContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"star_1");
         this.star_1 = _loc1_;
         BindingManager.executeBindings(this,"star_1",this.star_1);
         return _loc1_;
      }
      
      private function _HappyHourContent_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 380;
         _loc1_.id = "text_topic_1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text_topic_1 = _loc1_;
         BindingManager.executeBindings(this,"text_topic_1",this.text_topic_1);
         return _loc1_;
      }
      
      private function _HappyHourContent_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._HappyHourContent_BitmapImage3_i(),this._HappyHourContent_StandardText3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _HappyHourContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"star_2");
         this.star_2 = _loc1_;
         BindingManager.executeBindings(this,"star_2",this.star_2);
         return _loc1_;
      }
      
      private function _HappyHourContent_StandardText3_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 380;
         _loc1_.id = "text_topic_2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text_topic_2 = _loc1_;
         BindingManager.executeBindings(this,"text_topic_2",this.text_topic_2);
         return _loc1_;
      }
      
      private function _HappyHourContent_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._HappyHourContent_BitmapImage4_i(),this._HappyHourContent_StandardText4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _HappyHourContent_BitmapImage4_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"star_3");
         this.star_3 = _loc1_;
         BindingManager.executeBindings(this,"star_3",this.star_3);
         return _loc1_;
      }
      
      private function _HappyHourContent_StandardText4_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 380;
         _loc1_.id = "text_topic_3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text_topic_3 = _loc1_;
         BindingManager.executeBindings(this,"text_topic_3",this.text_topic_3);
         return _loc1_;
      }
      
      private function _HappyHourContent_StandardText5_i() : StandardText
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
      
      private function _HappyHourContent_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.width = 240;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._HappyHourContent_BitmapImage5_i(),this._HappyHourContent_GradientText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _HappyHourContent_BitmapImage5_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"clock_red");
         this.clock_red = _loc1_;
         BindingManager.executeBindings(this,"clock_red",this.clock_red);
         return _loc1_;
      }
      
      private function _HappyHourContent_GradientText2_i() : GradientText
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
      
      private function _HappyHourContent_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 1.45;
         _loc1_.left = -3;
         _loc1_.verticalCenter = 62;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _HappyHourContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._HappyHourContent_BitmapImage6_i(),this._HappyHourContent_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _HappyHourContent_BitmapImage6_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 43;
         _loc1_.verticalCenter = 30;
         _loc1_.initialized(this,"sonia");
         this.sonia = _loc1_;
         BindingManager.executeBindings(this,"sonia",this.sonia);
         return _loc1_;
      }
      
      private function _HappyHourContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = 0;
         _loc1_.setStyle("skinClass",BuyButton2LinesSkin);
         _loc1_.id = "buyButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buyButton = _loc1_;
         BindingManager.executeBindings(this,"buyButton",this.buyButton);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get buyButton() : Button
      {
         return this._1271589544buyButton;
      }
      
      public function set buyButton(param1:Button) : void
      {
         var _loc2_:Object = this._1271589544buyButton;
         if(_loc2_ !== param1)
         {
            this._1271589544buyButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buyButton",_loc2_,param1));
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
      public function get gradient_header() : GradientText
      {
         return this._1343131012gradient_header;
      }
      
      public function set gradient_header(param1:GradientText) : void
      {
         var _loc2_:Object = this._1343131012gradient_header;
         if(_loc2_ !== param1)
         {
            this._1343131012gradient_header = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gradient_header",_loc2_,param1));
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
      public function get sonia() : BitmapImage
      {
         return this._109620778sonia;
      }
      
      public function set sonia(param1:BitmapImage) : void
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
      public function get star_1() : BitmapImage
      {
         return this._892484220star_1;
      }
      
      public function set star_1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._892484220star_1;
         if(_loc2_ !== param1)
         {
            this._892484220star_1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"star_1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get star_2() : BitmapImage
      {
         return this._892484219star_2;
      }
      
      public function set star_2(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._892484219star_2;
         if(_loc2_ !== param1)
         {
            this._892484219star_2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"star_2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get star_3() : BitmapImage
      {
         return this._892484218star_3;
      }
      
      public function set star_3(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._892484218star_3;
         if(_loc2_ !== param1)
         {
            this._892484218star_3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"star_3",_loc2_,param1));
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
      public function get text_main() : StandardText
      {
         return this._1037783669text_main;
      }
      
      public function set text_main(param1:StandardText) : void
      {
         var _loc2_:Object = this._1037783669text_main;
         if(_loc2_ !== param1)
         {
            this._1037783669text_main = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text_main",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get text_topic_1() : StandardText
      {
         return this._886093839text_topic_1;
      }
      
      public function set text_topic_1(param1:StandardText) : void
      {
         var _loc2_:Object = this._886093839text_topic_1;
         if(_loc2_ !== param1)
         {
            this._886093839text_topic_1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text_topic_1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get text_topic_2() : StandardText
      {
         return this._886093840text_topic_2;
      }
      
      public function set text_topic_2(param1:StandardText) : void
      {
         var _loc2_:Object = this._886093840text_topic_2;
         if(_loc2_ !== param1)
         {
            this._886093840text_topic_2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text_topic_2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get text_topic_3() : StandardText
      {
         return this._886093841text_topic_3;
      }
      
      public function set text_topic_3(param1:StandardText) : void
      {
         var _loc2_:Object = this._886093841text_topic_3;
         if(_loc2_ !== param1)
         {
            this._886093841text_topic_3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text_topic_3",_loc2_,param1));
            }
         }
      }
   }
}

