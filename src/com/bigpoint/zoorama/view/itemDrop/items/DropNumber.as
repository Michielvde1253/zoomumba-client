package com.bigpoint.zoorama.view.itemDrop.items
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextField;
   
   public class DropNumber extends MovieClip
   {
      public function DropNumber(param1:int)
      {
         super();
         this.mouseEnabled = false;
         this.mouseChildren = false;
         var _loc2_:Sprite = AssetLibrary.getSprite("quickInfo","DropNumberSPR");
         _loc2_.mouseEnabled = false;
         _loc2_.mouseChildren = false;
         addChild(_loc2_);
         var _loc3_:TextField = _loc2_["amount_txt"] as TextField;
         _loc3_.text = "+" + String(param1);
         _loc3_.mouseEnabled = false;
      }
   }
}

