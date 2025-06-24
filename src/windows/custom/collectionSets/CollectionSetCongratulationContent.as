package windows.custom.collectionSets
{
   import buttons.simpleButton.BuyButtonBigSkin;
   import components.image.BackgroundImage;
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
   import windows.extensions.headers.skins.WindowHeaderExclamationMarkSkin;
   
   use namespace mx_internal;
   
   public class CollectionSetCongratulationContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1221270899header:WindowHeader;
      
      private var _1615557111itemsPicContainer:SpriteVisualElement;
      
      private var _954925063message:Text;
      
      private var _568785632starsContainer:SpriteVisualElement;
      
      private var _1876846645viewCollectionButton:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CollectionSetCongratulationContent()
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
         bindings = this._CollectionSetCongratulationContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_collectionSets_CollectionSetCongratulationContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CollectionSetCongratulationContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._CollectionSetCongratulationContent_InnerGroup1_c(),this._CollectionSetCongratulationContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CollectionSetCongratulationContent._watcherSetupUtil = param1;
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
      
      private function _CollectionSetCongratulationContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.mxmlContent = [this._CollectionSetCongratulationContent_BackgroundImage1_c(),this._CollectionSetCongratulationContent_SpriteVisualElement1_i(),this._CollectionSetCongratulationContent_SpriteVisualElement2_i(),this._CollectionSetCongratulationContent_Text1_i(),this._CollectionSetCongratulationContent_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollectionSetCongratulationContent_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 0.89;
         _loc1_.x = 70;
         _loc1_.y = 130;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollectionSetCongratulationContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 130;
         _loc1_.y = 190;
         _loc1_.initialized(this,"itemsPicContainer");
         this.itemsPicContainer = _loc1_;
         BindingManager.executeBindings(this,"itemsPicContainer",this.itemsPicContainer);
         return _loc1_;
      }
      
      private function _CollectionSetCongratulationContent_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 130;
         _loc1_.y = 190;
         _loc1_.initialized(this,"starsContainer");
         this.starsContainer = _loc1_;
         BindingManager.executeBindings(this,"starsContainer",this.starsContainer);
         return _loc1_;
      }
      
      private function _CollectionSetCongratulationContent_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.text = "";
         _loc1_.mouseEnabled = false;
         _loc1_.x = 230;
         _loc1_.y = 120;
         _loc1_.width = 163;
         _loc1_.height = 110;
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("color",3611397);
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "message";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.message = _loc1_;
         BindingManager.executeBindings(this,"message",this.message);
         return _loc1_;
      }
      
      private function _CollectionSetCongratulationContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 170;
         _loc1_.y = 269;
         _loc1_.setStyle("skinClass",BuyButtonBigSkin);
         _loc1_.id = "viewCollectionButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.viewCollectionButton = _loc1_;
         BindingManager.executeBindings(this,"viewCollectionButton",this.viewCollectionButton);
         return _loc1_;
      }
      
      private function _CollectionSetCongratulationContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._CollectionSetCongratulationContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollectionSetCongratulationContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 20;
         _loc1_.setStyle("skinClass",WindowHeaderExclamationMarkSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _CollectionSetCongratulationContent_bindingsSetup() : Array
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
      public function get itemsPicContainer() : SpriteVisualElement
      {
         return this._1615557111itemsPicContainer;
      }
      
      public function set itemsPicContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1615557111itemsPicContainer;
         if(_loc2_ !== param1)
         {
            this._1615557111itemsPicContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemsPicContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get message() : Text
      {
         return this._954925063message;
      }
      
      public function set message(param1:Text) : void
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
      public function get starsContainer() : SpriteVisualElement
      {
         return this._568785632starsContainer;
      }
      
      public function set starsContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._568785632starsContainer;
         if(_loc2_ !== param1)
         {
            this._568785632starsContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"starsContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get viewCollectionButton() : Button
      {
         return this._1876846645viewCollectionButton;
      }
      
      public function set viewCollectionButton(param1:Button) : void
      {
         var _loc2_:Object = this._1876846645viewCollectionButton;
         if(_loc2_ !== param1)
         {
            this._1876846645viewCollectionButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"viewCollectionButton",_loc2_,param1));
            }
         }
      }
   }
}

