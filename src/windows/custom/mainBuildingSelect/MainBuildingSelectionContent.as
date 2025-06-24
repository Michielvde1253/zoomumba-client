package windows.custom.mainBuildingSelect
{
   import components.textfield.StandardText;
   import custom.features.settings.RadioButtonMainBuilding;
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.RadioButtonGroup;
   import spark.layouts.TileLayout;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class MainBuildingSelectionContent extends Group
   {
      private var _2083409377_groupButtons:Group;
      
      private var _1332194002background:BitmapImage;
      
      private var _1378241396bubble:BitmapImage;
      
      private var _141550186mainBuildingsRadioGroup:RadioButtonGroup;
      
      private var _756497197mainBuildingsText:StandardText;
      
      private var _109620809sonja:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _building:Vector.<RadioButtonMainBuilding>;
      
      public function MainBuildingSelectionContent()
      {
         super();
         this.mxmlContent = [this._MainBuildingSelectionContent_InnerGroup1_c(),this._MainBuildingSelectionContent_OuterGroup1_c()];
         this._MainBuildingSelectionContent_RadioButtonGroup1_i();
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
      
      public function getBuilding(param1:int) : RadioButtonMainBuilding
      {
         return this._building[param1];
      }
      
      public function set ammountOfBuilding(param1:int) : void
      {
         var _loc3_:RadioButtonMainBuilding = null;
         this._groupButtons.removeAllElements();
         this._building = new Vector.<RadioButtonMainBuilding>();
         var _loc2_:int = 0;
         while(_loc2_ < param1)
         {
            _loc3_ = new RadioButtonMainBuilding();
            _loc3_.radioGroup = this.mainBuildingsRadioGroup;
            _loc3_.value = _loc2_;
            this._groupButtons.addElement(_loc3_);
            this._building[_loc2_] = _loc3_;
            _loc2_++;
         }
      }
      
      private function _MainBuildingSelectionContent_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"mainBuildingsRadioGroup");
         this.mainBuildingsRadioGroup = _loc1_;
         BindingManager.executeBindings(this,"mainBuildingsRadioGroup",this.mainBuildingsRadioGroup);
         return _loc1_;
      }
      
      private function _MainBuildingSelectionContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._MainBuildingSelectionContent_Group2_c(),this._MainBuildingSelectionContent_Group3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MainBuildingSelectionContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 45;
         _loc1_.top = 110;
         _loc1_.mxmlContent = [this._MainBuildingSelectionContent_BitmapImage1_i(),this._MainBuildingSelectionContent_BitmapImage2_i(),this._MainBuildingSelectionContent_StandardText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MainBuildingSelectionContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _MainBuildingSelectionContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 85;
         _loc1_.top = -23;
         _loc1_.initialized(this,"bubble");
         this.bubble = _loc1_;
         BindingManager.executeBindings(this,"bubble",this.bubble);
         return _loc1_;
      }
      
      private function _MainBuildingSelectionContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 300;
         _loc1_.top = 15;
         _loc1_.left = 200;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "mainBuildingsText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainBuildingsText = _loc1_;
         BindingManager.executeBindings(this,"mainBuildingsText",this.mainBuildingsText);
         return _loc1_;
      }
      
      private function _MainBuildingSelectionContent_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 90;
         _loc1_.layout = this._MainBuildingSelectionContent_TileLayout1_c();
         _loc1_.id = "_groupButtons";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._groupButtons = _loc1_;
         BindingManager.executeBindings(this,"_groupButtons",this._groupButtons);
         return _loc1_;
      }
      
      private function _MainBuildingSelectionContent_TileLayout1_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.requestedColumnCount = 6;
         _loc1_.columnWidth = 80;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MainBuildingSelectionContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._MainBuildingSelectionContent_BitmapImage3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MainBuildingSelectionContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 41;
         _loc1_.top = 75;
         _loc1_.initialized(this,"sonja");
         this.sonja = _loc1_;
         BindingManager.executeBindings(this,"sonja",this.sonja);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _groupButtons() : Group
      {
         return this._2083409377_groupButtons;
      }
      
      public function set _groupButtons(param1:Group) : void
      {
         var _loc2_:Object = this._2083409377_groupButtons;
         if(_loc2_ !== param1)
         {
            this._2083409377_groupButtons = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_groupButtons",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : BitmapImage
      {
         return this._1332194002background;
      }
      
      public function set background(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bubble() : BitmapImage
      {
         return this._1378241396bubble;
      }
      
      public function set bubble(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1378241396bubble;
         if(_loc2_ !== param1)
         {
            this._1378241396bubble = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubble",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainBuildingsRadioGroup() : RadioButtonGroup
      {
         return this._141550186mainBuildingsRadioGroup;
      }
      
      public function set mainBuildingsRadioGroup(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._141550186mainBuildingsRadioGroup;
         if(_loc2_ !== param1)
         {
            this._141550186mainBuildingsRadioGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainBuildingsRadioGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainBuildingsText() : StandardText
      {
         return this._756497197mainBuildingsText;
      }
      
      public function set mainBuildingsText(param1:StandardText) : void
      {
         var _loc2_:Object = this._756497197mainBuildingsText;
         if(_loc2_ !== param1)
         {
            this._756497197mainBuildingsText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainBuildingsText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sonja() : BitmapImage
      {
         return this._109620809sonja;
      }
      
      public function set sonja(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._109620809sonja;
         if(_loc2_ !== param1)
         {
            this._109620809sonja = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sonja",_loc2_,param1));
            }
         }
      }
   }
}

