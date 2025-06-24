package fr.kapit.assets
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public final class EmbeddedAssets implements IEventDispatcher
   {
      private static var _1510844093iconCapture_off:Class = EmbeddedAssets_iconCapture_off;
      
      private static var _2029473071iconCapture_on:Class = EmbeddedAssets_iconCapture_on;
      
      private static var _408457914iconCapture_over:Class = EmbeddedAssets_iconCapture_over;
      
      private static var _2112966219iconDebugOff:Class = EmbeddedAssets_iconDebugOff;
      
      private static var _901671129iconDebugOn:Class = EmbeddedAssets_iconDebugOn;
      
      private static var _1077427890iconDebugOver:Class = EmbeddedAssets_iconDebugOver;
      
      private static var _1811487144iconDisplayListOff:Class = EmbeddedAssets_iconDisplayListOff;
      
      private static var _196982406iconDisplayListOn:Class = EmbeddedAssets_iconDisplayListOn;
      
      private static var _321542075iconDisplayListOver:Class = EmbeddedAssets_iconDisplayListOver;
      
      private static var _1912314894iconEventOff:Class = EmbeddedAssets_iconEventOff;
      
      private static var _2016522400iconEventOn:Class = EmbeddedAssets_iconEventOn;
      
      private static var _847764971iconEventOver:Class = EmbeddedAssets_iconEventOver;
      
      private static var _1936900902iconOutlineOff:Class = EmbeddedAssets_iconOutlineOff;
      
      private static var _1170859336iconOutlineOn:Class = EmbeddedAssets_iconOutlineOn;
      
      private static var _85598723iconOutlineOver:Class = EmbeddedAssets_iconOutlineOver;
      
      private static var _1655765638iconRefreshPopUp_off:Class = EmbeddedAssets_iconRefreshPopUp_off;
      
      private static var _2131621772iconRefreshPopUp_on:Class = EmbeddedAssets_iconRefreshPopUp_on;
      
      private static var _210888233iconRefreshPopUp_over:Class = EmbeddedAssets_iconRefreshPopUp_over;
      
      private static var _39411758iconRefresh_off:Class = EmbeddedAssets_iconRefresh_off;
      
      private static var _1802386660iconRefresh_on:Class = EmbeddedAssets_iconRefresh_on;
      
      private static var _1221749039iconRefresh_over:Class = EmbeddedAssets_iconRefresh_over;
      
      private static var _853786220iconSeparator:Class = EmbeddedAssets_iconSeparator;
      
      private static var _1295168917iconShowMenu:Class = EmbeddedAssets_iconShowMenu;
      
      private static var _1825475923iconStatisticsOff:Class = EmbeddedAssets_iconStatisticsOff;
      
      private static var _1880776325iconStatisticsOn:Class = EmbeddedAssets_iconStatisticsOn;
      
      private static var _755194224iconStatisticsOver:Class = EmbeddedAssets_iconStatisticsOver;
      
      private static var _927151284iconStylesOff:Class = EmbeddedAssets_iconStylesOff;
      
      private static var _662828550iconStylesOn:Class = EmbeddedAssets_iconStylesOn;
      
      private static var _1323065809iconStylesOver:Class = EmbeddedAssets_iconStylesOver;
      
      private static var _709412322iconUnselect_off:Class = EmbeddedAssets_iconUnselect_off;
      
      private static var _299978928iconUnselect_on:Class = EmbeddedAssets_iconUnselect_on;
      
      private static var _516930043iconUnselect_over:Class = EmbeddedAssets_iconUnselect_over;
      
      private static var _326243291iconWindowBothOff:Class = EmbeddedAssets_iconWindowBothOff;
      
      private static var _1513496681iconWindowBothOn:Class = EmbeddedAssets_iconWindowBothOn;
      
      private static var _1884281938iconWindowOneOff:Class = EmbeddedAssets_iconWindowOneOff;
      
      private static var _1047595364iconWindowOneOn:Class = EmbeddedAssets_iconWindowOneOn;
      
      private static var _2036037292iconWindowTwoOff:Class = EmbeddedAssets_iconWindowTwoOff;
      
      private static var _1042700030iconWindowTwoOn:Class = EmbeddedAssets_iconWindowTwoOn;
      
      private static var _1360045406miniLogo:Class = EmbeddedAssets_miniLogo;
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      private var _bindingEventDispatcher:EventDispatcher = new EventDispatcher(IEventDispatcher(this));
      
      public function EmbeddedAssets()
      {
         super();
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconCapture_off() : Class
      {
         return EmbeddedAssets._1510844093iconCapture_off;
      }
      
      public static function set iconCapture_off(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1510844093iconCapture_off;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconCapture_off",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconCapture_on() : Class
      {
         return EmbeddedAssets._2029473071iconCapture_on;
      }
      
      public static function set iconCapture_on(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._2029473071iconCapture_on;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconCapture_on",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconCapture_over() : Class
      {
         return EmbeddedAssets._408457914iconCapture_over;
      }
      
      public static function set iconCapture_over(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._408457914iconCapture_over;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconCapture_over",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconDebugOff() : Class
      {
         return EmbeddedAssets._2112966219iconDebugOff;
      }
      
      public static function set iconDebugOff(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._2112966219iconDebugOff;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconDebugOff",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconDebugOn() : Class
      {
         return EmbeddedAssets._901671129iconDebugOn;
      }
      
      public static function set iconDebugOn(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._901671129iconDebugOn;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconDebugOn",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconDebugOver() : Class
      {
         return EmbeddedAssets._1077427890iconDebugOver;
      }
      
      public static function set iconDebugOver(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1077427890iconDebugOver;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconDebugOver",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconDisplayListOff() : Class
      {
         return EmbeddedAssets._1811487144iconDisplayListOff;
      }
      
      public static function set iconDisplayListOff(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1811487144iconDisplayListOff;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconDisplayListOff",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconDisplayListOn() : Class
      {
         return EmbeddedAssets._196982406iconDisplayListOn;
      }
      
      public static function set iconDisplayListOn(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._196982406iconDisplayListOn;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconDisplayListOn",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconDisplayListOver() : Class
      {
         return EmbeddedAssets._321542075iconDisplayListOver;
      }
      
      public static function set iconDisplayListOver(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._321542075iconDisplayListOver;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconDisplayListOver",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconEventOff() : Class
      {
         return EmbeddedAssets._1912314894iconEventOff;
      }
      
      public static function set iconEventOff(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1912314894iconEventOff;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconEventOff",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconEventOn() : Class
      {
         return EmbeddedAssets._2016522400iconEventOn;
      }
      
      public static function set iconEventOn(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._2016522400iconEventOn;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconEventOn",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconEventOver() : Class
      {
         return EmbeddedAssets._847764971iconEventOver;
      }
      
      public static function set iconEventOver(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._847764971iconEventOver;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconEventOver",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconOutlineOff() : Class
      {
         return EmbeddedAssets._1936900902iconOutlineOff;
      }
      
      public static function set iconOutlineOff(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1936900902iconOutlineOff;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconOutlineOff",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconOutlineOn() : Class
      {
         return EmbeddedAssets._1170859336iconOutlineOn;
      }
      
      public static function set iconOutlineOn(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1170859336iconOutlineOn;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconOutlineOn",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconOutlineOver() : Class
      {
         return EmbeddedAssets._85598723iconOutlineOver;
      }
      
      public static function set iconOutlineOver(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._85598723iconOutlineOver;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconOutlineOver",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconRefreshPopUp_off() : Class
      {
         return EmbeddedAssets._1655765638iconRefreshPopUp_off;
      }
      
      public static function set iconRefreshPopUp_off(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1655765638iconRefreshPopUp_off;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconRefreshPopUp_off",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconRefreshPopUp_on() : Class
      {
         return EmbeddedAssets._2131621772iconRefreshPopUp_on;
      }
      
      public static function set iconRefreshPopUp_on(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._2131621772iconRefreshPopUp_on;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconRefreshPopUp_on",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconRefreshPopUp_over() : Class
      {
         return EmbeddedAssets._210888233iconRefreshPopUp_over;
      }
      
      public static function set iconRefreshPopUp_over(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._210888233iconRefreshPopUp_over;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconRefreshPopUp_over",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconRefresh_off() : Class
      {
         return EmbeddedAssets._39411758iconRefresh_off;
      }
      
      public static function set iconRefresh_off(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._39411758iconRefresh_off;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconRefresh_off",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconRefresh_on() : Class
      {
         return EmbeddedAssets._1802386660iconRefresh_on;
      }
      
      public static function set iconRefresh_on(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1802386660iconRefresh_on;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconRefresh_on",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconRefresh_over() : Class
      {
         return EmbeddedAssets._1221749039iconRefresh_over;
      }
      
      public static function set iconRefresh_over(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1221749039iconRefresh_over;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconRefresh_over",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconSeparator() : Class
      {
         return EmbeddedAssets._853786220iconSeparator;
      }
      
      public static function set iconSeparator(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._853786220iconSeparator;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconSeparator",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconShowMenu() : Class
      {
         return EmbeddedAssets._1295168917iconShowMenu;
      }
      
      public static function set iconShowMenu(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1295168917iconShowMenu;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconShowMenu",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconStatisticsOff() : Class
      {
         return EmbeddedAssets._1825475923iconStatisticsOff;
      }
      
      public static function set iconStatisticsOff(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1825475923iconStatisticsOff;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconStatisticsOff",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconStatisticsOn() : Class
      {
         return EmbeddedAssets._1880776325iconStatisticsOn;
      }
      
      public static function set iconStatisticsOn(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1880776325iconStatisticsOn;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconStatisticsOn",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconStatisticsOver() : Class
      {
         return EmbeddedAssets._755194224iconStatisticsOver;
      }
      
      public static function set iconStatisticsOver(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._755194224iconStatisticsOver;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconStatisticsOver",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconStylesOff() : Class
      {
         return EmbeddedAssets._927151284iconStylesOff;
      }
      
      public static function set iconStylesOff(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._927151284iconStylesOff;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconStylesOff",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconStylesOn() : Class
      {
         return EmbeddedAssets._662828550iconStylesOn;
      }
      
      public static function set iconStylesOn(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._662828550iconStylesOn;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconStylesOn",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconStylesOver() : Class
      {
         return EmbeddedAssets._1323065809iconStylesOver;
      }
      
      public static function set iconStylesOver(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1323065809iconStylesOver;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconStylesOver",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconUnselect_off() : Class
      {
         return EmbeddedAssets._709412322iconUnselect_off;
      }
      
      public static function set iconUnselect_off(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._709412322iconUnselect_off;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconUnselect_off",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconUnselect_on() : Class
      {
         return EmbeddedAssets._299978928iconUnselect_on;
      }
      
      public static function set iconUnselect_on(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._299978928iconUnselect_on;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconUnselect_on",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconUnselect_over() : Class
      {
         return EmbeddedAssets._516930043iconUnselect_over;
      }
      
      public static function set iconUnselect_over(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._516930043iconUnselect_over;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconUnselect_over",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconWindowBothOff() : Class
      {
         return EmbeddedAssets._326243291iconWindowBothOff;
      }
      
      public static function set iconWindowBothOff(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._326243291iconWindowBothOff;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconWindowBothOff",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconWindowBothOn() : Class
      {
         return EmbeddedAssets._1513496681iconWindowBothOn;
      }
      
      public static function set iconWindowBothOn(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1513496681iconWindowBothOn;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconWindowBothOn",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconWindowOneOff() : Class
      {
         return EmbeddedAssets._1884281938iconWindowOneOff;
      }
      
      public static function set iconWindowOneOff(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1884281938iconWindowOneOff;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconWindowOneOff",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconWindowOneOn() : Class
      {
         return EmbeddedAssets._1047595364iconWindowOneOn;
      }
      
      public static function set iconWindowOneOn(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1047595364iconWindowOneOn;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconWindowOneOn",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconWindowTwoOff() : Class
      {
         return EmbeddedAssets._2036037292iconWindowTwoOff;
      }
      
      public static function set iconWindowTwoOff(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._2036037292iconWindowTwoOff;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconWindowTwoOff",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get iconWindowTwoOn() : Class
      {
         return EmbeddedAssets._1042700030iconWindowTwoOn;
      }
      
      public static function set iconWindowTwoOn(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1042700030iconWindowTwoOn;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"iconWindowTwoOn",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get miniLogo() : Class
      {
         return EmbeddedAssets._1360045406miniLogo;
      }
      
      public static function set miniLogo(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = EmbeddedAssets._1360045406miniLogo;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EmbeddedAssets,"miniLogo",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      public static function get staticEventDispatcher() : IEventDispatcher
      {
         return _staticBindingEventDispatcher;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
   }
}

