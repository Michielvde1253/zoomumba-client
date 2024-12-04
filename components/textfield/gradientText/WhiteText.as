package components.textfield.gradientText
{
   import com.greensock.TweenLite;
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
   import mx.binding.*;
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.filters.*;
   import mx.graphics.BitmapFill;
   import mx.graphics.SolidColorStroke;
   import mx.styles.*;
   import spark.components.Group;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class WhiteText extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _WhiteText_Rect2:Rect;
      
      private var _835193660bitmapBounds:Rect;
      
      private var _1743770798bitmapFill:BitmapFill;
      
      private var _102727412label:Text;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _94842723color:uint = 16777215;
      
      private var _365601008fontSize:int = 12;
      
      private var _1224696685fontFamily:String = "Tahoma";
      
      private var _734428249fontWeight:String = "bold";
      
      private var _1065511464textAlign:String = "left";
      
      private var _997851166bitmapPadding:int = 4;
      
      private var _202355100paddingBottom:int = 0;
      
      private var _1501175880paddingLeft:int = 0;
      
      private var _713848971paddingRight:int = 0;
      
      private var _90130308paddingTop:int = 0;
      
      private var _50359046leading:int = 0;
      
      private var _198450538debugMode:Boolean = false;
      
      private var _92903173align:String = "";
      
      private var _1625704636flatMode:Boolean = false;
      
      private var _1793372631bitmapWidth:int = 0;
      
      private var _673018058bitmapHeight:int = 0;
      
      private var _416492891internalRotation:int = 0;
      
      private var _text:String;
      
      private var _htmlText:String;
      
      private var _created:Boolean = false;
      
      private var _textChanged:Boolean = false;
      
      private var _lastTimerToRedraw:int = 0;
      
      private var _firstDraw:Boolean = true;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function WhiteText()
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
         bindings = this._WhiteText_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_components_textfield_gradientText_WhiteTextWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return WhiteText[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._WhiteText_Text1_i(),this._WhiteText_Rect1_i(),this._WhiteText_Rect2_i()];
         this.addEventListener("creationComplete",this.___WhiteText_Group1_creationComplete);
         this.addEventListener("addedToStage",this.___WhiteText_Group1_addedToStage);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         WhiteText._watcherSetupUtil = param1;
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
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this.label.maxWidth = param1;
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
         this.label.maxHeight = param1;
      }
      
      override public function set rotation(param1:Number) : void
      {
         this.internalRotation = param1;
      }
      
      override public function get rotation() : Number
      {
         return this.internalRotation;
      }
      
      private function created(param1:FlexEvent) : void
      {
         this._created = true;
         this.update(null);
      }
      
      private function generateRadialAlphaBox(param1:Number, param2:Number, param3:Array, param4:Array, param5:Array) : BitmapData
      {
         var _loc6_:BitmapData = new BitmapData(param1,param2,true,0);
         var _loc7_:Matrix = new Matrix();
         var _loc8_:Sprite = new Sprite();
         _loc7_.createGradientBox(param1,param2,90,0,0);
         _loc8_.graphics.beginGradientFill(GradientType.LINEAR,param3,param4,param5,_loc7_,SpreadMethod.PAD);
         _loc8_.graphics.drawRect(0,0,param1,param2);
         _loc8_.graphics.endFill();
         _loc6_.draw(_loc8_);
         return _loc6_;
      }
      
      private function getTextBitmapData(param1:Number, param2:Number) : BitmapData
      {
         var _loc3_:BitmapData = new BitmapData(param1,param2,true,0);
         _loc3_.draw(this.label,null,null,null,null,true);
         return _loc3_;
      }
      
      private function update(param1:Event) : void
      {
         if(this._created)
         {
            TweenLite.delayedCall(this.DELAY,this.draw,[getTimer()]);
         }
      }
      
      private function render(param1:Event) : void
      {
         if(this._textChanged)
         {
            this._textChanged = false;
            this.update(null);
         }
      }
      
      private function get DELAY() : Number
      {
         if(this._firstDraw)
         {
            return 0.05;
         }
         return 0.1;
      }
      
      private function draw(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:BitmapData = null;
         var _loc8_:BitmapData = null;
         var _loc9_:BitmapData = null;
         if(this.label.textWidth > 0 && param1 >= this._lastTimerToRedraw)
         {
            _loc2_ = [16777215,16777215];
            _loc3_ = [1,1];
            _loc4_ = [0,255];
            _loc5_ = this.bitmapWidth > 0 ? this.bitmapWidth : int(this.label.width);
            _loc6_ = this.bitmapHeight > 0 ? this.bitmapHeight : int(this.label.height);
            _loc7_ = new BitmapData(_loc5_ + this.bitmapPadding,_loc6_ + this.bitmapPadding,!this.debugMode,this.debugMode ? 16711680 : 0);
            _loc8_ = this.generateRadialAlphaBox(_loc7_.width,_loc7_.height,_loc2_,_loc3_,_loc4_);
            _loc9_ = this.getTextBitmapData(_loc7_.width,_loc7_.height);
            if(this.debugMode || this.flatMode)
            {
               _loc7_.copyPixels(_loc9_,_loc7_.rect,new Point(this.bitmapPadding / 2,this.bitmapPadding / 2));
            }
            else
            {
               _loc7_.copyPixels(_loc8_,_loc7_.rect,new Point(this.bitmapPadding / 2,this.bitmapPadding / 2),_loc9_,new Point(this.bitmapPadding / 2,this.bitmapPadding / 2),true);
            }
            if(!this.debugMode && !this.flatMode)
            {
               _loc7_.applyFilter(_loc7_,_loc7_.rect,new Point(),new GlowFilter(0,0.7,1.5,1.5,4,3));
               _loc7_.applyFilter(_loc7_,_loc7_.rect,new Point(),new GlowFilter(0,0.5,4,4,1.5,3));
            }
            this.dispose();
            this.bitmapBounds.height = _loc7_.height;
            this.bitmapBounds.width = _loc7_.width;
            this.bitmapFill.source = _loc7_;
            this._lastTimerToRedraw = param1;
            this._firstDraw = false;
         }
      }
      
      public function dispose() : void
      {
         if(this.bitmapFill.source)
         {
            this._htmlText = null;
            this._text = null;
            BitmapData(this.bitmapFill.source).dispose();
            this.bitmapFill.source = null;
            this.bitmapBounds.width = 0;
            this.bitmapBounds.height = 0;
         }
      }
      
      public function get htmlText() : String
      {
         return this._htmlText;
      }
      
      public function set htmlText(param1:String) : void
      {
         if(this._htmlText != param1)
         {
            this._htmlText = param1;
            this.label.htmlText = this._htmlText;
            this._textChanged = true;
         }
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function set text(param1:String) : void
      {
         if(this._text != param1)
         {
            this._text = param1;
            this.label.text = this._text;
            this._textChanged = true;
         }
      }
      
      private function _WhiteText_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = true;
         _loc1_.selectable = false;
         _loc1_.visible = false;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.addEventListener("resize",this.__label_resize);
         _loc1_.addEventListener("render",this.__label_render);
         _loc1_.id = "label";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.label = _loc1_;
         BindingManager.executeBindings(this,"label",this.label);
         return _loc1_;
      }
      
      public function __label_resize(param1:ResizeEvent) : void
      {
         this.render(param1);
      }
      
      public function __label_render(param1:Event) : void
      {
         this.render(param1);
      }
      
      private function _WhiteText_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.fill = this._WhiteText_BitmapFill1_i();
         _loc1_.initialized(this,"bitmapBounds");
         this.bitmapBounds = _loc1_;
         BindingManager.executeBindings(this,"bitmapBounds",this.bitmapBounds);
         return _loc1_;
      }
      
      private function _WhiteText_BitmapFill1_i() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         _loc1_.smooth = true;
         this.bitmapFill = _loc1_;
         BindingManager.executeBindings(this,"bitmapFill",this.bitmapFill);
         return _loc1_;
      }
      
      private function _WhiteText_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._WhiteText_SolidColorStroke1_c();
         _loc1_.initialized(this,"_WhiteText_Rect2");
         this._WhiteText_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_WhiteText_Rect2",this._WhiteText_Rect2);
         return _loc1_;
      }
      
      private function _WhiteText_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11141120;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      public function ___WhiteText_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.created(param1);
      }
      
      public function ___WhiteText_Group1_addedToStage(param1:Event) : void
      {
         this.update(param1);
      }
      
      private function _WhiteText_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,function(param1:uint):void
         {
            label.setStyle("color",param1);
         },"label.color","color");
         result[1] = new Binding(this,null,function(param1:Number):void
         {
            label.setStyle("fontSize",param1);
         },"label.fontSize","fontSize");
         result[2] = new Binding(this,null,function(param1:Number):void
         {
            label.setStyle("paddingBottom",param1);
         },"label.paddingBottom","paddingBottom");
         result[3] = new Binding(this,null,function(param1:Number):void
         {
            label.setStyle("paddingLeft",param1);
         },"label.paddingLeft","paddingLeft");
         result[4] = new Binding(this,null,function(param1:Number):void
         {
            label.setStyle("paddingRight",param1);
         },"label.paddingRight","paddingRight");
         result[5] = new Binding(this,null,function(param1:Number):void
         {
            label.setStyle("paddingTop",param1);
         },"label.paddingTop","paddingTop");
         result[6] = new Binding(this,null,function(param1:Number):void
         {
            label.setStyle("leading",param1);
         },"label.leading","leading");
         result[7] = new Binding(this,null,function(param1:String):void
         {
            label.setStyle("fontFamily",param1);
         },"label.fontFamily","fontFamily");
         result[8] = new Binding(this,null,function(param1:String):void
         {
            label.setStyle("fontWeight",param1);
         },"label.fontWeight","fontWeight");
         result[9] = new Binding(this,null,function(param1:String):void
         {
            label.setStyle("textAlign",param1);
         },"label.textAlign","textAlign");
         result[10] = new Binding(this,function():Object
         {
            return align.search(/T|B/g) == -1 ? (debugMode ? 0 : 2) : null;
         },null,"bitmapBounds.verticalCenter");
         result[11] = new Binding(this,function():Object
         {
            return align.search(/L|R/g) == -1 ? (debugMode ? 0 : 2) : null;
         },null,"bitmapBounds.horizontalCenter");
         result[12] = new Binding(this,function():Object
         {
            return align.search(/L/g) != -1 ? 0 : null;
         },null,"bitmapBounds.left");
         result[13] = new Binding(this,function():Object
         {
            return align.search(/R/g) != -1 ? 0 : null;
         },null,"bitmapBounds.right");
         result[14] = new Binding(this,function():Object
         {
            return align.search(/T/g) != -1 ? 0 : null;
         },null,"bitmapBounds.top");
         result[15] = new Binding(this,function():Object
         {
            return align.search(/B/g) != -1 ? 0 : null;
         },null,"bitmapBounds.bottom");
         result[16] = new Binding(this,function():Number
         {
            return internalRotation;
         },null,"bitmapBounds.rotation");
         result[17] = new Binding(this,null,null,"_WhiteText_Rect2.visible","debugMode");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapBounds() : Rect
      {
         return this._835193660bitmapBounds;
      }
      
      public function set bitmapBounds(param1:Rect) : void
      {
         var _loc2_:Object = this._835193660bitmapBounds;
         if(_loc2_ !== param1)
         {
            this._835193660bitmapBounds = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapBounds",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapFill() : BitmapFill
      {
         return this._1743770798bitmapFill;
      }
      
      public function set bitmapFill(param1:BitmapFill) : void
      {
         var _loc2_:Object = this._1743770798bitmapFill;
         if(_loc2_ !== param1)
         {
            this._1743770798bitmapFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get label() : Text
      {
         return this._102727412label;
      }
      
      public function set label(param1:Text) : void
      {
         var _loc2_:Object = this._102727412label;
         if(_loc2_ !== param1)
         {
            this._102727412label = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get color() : uint
      {
         return this._94842723color;
      }
      
      public function set color(param1:uint) : void
      {
         var _loc2_:Object = this._94842723color;
         if(_loc2_ !== param1)
         {
            this._94842723color = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"color",_loc2_,param1));
            }
         }
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
      public function get fontFamily() : String
      {
         return this._1224696685fontFamily;
      }
      
      public function set fontFamily(param1:String) : void
      {
         var _loc2_:Object = this._1224696685fontFamily;
         if(_loc2_ !== param1)
         {
            this._1224696685fontFamily = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fontFamily",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fontWeight() : String
      {
         return this._734428249fontWeight;
      }
      
      public function set fontWeight(param1:String) : void
      {
         var _loc2_:Object = this._734428249fontWeight;
         if(_loc2_ !== param1)
         {
            this._734428249fontWeight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fontWeight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textAlign() : String
      {
         return this._1065511464textAlign;
      }
      
      public function set textAlign(param1:String) : void
      {
         var _loc2_:Object = this._1065511464textAlign;
         if(_loc2_ !== param1)
         {
            this._1065511464textAlign = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textAlign",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapPadding() : int
      {
         return this._997851166bitmapPadding;
      }
      
      public function set bitmapPadding(param1:int) : void
      {
         var _loc2_:Object = this._997851166bitmapPadding;
         if(_loc2_ !== param1)
         {
            this._997851166bitmapPadding = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapPadding",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get paddingBottom() : int
      {
         return this._202355100paddingBottom;
      }
      
      public function set paddingBottom(param1:int) : void
      {
         var _loc2_:Object = this._202355100paddingBottom;
         if(_loc2_ !== param1)
         {
            this._202355100paddingBottom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"paddingBottom",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get paddingLeft() : int
      {
         return this._1501175880paddingLeft;
      }
      
      public function set paddingLeft(param1:int) : void
      {
         var _loc2_:Object = this._1501175880paddingLeft;
         if(_loc2_ !== param1)
         {
            this._1501175880paddingLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"paddingLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get paddingRight() : int
      {
         return this._713848971paddingRight;
      }
      
      public function set paddingRight(param1:int) : void
      {
         var _loc2_:Object = this._713848971paddingRight;
         if(_loc2_ !== param1)
         {
            this._713848971paddingRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"paddingRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get paddingTop() : int
      {
         return this._90130308paddingTop;
      }
      
      public function set paddingTop(param1:int) : void
      {
         var _loc2_:Object = this._90130308paddingTop;
         if(_loc2_ !== param1)
         {
            this._90130308paddingTop = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"paddingTop",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get leading() : int
      {
         return this._50359046leading;
      }
      
      public function set leading(param1:int) : void
      {
         var _loc2_:Object = this._50359046leading;
         if(_loc2_ !== param1)
         {
            this._50359046leading = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"leading",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get debugMode() : Boolean
      {
         return this._198450538debugMode;
      }
      
      public function set debugMode(param1:Boolean) : void
      {
         var _loc2_:Object = this._198450538debugMode;
         if(_loc2_ !== param1)
         {
            this._198450538debugMode = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"debugMode",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get align() : String
      {
         return this._92903173align;
      }
      
      public function set align(param1:String) : void
      {
         var _loc2_:Object = this._92903173align;
         if(_loc2_ !== param1)
         {
            this._92903173align = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"align",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get flatMode() : Boolean
      {
         return this._1625704636flatMode;
      }
      
      public function set flatMode(param1:Boolean) : void
      {
         var _loc2_:Object = this._1625704636flatMode;
         if(_loc2_ !== param1)
         {
            this._1625704636flatMode = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"flatMode",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get bitmapWidth() : int
      {
         return this._1793372631bitmapWidth;
      }
      
      private function set bitmapWidth(param1:int) : void
      {
         var _loc2_:Object = this._1793372631bitmapWidth;
         if(_loc2_ !== param1)
         {
            this._1793372631bitmapWidth = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapWidth",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get bitmapHeight() : int
      {
         return this._673018058bitmapHeight;
      }
      
      private function set bitmapHeight(param1:int) : void
      {
         var _loc2_:Object = this._673018058bitmapHeight;
         if(_loc2_ !== param1)
         {
            this._673018058bitmapHeight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapHeight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get internalRotation() : int
      {
         return this._416492891internalRotation;
      }
      
      private function set internalRotation(param1:int) : void
      {
         var _loc2_:Object = this._416492891internalRotation;
         if(_loc2_ !== param1)
         {
            this._416492891internalRotation = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"internalRotation",_loc2_,param1));
            }
         }
      }
   }
}

