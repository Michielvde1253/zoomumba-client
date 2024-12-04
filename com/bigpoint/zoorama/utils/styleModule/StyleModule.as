package com.bigpoint.zoorama.utils.styleModule
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.CSSResource;
   import com.bigpoint.zoorama.Settings;
   import flash.text.Font;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.utils.Dictionary;
   
   public class StyleModule
   {
      private static var css:StyleSheet;
      
      public static const HEADER_24:int = styleCount++;
      
      public static const HEADER_22:int = styleCount++;
      
      public static const HEADER_20:int = styleCount++;
      
      public static const HEADER_18:int = styleCount++;
      
      public static const HEADER_16:int = styleCount++;
      
      public static const HEADER_14:int = styleCount++;
      
      public static const HEADER_12:int = styleCount++;
      
      public static const HEADER_11:int = styleCount++;
      
      public static const HEADER_10:int = styleCount++;
      
      public static const HEADER_9:int = styleCount++;
      
      public static const HEADER_8:int = styleCount++;
      
      public static const HEADER_BOLD_24:int = styleCount++;
      
      public static const HEADER_BOLD_22:int = styleCount++;
      
      public static const HEADER_BOLD_20:int = styleCount++;
      
      public static const HEADER_BOLD_18:int = styleCount++;
      
      public static const HEADER_BOLD_16:int = styleCount++;
      
      public static const HEADER_BOLD_14:int = styleCount++;
      
      public static const HEADER_BOLD_12:int = styleCount++;
      
      public static const HEADER_BOLD_11:int = styleCount++;
      
      public static const HEADER_BOLD_10:int = styleCount++;
      
      public static const HEADER_BOLD_9:int = styleCount++;
      
      public static const HEADER_BOLD_8:int = styleCount++;
      
      public static const HEADER_24_CENTER:int = styleCount++;
      
      public static const HEADER_22_CENTER:int = styleCount++;
      
      public static const HEADER_20_CENTER:int = styleCount++;
      
      public static const HEADER_12_CENTER:int = styleCount++;
      
      public static const HEADER_11_CENTER:int = styleCount++;
      
      public static const HEADER_10_CENTER:int = styleCount++;
      
      public static const HEADER_9_CENTER:int = styleCount++;
      
      public static const HEADER_8_CENTER:int = styleCount++;
      
      public static const HEADER_BOLD_24_CENTER:int = styleCount++;
      
      public static const HEADER_BOLD_22_CENTER:int = styleCount++;
      
      public static const HEADER_BOLD_20_CENTER:int = styleCount++;
      
      public static const HEADER_BOLD_18_CENTER:int = styleCount++;
      
      public static const HEADER_BOLD_13_CENTER:int = styleCount++;
      
      public static const HEADER_BOLD_12_CENTER:int = styleCount++;
      
      public static const HEADER_BOLD_11_CENTER:int = styleCount++;
      
      public static const HEADER_BOLD_10_CENTER:int = styleCount++;
      
      public static const HEADER_BOLD_9_CENTER:int = styleCount++;
      
      public static const HEADER_BOLD_8_CENTER:int = styleCount++;
      
      public static const HEADER_12_RIGHT:int = styleCount++;
      
      public static const HEADER_11_RIGHT:int = styleCount++;
      
      public static const HEADER_10_RIGHT:int = styleCount++;
      
      public static const HEADER_9_RIGHT:int = styleCount++;
      
      public static const HEADER_8_RIGHT:int = styleCount++;
      
      public static const HEADER_BOLD_18_RIGHT:int = styleCount++;
      
      public static const HEADER_BOLD_12_RIGHT:int = styleCount++;
      
      public static const HEADER_BOLD_11_RIGHT:int = styleCount++;
      
      public static const HEADER_BOLD_10_RIGHT:int = styleCount++;
      
      public static const HEADER_BOLD_9_RIGHT:int = styleCount++;
      
      public static const HEADER_BOLD_8_RIGHT:int = styleCount++;
      
      public static const HEADER_14_LEFT:int = styleCount++;
      
      public static const HEADER_12_LEFT:int = styleCount++;
      
      public static const HEADER_11_LEFT:int = styleCount++;
      
      public static const HEADER_10_LEFT:int = styleCount++;
      
      public static const HEADER_9_LEFT:int = styleCount++;
      
      public static const HEADER_8_LEFT:int = styleCount++;
      
      public static const HEADER_BOLD_14_LEFT:int = styleCount++;
      
      public static const HEADER_BOLD_12_LEFT:int = styleCount++;
      
      public static const HEADER_BOLD_11_LEFT:int = styleCount++;
      
      public static const HEADER_BOLD_10_LEFT:int = styleCount++;
      
      public static const HEADER_BOLD_9_LEFT:int = styleCount++;
      
      public static const HEADER_BOLD_8_LEFT:int = styleCount++;
      
      public static const TOOLTIP_12_CENTER:int = styleCount++;
      
      public static const MONEY_PANEL_14_RIGHT:int = styleCount++;
      
      public static const LEVEL_PANEL_28:int = styleCount++;
      
      public static const LEVEL_PANEL_26:int = styleCount++;
      
      public static const LEVEL_PANEL_24:int = styleCount++;
      
      public static const PLAIN12:int = styleCount++;
      
      private static var styleCount:int = 0;
      
      private static var styles:Array = [];
      
      private static var isInitialized:Boolean = false;
      
      private static var embededFontDir:Dictionary = new Dictionary();
      
      public function StyleModule()
      {
         super();
      }
      
      public static function setTextFieldStyle(param1:TextField, param2:int) : void
      {
         var _loc3_:TextFormat = null;
         var _loc4_:Style = null;
         if(isInitialized)
         {
            _loc3_ = new TextFormat();
            _loc4_ = styles[param2];
            _loc3_.size = _loc4_.size;
            _loc3_.font = _loc4_.fontName;
            _loc3_.bold = _loc4_.bold;
            _loc3_.italic = _loc4_.italic;
            _loc3_.align = _loc4_.align;
            param1.defaultTextFormat = _loc3_;
            param1.setTextFormat(_loc3_);
            if(StyleModule.embededFontDir[_loc4_.fontName])
            {
               param1.embedFonts = true;
            }
            param1.width += 1;
            --param1.width;
            return;
         }
         throw Error("Style Module is not initialized, init it first.");
      }
      
      public static function setTextFieldCSS(param1:TextField) : void
      {
         param1.styleSheet = css;
      }
      
      public static function init() : void
      {
         var _loc1_:CSSResource = CSSResource(AssetLibrary.getAsset("Styles.css"));
         css = new StyleSheet();
         css.parseCSS(_loc1_.getCSS());
         if(Settings.SCALE_TEST)
         {
            styles[StyleModule.HEADER_24] = new Style(22,"Tahoma");
            styles[StyleModule.HEADER_22] = new Style(20,"Tahoma");
            styles[StyleModule.HEADER_20] = new Style(18,"Tahoma");
            styles[StyleModule.HEADER_18] = new Style(16,"Tahoma");
            styles[StyleModule.HEADER_16] = new Style(14,"Tahoma");
            styles[StyleModule.HEADER_14] = new Style(12,"Tahoma");
            styles[StyleModule.HEADER_12] = new Style(10,"Tahoma");
            styles[StyleModule.HEADER_11] = new Style(9,"Tahoma");
            styles[StyleModule.HEADER_10] = new Style(8,"Tahoma");
            styles[StyleModule.HEADER_9] = new Style(7,"Tahoma");
            styles[StyleModule.HEADER_8] = new Style(6,"Tahoma");
            styles[StyleModule.HEADER_BOLD_24] = new Style(22,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_22] = new Style(20,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_20] = new Style(18,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_18] = new Style(16,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_16] = new Style(14,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_14] = new Style(12,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_12] = new Style(10,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_11] = new Style(9,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_10] = new Style(8,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_9] = new Style(7,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_8] = new Style(6,"Tahoma",true);
            styles[StyleModule.HEADER_24_CENTER] = new Style(22,"Tahoma",false,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_22_CENTER] = new Style(20,"Tahoma",false,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_20_CENTER] = new Style(18,"Tahoma",false,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_12_CENTER] = new Style(10,"Tahoma",false,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_11_CENTER] = new Style(9,"Tahoma",false,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_10_CENTER] = new Style(8,"Tahoma",false,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_9_CENTER] = new Style(7,"Tahoma",false,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_8_CENTER] = new Style(6,"Tahoma",false,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_24_CENTER] = new Style(22,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_22_CENTER] = new Style(20,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_20_CENTER] = new Style(18,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_18_CENTER] = new Style(16,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_13_CENTER] = new Style(11,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_12_CENTER] = new Style(10,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_11_CENTER] = new Style(9,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_10_CENTER] = new Style(8,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_9_CENTER] = new Style(7,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_8_CENTER] = new Style(6,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_12_RIGHT] = new Style(10,"Tahoma",false,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_11_RIGHT] = new Style(9,"Tahoma",false,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_10_RIGHT] = new Style(8,"Tahoma",false,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_9_RIGHT] = new Style(7,"Tahoma",false,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_8_RIGHT] = new Style(6,"Tahoma",false,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_BOLD_18_RIGHT] = new Style(16,"Tahoma",true,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_BOLD_12_RIGHT] = new Style(10,"Tahoma",true,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_BOLD_11_RIGHT] = new Style(9,"Tahoma",true,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_BOLD_10_RIGHT] = new Style(8,"Tahoma",true,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_BOLD_9_RIGHT] = new Style(7,"Tahoma",true,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_BOLD_8_RIGHT] = new Style(6,"Tahoma",true,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_14_LEFT] = new Style(12,"Tahoma",false,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_12_LEFT] = new Style(10,"Tahoma",false,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_11_LEFT] = new Style(9,"Tahoma",false,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_10_LEFT] = new Style(8,"Tahoma",false,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_9_LEFT] = new Style(7,"Tahoma",false,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_8_LEFT] = new Style(6,"Tahoma",false,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_BOLD_14_LEFT] = new Style(12,"Tahoma",true,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_BOLD_12_LEFT] = new Style(10,"Tahoma",true,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_BOLD_11_LEFT] = new Style(9,"Tahoma",true,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_BOLD_10_LEFT] = new Style(8,"Tahoma",true,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_BOLD_9_LEFT] = new Style(7,"Tahoma",true,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_BOLD_8_LEFT] = new Style(6,"Tahoma",true,false,TextFormatAlign.LEFT);
            styles[StyleModule.PLAIN12] = new Style(10,"Tahoma");
            styles[StyleModule.HEADER_12_CENTER] = new Style(10,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.TOOLTIP_12_CENTER] = new Style(10,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.MONEY_PANEL_14_RIGHT] = new Style(12,"Tahoma",true,false,TextFormatAlign.RIGHT);
            styles[StyleModule.LEVEL_PANEL_28] = new Style(26,"Tahoma",true);
            styles[StyleModule.LEVEL_PANEL_26] = new Style(24,"Tahoma",true);
            styles[StyleModule.LEVEL_PANEL_24] = new Style(22,"Tahoma",true);
         }
         else
         {
            styles[StyleModule.HEADER_24] = new Style(24,"Tahoma");
            styles[StyleModule.HEADER_22] = new Style(22,"Tahoma");
            styles[StyleModule.HEADER_20] = new Style(20,"Tahoma");
            styles[StyleModule.HEADER_18] = new Style(18,"Tahoma");
            styles[StyleModule.HEADER_16] = new Style(16,"Tahoma");
            styles[StyleModule.HEADER_14] = new Style(14,"Tahoma");
            styles[StyleModule.HEADER_12] = new Style(12,"Tahoma");
            styles[StyleModule.HEADER_11] = new Style(11,"Tahoma");
            styles[StyleModule.HEADER_10] = new Style(10,"Tahoma");
            styles[StyleModule.HEADER_9] = new Style(9,"Tahoma");
            styles[StyleModule.HEADER_8] = new Style(8,"Tahoma");
            styles[StyleModule.HEADER_BOLD_24] = new Style(24,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_22] = new Style(22,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_20] = new Style(20,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_18] = new Style(18,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_16] = new Style(16,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_14] = new Style(14,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_12] = new Style(12,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_11] = new Style(11,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_10] = new Style(10,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_9] = new Style(9,"Tahoma",true);
            styles[StyleModule.HEADER_BOLD_8] = new Style(8,"Tahoma",true);
            styles[StyleModule.HEADER_24_CENTER] = new Style(24,"Tahoma",false,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_22_CENTER] = new Style(22,"Tahoma",false,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_20_CENTER] = new Style(20,"Tahoma",false,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_12_CENTER] = new Style(12,"Tahoma",false,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_11_CENTER] = new Style(11,"Tahoma",false,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_10_CENTER] = new Style(10,"Tahoma",false,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_9_CENTER] = new Style(9,"Tahoma",false,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_8_CENTER] = new Style(8,"Tahoma",false,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_24_CENTER] = new Style(24,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_22_CENTER] = new Style(22,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_20_CENTER] = new Style(20,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_18_CENTER] = new Style(18,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_13_CENTER] = new Style(13,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_12_CENTER] = new Style(12,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_11_CENTER] = new Style(11,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_10_CENTER] = new Style(10,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_9_CENTER] = new Style(9,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_BOLD_8_CENTER] = new Style(8,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.HEADER_12_RIGHT] = new Style(12,"Tahoma",false,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_11_RIGHT] = new Style(11,"Tahoma",false,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_10_RIGHT] = new Style(10,"Tahoma",false,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_9_RIGHT] = new Style(9,"Tahoma",false,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_8_RIGHT] = new Style(8,"Tahoma",false,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_BOLD_18_RIGHT] = new Style(18,"Tahoma",true,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_BOLD_12_RIGHT] = new Style(12,"Tahoma",true,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_BOLD_11_RIGHT] = new Style(11,"Tahoma",true,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_BOLD_10_RIGHT] = new Style(10,"Tahoma",true,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_BOLD_9_RIGHT] = new Style(9,"Tahoma",true,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_BOLD_8_RIGHT] = new Style(8,"Tahoma",true,false,TextFormatAlign.RIGHT);
            styles[StyleModule.HEADER_14_LEFT] = new Style(14,"Tahoma",false,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_12_LEFT] = new Style(12,"Tahoma",false,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_11_LEFT] = new Style(11,"Tahoma",false,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_10_LEFT] = new Style(10,"Tahoma",false,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_9_LEFT] = new Style(9,"Tahoma",false,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_8_LEFT] = new Style(8,"Tahoma",false,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_BOLD_14_LEFT] = new Style(14,"Tahoma",true,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_BOLD_12_LEFT] = new Style(12,"Tahoma",true,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_BOLD_11_LEFT] = new Style(11,"Tahoma",true,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_BOLD_10_LEFT] = new Style(10,"Tahoma",true,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_BOLD_9_LEFT] = new Style(9,"Tahoma",true,false,TextFormatAlign.LEFT);
            styles[StyleModule.HEADER_BOLD_8_LEFT] = new Style(8,"Tahoma",true,false,TextFormatAlign.LEFT);
            styles[StyleModule.PLAIN12] = new Style(12,"Tahoma");
            styles[StyleModule.HEADER_12_CENTER] = new Style(12,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.TOOLTIP_12_CENTER] = new Style(12,"Tahoma",true,false,TextFormatAlign.CENTER);
            styles[StyleModule.MONEY_PANEL_14_RIGHT] = new Style(14,"Tahoma",true,false,TextFormatAlign.RIGHT);
            styles[StyleModule.LEVEL_PANEL_28] = new Style(28,"Tahoma",true);
            styles[StyleModule.LEVEL_PANEL_26] = new Style(26,"Tahoma",true);
            styles[StyleModule.LEVEL_PANEL_24] = new Style(24,"Tahoma",true);
         }
         registerCustomFonts();
         isInitialized = true;
      }
      
      private static function registerCustomFonts() : void
      {
         var _loc1_:Array = Font.enumerateFonts();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            StyleModule.embededFontDir[Font(_loc1_[_loc2_]).fontName] = true;
            _loc2_++;
         }
      }
   }
}

