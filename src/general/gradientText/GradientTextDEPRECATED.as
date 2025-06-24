package general.gradientText
{
   import com.greensock.TweenLite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.SpreadMethod;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   
   public class GradientTextDEPRECATED extends Group
   {
      private var _229990418bitmapContainer:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _colour:uint = 0;
      
      private var _text:String = "default";
      
      private var _width:Number = 10;
      
      private var _height:Number = 10;
      
      private var _align:String = "left";
      
      private var _fontSize:int = 10;
      
      private var _font:String = "Tahoma";
      
      private var _multiline:Boolean = false;
      
      private var _textWidth:int = -1;
      
      private var _textHeight:int = -1;
      
      private var _bold:Boolean = false;
      
      private var _italic:Boolean = false;
      
      private var textField:TextField = new TextField();
      
      private var bitmapData:BitmapData;
      
      private var waitForRender:Boolean = false;
      
      public function GradientTextDEPRECATED()
      {
         super();
         this.mxmlContent = [this._GradientTextDEPRECATED_SpriteVisualElement1_i()];
         this.addEventListener("preinitialize",this.___GradientTextDEPRECATED_Group1_preinitialize);
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
      
      protected function initComponent(param1:FlexEvent) : void
      {
      }
      
      private function createTextField() : void
      {
         this.textField = new TextField();
         this.textField.autoSize = TextFieldAutoSize.LEFT;
         this.textField.embedFonts = true;
         this.textField.textColor = this._colour;
         this.textField.text = this._text;
         this.textField.multiline = this._multiline;
         this.textField.wordWrap = this._multiline;
         if(this._textWidth > 0)
         {
            this.textField.width = this._textWidth;
         }
         if(this._textHeight > 0)
         {
            this.textField.height = this._textHeight;
         }
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.size = this._fontSize;
         _loc1_.font = this._font;
         _loc1_.bold = this._bold;
         _loc1_.italic = this._italic;
         this.textField.defaultTextFormat = _loc1_;
         this.textField.setTextFormat(_loc1_);
      }
      
      private function getGradientObject(param1:TextField) : Sprite
      {
         var _loc2_:Sprite = new Sprite();
         _loc2_.addChild(this.textField);
         var _loc3_:Sprite = new Sprite();
         var _loc4_:String = GradientType.LINEAR;
         var _loc5_:Array = [16761184,16580605,16761184];
         var _loc6_:Array = [1,1,1];
         var _loc7_:Array = [0,136,255];
         var _loc8_:String = SpreadMethod.PAD;
         var _loc9_:Matrix = new Matrix();
         _loc9_.createGradientBox(Math.ceil(this.textField.width),Math.ceil(this.textField.height),90,0,0);
         var _loc10_:Graphics = _loc3_.graphics;
         _loc10_.beginGradientFill(_loc4_,_loc5_,_loc6_,_loc7_,_loc9_,_loc8_);
         _loc10_.drawRect(0,0,Math.ceil(this.textField.width),Math.ceil(this.textField.height));
         _loc10_.endFill();
         var _loc11_:Sprite = new Sprite();
         _loc11_.addChild(_loc3_);
         _loc3_.mask = _loc2_;
         _loc11_.filters = [new GlowFilter(2889217,1,2,2,4,3)];
         return _loc11_;
      }
      
      private function disposeBitmapText() : void
      {
         if(this.bitmapContainer.numChildren > 0)
         {
            this.bitmapData.dispose();
            this.bitmapContainer.removeChildAt(0);
         }
      }
      
      public function set fontSize(param1:int) : void
      {
         this._fontSize = param1;
         this.preDraw();
      }
      
      public function set multiline(param1:Boolean) : void
      {
         this._multiline = param1;
         this.preDraw();
      }
      
      public function set textWidth(param1:int) : void
      {
         this._textWidth = param1;
         this.preDraw();
      }
      
      public function set textHeight(param1:int) : void
      {
         this._textHeight = param1;
         this.preDraw();
      }
      
      public function set colour(param1:uint) : void
      {
         this._colour = param1;
         this.preDraw();
      }
      
      public function set text(param1:String) : void
      {
         this._text = param1;
         this.preDraw();
      }
      
      public function set bold(param1:Boolean) : void
      {
         this._bold = param1;
         this.preDraw();
      }
      
      public function set italic(param1:Boolean) : void
      {
         this._italic = param1;
         this.preDraw();
      }
      
      public function set align(param1:String) : void
      {
         this._align = param1;
         this.preDraw();
      }
      
      public function set containerWidth(param1:int) : void
      {
         this._width = param1;
         this.preDraw();
      }
      
      public function set containerHeight(param1:int) : void
      {
         this._height = param1;
         this.preDraw();
      }
      
      private function preDraw() : void
      {
         if(!this.waitForRender)
         {
            TweenLite.delayedCall(0.05,this.draw);
            this.waitForRender = true;
         }
      }
      
      private function draw() : void
      {
         this.waitForRender = false;
         this.createTextField();
         this.disposeBitmapText();
         var _loc1_:Sprite = this.getGradientObject(this.textField);
         this.bitmapData = new BitmapData(_loc1_.width,_loc1_.height,true,0);
         this.bitmapData.draw(_loc1_);
         var _loc2_:Bitmap = new Bitmap(this.bitmapData);
         this.bitmapContainer.addChild(_loc2_);
         switch(this._align)
         {
            case "center":
               _loc2_.x = this.width / 2 - _loc2_.width / 2;
               break;
            case "left":
               break;
            case "right":
               _loc2_.x = this.width - _loc2_.width;
         }
      }
      
      private function _GradientTextDEPRECATED_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"bitmapContainer");
         this.bitmapContainer = _loc1_;
         BindingManager.executeBindings(this,"bitmapContainer",this.bitmapContainer);
         return _loc1_;
      }
      
      public function ___GradientTextDEPRECATED_Group1_preinitialize(param1:FlexEvent) : void
      {
         this.initComponent(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapContainer() : SpriteVisualElement
      {
         return this._229990418bitmapContainer;
      }
      
      public function set bitmapContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._229990418bitmapContainer;
         if(_loc2_ !== param1)
         {
            this._229990418bitmapContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapContainer",_loc2_,param1));
            }
         }
      }
   }
}

