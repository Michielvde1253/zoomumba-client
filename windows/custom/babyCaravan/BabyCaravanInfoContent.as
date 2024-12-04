package windows.custom.babyCaravan
{
   import components.image.BackgroundImage;
   import components.textfield.StandardText;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class BabyCaravanInfoContent extends Group
   {
      private var _306950163animalsPic:BitmapImage;
      
      private var _795439315circleImg:BackgroundImage;
      
      private var _1221270899header:StandardText;
      
      private var _3321844line:BitmapImage;
      
      private var _954925063message:StandardText;
      
      private var _1537532672soniaPic:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Patterns_swf_HPatternLine_1769938539:Class = BabyCaravanInfoContent__embed_mxml__general_Patterns_swf_HPatternLine_1769938539;
      
      public function BabyCaravanInfoContent()
      {
         super();
         this.width = 400;
         this.height = 300;
         this.mxmlContent = [this._BabyCaravanInfoContent_InnerGroup1_c(),this._BabyCaravanInfoContent_OuterGroup1_c()];
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
      
      private function _BabyCaravanInfoContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._BabyCaravanInfoContent_BitmapImage1_i(),this._BabyCaravanInfoContent_BackgroundImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BabyCaravanInfoContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 152;
         _loc1_.top = 83;
         _loc1_.width = 250;
         _loc1_.height = 8;
         _loc1_.fillMode = "repeat";
         _loc1_.source = this._embed_mxml__general_Patterns_swf_HPatternLine_1769938539;
         _loc1_.initialized(this,"line");
         this.line = _loc1_;
         BindingManager.executeBindings(this,"line",this.line);
         return _loc1_;
      }
      
      private function _BabyCaravanInfoContent_BackgroundImage1_i() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 1.25;
         _loc1_.x = -8;
         _loc1_.y = 27;
         _loc1_.id = "circleImg";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.circleImg = _loc1_;
         BindingManager.executeBindings(this,"circleImg",this.circleImg);
         return _loc1_;
      }
      
      private function _BabyCaravanInfoContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._BabyCaravanInfoContent_BitmapImage2_i(),this._BabyCaravanInfoContent_BitmapImage3_i(),this._BabyCaravanInfoContent_StandardText1_i(),this._BabyCaravanInfoContent_StandardText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BabyCaravanInfoContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 15;
         _loc1_.y = -3;
         _loc1_.initialized(this,"soniaPic");
         this.soniaPic = _loc1_;
         BindingManager.executeBindings(this,"soniaPic",this.soniaPic);
         return _loc1_;
      }
      
      private function _BabyCaravanInfoContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 205;
         _loc1_.initialized(this,"animalsPic");
         this.animalsPic = _loc1_;
         BindingManager.executeBindings(this,"animalsPic",this.animalsPic);
         return _loc1_;
      }
      
      private function _BabyCaravanInfoContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 255;
         _loc1_.height = 50;
         _loc1_.x = 145;
         _loc1_.y = 49;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontSize",16);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _BabyCaravanInfoContent_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 330;
         _loc1_.height = 130;
         _loc1_.x = 69;
         _loc1_.y = 182;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "message";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.message = _loc1_;
         BindingManager.executeBindings(this,"message",this.message);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get animalsPic() : BitmapImage
      {
         return this._306950163animalsPic;
      }
      
      public function set animalsPic(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._306950163animalsPic;
         if(_loc2_ !== param1)
         {
            this._306950163animalsPic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animalsPic",_loc2_,param1));
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
      public function get header() : StandardText
      {
         return this._1221270899header;
      }
      
      public function set header(param1:StandardText) : void
      {
         var _loc2_:Object = this._1221270899header;
         if(_loc2_ !== param1)
         {
            this._1221270899header = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"header",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get line() : BitmapImage
      {
         return this._3321844line;
      }
      
      public function set line(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._3321844line;
         if(_loc2_ !== param1)
         {
            this._3321844line = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"line",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get message() : StandardText
      {
         return this._954925063message;
      }
      
      public function set message(param1:StandardText) : void
      {
         var _loc2_:Object = this._954925063message;
         if(_loc2_ !== param1)
         {
            this._954925063message = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"message",_loc2_,param1));
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
   }
}

