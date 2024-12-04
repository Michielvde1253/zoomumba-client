package fr.kapit
{
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
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
   import fr.kapit.components.InspectorDockBarItem;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class DockBar extends Canvas
   {
      private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
         "type":Canvas,
         "events":{
            "mouseMove":"___DockBar_Canvas1_mouseMove",
            "rollOut":"___DockBar_Canvas1_rollOut",
            "initialize":"___DockBar_Canvas1_initialize",
            "creationComplete":"___DockBar_Canvas1_creationComplete"
         },
         "propertiesFactory":function():Object
         {
            return {"height":100};
         }
      });
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var items:Array;
      
      public var images:Array = [];
      
      public var innerCanvas:HBox = new HBox();
      
      public var menuImage:Image;
      
      private var _1063879027minSize:Number = 32;
      
      public var maxSize:Number = 64;
      
      public var w:Number;
      
      public var span:Number = 20;
      
      private var _timer:Timer = new Timer(600);
      
      public function DockBar()
      {
         super();
         mx_internal::_document = this;
         this.clipContent = false;
         this.percentWidth = 100;
         this.height = 100;
         this.mouseChildren = true;
         this.addEventListener("mouseMove",this.___DockBar_Canvas1_mouseMove);
         this.addEventListener("rollOut",this.___DockBar_Canvas1_rollOut);
         this.addEventListener("initialize",this.___DockBar_Canvas1_initialize);
         this.addEventListener("creationComplete",this.___DockBar_Canvas1_creationComplete);
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
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      private function _onCreationComplete() : void
      {
         this._timer.addEventListener(TimerEvent.TIMER,this._onTimerComplete);
      }
      
      public function resize(param1:int) : void
      {
         var _loc2_:Array = this.innerCanvas.getChildren();
         if(param1 > this.innerCanvas.width + InspectorDockBarItem(_loc2_[0]).width * 4)
         {
            this.minSize = 32;
            this.maxSize = 64;
         }
         else
         {
            this.minSize = this.width / (_loc2_.length + 4);
            this.maxSize = this.minSize * 2;
         }
      }
      
      public function close() : void
      {
         var _loc3_:InspectorDockBarItem = null;
         this.innerCanvas.visible = false;
         this.menuImage.visible = true;
         height = 20;
         var _loc1_:Array = this.innerCanvas.getChildren();
         var _loc2_:uint = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_[_loc2_];
            _loc3_.width = this.minSize;
            _loc2_++;
         }
      }
      
      public function open(param1:int = -1) : void
      {
         if(this.innerCanvas.visible)
         {
            return;
         }
         this.innerCanvas.visible = true;
         this.menuImage.visible = false;
         height = 100;
         if(param1 != -1)
         {
            this._timer.delay = param1;
            this._timer.start();
         }
      }
      
      private function _onTimerComplete(param1:TimerEvent) : void
      {
         this._timer.stop();
         this.close();
         dispatchEvent(new Event("closed"));
      }
      
      private function onmousemove(param1:MouseEvent) : void
      {
         var _loc6_:Image = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         this.images = this.innerCanvas.getChildren();
         var _loc2_:uint = this.images.length;
         var _loc3_:int = Math.floor(_loc2_ / 2);
         var _loc4_:Number = 0;
         var _loc5_:uint = 0;
         while(_loc5_ < _loc2_)
         {
            _loc6_ = this.images[_loc5_];
            _loc7_ = Math.abs(this.innerCanvas.mouseX - _loc6_.x);
            _loc8_ = Math.abs(this.innerCanvas.mouseY - _loc6_.y);
            _loc9_ = Math.sqrt(_loc7_ * _loc7_ + _loc8_ * _loc8_);
            _loc10_ = _loc6_.width / _loc6_.height;
            _loc6_.width = this.maxSize - _loc9_ / 5;
            if(_loc6_.width < this.minSize)
            {
               _loc6_.width = this.minSize;
            }
            if(_loc6_.width > this.maxSize)
            {
               _loc6_.width = this.maxSize;
            }
            _loc4_ += _loc6_.width + this.span;
            _loc5_++;
         }
         if(param1)
         {
            param1.updateAfterEvent();
         }
      }
      
      public function init() : void
      {
         this.innerCanvas = HBox(this.getChildAt(2));
         this.menuImage = Image(HBox(this.getChildAt(0)).getChildAt(0));
         this.close();
      }
      
      private function onover(param1:MouseEvent) : void
      {
         this.open();
      }
      
      public function addItem(param1:Event) : void
      {
         this.images.push(param1.currentTarget);
      }
      
      public function ___DockBar_Canvas1_mouseMove(param1:MouseEvent) : void
      {
         this.onmousemove(param1);
      }
      
      public function ___DockBar_Canvas1_rollOut(param1:MouseEvent) : void
      {
         this.close();
      }
      
      public function ___DockBar_Canvas1_initialize(param1:FlexEvent) : void
      {
         this.init();
      }
      
      public function ___DockBar_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this._onCreationComplete();
      }
      
      [Bindable(event="propertyChange")]
      public function get minSize() : Number
      {
         return this._1063879027minSize;
      }
      
      public function set minSize(param1:Number) : void
      {
         var _loc2_:Object = this._1063879027minSize;
         if(_loc2_ !== param1)
         {
            this._1063879027minSize = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"minSize",_loc2_,param1));
            }
         }
      }
   }
}

