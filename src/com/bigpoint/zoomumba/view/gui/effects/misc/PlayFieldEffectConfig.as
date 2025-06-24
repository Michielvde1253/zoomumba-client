package com.bigpoint.zoomumba.view.gui.effects.misc
{
   import com.bigpoint.zoomumba.constants.EFFECTCONST;
   import com.bigpoint.zoomumba.view.gui.effects.vo.PlayFieldEffectVo;
   
   public class PlayFieldEffectConfig
   {
      private var _effectList:Vector.<PlayFieldEffectVo>;
      
      public function PlayFieldEffectConfig()
      {
         var _loc1_:PlayFieldEffectVo = null;
         super();
         this._effectList = new Vector.<PlayFieldEffectVo>();
         _loc1_ = new PlayFieldEffectVo();
         _loc1_.name = EFFECTCONST.EFFECT_FOG;
         _loc1_.delayMax = 120;
         _loc1_.delayMin = 0;
         _loc1_.itemCount = 6;
         _loc1_.speedMax = 80;
         _loc1_.speedMin = 40;
         _loc1_.assetMinScale = 70;
         _loc1_.assetMaxScale = 90;
         _loc1_.assetMinAlpha = 30;
         _loc1_.assetMaxAlpha = 50;
         _loc1_.effectAction = EFFECTCONST.EFFECT_ACTION_ANI_RIGHT_TO_LEFT;
         _loc1_.screenType = EFFECTCONST.SCREEN_FIELD;
         this._effectList.push(_loc1_);
         _loc1_ = new PlayFieldEffectVo();
         _loc1_.name = EFFECTCONST.DECO_EFFECT_FOG;
         _loc1_.delayMax = 0;
         _loc1_.delayMin = 0;
         _loc1_.itemCount = 0;
         _loc1_.speedMax = 0;
         _loc1_.speedMin = 0;
         _loc1_.assetMinScale = 0;
         _loc1_.assetMaxScale = 0;
         _loc1_.assetMinAlpha = 0;
         _loc1_.assetMaxAlpha = 0;
         _loc1_.effectAction = EFFECTCONST.EFFECT_ACTION_DISPLAYDECO;
         _loc1_.screenType = EFFECTCONST.SCREEN_FRONT;
         this._effectList.push(_loc1_);
         _loc1_ = new PlayFieldEffectVo();
         _loc1_.name = EFFECTCONST.DECO_EFFECT_SNOW;
         _loc1_.delayMax = 0;
         _loc1_.delayMin = 0;
         _loc1_.itemCount = 0;
         _loc1_.speedMax = 0;
         _loc1_.speedMin = 0;
         _loc1_.assetMinScale = 0;
         _loc1_.assetMaxScale = 0;
         _loc1_.assetMinAlpha = 0;
         _loc1_.assetMaxAlpha = 0;
         _loc1_.effectAction = EFFECTCONST.EFFECT_ACTION_DISPLAYDECO;
         _loc1_.screenType = EFFECTCONST.SCREEN_FRONT;
         this._effectList.push(_loc1_);
      }
      
      public function getEffectByName(param1:String) : PlayFieldEffectVo
      {
         var _loc2_:PlayFieldEffectVo = null;
         for each(_loc2_ in this.effectList)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get effectList() : Vector.<PlayFieldEffectVo>
      {
         return this._effectList;
      }
   }
}

