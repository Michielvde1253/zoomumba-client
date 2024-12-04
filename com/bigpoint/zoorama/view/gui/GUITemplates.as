package com.bigpoint.zoorama.view.gui
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.mainpanels.MainPanelHighlightStar;
   import com.bigpoint.zoorama.view.gui.tooltip.Tooltip;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.SpreadMethod;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public final class GUITemplates
   {
      public function GUITemplates()
      {
         super();
      }
      
      public static function getStandardTooltip(param1:String, param2:Boolean = false) : Tooltip
      {
         var _loc3_:Tooltip = null;
         _loc3_ = new Tooltip();
         _loc3_.skin = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_TOOLTIP);
         _loc3_.followMouse = param2;
         _loc3_.text = param1;
         return _loc3_;
      }
      
      public static function createBitmapTextfield(param1:String, param2:int = -1, param3:int = -1) : Bitmap
      {
         var _loc4_:TextField = getTextObject(param1,param2,param3);
         var _loc5_:Sprite = new Sprite();
         _loc5_.addChild(_loc4_);
         var _loc6_:BitmapData = new BitmapData(_loc5_.width,_loc5_.height,true,0);
         _loc6_.draw(_loc5_);
         return new Bitmap(_loc6_);
      }
      
      public static function createMaskedGradientTextfield(param1:String, param2:int = -1, param3:TextField = null) : Bitmap
      {
         var _loc4_:Sprite = getGradientObject(param1,param2,param3);
         var _loc5_:BitmapData = new BitmapData(_loc4_.width,_loc4_.height,true,0);
         _loc5_.draw(_loc4_);
         var _loc6_:Bitmap = new Bitmap(_loc5_);
         if(Settings.SCALE_TEST)
         {
            _loc6_.scaleX = 1.31466667;
            _loc6_.scaleY = 1.31466667;
         }
         return _loc6_;
      }
      
      public static function drowMaskedGradientTextfield(param1:Bitmap, param2:String, param3:int = -1, param4:Boolean = true, param5:int = 0, param6:int = 0) : void
      {
         var _loc7_:Sprite = getGradientObject(param2,param3);
         if(param4)
         {
            param1.bitmapData.fillRect(new Rectangle(0,0,param1.width,param1.height),0);
         }
         var _loc8_:Matrix = new Matrix();
         _loc8_.translate(param5,param6);
         param1.bitmapData.draw(_loc7_,_loc8_);
      }
      
      private static function getTextObject(param1:String, param2:int = -1, param3:int = -1) : TextField
      {
         var _loc4_:TextField = new TextField();
         _loc4_.autoSize = TextFieldAutoSize.LEFT;
         _loc4_.embedFonts = true;
         _loc4_.textColor = param3;
         if(param2 == -1)
         {
            StyleModule.setTextFieldStyle(_loc4_,StyleModule.HEADER_12);
         }
         else
         {
            StyleModule.setTextFieldStyle(_loc4_,param2);
         }
         StyleModule.setTextFieldCSS(_loc4_);
         _loc4_.text = param1;
         return _loc4_;
      }
      
      private static function getGradientObject(param1:String, param2:int = -1, param3:TextField = null) : Sprite
      {
         var _loc4_:Sprite = new Sprite();
         var _loc5_:TextField = getTextObject(param1,param2,0);
         if(param3)
         {
            _loc5_.autoSize = param3.autoSize;
            _loc5_.multiline = param3.multiline;
            _loc5_.wordWrap = param3.wordWrap;
            _loc5_.width = param3.width;
            _loc5_.height = param3.height;
         }
         _loc4_.addChild(_loc5_);
         var _loc6_:Sprite = new Sprite();
         var _loc7_:String = GradientType.LINEAR;
         var _loc8_:Array = [16761184,16580605,16761184];
         var _loc9_:Array = [1,1,1];
         var _loc10_:Array = [0,136,255];
         var _loc11_:String = SpreadMethod.PAD;
         var _loc12_:Matrix = new Matrix();
         _loc12_.createGradientBox(_loc5_.width,_loc5_.height,90,0,0);
         var _loc13_:Graphics = _loc6_.graphics;
         _loc13_.beginGradientFill(_loc7_,_loc8_,_loc9_,_loc10_,_loc12_,_loc11_);
         _loc13_.drawRect(0,0,_loc5_.width,_loc5_.height);
         _loc13_.endFill();
         var _loc14_:Sprite = new Sprite();
         _loc14_.addChild(_loc6_);
         _loc6_.mask = _loc4_;
         _loc14_.filters = [new GlowFilter(2889217,1,2,2,4,3)];
         return _loc14_;
      }
      
      public static function createStars(param1:Sprite, param2:int = 5, param3:int = 30, param4:int = 30, param5:int = 0, param6:int = 0, param7:int = 0) : Sprite
      {
         var _loc10_:MainPanelHighlightStar = null;
         return new Sprite();
      }
      
      public static function redrawText(... rest) : void
      {
         var _loc2_:TextField = null;
         for each(_loc2_ in rest)
         {
            _loc2_.cacheAsBitmap = !_loc2_.cacheAsBitmap;
            _loc2_.cacheAsBitmap = !_loc2_.cacheAsBitmap;
         }
      }
   }
}

