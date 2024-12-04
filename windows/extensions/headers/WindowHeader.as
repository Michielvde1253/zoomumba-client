package windows.extensions.headers
{
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
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.supportClasses.SkinnableComponent;
   import spark.primitives.BitmapImage;
   import windows.core.WindowConstants;
   
   public class WindowHeader extends SkinnableComponent
   {
      public static const TOP_DISTANCE:int = 60;
      
      public static const HORIZONTAL_GAP:int = 60;
      
      public static const LEFT_WIDTH:int = 30;
      
      private static var _skinParts:Object = {
         "sign":false,
         "title":true,
         "lineLeft":false,
         "lineRight":true
      };
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      [SkinPart(required="true")]
      public var title:Text;
      
      [SkinPart(required="false")]
      public var sign:BitmapImage;
      
      [SkinPart(required="false")]
      public var lineLeft:BitmapImage;
      
      [SkinPart(required="true")]
      public var lineRight:BitmapImage;
      
      private var _365601008fontSize:int = 14;
      
      private var _190451707bgScale:Number = 0;
      
      private var _1391823380bgLeft:Number = 0;
      
      private var _93657808bgTop:Number = 0;
      
      private var _3556653text:String = "";
      
      private var _2124767295dynamic:Boolean = false;
      
      private var _oldWidth:int = -1;
      
      private var _skinSize:int = -1;
      
      private var _leftSpace:Array = [8,8,13,11,16,16];
      
      private var _rightSpace:Array = [8,12,14,17,23,23];
      
      public function WindowHeader()
      {
         super();
         this.percentWidth = 100;
         this.addEventListener("initialize",this.___WindowHeader_SkinnableComponent1_initialize);
         this.addEventListener("remove",this.___WindowHeader_SkinnableComponent1_remove);
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
      
      [Bindable(event="skinSizeChanged")]
      public function get skinSize() : int
      {
         return this._skinSize;
      }
      
      public function set skinSize(param1:int) : void
      {
         this._skinSize = param1;
         dispatchEvent(new Event("skinSizeChanged"));
      }
      
      private function init(param1:FlexEvent) : void
      {
         addEventListener("widthChanged",this.changeSize);
      }
      
      private function changeSize(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.width > 0 && this._oldWidth != this.width)
         {
            if(this._skinSize == -1)
            {
               throw new Error("You need to specify the size of the window: skinSize = WindowConstants.SKIN_* !");
            }
            _loc2_ = int(this._leftSpace[this._skinSize * 0.1 - 1]);
            _loc3_ = int(this._rightSpace[this._skinSize * 0.1 - 1]);
            this.y = WindowConstants["TOP_BORDER_DISTANCE_SKIN_" + this._skinSize];
            this.x = WindowConstants["LEFT_BORDER_DISTANCE_SKIN_" + this._skinSize] + _loc2_;
            this.width = WindowConstants["INTERNAL_WIDTH_SKIN_" + this._skinSize] - _loc2_ - _loc3_;
            invalidateProperties();
            invalidateDisplayList();
            this._oldWidth = this.width;
         }
      }
      
      private function destroy(param1:Event) : void
      {
         removeEventListener("widthChanged",this.changeSize);
      }
      
      public function ___WindowHeader_SkinnableComponent1_initialize(param1:FlexEvent) : void
      {
         this.init(param1);
      }
      
      public function ___WindowHeader_SkinnableComponent1_remove(param1:FlexEvent) : void
      {
         this.destroy(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get fontSize() : int
      {
         return this._365601008fontSize;
      }
      
      public function set fontSize(param1:int) : void
      {
         var _loc2_:Object = this._365601008fontSize;
         if(_loc2_ !== param1)
         {
            this._365601008fontSize = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fontSize",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgScale() : Number
      {
         return this._190451707bgScale;
      }
      
      public function set bgScale(param1:Number) : void
      {
         var _loc2_:Object = this._190451707bgScale;
         if(_loc2_ !== param1)
         {
            this._190451707bgScale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgScale",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgLeft() : Number
      {
         return this._1391823380bgLeft;
      }
      
      public function set bgLeft(param1:Number) : void
      {
         var _loc2_:Object = this._1391823380bgLeft;
         if(_loc2_ !== param1)
         {
            this._1391823380bgLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgTop() : Number
      {
         return this._93657808bgTop;
      }
      
      public function set bgTop(param1:Number) : void
      {
         var _loc2_:Object = this._93657808bgTop;
         if(_loc2_ !== param1)
         {
            this._93657808bgTop = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgTop",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get text() : String
      {
         return this._3556653text;
      }
      
      public function set text(param1:String) : void
      {
         var _loc2_:Object = this._3556653text;
         if(_loc2_ !== param1)
         {
            this._3556653text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dynamic() : Boolean
      {
         return this._2124767295dynamic;
      }
      
      public function set dynamic(param1:Boolean) : void
      {
         var _loc2_:Object = this._2124767295dynamic;
         if(_loc2_ !== param1)
         {
            this._2124767295dynamic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dynamic",_loc2_,param1));
            }
         }
      }
   }
}

