package fr.kapit.events
{
   import flash.events.ActivityEvent;
   import flash.events.AsyncErrorEvent;
   import flash.events.ContextMenuEvent;
   import flash.events.DataEvent;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.FullScreenEvent;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.StatusEvent;
   import flash.events.TextEvent;
   import fr.kapit.utils.ClassUtils;
   import mx.events.CalendarLayoutChangeEvent;
   import mx.events.ChildExistenceChangedEvent;
   import mx.events.CollectionEvent;
   import mx.events.CuePointEvent;
   import mx.events.DataGridEvent;
   import mx.events.DateChooserEvent;
   import mx.events.DragEvent;
   import mx.events.DropdownEvent;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.FlexMouseEvent;
   import mx.events.IndexChangedEvent;
   import mx.events.ListEvent;
   import mx.events.MenuEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.events.ScrollEvent;
   import mx.events.SliderEvent;
   import mx.events.StateChangeEvent;
   import mx.events.ToolTipEvent;
   import mx.events.VideoEvent;
   import mx.messaging.events.ChannelEvent;
   import mx.messaging.events.ChannelFaultEvent;
   import mx.messaging.events.MessageEvent;
   
   public class BuitinEvents
   {
      public static var Accordion:Array = [IndexChangedEvent.CHANGE];
      
      public static var AdvancedDataGrid:Array = ["headerDragOutside","headerDropOutside","itemClose","itemOpen","itemOpening"];
      
      public static var AdvancedDataGridBaseEx:Array = ["columnStretch","headerRelease","headerShift","itemEditBegin","itemEditEnd","itemFocusIn","itemFocusOut","sort"];
      
      public static var AdvancedListBase:Array = ["change","dataChange","itemClick","itemDoubleClick","itemRollOut","itemRollOver"];
      
      public static var Application:Array = [FlexEvent.APPLICATION_COMPLETE,ErrorEvent.ERROR];
      
      public static var Button:Array = [FlexEvent.BUTTON_DOWN,Event.CHANGE,FlexEvent.DATA_CHANGE];
      
      public static var Camera:Array = [ActivityEvent.ACTIVITY,StatusEvent.STATUS];
      
      public static var Channel:Array = [ChannelEvent.CONNECT,ChannelEvent.DISCONNECT,ChannelFaultEvent.FAULT,MessageEvent.MESSAGE,PropertyChangeEvent.PROPERTY_CHANGE];
      
      public static var ChannelSet:Array = [ChannelEvent.CONNECT,ChannelEvent.DISCONNECT,ChannelFaultEvent.FAULT,MessageEvent.MESSAGE,PropertyChangeEvent.PROPERTY_CHANGE];
      
      public static var ComboBox:Array = [ListEvent.CHANGE,DropdownEvent.CLOSE,FlexEvent.DATA_CHANGE,FlexEvent.ENTER,ListEvent.ITEM_ROLL_OUT,ListEvent.ITEM_ROLL_OVER,DropdownEvent.OPEN,ScrollEvent.SCROLL];
      
      public static var Container:Array = [ChildExistenceChangedEvent.CHILD_ADD,IndexChangedEvent.CHILD_INDEX_CHANGE,ChildExistenceChangedEvent.CHILD_REMOVE,FlexEvent.DATA_CHANGE,ScrollEvent.SCROLL];
      
      public static var ContextMenu:Array = [ContextMenuEvent.MENU_SELECT];
      
      public static var ContextMenuItem:Array = [ContextMenuEvent.MENU_ITEM_SELECT];
      
      public static var DataGrid:Array = [DataGridEvent.COLUMN_STRETCH,DataGridEvent.HEADER_RELEASE,DataGridEvent.ITEM_EDIT_BEGIN,DataGridEvent.ITEM_EDIT_BEGINNING,DataGridEvent.ITEM_EDIT_END,DataGridEvent.ITEM_FOCUS_IN,DataGridEvent.ITEM_FOCUS_OUT,IndexChangedEvent.HEADER_SHIFT];
      
      public static var DateChooser:Array = [CalendarLayoutChangeEvent.CHANGE,DateChooserEvent.SCROLL];
      
      public static var DisplayObject:Array = [Event.ADDED,Event.ADDED_TO_STAGE,Event.ENTER_FRAME,Event.REMOVED,Event.REMOVED_FROM_STAGE,Event.RENDER];
      
      public static var Effect:Array = [EffectEvent.EFFECT_END,EffectEvent.EFFECT_START];
      
      public static var EventDispatcher:Array = [Event.ACTIVATE,Event.DEACTIVATE];
      
      public static var FileReference:Array = [Event.CANCEL,Event.COMPLETE,HTTPStatusEvent.HTTP_STATUS,IOErrorEvent.IO_ERROR,Event.OPEN,ProgressEvent.PROGRESS,SecurityErrorEvent.SECURITY_ERROR,Event.SELECT,DataEvent.UPLOAD_COMPLETE_DATA];
      
      public static var FileReferenceList:Array = [Event.CANCEL,Event.SELECT];
      
      public static var Image:Array = [FlexEvent.DATA_CHANGE];
      
      public static var InteractiveObject:Array = [MouseEvent.CLICK,MouseEvent.DOUBLE_CLICK,FocusEvent.FOCUS_IN,FocusEvent.FOCUS_OUT,KeyboardEvent.KEY_DOWN,FocusEvent.KEY_FOCUS_CHANGE,KeyboardEvent.KEY_UP,MouseEvent.MOUSE_DOWN,FocusEvent.MOUSE_FOCUS_CHANGE,MouseEvent.MOUSE_MOVE,MouseEvent.MOUSE_OUT,MouseEvent.MOUSE_OVER,MouseEvent.MOUSE_UP,MouseEvent.MOUSE_WHEEL,MouseEvent.ROLL_OUT,MouseEvent.ROLL_OVER,Event.TAB_CHILDREN_CHANGE,Event.TAB_ENABLED_CHANGE,Event.TAB_INDEX_CHANGE];
      
      public static var Label:Array = [FlexEvent.DATA_CHANGE,TextEvent.LINK];
      
      public static var ListBase:Array = [ListEvent.CHANGE,FlexEvent.DATA_CHANGE,ListEvent.ITEM_CLICK,ListEvent.ITEM_DOUBLE_CLICK,ListEvent.ITEM_ROLL_OUT,ListEvent.ITEM_ROLL_OVER];
      
      public static var ListCollectionView:Array = [CollectionEvent.COLLECTION_CHANGE];
      
      public static var ListItemRenderer:Array = [FlexEvent.DATA_CHANGE];
      
      public static var LoaderInfo:Array = [Event.COMPLETE,HTTPStatusEvent.HTTP_STATUS,Event.INIT,IOErrorEvent.IO_ERROR,Event.OPEN,ProgressEvent.PROGRESS,Event.UNLOAD];
      
      public static var LocalConnection:Array = [AsyncErrorEvent.ASYNC_ERROR,SecurityErrorEvent.SECURITY_ERROR,StatusEvent.STATUS];
      
      public static var MenuBar:Array = [MenuEvent.CHANGE,MenuEvent.ITEM_CLICK,MenuEvent.ITEM_ROLL_OUT,MenuEvent.ITEM_ROLL_OVER,MenuEvent.MENU_HIDE,MenuEvent.MENU_SHOW];
      
      public static var MenuItemRenderer:Array = [FlexEvent.DATA_CHANGE];
      
      public static var Microphone:Array = [ActivityEvent.ACTIVITY,StatusEvent.STATUS];
      
      public static var NumericStepper:Array = [Event.CHANGE,FlexEvent.DATA_CHANGE];
      
      public static var ProgressBar:Array = [Event.COMPLETE,FlexEvent.HIDE,ProgressEvent.PROGRESS,FlexEvent.SHOW];
      
      public static var Repeater:Array = [FlexEvent.REPEAT,FlexEvent.REPEAT_END,FlexEvent.REPEAT_START];
      
      public static var SWFLoader:Array = [Event.COMPLETE,HTTPStatusEvent.HTTP_STATUS,Event.INIT,IOErrorEvent.IO_ERROR,Event.OPEN,ProgressEvent.PROGRESS,SecurityErrorEvent.SECURITY_ERROR,Event.UNLOAD];
      
      public static var ScrollControlBase:Array = [ScrollEvent.SCROLL];
      
      public static var Slider:Array = [SliderEvent.CHANGE,SliderEvent.THUMB_DRAG,SliderEvent.THUMB_PRESS,SliderEvent.THUMB_RELEASE];
      
      public static var Stage:Array = [FullScreenEvent.FULL_SCREEN,Event.MOUSE_LEAVE,Event.RESIZE];
      
      public static var TextArea:Array = [Event.CHANGE,FlexEvent.DATA_CHANGE,TextEvent.LINK,TextEvent.TEXT_INPUT];
      
      public static var TextField:Array = [Event.CHANGE,TextEvent.LINK,Event.SCROLL,TextEvent.TEXT_INPUT];
      
      public static var TextInput:Array = [Event.CHANGE,FlexEvent.DATA_CHANGE,FlexEvent.ENTER,TextEvent.TEXT_INPUT];
      
      public static var TileListItemRenderer:Array = [FlexEvent.DATA_CHANGE];
      
      public static var Timer:Array = ["timer","timerComplete"];
      
      public static var TreeItemRenderer:Array = [FlexEvent.DATA_CHANGE];
      
      public static var UIComponent:Array = [FlexEvent.ADD,FlexEvent.CREATION_COMPLETE,StateChangeEvent.CURRENT_STATE_CHANGE,StateChangeEvent.CURRENT_STATE_CHANGING,DragEvent.DRAG_COMPLETE,DragEvent.DRAG_DROP,DragEvent.DRAG_ENTER,DragEvent.DRAG_EXIT,DragEvent.DRAG_OVER,EffectEvent.EFFECT_END,EffectEvent.EFFECT_START,FlexEvent.ENTER_STATE,FlexEvent.EXIT_STATE,FlexEvent.HIDE,FlexEvent.INITIALIZE,FlexEvent.INVALID,FlexMouseEvent.MOUSE_DOWN_OUTSIDE,FlexMouseEvent.MOUSE_WHEEL_OUTSIDE,FlexEvent.PREINITIALIZE,FlexEvent.REMOVE,ResizeEvent.RESIZE,FlexEvent.SHOW,ToolTipEvent.TOOL_TIP_CREATE,ToolTipEvent.TOOL_TIP_END,ToolTipEvent.TOOL_TIP_HIDE,ToolTipEvent.TOOL_TIP_SHOW,ToolTipEvent.TOOL_TIP_SHOWN,ToolTipEvent.TOOL_TIP_START,FlexEvent.UPDATE_COMPLETE,FlexEvent.VALID,FlexEvent.VALUE_COMMIT];
      
      public static var VideoDisplay:Array = [VideoEvent.CLOSE,VideoEvent.COMPLETE,CuePointEvent.CUE_POINT,VideoEvent.PLAYHEAD_UPDATE,ProgressEvent.PROGRESS,VideoEvent.READY,VideoEvent.REWIND,VideoEvent.STATE_CHANGE];
      
      public static var ViewStack:Array = [IndexChangedEvent.CHANGE];
      
      public function BuitinEvents()
      {
         super();
      }
      
      public static function getEventsForClass(param1:Class) : Array
      {
         var _loc2_:String = ClassUtils.getShortClassName(param1);
         return BuitinEvents[_loc2_] as Array;
      }
   }
}

