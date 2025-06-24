package custom.card.skin
{
   import components.textfield.StandardText;
   import custom.card.component.CardActionButton;
   import custom.card.component.CardBackground;
   import custom.card.component.CardBottom;
   import custom.card.component.CardBuyButton;
   import custom.card.component.CardDecoBack;
   import custom.card.component.CardDecoLocked;
   import custom.card.component.CardDecoPossible;
   import custom.card.component.CardDecoReady;
   import custom.card.component.CardNail;
   import custom.card.component.CardRight;
   import custom.card.component.CardTop;
   import custom.card.custom.ItemCard;
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
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.VGroup;
   import spark.components.supportClasses.Skin;
   import spark.core.SpriteVisualElement;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class ItemCardCraftingSkin extends Skin implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _ItemCardCraftingSkin_StandardText1:StandardText;
      
      private var _1561524713actionGroup:CardActionButton;
      
      private var _1332194002background:CardBackground;
      
      private var _631173356bottomGroup:CardBottom;
      
      private var _1006326887buyGroup:CardBuyButton;
      
      private var _152349648canCraft:CardDecoPossible;
      
      private var _410956671container:SpriteVisualElement;
      
      private var _951530617content:Group;
      
      private var _423015077decoBackContent:CardDecoBack;
      
      private var _3327275lock:CardDecoLocked;
      
      private var _3373590nail:CardNail;
      
      private var _108386723ready:CardDecoReady;
      
      private var _1409862205rightGroup:CardRight;
      
      private var _988229078topGroup:CardTop;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ItemCard;
      
      public function ItemCardCraftingSkin()
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
         bindings = this._ItemCardCraftingSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_card_skin_ItemCardCraftingSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ItemCardCraftingSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 130;
         this.maxWidth = 130;
         this.height = 170;
         this.maxHeight = 170;
         this.mxmlContent = [this._ItemCardCraftingSkin_CardBackground1_i(),this._ItemCardCraftingSkin_CardNail1_i(),this._ItemCardCraftingSkin_VGroup1_c(),this._ItemCardCraftingSkin_Group6_c(),this._ItemCardCraftingSkin_CardBuyButton1_i(),this._ItemCardCraftingSkin_CardActionButton1_i()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ItemCardCraftingSkin._watcherSetupUtil = param1;
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
      
      private function _ItemCardCraftingSkin_CardBackground1_i() : CardBackground
      {
         var _loc1_:CardBackground = new CardBackground();
         _loc1_.top = 15;
         _loc1_.currentState = "normal";
         _loc1_.id = "background";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_CardNail1_i() : CardNail
      {
         var _loc1_:CardNail = new CardNail();
         _loc1_.id = "nail";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nail = _loc1_;
         BindingManager.executeBindings(this,"nail",this.nail);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.width = 110;
         _loc1_.maxWidth = 110;
         _loc1_.height = 138;
         _loc1_.maxHeight = 138;
         _loc1_.top = 22;
         _loc1_.left = 7;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ItemCardCraftingSkin_Group1_c(),this._ItemCardCraftingSkin_Group2_c(),this._ItemCardCraftingSkin_Group5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.minHeight = 20;
         _loc1_.maxHeight = 20;
         _loc1_.mxmlContent = [this._ItemCardCraftingSkin_CardTop1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_CardTop1_i() : CardTop
      {
         var _loc1_:CardTop = new CardTop();
         _loc1_.id = "topGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.topGroup = _loc1_;
         BindingManager.executeBindings(this,"topGroup",this.topGroup);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ItemCardCraftingSkin_Group3_c(),this._ItemCardCraftingSkin_Group4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.percentHeight = 100;
         _loc1_.minWidth = 20;
         _loc1_.maxWidth = 20;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.right = 0;
         _loc1_.percentHeight = 100;
         _loc1_.minWidth = 20;
         _loc1_.maxWidth = 20;
         _loc1_.mxmlContent = [this._ItemCardCraftingSkin_CardRight1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_CardRight1_i() : CardRight
      {
         var _loc1_:CardRight = new CardRight();
         _loc1_.id = "rightGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rightGroup = _loc1_;
         BindingManager.executeBindings(this,"rightGroup",this.rightGroup);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.minHeight = 20;
         _loc1_.maxHeight = 20;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_Group6_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 116.5;
         _loc1_.maxWidth = 116.5;
         _loc1_.height = 138.5;
         _loc1_.maxHeight = 138.5;
         _loc1_.top = 20;
         _loc1_.left = 7;
         _loc1_.mxmlContent = [this._ItemCardCraftingSkin_StandardText1_i(),this._ItemCardCraftingSkin_Group7_i(),this._ItemCardCraftingSkin_CardBottom1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 110;
         _loc1_.top = 11;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("fontAntiAliasType","normal");
         _loc1_.id = "_ItemCardCraftingSkin_StandardText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ItemCardCraftingSkin_StandardText1 = _loc1_;
         BindingManager.executeBindings(this,"_ItemCardCraftingSkin_StandardText1",this._ItemCardCraftingSkin_StandardText1);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_Group7_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.verticalCenter = 2;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._ItemCardCraftingSkin_CardDecoBack1_i(),this._ItemCardCraftingSkin_SpriteVisualElement1_i(),this._ItemCardCraftingSkin_CardDecoLocked1_i(),this._ItemCardCraftingSkin_CardDecoPossible1_i(),this._ItemCardCraftingSkin_CardDecoReady1_i()];
         _loc1_.id = "content";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.content = _loc1_;
         BindingManager.executeBindings(this,"content",this.content);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_CardDecoBack1_i() : CardDecoBack
      {
         var _loc1_:CardDecoBack = new CardDecoBack();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "decoBackContent";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.decoBackContent = _loc1_;
         BindingManager.executeBindings(this,"decoBackContent",this.decoBackContent);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"container");
         this.container = _loc1_;
         BindingManager.executeBindings(this,"container",this.container);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_CardDecoLocked1_i() : CardDecoLocked
      {
         var _loc1_:CardDecoLocked = new CardDecoLocked();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "lock";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lock = _loc1_;
         BindingManager.executeBindings(this,"lock",this.lock);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_CardDecoPossible1_i() : CardDecoPossible
      {
         var _loc1_:CardDecoPossible = new CardDecoPossible();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "canCraft";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.canCraft = _loc1_;
         BindingManager.executeBindings(this,"canCraft",this.canCraft);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_CardDecoReady1_i() : CardDecoReady
      {
         var _loc1_:CardDecoReady = new CardDecoReady();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "ready";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ready = _loc1_;
         BindingManager.executeBindings(this,"ready",this.ready);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_CardBottom1_i() : CardBottom
      {
         var _loc1_:CardBottom = new CardBottom();
         _loc1_.id = "bottomGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bottomGroup = _loc1_;
         BindingManager.executeBindings(this,"bottomGroup",this.bottomGroup);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_CardBuyButton1_i() : CardBuyButton
      {
         var _loc1_:CardBuyButton = new CardBuyButton();
         _loc1_.id = "buyGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buyGroup = _loc1_;
         BindingManager.executeBindings(this,"buyGroup",this.buyGroup);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_CardActionButton1_i() : CardActionButton
      {
         var _loc1_:CardActionButton = new CardActionButton();
         _loc1_.id = "actionGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.actionGroup = _loc1_;
         BindingManager.executeBindings(this,"actionGroup",this.actionGroup);
         return _loc1_;
      }
      
      private function _ItemCardCraftingSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.title;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_ItemCardCraftingSkin_StandardText1.text");
         result[1] = new Binding(this,function():uint
         {
            return Color.CRAFTING_COLOR_WHITEBLUE;
         },function(param1:uint):void
         {
            _ItemCardCraftingSkin_StandardText1.setStyle("color",param1);
         },"_ItemCardCraftingSkin_StandardText1.color");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get actionGroup() : CardActionButton
      {
         return this._1561524713actionGroup;
      }
      
      public function set actionGroup(param1:CardActionButton) : void
      {
         var _loc2_:Object = this._1561524713actionGroup;
         if(_loc2_ !== param1)
         {
            this._1561524713actionGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actionGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : CardBackground
      {
         return this._1332194002background;
      }
      
      public function set background(param1:CardBackground) : void
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
      public function get bottomGroup() : CardBottom
      {
         return this._631173356bottomGroup;
      }
      
      public function set bottomGroup(param1:CardBottom) : void
      {
         var _loc2_:Object = this._631173356bottomGroup;
         if(_loc2_ !== param1)
         {
            this._631173356bottomGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bottomGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buyGroup() : CardBuyButton
      {
         return this._1006326887buyGroup;
      }
      
      public function set buyGroup(param1:CardBuyButton) : void
      {
         var _loc2_:Object = this._1006326887buyGroup;
         if(_loc2_ !== param1)
         {
            this._1006326887buyGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buyGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get canCraft() : CardDecoPossible
      {
         return this._152349648canCraft;
      }
      
      public function set canCraft(param1:CardDecoPossible) : void
      {
         var _loc2_:Object = this._152349648canCraft;
         if(_loc2_ !== param1)
         {
            this._152349648canCraft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"canCraft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get container() : SpriteVisualElement
      {
         return this._410956671container;
      }
      
      public function set container(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._410956671container;
         if(_loc2_ !== param1)
         {
            this._410956671container = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"container",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get content() : Group
      {
         return this._951530617content;
      }
      
      public function set content(param1:Group) : void
      {
         var _loc2_:Object = this._951530617content;
         if(_loc2_ !== param1)
         {
            this._951530617content = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"content",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get decoBackContent() : CardDecoBack
      {
         return this._423015077decoBackContent;
      }
      
      public function set decoBackContent(param1:CardDecoBack) : void
      {
         var _loc2_:Object = this._423015077decoBackContent;
         if(_loc2_ !== param1)
         {
            this._423015077decoBackContent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"decoBackContent",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lock() : CardDecoLocked
      {
         return this._3327275lock;
      }
      
      public function set lock(param1:CardDecoLocked) : void
      {
         var _loc2_:Object = this._3327275lock;
         if(_loc2_ !== param1)
         {
            this._3327275lock = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lock",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get nail() : CardNail
      {
         return this._3373590nail;
      }
      
      public function set nail(param1:CardNail) : void
      {
         var _loc2_:Object = this._3373590nail;
         if(_loc2_ !== param1)
         {
            this._3373590nail = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nail",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ready() : CardDecoReady
      {
         return this._108386723ready;
      }
      
      public function set ready(param1:CardDecoReady) : void
      {
         var _loc2_:Object = this._108386723ready;
         if(_loc2_ !== param1)
         {
            this._108386723ready = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ready",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rightGroup() : CardRight
      {
         return this._1409862205rightGroup;
      }
      
      public function set rightGroup(param1:CardRight) : void
      {
         var _loc2_:Object = this._1409862205rightGroup;
         if(_loc2_ !== param1)
         {
            this._1409862205rightGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rightGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get topGroup() : CardTop
      {
         return this._988229078topGroup;
      }
      
      public function set topGroup(param1:CardTop) : void
      {
         var _loc2_:Object = this._988229078topGroup;
         if(_loc2_ !== param1)
         {
            this._988229078topGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"topGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : ItemCard
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ItemCard) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}

