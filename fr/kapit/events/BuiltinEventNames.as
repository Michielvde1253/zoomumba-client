package fr.kapit.events
{
   import flash.events.ActivityEvent;
   import flash.events.ContextMenuEvent;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.HTTPStatusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.NetStatusEvent;
   import flash.events.ProgressEvent;
   import flash.events.StatusEvent;
   import flash.events.SyncEvent;
   import flash.events.TextEvent;
   import flash.events.TimerEvent;
   import fr.kapit.introspection.AccessorDescriptor;
   import fr.kapit.introspection.ClassDescriptor;
   import fr.kapit.introspection.ClassProxy;
   import mx.events.AdvancedDataGridEvent;
   import mx.events.ChildExistenceChangedEvent;
   import mx.events.CloseEvent;
   import mx.events.CollectionEvent;
   import mx.events.ColorPickerEvent;
   import mx.events.CuePointEvent;
   import mx.events.DataGridEvent;
   import mx.events.DateChooserEvent;
   import mx.events.DividerEvent;
   import mx.events.DragEvent;
   import mx.events.DropdownEvent;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.FlexMouseEvent;
   import mx.events.IndexChangedEvent;
   import mx.events.ItemClickEvent;
   import mx.events.ListEvent;
   import mx.events.MoveEvent;
   import mx.events.NumericStepperEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.events.ScrollEvent;
   import mx.events.SliderEvent;
   import mx.events.StateChangeEvent;
   import mx.events.ToolTipEvent;
   import mx.events.TreeEvent;
   import mx.events.TweenEvent;
   import mx.events.ValidationResultEvent;
   import mx.events.VideoEvent;
   import mx.logging.LogEvent;
   import mx.messaging.events.ChannelEvent;
   import mx.messaging.events.ChannelFaultEvent;
   import mx.messaging.events.MessageEvent;
   import mx.messaging.events.MessageFaultEvent;
   import mx.rpc.events.FaultEvent;
   import mx.rpc.events.ResultEvent;
   import mx.rpc.soap.LoadEvent;
   
   public class BuiltinEventNames
   {
      public static const eventClasses:Object = {
         "activity":ActivityEvent,
         "channelFault":ChannelFaultEvent,
         "channelConnect":ChannelEvent,
         "channelDisconnect":ChannelEvent,
         "childRemove":ChildExistenceChangedEvent,
         "overlayCreated":ChildExistenceChangedEvent,
         "childAdd":ChildExistenceChangedEvent,
         "close":CloseEvent,
         "collectionChange":CollectionEvent,
         "itemRollOver":ListEvent,
         "itemRollOut":ListEvent,
         "enter":ColorPickerEvent,
         "change":ListEvent,
         "menuItemSelect":ContextMenuEvent,
         "menuSelect":ContextMenuEvent,
         "cuePoint":CuePointEvent,
         "itemEditEnd":DataGridEvent,
         "itemFocusOut":DataGridEvent,
         "itemEditBeginning":DataGridEvent,
         "columnStretch":DataGridEvent,
         "itemEditBegin":DataGridEvent,
         "itemFocusIn":DataGridEvent,
         "headerRelease":DataGridEvent,
         "scroll":DateChooserEvent,
         "dividerDrag":DividerEvent,
         "dividerRelease":DividerEvent,
         "dividerPress":DividerEvent,
         "close":DropdownEvent,
         "open":DropdownEvent,
         "effectStart":EffectEvent,
         "effectEnd":EffectEvent,
         "repeat":FlexEvent,
         "initProgress":FlexEvent,
         "loading":FlexEvent,
         "transformChange":FlexEvent,
         "preloaderDone":FlexEvent,
         "initComplete":FlexEvent,
         "repeatStart":FlexEvent,
         "remove":FlexEvent,
         "valid":FlexEvent,
         "add":FlexEvent,
         "initialize":FlexEvent,
         "invalid":FlexEvent,
         "dataChange":FlexEvent,
         "enterState":FlexEvent,
         "urlChanged":FlexEvent,
         "preinitialize":FlexEvent,
         "buttonDown":FlexEvent,
         "applicationComplete":FlexEvent,
         "exitState":FlexEvent,
         "idle":FlexEvent,
         "cursorUpdate":FlexEvent,
         "repeatEnd":FlexEvent,
         "enter":FlexEvent,
         "show":FlexEvent,
         "creationComplete":FlexEvent,
         "updateComplete":FlexEvent,
         "valueCommit":FlexEvent,
         "hide":FlexEvent,
         "focusOut":FocusEvent,
         "focusIn":FocusEvent,
         "mouseFocusChange":FocusEvent,
         "keyFocusChange":FocusEvent,
         "httpStatus":HTTPStatusEvent,
         "change":IndexChangedEvent,
         "headerShift":IndexChangedEvent,
         "childIndexChange":IndexChangedEvent,
         "itemClick":ItemClickEvent,
         "keyDown":KeyboardEvent,
         "keyUp":KeyboardEvent,
         "itemDoubleClick":ListEvent,
         "itemEditEnd":ListEvent,
         "itemClick":ListEvent,
         "itemEditBeginning":ListEvent,
         "itemFocusIn":ListEvent,
         "itemRollOver":ListEvent,
         "itemRollOut":ListEvent,
         "change":ListEvent,
         "itemFocusOut":ListEvent,
         "itemEditBegin":ListEvent,
         "load":LoadEvent,
         "result":ResultEvent,
         "fault":FaultEvent,
         "message":MessageEvent,
         "result":MessageEvent,
         "fault":MessageFaultEvent,
         "log":LogEvent,
         "mouseMove":MouseEvent,
         "mouseOver":MouseEvent,
         "click":MouseEvent,
         "rollOver":MouseEvent,
         "mouseUp":MouseEvent,
         "mouseWheel":MouseEvent,
         "mouseOut":MouseEvent,
         "rollOut":MouseEvent,
         "mouseDown":MouseEvent,
         "doubleClick":MouseEvent,
         "move":MoveEvent,
         "netStatus":NetStatusEvent,
         "change":NumericStepperEvent,
         "progress":ProgressEvent,
         "socketData":ProgressEvent,
         "propertyChange":PropertyChangeEvent,
         "resize":ResizeEvent,
         "scroll":ScrollEvent,
         "change":SliderEvent,
         "thumbPress":SliderEvent,
         "thumbDrag":SliderEvent,
         "thumbRelease":SliderEvent,
         "currentStateChanging":StateChangeEvent,
         "currentStateChange":StateChangeEvent,
         "status":StatusEvent,
         "sync":SyncEvent,
         "textInput":TextEvent,
         "link":TextEvent,
         "timerComplete":TimerEvent,
         "timer":TimerEvent,
         "toolTipCreate":ToolTipEvent,
         "toolTipEnd":ToolTipEvent,
         "toolTipStart":ToolTipEvent,
         "toolTipHide":ToolTipEvent,
         "toolTipShown":ToolTipEvent,
         "toolTipShow":ToolTipEvent,
         "itemOpening":TreeEvent,
         "itemOpen":TreeEvent,
         "itemClose":TreeEvent,
         "tweenUpdate":TweenEvent,
         "tweenEnd":TweenEvent,
         "tweenStart":TweenEvent,
         "invalid":ValidationResultEvent,
         "valid":ValidationResultEvent,
         "loading":VideoEvent,
         "rewinding":VideoEvent,
         "connectionError":VideoEvent,
         "stateChange":VideoEvent,
         "execQueuedCmd":VideoEvent,
         "complete":VideoEvent,
         "disconnected":VideoEvent,
         "playheadUpdate":VideoEvent,
         "rewind":VideoEvent,
         "stopped":VideoEvent,
         "ready":VideoEvent,
         "playing":VideoEvent,
         "buffering":VideoEvent,
         "resizing":VideoEvent,
         "seeking":VideoEvent,
         "close":VideoEvent,
         "paused":VideoEvent,
         "complete":Event,
         "fullScreen":Event,
         "unload":Event,
         "connect":Event,
         "close":Event,
         "scroll":Event,
         "deactivate":Event,
         "enterFrame":Event,
         "id3":Event,
         "select":Event,
         "soundComplete":Event,
         "tabChildrenChange":Event,
         "init":Event,
         "tabEnabledChange":Event,
         "mouseLeave":Event,
         "addedToStage":Event,
         "open":Event,
         "cancel":Event,
         "removed":Event,
         "removedFromStage":Event,
         "added":Event,
         "render":Event,
         "tabIndexChange":Event,
         "change":Event,
         "resize":Event,
         "activate":Event,
         "timer":TimerEvent,
         "timerComplete":TimerEvent,
         "columnStretch":AdvancedDataGridEvent,
         "headerDragOutside":AdvancedDataGridEvent,
         "headerDropOutside":AdvancedDataGridEvent,
         "headerRelease":AdvancedDataGridEvent,
         "itemClose":AdvancedDataGridEvent,
         "itemEditBegin":AdvancedDataGridEvent,
         "itemEditBeginning":AdvancedDataGridEvent,
         "itemEditEnd":AdvancedDataGridEvent,
         "itemFocusIn":AdvancedDataGridEvent,
         "itemFocusOut":AdvancedDataGridEvent,
         "itemOpen":AdvancedDataGridEvent,
         "itemOpening":AdvancedDataGridEvent,
         "sort":AdvancedDataGridEvent,
         "dragComplete":DragEvent,
         "dragDrop":DragEvent,
         "dragEnter":DragEvent,
         "dragExit":DragEvent,
         "dragOver":DragEvent,
         "dragStart":DragEvent,
         "mouseDownOutside":FlexMouseEvent,
         "mouseWheelOutside":FlexMouseEvent
      };
      
      public function BuiltinEventNames()
      {
         super();
      }
      
      public static function getEventNames(param1:Class) : Array
      {
         var _loc4_:AccessorDescriptor = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc2_:Array = [];
         var _loc3_:ClassDescriptor = ClassProxy.getInstance().getDescriptor(param1);
         for each(_loc4_ in _loc3_.constants)
         {
            _loc5_ = _loc4_.name;
            _loc6_ = param1[_loc5_] as String;
            if(_loc6_)
            {
               _loc2_.push(_loc6_);
            }
         }
         _loc2_.sort();
         return _loc2_;
      }
   }
}

