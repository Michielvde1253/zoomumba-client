package windows.custom.questsWindow.components
{
   import com.greensock.TweenMax;
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
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.BitmapFill;
   import mx.graphics.SolidColor;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.primitives.Ellipse;
   import spark.primitives.Rect;
   import utils.Color;
   import windows.events.QuestWindowEvents;
   
   use namespace mx_internal;
   
   public class QuestItemButton extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1332194002background:BackgroundImage;
      
      private var _835193660bitmapBounds:Rect;
      
      private var _951530617content:BitmapFill;
      
      private var _1204617795hitCircle:Ellipse;
      
      private var _1110650414hitContainer:HGroup;
      
      private var _109757537stars:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _23410101_bitmapContent:BitmapData;
      
      private var _109324790sepia:Boolean = false;
      
      public var questId:int = -1;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function QuestItemButton()
      {
         var watchers:Array;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._QuestItemButton_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_questsWindow_components_QuestItemButtonWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return QuestItemButton[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 90;
         this.height = 90;
         this.maxWidth = 90;
         this.maxHeight = 90;
         this.mxmlContent = [this._QuestItemButton_BackgroundImage1_i(),this._QuestItemButton_HGroup1_c(),this._QuestItemButton_Image1_i(),this._QuestItemButton_HGroup2_i()];
         this.currentState = "up";
         this.addEventListener("click",this.___QuestItemButton_Group1_click);
         this.addEventListener("creationComplete",this.___QuestItemButton_Group1_creationComplete);
         this.addEventListener("mouseOut",this.___QuestItemButton_Group1_mouseOut);
         this.addEventListener("mouseOver",this.___QuestItemButton_Group1_mouseOver);
         this.addEventListener("mouseUp",this.___QuestItemButton_Group1_mouseUp);
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
         QuestItemButton._watcherSetupUtil = param1;
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
      
      protected function overState(param1:MouseEvent) : void
      {
         currentState = "over";
      }
      
      protected function upState(param1:MouseEvent) : void
      {
         currentState = "up";
      }
      
      protected function button1_clickHandler(param1:MouseEvent) : void
      {
         currentState = "down";
         dispatchEvent(new QuestWindowEvents(QuestWindowEvents.QUEST_ITEM_BUTTON_CLICKED,this.questId));
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
      
      protected function config(param1:FlexEvent) : void
      {
         this.hitContainer.mouseEnabled = false;
         hitArea = this.hitContainer;
         this.buttonMode = true;
         this.useHandCursor = true;
      }
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         super.stateChanged(param1,param2,param3);
         if(param1 != param2)
         {
            switch(param2)
            {
               case "over":
                  TweenMax.to(this.bitmapBounds,0.2,{
                     "scaleX":1.1,
                     "scaleY":1.1
                  });
                  break;
               case "up":
                  TweenMax.to(this.bitmapBounds,0.2,{
                     "scaleX":1,
                     "scaleY":1
                  });
            }
         }
      }
      
      private function _QuestItemButton_BackgroundImage1_i() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.verticalCenter = 3;
         _loc1_.horizontalCenter = 0;
         _loc1_.scale = 0.57;
         _loc1_.id = "background";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _QuestItemButton_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalCenter = 3;
         _loc1_.horizontalCenter = 0;
         _loc1_.focusEnabled = false;
         _loc1_.horizontalAlign = "center";
         _loc1_.mouseEnabled = false;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._QuestItemButton_Rect1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _QuestItemButton_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.fill = this._QuestItemButton_BitmapFill1_i();
         _loc1_.initialized(this,"bitmapBounds");
         this.bitmapBounds = _loc1_;
         BindingManager.executeBindings(this,"bitmapBounds",this.bitmapBounds);
         return _loc1_;
      }
      
      private function _QuestItemButton_BitmapFill1_i() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         _loc1_.smooth = true;
         this.content = _loc1_;
         BindingManager.executeBindings(this,"content",this.content);
         return _loc1_;
      }
      
      private function _QuestItemButton_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.x = 3;
         _loc1_.y = 17;
         _loc1_.id = "stars";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.stars = _loc1_;
         BindingManager.executeBindings(this,"stars",this.stars);
         return _loc1_;
      }
      
      private function _QuestItemButton_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._QuestItemButton_Ellipse1_i()];
         _loc1_.id = "hitContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitContainer = _loc1_;
         BindingManager.executeBindings(this,"hitContainer",this.hitContainer);
         return _loc1_;
      }
      
      private function _QuestItemButton_Ellipse1_i() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.fill = this._QuestItemButton_SolidColor1_c();
         _loc1_.initialized(this,"hitCircle");
         this.hitCircle = _loc1_;
         BindingManager.executeBindings(this,"hitCircle",this.hitCircle);
         return _loc1_;
      }
      
      private function _QuestItemButton_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0;
         _loc1_.color = 14540253;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      public function ___QuestItemButton_Group1_click(param1:MouseEvent) : void
      {
         this.button1_clickHandler(param1);
      }
      
      public function ___QuestItemButton_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      public function ___QuestItemButton_Group1_mouseOut(param1:MouseEvent) : void
      {
         this.upState(param1);
      }
      
      public function ___QuestItemButton_Group1_mouseOver(param1:MouseEvent) : void
      {
         this.overState(param1);
      }
      
      public function ___QuestItemButton_Group1_mouseUp(param1:MouseEvent) : void
      {
         this.upState(param1);
      }
      
      private function _QuestItemButton_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Array
         {
            var _loc1_:* = sepia ? [Color.getColorMatrixFilter(Color.SEPIA)] : [];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"bitmapBounds.filters");
         result[1] = new Binding(this,function():Object
         {
            return _bitmapContent;
         },null,"content.source");
         result[2] = new Binding(this,function():Number
         {
            return background.width;
         },null,"hitCircle.width");
         result[3] = new Binding(this,function():Number
         {
            return background.height;
         },null,"hitCircle.height");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : BackgroundImage
      {
         return this._1332194002background;
      }
      
      public function set background(param1:BackgroundImage) : void
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
      public function get hitCircle() : Ellipse
      {
         return this._1204617795hitCircle;
      }
      
      public function set hitCircle(param1:Ellipse) : void
      {
         var _loc2_:Object = this._1204617795hitCircle;
         if(_loc2_ !== param1)
         {
            this._1204617795hitCircle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hitCircle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hitContainer() : HGroup
      {
         return this._1110650414hitContainer;
      }
      
      public function set hitContainer(param1:HGroup) : void
      {
         var _loc2_:Object = this._1110650414hitContainer;
         if(_loc2_ !== param1)
         {
            this._1110650414hitContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hitContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get stars() : Image
      {
         return this._109757537stars;
      }
      
      public function set stars(param1:Image) : void
      {
         var _loc2_:Object = this._109757537stars;
         if(_loc2_ !== param1)
         {
            this._109757537stars = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stars",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get sepia() : Boolean
      {
         return this._109324790sepia;
      }
      
      public function set sepia(param1:Boolean) : void
      {
         var _loc2_:Object = this._109324790sepia;
         if(_loc2_ !== param1)
         {
            this._109324790sepia = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sepia",_loc2_,param1));
            }
         }
      }
   }
}

