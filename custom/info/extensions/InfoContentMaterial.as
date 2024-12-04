package custom.info.extensions
{
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import custom.info.core.AbstractInfo;
   import custom.info.groups.InfoDisplayGroupPreview;
   import custom.info.groups.InfoDisplayGroupRight;
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
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.core.SpriteVisualElement;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderInfoMarkSkin;
   
   use namespace mx_internal;
   
   public class InfoContentMaterial extends AbstractInfo implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _894232893MaterialPic:VGroup;
      
      public var _InfoContentMaterial_StandardText1:StandardText;
      
      public var _InfoContentMaterial_WindowHeader1:WindowHeader;
      
      private var _347613694switchInfo:StandardText;
      
      private var _53253650timerText:GradientText;
      
      private var _1697796767trashDollarText:GradientText;
      
      private var _1931235453zooDollarText:GradientText;
      
      private var _1481819147zooMoneyImage:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_ClockRedIcon_694477795:Class;
      
      private var _embed_mxml__general_Decorations_swf_Trash_822848217:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function InfoContentMaterial()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_ClockRedIcon_694477795 = InfoContentMaterial__embed_mxml__general_Decorations_swf_ClockRedIcon_694477795;
         this._embed_mxml__general_Decorations_swf_Trash_822848217 = InfoContentMaterial__embed_mxml__general_Decorations_swf_Trash_822848217;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._InfoContentMaterial_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_info_extensions_InfoContentMaterialWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return InfoContentMaterial[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._InfoContentMaterial_InnerGroup1_c(),this._InfoContentMaterial_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         InfoContentMaterial._watcherSetupUtil = param1;
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
      
      private function _InfoContentMaterial_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._InfoContentMaterial_Group1_c(),this._InfoContentMaterial_Group2_c(),this._InfoContentMaterial_VGroup1_c(),this._InfoContentMaterial_HGroup1_c(),this._InfoContentMaterial_HGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.right = 100;
         _loc1_.width = 200;
         _loc1_.top = 120;
         _loc1_.bottom = 90;
         _loc1_.mxmlContent = [this._InfoContentMaterial_StandardText1_i(),this._InfoContentMaterial_InfoDisplayGroupRight1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "_InfoContentMaterial_StandardText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoContentMaterial_StandardText1 = _loc1_;
         BindingManager.executeBindings(this,"_InfoContentMaterial_StandardText1",this._InfoContentMaterial_StandardText1);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_InfoDisplayGroupRight1_i() : InfoDisplayGroupRight
      {
         var _loc1_:InfoDisplayGroupRight = new InfoDisplayGroupRight();
         _loc1_.bottom = 0;
         _loc1_.id = "groupRight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         groupRight = _loc1_;
         BindingManager.executeBindings(this,"groupRight",groupRight);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 50;
         _loc1_.top = 130;
         _loc1_.width = 300;
         _loc1_.maxWidth = 300;
         _loc1_.height = 240;
         _loc1_.maxHeight = 240;
         _loc1_.mxmlContent = [this._InfoContentMaterial_SpriteVisualElement1_i(),this._InfoContentMaterial_InfoDisplayGroupPreview1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = null;
         _loc1_ = new SpriteVisualElement();
         _loc1_.verticalCenter = -20;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"container");
         container = _loc1_;
         BindingManager.executeBindings(this,"container",container);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_InfoDisplayGroupPreview1_i() : InfoDisplayGroupPreview
      {
         var _loc1_:InfoDisplayGroupPreview = null;
         _loc1_ = new InfoDisplayGroupPreview();
         _loc1_.id = "groupPreview";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         groupPreview = _loc1_;
         BindingManager.executeBindings(this,"groupPreview",groupPreview);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.bottom = 55;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.x = 355;
         _loc1_.y = 230;
         _loc1_.width = 220;
         _loc1_.height = 150;
         _loc1_.mxmlContent = [this._InfoContentMaterial_VGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._InfoContentMaterial_StandardText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 220;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "switchInfo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.switchInfo = _loc1_;
         BindingManager.executeBindings(this,"switchInfo",this.switchInfo);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.width = 300;
         _loc1_.x = 100;
         _loc1_.y = 280;
         _loc1_.mxmlContent = [this._InfoContentMaterial_VGroup3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 11;
         _loc1_.verticalAlign = "middle";
         _loc1_.width = 25;
         _loc1_.mxmlContent = [this._InfoContentMaterial_HGroup3_c(),this._InfoContentMaterial_HGroup5_c(),this._InfoContentMaterial_HGroup7_c()];
         _loc1_.id = "MaterialPic";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.MaterialPic = _loc1_;
         BindingManager.executeBindings(this,"MaterialPic",this.MaterialPic);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 20;
         _loc1_.width = 250;
         _loc1_.mxmlContent = [this._InfoContentMaterial_HGroup4_c(),this._InfoContentMaterial_Group3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.width = 30;
         _loc1_.horizontalCenter = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._InfoContentMaterial_Image1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.8;
         _loc1_.scaleY = 0.7;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_Trash_822848217;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._InfoContentMaterial_GradientText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 12;
         _loc1_.id = "trashDollarText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.trashDollarText = _loc1_;
         BindingManager.executeBindings(this,"trashDollarText",this.trashDollarText);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_HGroup5_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 20;
         _loc1_.width = 250;
         _loc1_.mxmlContent = [this._InfoContentMaterial_HGroup6_c(),this._InfoContentMaterial_Group4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_HGroup6_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.width = 30;
         _loc1_.horizontalCenter = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._InfoContentMaterial_Image2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.8;
         _loc1_.scaleY = 0.7;
         _loc1_.id = "zooMoneyImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.zooMoneyImage = _loc1_;
         BindingManager.executeBindings(this,"zooMoneyImage",this.zooMoneyImage);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._InfoContentMaterial_GradientText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 12;
         _loc1_.id = "zooDollarText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.zooDollarText = _loc1_;
         BindingManager.executeBindings(this,"zooDollarText",this.zooDollarText);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_HGroup7_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 20;
         _loc1_.width = 250;
         _loc1_.mxmlContent = [this._InfoContentMaterial_HGroup8_c(),this._InfoContentMaterial_Group5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_HGroup8_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.width = 30;
         _loc1_.horizontalCenter = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._InfoContentMaterial_Image3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_Image3_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 1;
         _loc1_.scaleY = 1;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_ClockRedIcon_694477795;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._InfoContentMaterial_GradientText3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_GradientText3_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 12;
         _loc1_.id = "timerText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timerText = _loc1_;
         BindingManager.executeBindings(this,"timerText",this.timerText);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._InfoContentMaterial_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 18;
         _loc1_.setStyle("skinClass",WindowHeaderInfoMarkSkin);
         _loc1_.id = "_InfoContentMaterial_WindowHeader1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoContentMaterial_WindowHeader1 = _loc1_;
         BindingManager.executeBindings(this,"_InfoContentMaterial_WindowHeader1",this._InfoContentMaterial_WindowHeader1);
         return _loc1_;
      }
      
      private function _InfoContentMaterial_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_InfoContentMaterial_StandardText1.text","text");
         result[1] = new Binding(this,null,null,"_InfoContentMaterial_WindowHeader1.text","title");
         result[2] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_40;
         },null,"_InfoContentMaterial_WindowHeader1.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get MaterialPic() : VGroup
      {
         return this._894232893MaterialPic;
      }
      
      public function set MaterialPic(param1:VGroup) : void
      {
         var _loc2_:Object = this._894232893MaterialPic;
         if(_loc2_ !== param1)
         {
            this._894232893MaterialPic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"MaterialPic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get switchInfo() : StandardText
      {
         return this._347613694switchInfo;
      }
      
      public function set switchInfo(param1:StandardText) : void
      {
         var _loc2_:Object = this._347613694switchInfo;
         if(_loc2_ !== param1)
         {
            this._347613694switchInfo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"switchInfo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timerText() : GradientText
      {
         return this._53253650timerText;
      }
      
      public function set timerText(param1:GradientText) : void
      {
         var _loc2_:Object = this._53253650timerText;
         if(_loc2_ !== param1)
         {
            this._53253650timerText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timerText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get trashDollarText() : GradientText
      {
         return this._1697796767trashDollarText;
      }
      
      public function set trashDollarText(param1:GradientText) : void
      {
         var _loc2_:Object = this._1697796767trashDollarText;
         if(_loc2_ !== param1)
         {
            this._1697796767trashDollarText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"trashDollarText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get zooDollarText() : GradientText
      {
         return this._1931235453zooDollarText;
      }
      
      public function set zooDollarText(param1:GradientText) : void
      {
         var _loc2_:Object = this._1931235453zooDollarText;
         if(_loc2_ !== param1)
         {
            this._1931235453zooDollarText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"zooDollarText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get zooMoneyImage() : Image
      {
         return this._1481819147zooMoneyImage;
      }
      
      public function set zooMoneyImage(param1:Image) : void
      {
         var _loc2_:Object = this._1481819147zooMoneyImage;
         if(_loc2_ !== param1)
         {
            this._1481819147zooMoneyImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"zooMoneyImage",_loc2_,param1));
            }
         }
      }
   }
}

