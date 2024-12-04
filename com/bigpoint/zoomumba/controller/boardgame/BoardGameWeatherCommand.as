package com.bigpoint.zoomumba.controller.boardgame
{
   import com.bigpoint.zoomumba.constants.EFFECTCONST;
   import com.bigpoint.zoomumba.constants.GAMEBOARD;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.events.boardgame.BoardgameProxy;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameVo;
   import com.bigpoint.zoomumba.view.gui.effects.vo.StartEffectVo;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class BoardGameWeatherCommand extends SimpleCommand
   {
      public function BoardGameWeatherCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:BoardgameVo = null;
         var _loc2_:BoardgameProxy = facade.getProxy(BoardgameProxy);
         if(_loc2_)
         {
            for each(_loc3_ in _loc2_.proxyData)
            {
               switch(_loc3_.eventId)
               {
                  case GAMEBOARD.BOARDGAME_HALLOWEEN_2013:
                     sendNotification(Note.START_PLAYFIELD_EFFECT,new StartEffectVo(EFFECTCONST.DECO_EFFECT_FOG));
                     sendNotification(Note.START_PLAYFIELD_EFFECT,new StartEffectVo(EFFECTCONST.EFFECT_FOG));
                     break;
                  case GAMEBOARD.BOARDGAME_HALLOWEEN_2014:
                     sendNotification(Note.START_PLAYFIELD_EFFECT,new StartEffectVo(EFFECTCONST.DECO_EFFECT_FOG));
                     break;
                  case GAMEBOARD.BOARDGAME_XMAS_2014:
                     sendNotification(Note.START_PLAYFIELD_EFFECT,new StartEffectVo(EFFECTCONST.DECO_EFFECT_SNOW));
                     break;
               }
            }
         }
      }
   }
}

