package com.bigpoint.zoomumba.view.gui.effects.vo
{
   public class PlayFieldEffectVo
   {
      public var name:String;
      
      public var soundName:String;
      
      public var assetMinScale:Number = 0.4;
      
      public var assetMaxScale:Number = 0.6;
      
      public var assetMinAlpha:Number = 1;
      
      public var assetMaxAlpha:Number = 1;
      
      public var matrix:Array = [];
      
      public var speedMin:int;
      
      public var speedMax:int;
      
      public var itemCount:int;
      
      public var delayMin:int;
      
      public var delayMax:int;
      
      public var effectAction:String;
      
      public var screenType:String;
      
      public function PlayFieldEffectVo()
      {
         super();
      }
   }
}

