package windows.custom.events.community
{
   import components.textfield.StandardText;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class GenericCommunityEventHelpContent extends Group
   {
      private var _878707486imageBack:BitmapImage;
      
      private var _1689098695imageBubble:BitmapImage;
      
      private var _1465916018imageFront:BitmapImage;
      
      private var _1365610521textBubble:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function GenericCommunityEventHelpContent()
      {
         super();
         this.mxmlContent = [this._GenericCommunityEventHelpContent_InnerGroup1_c(),this._GenericCommunityEventHelpContent_OuterGroup1_c()];
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
      
      private function _GenericCommunityEventHelpContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._GenericCommunityEventHelpContent_BitmapImage1_i(),this._GenericCommunityEventHelpContent_BitmapImage2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _GenericCommunityEventHelpContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 25;
         _loc1_.y = 25;
         _loc1_.initialized(this,"imageBack");
         this.imageBack = _loc1_;
         BindingManager.executeBindings(this,"imageBack",this.imageBack);
         return _loc1_;
      }
      
      private function _GenericCommunityEventHelpContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 20;
         _loc1_.y = 25;
         _loc1_.initialized(this,"imageBubble");
         this.imageBubble = _loc1_;
         BindingManager.executeBindings(this,"imageBubble",this.imageBubble);
         return _loc1_;
      }
      
      private function _GenericCommunityEventHelpContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._GenericCommunityEventHelpContent_BitmapImage3_i(),this._GenericCommunityEventHelpContent_StandardText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _GenericCommunityEventHelpContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 5;
         _loc1_.y = 27;
         _loc1_.initialized(this,"imageFront");
         this.imageFront = _loc1_;
         BindingManager.executeBindings(this,"imageFront",this.imageFront);
         return _loc1_;
      }
      
      private function _GenericCommunityEventHelpContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 300;
         _loc1_.x = 210;
         _loc1_.y = 70;
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
      
      [Bindable(event="propertyChange")]
      public function get imageBack() : BitmapImage
      {
         return this._878707486imageBack;
      }
      
      public function set imageBack(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._878707486imageBack;
         if(_loc2_ !== param1)
         {
            this._878707486imageBack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageBack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageBubble() : BitmapImage
      {
         return this._1689098695imageBubble;
      }
      
      public function set imageBubble(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1689098695imageBubble;
         if(_loc2_ !== param1)
         {
            this._1689098695imageBubble = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageBubble",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageFront() : BitmapImage
      {
         return this._1465916018imageFront;
      }
      
      public function set imageFront(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1465916018imageFront;
         if(_loc2_ !== param1)
         {
            this._1465916018imageFront = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageFront",_loc2_,param1));
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

