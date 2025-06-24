package com.bigpoint.zoomumba.view.managmentCenter.components
{
   import com.bigpoint.utils.McUtil;
   import com.bigpoint.zoomumba.constants.MANAGMENTCENTER;
   import com.bigpoint.zoomumba.model.managmentCenter.events.BuildingEvent;
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmentCenterBuildingViewVo;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.*;
   import com.greensock.easing.*;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class ManagmentBuilding extends Sprite
   {
      private static const FRAME_NAME:String = "level_";
      
      private var _buildingVo:ManagmentCenterBuildingViewVo;
      
      private var _buildingView:MovieClip;
      
      private var _glowFilter:TweenMax;
      
      private var _bounceAction:TweenMax;
      
      private var _clickable:Boolean;
      
      private var _tooltipText:String;
      
      public function ManagmentBuilding(param1:MovieClip, param2:ManagmentCenterBuildingViewVo)
      {
         super();
         this._buildingVo = param2;
         this._buildingView = param1;
         this._buildingView.mouseEnabled = false;
         this.init();
      }
      
      private function init() : void
      {
         this.updateView();
      }
      
      private function updateView() : void
      {
         if(this._buildingView)
         {
            if(this._bounceAction)
            {
               this._bounceAction.kill();
               this._bounceAction = null;
            }
            if(this._buildingView.clickarea_mc)
            {
               this._buildingView.clickarea_mc.useHandCursor = false;
               this._buildingView.clickarea_mc.buttonMode = false;
               this._buildingView.clickarea_mc.removeEventListener(MouseEvent.CLICK,this.onClickBuilding);
               this._buildingView.clickarea_mc.removeEventListener(MouseEvent.ROLL_OVER,this.onOverBuilding);
               this._buildingView.clickarea_mc.removeEventListener(MouseEvent.MOUSE_OVER,this.onOverBuilding);
               this._buildingView.clickarea_mc.removeEventListener(MouseEvent.ROLL_OUT,this.onOutBuilding);
               this._buildingView.clickarea_mc.removeEventListener(MouseEvent.MOUSE_OUT,this.onOutBuilding);
            }
            McUtil.gotoAndWait(this.initClickEventButton,this._buildingView,FRAME_NAME + String(this._buildingVo.viewState));
         }
      }
      
      private function initClickEventButton() : void
      {
         var _loc1_:Boolean = false;
         if(this._buildingVo.commingSoon)
         {
            this._tooltipText = TextResourceModule.getText("zoo.tooltip.managementcenter.commingsoon");
            _loc1_ = false;
         }
         else if(this._buildingVo.viewState > 0)
         {
            if(this._buildingVo.id != MANAGMENTCENTER.MC_BUILDING_EVENT)
            {
               this._tooltipText = TextResourceModule.getText("zoo.tooltip.managementcenter.building." + this._buildingVo.id);
               this._tooltipText += "<br>";
               this._tooltipText += TextResourceModule.getText("zoo.tooltip.managementcenter.description." + this._buildingVo.id);
            }
            _loc1_ = true;
         }
         else if(this._buildingVo.viewState == 0)
         {
            this._tooltipText = TextResourceModule.getText("zoo.tooltip.managementcenter.message.errorlevel");
            this._tooltipText = this._tooltipText.replace("%building%",TextResourceModule.getText("zoo.tooltip.managementcenter.building." + this._buildingVo.id));
            this._tooltipText = this._tooltipText.replace("%level%",this._buildingVo.userLevelRequired);
            _loc1_ = false;
         }
         if(this._buildingView.clickarea_mc)
         {
            this._buildingView.clickarea_mc.removeEventListener(MouseEvent.ROLL_OUT,this.onOutBuilding);
            this._buildingView.clickarea_mc.removeEventListener(MouseEvent.MOUSE_OUT,this.onOutBuilding);
            if(_loc1_)
            {
               this._buildingView.clickarea_mc.useHandCursor = true;
               this._buildingView.clickarea_mc.buttonMode = true;
               this._buildingView.clickarea_mc.addEventListener(MouseEvent.CLICK,this.onClickBuilding);
            }
            else
            {
               this._buildingView.clickarea_mc.useHandCursor = false;
               this._buildingView.clickarea_mc.buttonMode = false;
               this._buildingView.clickarea_mc.removeEventListener(MouseEvent.CLICK,this.onClickBuilding);
            }
            this._buildingView.clickarea_mc.alpha = 0;
         }
         if(this._buildingView.outline_mc)
         {
            this._buildingView.outline_mc.useHandCursor = false;
            this._buildingView.outline_mc.buttonMode = false;
            this._buildingView.outline_mc.mouseEnabled = false;
            this._buildingView.outline_mc.mouseChildren = false;
            this._buildingView.outline_mc.alpha = 0;
         }
         this.signActionView(this._buildingVo.showAction);
         this.onOutBuilding();
         this._clickable = _loc1_;
      }
      
      private function signActionView(param1:Boolean) : void
      {
         if(this._buildingView.action_mc)
         {
            this._buildingView.action_mc.visible = param1;
            this._buildingView.action_mc.mouseEnabled = false;
            this._buildingView.action_mc.mouseChildren = false;
         }
         this.bounceAction(!param1);
      }
      
      private function bounceAction(param1:Boolean = false) : void
      {
         if(this._bounceAction)
         {
            this._bounceAction.kill();
            this._bounceAction = null;
         }
         if(Boolean(this._buildingView.action_mc) || param1 == false)
         {
            if(this._buildingView.action_mc.scaleX <= 0.9)
            {
               this._bounceAction = TweenMax.to(this._buildingView.action_mc,1.5,{
                  "glowFilter":{
                     "color":16750848,
                     "alpha":1,
                     "blurX":7,
                     "blurY":7,
                     "strength":3
                  },
                  "scaleX":1.3,
                  "scaleY":1.3,
                  "onComplete":this.bounceAction
               });
            }
            else
            {
               this._bounceAction = TweenMax.to(this._buildingView.action_mc,1.5,{
                  "glowFilter":{
                     "alpha":0,
                     "remove":true
                  },
                  "scaleX":0.9,
                  "scaleY":0.9,
                  "onComplete":this.bounceAction
               });
            }
         }
      }
      
      private function onOutBuilding(param1:MouseEvent = null) : void
      {
         TooltipNewManager.removeToolTip();
         if(this._buildingView.clickarea_mc)
         {
            this._buildingView.clickarea_mc.addEventListener(MouseEvent.ROLL_OVER,this.onOverBuilding);
            this._buildingView.clickarea_mc.addEventListener(MouseEvent.MOUSE_OVER,this.onOverBuilding);
            this._buildingView.clickarea_mc.removeEventListener(MouseEvent.ROLL_OUT,this.onOutBuilding);
            this._buildingView.clickarea_mc.removeEventListener(MouseEvent.MOUSE_OUT,this.onOutBuilding);
         }
         this.showGlow(false);
      }
      
      private function onOverBuilding(param1:MouseEvent = null) : void
      {
         if(this._tooltipText != "")
         {
            TooltipNewManager.setToolTip(this as DisplayObject,this._tooltipText);
         }
         if(this._buildingView.clickarea_mc)
         {
            this._buildingView.clickarea_mc.removeEventListener(MouseEvent.ROLL_OVER,this.onOverBuilding);
            this._buildingView.clickarea_mc.removeEventListener(MouseEvent.MOUSE_OVER,this.onOverBuilding);
            this._buildingView.clickarea_mc.addEventListener(MouseEvent.ROLL_OUT,this.onOutBuilding);
            this._buildingView.clickarea_mc.addEventListener(MouseEvent.MOUSE_OUT,this.onOutBuilding);
            this.showGlow(true);
         }
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
            this._glowFilter = TweenMax.to(this._buildingView,0.5,{"glowFilter":{
               "color":16750848,
               "alpha":1,
               "blurX":7,
               "blurY":7,
               "strength":3
            }});
         }
         else
         {
            this._glowFilter = TweenMax.to(this._buildingView,0.5,{"glowFilter":{
               "alpha":0,
               "remove":true
            }});
         }
      }
      
      private function onClickBuilding(param1:MouseEvent) : void
      {
         if(this._buildingVo.level == 0 && this._buildingVo.canBuy == true)
         {
            this.showBuyWindow();
         }
         else
         {
            dispatchEvent(new BuildingEvent(BuildingEvent.CLICK_BUILDING,this._buildingVo,true));
         }
      }
      
      private function showBuyWindow() : void
      {
      }
      
      public function destroy() : void
      {
         if(Boolean(this._buildingView) && Boolean(this._buildingView.clickarea_mc))
         {
            this._buildingView.clickarea_mc.useHandCursor = false;
            this._buildingView.clickarea_mc.buttonMode = false;
            this._buildingView.clickarea_mc.removeEventListener(MouseEvent.CLICK,this.onClickBuilding);
            this._buildingView.clickarea_mc.removeEventListener(MouseEvent.ROLL_OVER,this.onOverBuilding);
            this._buildingView.clickarea_mc.removeEventListener(MouseEvent.MOUSE_OVER,this.onOverBuilding);
            this._buildingView.clickarea_mc.removeEventListener(MouseEvent.ROLL_OUT,this.onOutBuilding);
            this._buildingView.clickarea_mc.removeEventListener(MouseEvent.MOUSE_OUT,this.onOutBuilding);
         }
         if(this._glowFilter)
         {
            this._glowFilter.kill();
            this._glowFilter = null;
         }
         if(this._bounceAction)
         {
            this._bounceAction.kill();
            this._bounceAction = null;
         }
      }
      
      public function set buildingVo(param1:ManagmentCenterBuildingViewVo) : void
      {
         this._buildingVo = param1;
         this.updateView();
      }
   }
}

