package custom.features.avatar
{
   import buttons.extended.ButtonCircularZoomable;
   import buttons.skin.circularZoomable.ButtonOKCircularSkin;
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
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.states.AddItems;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class AvatarOption extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _AvatarOption_BitmapImage1:BitmapImage;
      
      public var _AvatarOption_ButtonCircularZoomable1:ButtonCircularZoomable;
      
      public var _AvatarOption_Image1:Image;
      
      private var _1000556740spriteContainer:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var value:int = -1;
      
      private var _1367605390cardBd:BitmapData;
      
      private var _embed_mxml__general_Decorations_swf_LockClosedSPR_555374237:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AvatarOption()
      {
         var bindings:Array;
         var watchers:Array;
         var _AvatarOption_ButtonCircularZoomable1_factory:DeferredInstanceFromFunction;
         var _AvatarOption_Image1_factory:DeferredInstanceFromFunction;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_LockClosedSPR_555374237 = AvatarOption__embed_mxml__general_Decorations_swf_LockClosedSPR_555374237;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._AvatarOption_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_avatar_AvatarOptionWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AvatarOption[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 70;
         this.height = 80;
         this.maxWidth = 70;
         this.maxHeight = 80;
         this.useHandCursor = true;
         this.buttonMode = true;
         this.mxmlContent = [this._AvatarOption_BitmapImage1_i(),this._AvatarOption_SpriteVisualElement1_i()];
         this.currentState = "default";
         this.addEventListener("click",this.___AvatarOption_Group1_click);
         _AvatarOption_ButtonCircularZoomable1_factory = new DeferredInstanceFromFunction(this._AvatarOption_ButtonCircularZoomable1_i);
         _AvatarOption_Image1_factory = new DeferredInstanceFromFunction(this._AvatarOption_Image1_i);
         states = [new State({
            "name":"default",
            "overrides":[]
         }),new State({
            "name":"selected",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_AvatarOption_ButtonCircularZoomable1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            })]
         }),new State({
            "name":"locked",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_AvatarOption_Image1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            })]
         })];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AvatarOption._watcherSetupUtil = param1;
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
      
      private function clicked(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("avatarOptClicked",true));
      }
      
      private function _AvatarOption_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"_AvatarOption_BitmapImage1");
         this._AvatarOption_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_AvatarOption_BitmapImage1",this._AvatarOption_BitmapImage1);
         return _loc1_;
      }
      
      private function _AvatarOption_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"spriteContainer");
         this.spriteContainer = _loc1_;
         BindingManager.executeBindings(this,"spriteContainer",this.spriteContainer);
         return _loc1_;
      }
      
      private function _AvatarOption_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.scaleX = 0.7;
         _loc1_.scaleY = 0.7;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_LockClosedSPR_555374237;
         _loc1_.id = "_AvatarOption_Image1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AvatarOption_Image1 = _loc1_;
         BindingManager.executeBindings(this,"_AvatarOption_Image1",this._AvatarOption_Image1);
         return _loc1_;
      }
      
      private function _AvatarOption_ButtonCircularZoomable1_i() : ButtonCircularZoomable
      {
         var _loc1_:ButtonCircularZoomable = new ButtonCircularZoomable();
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.right = -10;
         _loc1_.bottom = -5;
         _loc1_.bgScale = 0.29;
         _loc1_.backgroundState = "inner";
         _loc1_.setStyle("skinClass",ButtonOKCircularSkin);
         _loc1_.id = "_AvatarOption_ButtonCircularZoomable1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AvatarOption_ButtonCircularZoomable1 = _loc1_;
         BindingManager.executeBindings(this,"_AvatarOption_ButtonCircularZoomable1",this._AvatarOption_ButtonCircularZoomable1);
         return _loc1_;
      }
      
      public function ___AvatarOption_Group1_click(param1:MouseEvent) : void
      {
         this.clicked(param1);
      }
      
      private function _AvatarOption_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_AvatarOption_BitmapImage1.source","cardBd");
         result[1] = new Binding(this,function():Array
         {
            var _loc1_:* = [0.35,0.35];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"_AvatarOption_ButtonCircularZoomable1.iconScales");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get spriteContainer() : SpriteVisualElement
      {
         return this._1000556740spriteContainer;
      }
      
      public function set spriteContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1000556740spriteContainer;
         if(_loc2_ !== param1)
         {
            this._1000556740spriteContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spriteContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cardBd() : BitmapData
      {
         return this._1367605390cardBd;
      }
      
      public function set cardBd(param1:BitmapData) : void
      {
         var _loc2_:Object = this._1367605390cardBd;
         if(_loc2_ !== param1)
         {
            this._1367605390cardBd = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cardBd",_loc2_,param1));
            }
         }
      }
   }
}

