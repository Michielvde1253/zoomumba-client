package com.bigpoint.zoomumba.view.windows.events.boardgameEvent.asCompontents
{
   import com.bigpoint.utils.BmpUtil;
   import com.greensock.TweenLite;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.TextField;
   
   public class BoardgameBubble extends Sprite
   {
      private var _asset:Sprite;
      
      private var _text:TextField;
      
      private var _tween:TweenLite;
      
      private var _tweenDelay:TweenLite;
      
      private var _renderdText:Bitmap;
      
      private var _lastText:String;
      
      private var _bmpUtil:BmpUtil;
      
      public function BoardgameBubble(param1:Sprite)
      {
         super();
         this._asset = param1;
         this._asset.mouseEnabled = false;
         this._asset.mouseChildren = false;
         this.x = this._asset.x;
         this.y = this._asset.y;
         this._bmpUtil = new BmpUtil();
         this._text = this._asset.getChildByName("info_txt") as TextField;
      }
      
      public function showBubble(param1:String, param2:int = -1) : void
      {
         this.killTween();
         if(Boolean(param1) && Boolean(this._asset))
         {
            this._text.text = param1;
            if(param1 != this._lastText)
            {
               this.removeRendertText();
               this._renderdText = this._bmpUtil.toBitmap(this._asset);
               this._renderdText.smoothing = true;
               this._renderdText.x = this._renderdText.width / 2 * -1;
               this._renderdText.y = this._renderdText.height / 2 * -1;
               addChild(this._renderdText);
               this._lastText = param1;
            }
            this.scaleX = 0.001;
            this.scaleY = 0.001;
            this.visible = true;
            if(param2 != -1)
            {
               this._tweenDelay = TweenLite.delayedCall(param2,this.hideBubble);
            }
            this._tween = new TweenLite(this,0.5,{
               "scaleX":1,
               "scaleY":1,
               "alpha":1
            });
         }
      }
      
      public function hideBubble() : void
      {
         this.killTween();
         if(this._asset)
         {
            this._tween = new TweenLite(this,0.5,{
               "scaleX":0.01,
               "scaleY":0.01,
               "alpha":0,
               "onComplete":this.unVisible
            });
         }
      }
      
      private function unVisible() : void
      {
         this.visible = false;
         this.killTween();
      }
      
      private function removeRendertText() : void
      {
         if(this._renderdText)
         {
            if(this.contains(this._renderdText))
            {
               this.removeChild(this._renderdText);
            }
         }
      }
      
      private function killTween() : void
      {
         if(this._tween)
         {
            this._tween.kill();
            this._tween = null;
         }
         if(this._tweenDelay)
         {
            this._tweenDelay.kill();
            this._tweenDelay = null;
         }
      }
      
      public function destroy() : void
      {
         this.killTween();
         this.removeRendertText();
         this._asset = null;
      }
   }
}

