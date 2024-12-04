package fr.kapit
{
   import com.flexspy.imp.DataGridValueEnumEditor;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import fr.kapit.components.ClassOutlineComponent;
   import fr.kapit.components.ComponentManager;
   import fr.kapit.components.EventLoggerComponent;
   import fr.kapit.components.StatisticsComponent;
   import fr.kapit.components.StyleComponent;
   import fr.kapit.events.EventFilters;
   import fr.kapit.events.EventTrapper;
   import fr.kapit.events.KapDebugEventDispatcher;
   import fr.kapit.introspection.components.DisplayListComponent;
   import fr.kapit.popup.PopupLoader;
   import fr.kapit.tree.DebugComponent;
   import fr.kapit.watch.ChangeWatcherComponent;
   import mx.events.CloseEvent;
   import mx.managers.PopUpManager;
   
   public class KapInspect extends PopupLoader
   {
      private static var _inspector:PopupInspector;
      
      public static const NAME:String = "KapInspect";
      
      private static var KEY_ALT:String = "alt";
      
      private static var KEY_CTRL:String = "ctrl";
      
      private static var KEY_SHIFT:String = "shift";
      
      private static var _initialEventLoggers:Array = [];
      
      private static var _initialItems:Array = [];
      
      private var _alt:Boolean;
      
      private var _ctrl:Boolean;
      
      private var _keycode:uint;
      
      private var _shift:Boolean;
      
      private var _useMouseShortcut:Boolean = true;
      
      public function KapInspect()
      {
         super(NAME,PopupInspector);
         KapDebugEventDispatcher.instance.addEventListener("LoadKapInspect",this._onLoadKapInspect);
         ComponentManager.instance.registerView(DebugComponent,NAME);
         ComponentManager.instance.registerView(EventLoggerComponent,NAME);
         ComponentManager.instance.registerView(StatisticsComponent,NAME);
         ComponentManager.instance.registerView(StyleComponent,NAME);
         ComponentManager.instance.registerView(ClassOutlineComponent,NAME);
         ComponentManager.instance.registerView(DisplayListComponent,NAME);
         ComponentManager.instance.registerView(ChangeWatcherComponent,NAME);
      }
      
      public static function addDebugItem(param1:Object, param2:String = "", param3:Object = null) : void
      {
         if(_inspector)
         {
            _inspector.addDebugItem(param1,param2,param3);
         }
         else
         {
            _initialItems.push({
               "item":param1,
               "name":param2,
               "host":param3
            });
         }
      }
      
      public static function addEventLogger(param1:Object, param2:EventFilters = null, param3:Boolean = false, param4:int = 500) : void
      {
         if(_inspector)
         {
            _inspector.addEventLogger(param1);
         }
         else
         {
            EventTrapper.createTrapper(param1,param2,param3,param4);
            _initialEventLoggers.push({
               "item":param1,
               "filters":param2,
               "chainEvents":param3,
               "maxEvents":param4
            });
         }
      }
      
      public function set logApplicationEvents(param1:Boolean) : void
      {
         if(param1)
         {
            if(popup)
            {
               (popup as PopupInspector).addEventLogger(application);
            }
            else
            {
               EventTrapper.createTrapper(application,null,true);
               _initialEventLoggers.push({
                  "item":application,
                  "filters":null,
                  "chainEvents":true,
                  "maxEvents":500
               });
            }
         }
      }
      
      override public function showPopup() : void
      {
         var _loc1_:Object = null;
         super.showPopup();
         if(!_inspector)
         {
            _inspector = popup as PopupInspector;
            for each(_loc1_ in _initialItems)
            {
               _inspector.addDebugItem(_loc1_.item,_loc1_.name,_loc1_.host);
            }
            for each(_loc1_ in _initialEventLoggers)
            {
               _inspector.addEventLogger(_loc1_.item);
            }
         }
      }
      
      override protected function popupCreated() : void
      {
         var _loc1_:Object = null;
         (popup as PopupInspector).setRootComponents(application,application);
         for each(_loc1_ in _initialEventLoggers)
         {
            (popup as PopupInspector).addEventLogger(_loc1_.item);
         }
         if(width != 0 && height != 0)
         {
            (popup as PopupInspector).initialWidth = width;
            (popup as PopupInspector).initialHeight = height;
         }
      }
      
      override protected function popup_closeHandler(param1:CloseEvent) : void
      {
         PopUpManager.removePopUp(popup);
         if((popup as PopupInspector).mustBeReloaded)
         {
            popup = null;
            this.showPopup();
         }
         else
         {
            popup.visible = false;
            PopupInspector.mouseCapture.isInCapture = false;
         }
      }
      
      override protected function stage_keyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.target is DataGridValueEnumEditor)
         {
            return;
         }
         if(param1.altKey == this._alt && param1.ctrlKey == this._ctrl && param1.shiftKey == this._shift && param1.keyCode == this._keycode)
         {
            return this.showPopup();
         }
         if(Boolean(popup) && Boolean(popup.visible))
         {
            (popup as PopupInspector).onKeyDown(param1);
         }
         if(param1.keyCode == Keyboard.ESCAPE && Boolean(popup))
         {
            if(PopupInspector.mouseCapture.isInCapture)
            {
               PopupInspector.mouseCapture.isInCapture = false;
               (popup as PopupInspector).setCaptureCursor(false);
               popup.visible = true;
            }
            else
            {
               PopUpManager.removePopUp(popup);
               popup.visible = false;
               PopupInspector.mouseCapture.enabled = false;
            }
         }
      }
      
      private function _activatePopup() : void
      {
         if(Boolean(popup) && PopupInspector.mouseCapture.isInCapture)
         {
            PopupInspector.mouseCapture.isInCapture = false;
            (popup as PopupInspector).setCaptureCursor(false);
            popup.visible = true;
         }
         else
         {
            this.showPopup();
         }
      }
      
      private function _onLoadKapInspect(param1:Event) : void
      {
         this._activatePopup();
      }
   }
}

