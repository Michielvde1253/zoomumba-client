package custom.features.collectable.book.component
{
   import com.greensock.TweenMax;
   import custom.features.collectable.book.events.BookEvents;
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
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class RibbonButton extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _410956671container:Group;
      
      private var _280343272graphic:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var isActive:Boolean = false;
      
      public var internalID:int;
      
      private const INACTIVE_GAP:int = -20;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function RibbonButton()
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
         bindings = this._RibbonButton_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_collectable_book_component_RibbonButtonWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return RibbonButton[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 60;
         this.maxWidth = 60;
         this.height = 113;
         this.buttonMode = true;
         this.mxmlContent = [this._RibbonButton_Group2_i()];
         this.addEventListener("creationComplete",this.___RibbonButton_Group1_creationComplete);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         RibbonButton._watcherSetupUtil = param1;
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
      
      public function active() : void
      {
         this.isActive = true;
         this.toggleView();
      }
      
      public function notActive() : void
      {
         this.isActive = false;
         this.toggleView();
      }
      
      private function toggleView() : void
      {
         if(this.isActive)
         {
            this.container.y = -5;
         }
         else
         {
            this.container.y = this.INACTIVE_GAP;
         }
      }
      
      protected function componentInit(param1:FlexEvent) : void
      {
         this.container.addEventListener(MouseEvent.CLICK,this.handleButtonClick);
         this.container.addEventListener(MouseEvent.MOUSE_OVER,this.handleButtonOver);
         this.container.addEventListener(MouseEvent.MOUSE_OUT,this.handleButtonOut);
      }
      
      private function handleButtonClick(param1:MouseEvent) : void
      {
         var _loc2_:BookEvents = new BookEvents(BookEvents.RIBBON_BUTTON_MOUSE_CLICK);
         _loc2_.ribbonId = this.internalID;
         dispatchEvent(_loc2_);
      }
      
      private function handleButtonOver(param1:MouseEvent) : void
      {
         var _loc2_:BookEvents = new BookEvents(BookEvents.RIBBON_BUTTON_MOUSE_OVER);
         TweenMax.to(this,0.3,{"colorMatrixFilter":{
            "contrast":1.4,
            "brightness":1.2
         }});
         _loc2_.ribbonId = this.internalID;
         dispatchEvent(_loc2_);
      }
      
      private function handleButtonOut(param1:MouseEvent) : void
      {
         var _loc2_:BookEvents = new BookEvents(BookEvents.RIBBON_BUTTON_MOUSE_OUT);
         TweenMax.to(this,0.3,{"colorMatrixFilter":{
            "contrast":1,
            "brightness":1,
            "remove":true
         }});
         _loc2_.ribbonId = this.internalID;
         dispatchEvent(_loc2_);
      }
      
      public function set imagePath(param1:*) : void
      {
         this.graphic.source = param1;
      }
      
      private function _RibbonButton_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._RibbonButton_BitmapImage1_i()];
         _loc1_.id = "container";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.container = _loc1_;
         BindingManager.executeBindings(this,"container",this.container);
         return _loc1_;
      }
      
      private function _RibbonButton_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.y = -10;
         _loc1_.initialized(this,"graphic");
         this.graphic = _loc1_;
         BindingManager.executeBindings(this,"graphic",this.graphic);
         return _loc1_;
      }
      
      public function ___RibbonButton_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.componentInit(param1);
      }
      
      private function _RibbonButton_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return INACTIVE_GAP;
         },null,"container.y");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get container() : Group
      {
         return this._410956671container;
      }
      
      public function set container(param1:Group) : void
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
      public function get graphic() : BitmapImage
      {
         return this._280343272graphic;
      }
      
      public function set graphic(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._280343272graphic;
         if(_loc2_ !== param1)
         {
            this._280343272graphic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"graphic",_loc2_,param1));
            }
         }
      }
   }
}

