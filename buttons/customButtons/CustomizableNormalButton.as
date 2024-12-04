package buttons.customButtons
{
   import com.greensock.TweenMax;
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
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.BitmapFill;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class CustomizableNormalButton extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _835193660bitmapBounds:Rect;
      
      private var _951530617content:BitmapFill;
      
      private var _1248459017hGroup:HGroup;
      
      private var _924936103lockedImg:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var overEffect:int = 0;
      
      public var scaleEffect:Number = 1.1;
      
      private var _usable:Boolean;
      
      private var _locked:Boolean;
      
      private var _23410101_bitmapContent:BitmapData;
      
      private var _embed_mxml__general_Decorations_swf_LockClosedSPR_555374237:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CustomizableNormalButton()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_LockClosedSPR_555374237 = CustomizableNormalButton__embed_mxml__general_Decorations_swf_LockClosedSPR_555374237;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CustomizableNormalButton_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_buttons_customButtons_CustomizableNormalButtonWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CustomizableNormalButton[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.buttonMode = true;
         this.useHandCursor = true;
         this.mxmlContent = [this._CustomizableNormalButton_HGroup1_i(),this._CustomizableNormalButton_Image1_i()];
         this.currentState = "up";
         this.addEventListener("mouseOver",this.___CustomizableNormalButton_Group1_mouseOver);
         this.addEventListener("mouseUp",this.___CustomizableNormalButton_Group1_mouseUp);
         this.addEventListener("mouseOut",this.___CustomizableNormalButton_Group1_mouseOut);
         this.addEventListener("click",this.___CustomizableNormalButton_Group1_click);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[]
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
         CustomizableNormalButton._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.disabledAlpha = 1;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function get bitmapContent() : BitmapData
      {
         return this._bitmapContent;
      }
      
      public function set bitmapContent(param1:BitmapData) : void
      {
         this.bitmapBounds.width = param1.width;
         this.bitmapBounds.height = param1.height;
         this._bitmapContent = param1;
      }
      
      public function set hitContainer(param1:Sprite) : void
      {
         param1.mouseEnabled = false;
         hitArea = param1;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         if(param1)
         {
            TweenMax.to(this,1,{"colorMatrixFilter":{
               "amount":1,
               "remove":true
            }});
         }
         else
         {
            TweenMax.to(this,1,{"colorMatrixFilter":{
               "colorize":13421772,
               "amount":1
            }});
         }
      }
      
      public function set usable(param1:Boolean) : void
      {
         this._usable = param1;
         if(param1)
         {
            TweenMax.to(this,1,{"colorMatrixFilter":{
               "amount":1,
               "remove":true
            }});
         }
         else
         {
            TweenMax.to(this,1,{"colorMatrixFilter":{
               "colorize":13421772,
               "amount":1
            }});
         }
      }
      
      public function get usable() : Boolean
      {
         return this._usable;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this._locked = param1;
         this.lockedImg.visible = this._locked;
      }
      
      public function get locked() : Boolean
      {
         return this._locked;
      }
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         super.stateChanged(param1,param2,param3);
         if(param1 != param2)
         {
            switch(param2)
            {
               case "over":
                  if(this.overEffect == 0)
                  {
                     TweenMax.to(this.bitmapBounds,0.2,{
                        "scaleX":this.scaleEffect,
                        "scaleY":this.scaleEffect
                     });
                  }
                  else if(this.overEffect == 1)
                  {
                     TweenMax.to(this,0.3,{"colorMatrixFilter":{
                        "contrast":1.4,
                        "brightness":1.2
                     }});
                  }
                  break;
               case "up":
                  if(this.overEffect == 0)
                  {
                     TweenMax.to(this.bitmapBounds,0.2,{
                        "scaleX":1,
                        "scaleY":1
                     });
                  }
                  else if(this.overEffect == 1)
                  {
                     TweenMax.to(this,0.3,{"colorMatrixFilter":{
                        "contrast":1,
                        "brightness":1,
                        "remove":true
                     }});
                  }
            }
         }
      }
      
      private function _CustomizableNormalButton_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mouseEnabled = false;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.focusEnabled = false;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CustomizableNormalButton_Rect1_i()];
         _loc1_.id = "hGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hGroup = _loc1_;
         BindingManager.executeBindings(this,"hGroup",this.hGroup);
         return _loc1_;
      }
      
      private function _CustomizableNormalButton_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.fill = this._CustomizableNormalButton_BitmapFill1_i();
         _loc1_.initialized(this,"bitmapBounds");
         this.bitmapBounds = _loc1_;
         BindingManager.executeBindings(this,"bitmapBounds",this.bitmapBounds);
         return _loc1_;
      }
      
      private function _CustomizableNormalButton_BitmapFill1_i() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         _loc1_.smooth = true;
         this.content = _loc1_;
         BindingManager.executeBindings(this,"content",this.content);
         return _loc1_;
      }
      
      private function _CustomizableNormalButton_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.scaleContent = false;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_LockClosedSPR_555374237;
         _loc1_.visible = false;
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("horizontalAlign","center");
         _loc1_.id = "lockedImg";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lockedImg = _loc1_;
         BindingManager.executeBindings(this,"lockedImg",this.lockedImg);
         return _loc1_;
      }
      
      public function ___CustomizableNormalButton_Group1_mouseOver(param1:MouseEvent) : void
      {
         currentState = "over";
      }
      
      public function ___CustomizableNormalButton_Group1_mouseUp(param1:MouseEvent) : void
      {
         currentState = "up";
      }
      
      public function ___CustomizableNormalButton_Group1_mouseOut(param1:MouseEvent) : void
      {
         currentState = "up";
      }
      
      public function ___CustomizableNormalButton_Group1_click(param1:MouseEvent) : void
      {
         currentState = "down";
      }
      
      private function _CustomizableNormalButton_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return _bitmapContent;
         },null,"content.source");
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
      public function get content() : BitmapFill
      {
         return this._951530617content;
      }
      
      public function set content(param1:BitmapFill) : void
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
      public function get hGroup() : HGroup
      {
         return this._1248459017hGroup;
      }
      
      public function set hGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._1248459017hGroup;
         if(_loc2_ !== param1)
         {
            this._1248459017hGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lockedImg() : Image
      {
         return this._924936103lockedImg;
      }
      
      public function set lockedImg(param1:Image) : void
      {
         var _loc2_:Object = this._924936103lockedImg;
         if(_loc2_ !== param1)
         {
            this._924936103lockedImg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lockedImg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _bitmapContent() : BitmapData
      {
         return this._23410101_bitmapContent;
      }
      
      private function set _bitmapContent(param1:BitmapData) : void
      {
         var _loc2_:Object = this._23410101_bitmapContent;
         if(_loc2_ !== param1)
         {
            this._23410101_bitmapContent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bitmapContent",_loc2_,param1));
            }
         }
      }
   }
}

