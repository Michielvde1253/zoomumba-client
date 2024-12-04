package com.bigpoint.zoomumba.view.managmentCenter.components
{
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.utils.timeManager.TimeTrack;
   import com.bigpoint.zoomumba.model.managmentCenter.events.CircusBoxEvent;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.StoreData;
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmentCenterCircusBoxesVo;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenMax;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   
   public class ManagmentCircusBox extends EventDispatcher
   {
      private var _vo:ManagmentCenterCircusBoxesVo;
      
      private var _glowFilter:TweenMax;
      
      private var _tooltipText:String = "";
      
      private var _collectTimeTrack:TimeTrack;
      
      public function ManagmentCircusBox(param1:ManagmentCenterCircusBoxesVo)
      {
         this._collectTimeTrack = TimeManager.creatEmptyTrack(this.refresh);
         super();
         this._vo = param1;
         this.refresh();
      }
      
      public function refresh() : void
      {
         this.view.mouseEnabled = true;
         this.view.buttonMode = true;
         this.view.useHandCursor = true;
         if(this.storeData.uniqueId <= 0)
         {
            this.view.visible = false;
            this.removeMouseInteraction();
         }
         else
         {
            this.setMouseInteraction();
            this.view.visible = true;
            if(this.canCollect)
            {
               this.view.gotoAndStop(2);
               TimeManager.removeTrack(this._collectTimeTrack);
            }
            else
            {
               this.view.gotoAndStop(1);
               TimeManager.updateTrackTime(this._collectTimeTrack,this.storeData.collectTimeStamp);
            }
            this.onOutBox();
         }
      }
      
      private function onClickBox(param1:MouseEvent) : void
      {
         if(this.canCollect)
         {
            dispatchEvent(new CircusBoxEvent(CircusBoxEvent.CIRCUS_OPEN_BOX,this._vo,this.storeData.uniqueId,true));
            this.storeData.uniqueId = -1;
            this.refresh();
         }
      }
      
      private function onOutBox(param1:MouseEvent = null) : void
      {
         TooltipNewManager.removeToolTip();
         TimeManager.unregisterTickFunction(this.circusToolTipUpdate);
         this.view.addEventListener(MouseEvent.ROLL_OVER,this.onOverBox);
         this.view.addEventListener(MouseEvent.MOUSE_OVER,this.onOverBox);
         this.view.removeEventListener(MouseEvent.ROLL_OUT,this.onOutBox);
         this.view.removeEventListener(MouseEvent.MOUSE_OUT,this.onOutBox);
         this.showGlow(false);
      }
      
      private function onOverBox(param1:MouseEvent = null) : void
      {
         var _loc2_:String = null;
         if(this.canCollect)
         {
            TooltipNewManager.setToolTip(this.view as DisplayObject,TextResourceModule.getText("zoo.event.circus.tooltipOpenedBox"),true,-1,-1,true);
         }
         else
         {
            _loc2_ = TimeFormat.secondsToTimeString(this.storeData.collectTimeStamp - TimeManager.currentTime);
            this._tooltipText = TextResourceModule.getTextReplaced("zoo.event.circus.tooltipClosedBox",Vector.<TextReplace>([new TextReplace("%amount%",_loc2_)]));
            TooltipNewManager.setToolTip(this.view as DisplayObject,this._tooltipText,true,-1,-1,true);
            TimeManager.registerTickFunction(this.circusToolTipUpdate);
         }
         if(this._tooltipText != "")
         {
            TooltipNewManager.setToolTip(this.view as DisplayObject,this._tooltipText);
         }
         this.view.removeEventListener(MouseEvent.ROLL_OVER,this.onOverBox);
         this.view.removeEventListener(MouseEvent.MOUSE_OVER,this.onOverBox);
         this.view.addEventListener(MouseEvent.ROLL_OUT,this.onOutBox);
         this.view.addEventListener(MouseEvent.MOUSE_OUT,this.onOutBox);
         this.showGlow(true);
      }
      
      private function circusToolTipUpdate() : void
      {
         var _loc1_:String = TimeFormat.secondsToTimeString(this.storeData.collectTimeStamp - TimeManager.currentTime);
         this._tooltipText = TextResourceModule.getTextReplaced("zoo.event.circus.tooltipClosedBox",Vector.<TextReplace>([new TextReplace("%amount%",_loc1_)]));
         TooltipNewManager.current.updateText(this._tooltipText);
      }
      
      private function showGlow(param1:Boolean) : void
      {
         if(this._glowFilter)
         {
            this._glowFilter.kill();
            this._glowFilter = null;
         }
         if(param1)
         {
            this._glowFilter = TweenMax.to(this.view,0.5,{"glowFilter":{
               "color":16750848,
               "alpha":1,
               "blurX":7,
               "blurY":7,
               "strength":3
            }});
         }
         else
         {
            this._glowFilter = TweenMax.to(this.view,0.5,{"glowFilter":{
               "alpha":0,
               "remove":true
            }});
         }
      }
      
      public function removeMouseInteraction() : void
      {
         this.view.removeEventListener(MouseEvent.CLICK,this.onClickBox);
         this.view.removeEventListener(MouseEvent.ROLL_OVER,this.onOverBox);
         this.view.removeEventListener(MouseEvent.MOUSE_OVER,this.onOverBox);
         this.view.removeEventListener(MouseEvent.ROLL_OUT,this.onOutBox);
         this.view.removeEventListener(MouseEvent.MOUSE_OUT,this.onOutBox);
      }
      
      public function setMouseInteraction() : void
      {
         this.view.addEventListener(MouseEvent.CLICK,this.onClickBox);
         this.view.addEventListener(MouseEvent.ROLL_OVER,this.onOverBox);
         this.view.addEventListener(MouseEvent.MOUSE_OVER,this.onOverBox);
         this.view.addEventListener(MouseEvent.ROLL_OUT,this.onOutBox);
         this.view.addEventListener(MouseEvent.MOUSE_OUT,this.onOutBox);
      }
      
      public function destroy() : void
      {
         this.removeMouseInteraction();
         TimeManager.unregisterTickFunction(this.circusToolTipUpdate);
         TooltipNewManager.removeToolTip();
      }
      
      public function get canCollect() : Boolean
      {
         return this.storeData.collectTimeStamp < TimeManager.currentTime;
      }
      
      public function get view() : MovieClip
      {
         return this._vo.item_mc;
      }
      
      public function get storeData() : StoreData
      {
         return this._vo.fieldItemData;
      }
      
      public function set storeData(param1:StoreData) : void
      {
         this._vo.fieldItemData = param1;
      }
   }
}

