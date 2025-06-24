package components.tooltip
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
   import mx.controls.ToolTip;
   import mx.core.FlexGlobals;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.ToolTipEvent;
   import mx.filters.*;
   import mx.managers.ToolTipManager;
   import mx.styles.*;
   import utils.Color;
   import utils.ToolTipConfig;
   
   use namespace mx_internal;
   
   public class ToolTipBrown extends ToolTip implements IToolTipPostionable, IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _currentTarget:DisplayObject;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ToolTipBrown()
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
         bindings = this._ToolTipBrown_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_components_tooltip_ToolTipBrownWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ToolTipBrown[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.maxWidth = 500;
         this.addEventListener("creationComplete",this.___ToolTipBrown_ToolTip1_creationComplete);
         this.addEventListener("removedFromStage",this.___ToolTipBrown_ToolTip1_removedFromStage);
         this.addEventListener("removed",this.___ToolTipBrown_ToolTip1_removed);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ToolTipBrown._watcherSetupUtil = param1;
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
            this.cornerRadius = 8;
            this.fontWeight = "bold";
            this.fontFamily = "Tahoma";
            this.fontSize = 12;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function config(param1:FlexEvent) : void
      {
         if(ToolTipManager.currentTarget)
         {
            this._currentTarget = ToolTipManager.currentTarget;
            this._currentTarget.addEventListener(ToolTipEvent.TOOL_TIP_SHOW,this.show);
            this._currentTarget.addEventListener(ToolTipEvent.TOOL_TIP_HIDE,this.destroy);
            if(ToolTipConfig.isMouseMoveEnabled)
            {
               this._currentTarget.addEventListener(MouseEvent.MOUSE_MOVE,this.moveHandler);
            }
         }
      }
      
      private function destroy(param1:Event) : void
      {
         if(this._currentTarget)
         {
            if(this._currentTarget.hasEventListener(MouseEvent.MOUSE_MOVE))
            {
               this._currentTarget.removeEventListener(MouseEvent.MOUSE_MOVE,this.moveHandler);
            }
            if(this._currentTarget.hasEventListener(ToolTipEvent.TOOL_TIP_SHOW))
            {
               this._currentTarget.removeEventListener(ToolTipEvent.TOOL_TIP_SHOW,this.show);
            }
            if(this._currentTarget.hasEventListener(ToolTipEvent.TOOL_TIP_HIDE))
            {
               this._currentTarget.removeEventListener(ToolTipEvent.TOOL_TIP_HIDE,this.destroy);
            }
            this._currentTarget = null;
         }
      }
      
      private function show(param1:ToolTipEvent) : void
      {
         this.position((FlexGlobals.topLevelApplication as Sprite).stage.mouseX,(FlexGlobals.topLevelApplication as Sprite).stage.mouseY);
      }
      
      private function moveHandler(param1:MouseEvent) : void
      {
         this.position(param1.stageX,param1.stageY);
      }
      
      public function position(param1:Number, param2:Number) : void
      {
         var _loc3_:int = (FlexGlobals.topLevelApplication as Sprite).stage.stageWidth;
         var _loc4_:int = (FlexGlobals.topLevelApplication as Sprite).stage.stageHeight;
         if(param1 > _loc3_ / 2)
         {
            this.x = param1 - this.width - ToolTipConfig.STANDARD_SPACE_X;
         }
         else
         {
            this.x = param1 + ToolTipConfig.STANDARD_SPACE_X;
         }
         if(param2 > _loc4_ / 2)
         {
            this.y = param2 - this.height - ToolTipConfig.STANDARD_SPACE_Y;
         }
         else
         {
            this.y = param2 + ToolTipConfig.STANDARD_SPACE_Y;
         }
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         textField.text = textField.text.replace("<br>","\r");
      }
      
      public function ___ToolTipBrown_ToolTip1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      public function ___ToolTipBrown_ToolTip1_removedFromStage(param1:Event) : void
      {
         this.destroy(param1);
      }
      
      public function ___ToolTipBrown_ToolTip1_removed(param1:Event) : void
      {
         this.destroy(param1);
      }
      
      private function _ToolTipBrown_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return Color.TOOLTIP_NORMAL_TXT_COLOR;
         },function(param1:uint):void
         {
            this.setStyle("color",param1);
         },"this.color");
         result[1] = new Binding(this,function():uint
         {
            return Color.TOOLTIP_COLOR_BROWN;
         },function(param1:uint):void
         {
            this.setStyle("backgroundColor",param1);
         },"this.backgroundColor");
         result[2] = new Binding(this,function():uint
         {
            return Color.TOOLTIP_COLOR_BROWN;
         },function(param1:uint):void
         {
            this.setStyle("borderColor",param1);
         },"this.borderColor");
         return result;
      }
   }
}

