package fr.kapit.popup
{
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.system.Capabilities;
   import flash.ui.Keyboard;
   import fr.kapit.components.ComponentLoader;
   import fr.kapit.components.IKapDebugComponent;
   import fr.kapit.events.KapDebugEventDispatcher;
   import fr.kapit.events.PluginLoadedEvent;
   import fr.kapit.utils.ApplicationUtils;
   import mx.core.IFlexDisplayObject;
   import mx.core.UIComponent;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.managers.PopUpManager;
   
   public class PopupLoader
   {
      private static const _KEY_ALT:String = "alt";
      
      private static const _KEY_CTRL:String = "ctrl";
      
      private static const _KEY_SHIFT:String = "shift";
      
      public var height:int;
      
      public var popupClass:Class;
      
      public var width:int;
      
      public var x:int;
      
      public var y:int;
      
      protected var application:UIComponent;
      
      protected var defaultShortcutPrefix:String;
      
      protected var isMac:Boolean;
      
      protected var modulesBuffer:Array = [];
      
      protected var popup:IFlexDisplayObject;
      
      protected var viewsBuffer:Array = [];
      
      private var _alt:Boolean;
      
      private var _consoleName:String;
      
      private var _ctrl:Boolean;
      
      private var _keycode:uint;
      
      private var _shift:Boolean;
      
      private var _useMouseShortcut:Boolean = true;
      
      public function PopupLoader(param1:String, param2:Class = null, param3:UIComponent = null)
      {
         super();
         this._consoleName = param1;
         this.popupClass = param2;
         this.application = param3 || ApplicationUtils.application;
         if(this.application.stage == null)
         {
            this.application.addEventListener(FlexEvent.APPLICATION_COMPLETE,this.application_applicationCompleteHandler);
         }
         else
         {
            this.initStageListeners();
         }
         this.isMac = Capabilities.version.indexOf("MAC") == 0;
         this.defaultShortcutPrefix = this.isMac ? [_KEY_CTRL,_KEY_SHIFT].join("+") : [_KEY_CTRL,_KEY_ALT].join("+");
         this.shortcut = this.defaultShortcutPrefix + "+123";
         KapDebugEventDispatcher.instance.addEventListener(PluginLoadedEvent.MODULE_LOADED,this.moduleLoadedHandler);
         KapDebugEventDispatcher.instance.addEventListener(PluginLoadedEvent.VIEW_LOADED,this.viewLoadedHandler);
      }
      
      public function set customViews(param1:Array) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in param1)
         {
            if(!(_loc2_ is IKapDebugComponent))
            {
               throw new Error("Given component (index: " + param1.indexOf(_loc2_).toString() + ") must be implemented IKapDebugComponent.");
            }
            (_loc2_ as IKapDebugComponent).registerView(this._consoleName);
         }
      }
      
      public function set pluginModules(param1:String) : void
      {
         if(param1 is String)
         {
            ComponentLoader.loadComponents(param1.split(","),this._consoleName);
         }
      }
      
      public function set shortcut(param1:String) : void
      {
         var _loc3_:String = null;
         this._ctrl = false;
         this._alt = false;
         this._shift = false;
         var _loc2_:Array = param1.split("+");
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_ === _KEY_CTRL || _loc3_ === _KEY_ALT || _loc3_ === _KEY_SHIFT)
            {
               this._ctrl = _loc3_ === _KEY_CTRL ? true : this._ctrl;
               this._alt = _loc3_ === _KEY_ALT ? true : this._alt;
               this._shift = _loc3_ === _KEY_SHIFT ? true : this._shift;
            }
            else
            {
               this._keycode = uint(Number(_loc3_));
            }
         }
      }
      
      public function showPopup() : void
      {
         if(!this.popup)
         {
            this.popup = PopUpManager.createPopUp(this.application,this.popupClass);
            this.popup.addEventListener(FlexEvent.CREATION_COMPLETE,this.popup_creationCompleteHandler);
            if(this.width != 0 && this.height != 0)
            {
               this.popup.width = this.width;
               this.popup.height = this.height;
            }
            else
            {
               this.popup.width = Math.min(700,this.application.width);
               this.popup.height = Math.min(450,this.application.height);
            }
            this.popupCreated();
            if(this.width == 0 || this.height == 0)
            {
               PopUpManager.centerPopUp(this.popup);
            }
            else
            {
               this.popup.x = this.x;
               this.popup.y = this.y;
            }
            this.popup.addEventListener(CloseEvent.CLOSE,this.popup_closeHandler);
         }
         else if(!this.popup.visible)
         {
            PopUpManager.addPopUp(this.popup,this.application);
            this.popup.visible = true;
            if(this.popup.x < 0 || this.popup.y < 0)
            {
               PopUpManager.centerPopUp(this.popup);
            }
         }
      }
      
      public function set useMouseShortcut(param1:Boolean) : void
      {
         this._useMouseShortcut = param1;
         if(!param1 && Boolean(this.application.stage))
         {
            this.application.stage.removeEventListener(MouseEvent.CLICK,this.stage_clickHandler);
         }
      }
      
      protected function initStageListeners() : void
      {
         this.application.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.stage_keyDownHandler);
         if(this._useMouseShortcut)
         {
            this.application.stage.addEventListener(MouseEvent.CLICK,this.stage_clickHandler);
         }
      }
      
      protected function moduleLoadedHandler(param1:PluginLoadedEvent) : void
      {
         if(this._consoleName != param1.console)
         {
            return;
         }
         if(this.popup is IPopupView)
         {
            (this.popup as IPopupView).addModule(param1.pluginName);
         }
         else
         {
            this.modulesBuffer.push(param1.pluginName);
         }
      }
      
      protected function popupCreated() : void
      {
      }
      
      protected function popup_closeHandler(param1:CloseEvent) : void
      {
         PopUpManager.removePopUp(this.popup);
         this.popup.visible = false;
      }
      
      protected function stage_keyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.altKey == this._alt && param1.ctrlKey == this._ctrl && param1.shiftKey == this._shift && param1.keyCode == this._keycode)
         {
            return this.showPopup();
         }
         if(param1.keyCode === Keyboard.ESCAPE && Boolean(this.popup))
         {
            PopUpManager.removePopUp(this.popup);
            this.popup.visible = false;
         }
      }
      
      protected function viewLoadedHandler(param1:PluginLoadedEvent) : void
      {
         if(this._consoleName != param1.console)
         {
            return;
         }
         if(this.popup is IPopupView)
         {
            (this.popup as IPopupView).addCustomView(param1.pluginName);
         }
         else
         {
            this.viewsBuffer.push(param1.pluginName);
         }
      }
      
      private function application_applicationCompleteHandler(param1:FlexEvent) : void
      {
         this.application.removeEventListener(FlexEvent.APPLICATION_COMPLETE,this.application_applicationCompleteHandler);
         this.initStageListeners();
      }
      
      private function popup_creationCompleteHandler(param1:FlexEvent) : void
      {
         var _loc2_:String = null;
         this.popup.removeEventListener(FlexEvent.CREATION_COMPLETE,this.popup_creationCompleteHandler);
         if(this.popup is IPopupView)
         {
            for each(_loc2_ in this.viewsBuffer)
            {
               (this.popup as IPopupView).addCustomView(_loc2_);
            }
            for each(_loc2_ in this.modulesBuffer)
            {
               (this.popup as IPopupView).addModule(_loc2_);
            }
            return;
         }
         throw new Error("popup must implement IPopupView interface.");
      }
      
      private function removeStageListeners() : void
      {
         this.application.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.stage_keyDownHandler);
         if(this._useMouseShortcut)
         {
            this.application.stage.removeEventListener(MouseEvent.CLICK,this.stage_clickHandler);
         }
      }
      
      private function stage_clickHandler(param1:MouseEvent) : void
      {
         if(this.isMac && param1.ctrlKey && param1.shiftKey || param1.ctrlKey && param1.altKey)
         {
            this.showPopup();
         }
      }
   }
}

