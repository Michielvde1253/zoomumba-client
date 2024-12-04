package windows.custom.collectionSets
{
   import buttons.simpleButton.BuyButtonBigSkin;
   import components.textfield.gradientText.GradientText;
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
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderLineSkin;
   
   use namespace mx_internal;
   
   public class CollectionSetRewordContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1221270899header:WindowHeader;
      
      private var _3237038info:Text;
      
      private var _1130638157pickReword1:Button;
      
      private var _1130638156pickReword2:Button;
      
      private var _724131137rewordAmmount1:GradientText;
      
      private var _724131138rewordAmmount2:GradientText;
      
      private var _1231245636rewordPic1:SpriteVisualElement;
      
      private var _1231245637rewordPic2:SpriteVisualElement;
      
      private var _1862311355windowLogo:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CollectionSetRewordContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CollectionSetRewordContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_collectionSets_CollectionSetRewordContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CollectionSetRewordContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._CollectionSetRewordContent_InnerGroup1_c(),this._CollectionSetRewordContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CollectionSetRewordContent._watcherSetupUtil = param1;
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
      
      private function _CollectionSetRewordContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._CollectionSetRewordContent_Text1_i(),this._CollectionSetRewordContent_SpriteVisualElement1_i(),this._CollectionSetRewordContent_SpriteVisualElement2_i(),this._CollectionSetRewordContent_GradientText1_i(),this._CollectionSetRewordContent_GradientText2_i(),this._CollectionSetRewordContent_Button1_i(),this._CollectionSetRewordContent_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollectionSetRewordContent_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.text = "";
         _loc1_.mouseEnabled = false;
         _loc1_.x = 140;
         _loc1_.y = 105;
         _loc1_.width = 150;
         _loc1_.height = 30;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("color",3611397);
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "info";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.info = _loc1_;
         BindingManager.executeBindings(this,"info",this.info);
         return _loc1_;
      }
      
      private function _CollectionSetRewordContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 130;
         _loc1_.y = 180;
         _loc1_.initialized(this,"rewordPic1");
         this.rewordPic1 = _loc1_;
         BindingManager.executeBindings(this,"rewordPic1",this.rewordPic1);
         return _loc1_;
      }
      
      private function _CollectionSetRewordContent_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 320;
         _loc1_.y = 180;
         _loc1_.initialized(this,"rewordPic2");
         this.rewordPic2 = _loc1_;
         BindingManager.executeBindings(this,"rewordPic2",this.rewordPic2);
         return _loc1_;
      }
      
      private function _CollectionSetRewordContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 20;
         _loc1_.fontFamily = "Tahoma";
         _loc1_.fontWeight = "bold";
         _loc1_.textAlign = "left";
         _loc1_.mouseEnabled = false;
         _loc1_.x = 70;
         _loc1_.y = 220;
         _loc1_.width = 130;
         _loc1_.height = 40;
         _loc1_.id = "rewordAmmount1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rewordAmmount1 = _loc1_;
         BindingManager.executeBindings(this,"rewordAmmount1",this.rewordAmmount1);
         return _loc1_;
      }
      
      private function _CollectionSetRewordContent_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 20;
         _loc1_.fontFamily = "Tahoma";
         _loc1_.fontWeight = "bold";
         _loc1_.textAlign = "left";
         _loc1_.mouseEnabled = false;
         _loc1_.x = 250;
         _loc1_.y = 220;
         _loc1_.width = 130;
         _loc1_.height = 40;
         _loc1_.id = "rewordAmmount2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rewordAmmount2 = _loc1_;
         BindingManager.executeBindings(this,"rewordAmmount2",this.rewordAmmount2);
         return _loc1_;
      }
      
      private function _CollectionSetRewordContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 69;
         _loc1_.y = 269;
         _loc1_.setStyle("skinClass",BuyButtonBigSkin);
         _loc1_.id = "pickReword1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pickReword1 = _loc1_;
         BindingManager.executeBindings(this,"pickReword1",this.pickReword1);
         return _loc1_;
      }
      
      private function _CollectionSetRewordContent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 248;
         _loc1_.y = 269;
         _loc1_.setStyle("skinClass",BuyButtonBigSkin);
         _loc1_.id = "pickReword2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pickReword2 = _loc1_;
         BindingManager.executeBindings(this,"pickReword2",this.pickReword2);
         return _loc1_;
      }
      
      private function _CollectionSetRewordContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._CollectionSetRewordContent_WindowHeader1_i(),this._CollectionSetRewordContent_SpriteVisualElement3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollectionSetRewordContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 24;
         _loc1_.setStyle("skinClass",WindowHeaderLineSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _CollectionSetRewordContent_SpriteVisualElement3_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 70;
         _loc1_.y = 80;
         _loc1_.initialized(this,"windowLogo");
         this.windowLogo = _loc1_;
         BindingManager.executeBindings(this,"windowLogo",this.windowLogo);
         return _loc1_;
      }
      
      private function _CollectionSetRewordContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_20;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get header() : WindowHeader
      {
         return this._1221270899header;
      }
      
      public function set header(param1:WindowHeader) : void
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
      public function get info() : Text
      {
         return this._3237038info;
      }
      
      public function set info(param1:Text) : void
      {
         var _loc2_:Object = this._3237038info;
         if(_loc2_ !== param1)
         {
            this._3237038info = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"info",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pickReword1() : Button
      {
         return this._1130638157pickReword1;
      }
      
      public function set pickReword1(param1:Button) : void
      {
         var _loc2_:Object = this._1130638157pickReword1;
         if(_loc2_ !== param1)
         {
            this._1130638157pickReword1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pickReword1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pickReword2() : Button
      {
         return this._1130638156pickReword2;
      }
      
      public function set pickReword2(param1:Button) : void
      {
         var _loc2_:Object = this._1130638156pickReword2;
         if(_loc2_ !== param1)
         {
            this._1130638156pickReword2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pickReword2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewordAmmount1() : GradientText
      {
         return this._724131137rewordAmmount1;
      }
      
      public function set rewordAmmount1(param1:GradientText) : void
      {
         var _loc2_:Object = this._724131137rewordAmmount1;
         if(_loc2_ !== param1)
         {
            this._724131137rewordAmmount1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewordAmmount1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewordAmmount2() : GradientText
      {
         return this._724131138rewordAmmount2;
      }
      
      public function set rewordAmmount2(param1:GradientText) : void
      {
         var _loc2_:Object = this._724131138rewordAmmount2;
         if(_loc2_ !== param1)
         {
            this._724131138rewordAmmount2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewordAmmount2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewordPic1() : SpriteVisualElement
      {
         return this._1231245636rewordPic1;
      }
      
      public function set rewordPic1(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1231245636rewordPic1;
         if(_loc2_ !== param1)
         {
            this._1231245636rewordPic1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewordPic1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewordPic2() : SpriteVisualElement
      {
         return this._1231245637rewordPic2;
      }
      
      public function set rewordPic2(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1231245637rewordPic2;
         if(_loc2_ !== param1)
         {
            this._1231245637rewordPic2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewordPic2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get windowLogo() : SpriteVisualElement
      {
         return this._1862311355windowLogo;
      }
      
      public function set windowLogo(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1862311355windowLogo;
         if(_loc2_ !== param1)
         {
            this._1862311355windowLogo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"windowLogo",_loc2_,param1));
            }
         }
      }
   }
}

