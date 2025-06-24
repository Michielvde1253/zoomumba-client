package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.view.gui.win.generals.SizedMiniWindow;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class SaveScreenshotWindow extends SizedMiniWindow
   {
      private var image:BitmapData;
      
      private const MAX_WIDTH:int = 200;
      
      private const MAX_HEIGHT:int = 100;
      
      public function SaveScreenshotWindow(param1:Notifier, param2:BitmapData, param3:WindowButtonParams = null)
      {
         var _loc4_:String = null;
         _loc4_ = "SaveScreenshotWindow";
         modal = true;
         this.image = param2;
         super(param1,_loc4_,param3);
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         var _loc1_:Sprite = new Sprite();
         this.addChild(_loc1_);
         _loc1_.x = 40;
         _loc1_.y = 100;
         var _loc2_:Bitmap = new Bitmap(this.image);
         var _loc3_:Number = _loc2_.width / _loc2_.height;
         if(_loc2_.width > this.MAX_WIDTH)
         {
            _loc2_.width = this.MAX_WIDTH;
            _loc2_.height = this.MAX_WIDTH / _loc3_;
         }
         if(_loc2_.height > this.MAX_HEIGHT)
         {
            _loc2_.height = this.MAX_HEIGHT;
            _loc2_.width = this.MAX_HEIGHT * _loc3_;
         }
         _loc1_.addChild(_loc2_);
         _loc2_.smoothing = true;
         _loc2_.x = 130 - _loc2_.width / 2;
         _loc2_.y = 55 - _loc2_.height / 2;
      }
   }
}

