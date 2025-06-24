package com.bigpoint.zoorama.view.actionMenu
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import flash.display.Sprite;
   
   public class SocialActionMenu extends AbstractActionMenu
   {
      private var notifier:Notifier;
      
      private var socialMainPic:Sprite;
      
      private var socialButtons:Vector.<ActionButton>;
      
      public function SocialActionMenu(param1:Notifier)
      {
         var _loc6_:ActionButton = null;
         this.socialButtons = new Vector.<ActionButton>();
         super();
         this._menuType = ActionMenuTypes.MENU_TYPE_COMMUNITY;
         this.notifier = new Notifier(param1);
         var _loc2_:Vector.<int> = Vector.<int>([ActionButton.MAIL_ACTION,ActionButton.BONUS_CODE_ACTION,ActionButton.NEWS_ACTION,ActionButton.PRIZE_ACTION,ActionButton.INVITE_ACTION]);
         var _loc3_:Vector.<int> = Vector.<int>([-67,-32,40,70,-32]);
         var _loc4_:Vector.<int> = Vector.<int>([5,63,62,5,-63]);
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc6_ = new ActionButton(this.notifier,this,this._menuType,_loc2_[_loc5_]);
            if(_loc5_ == 0)
            {
               _loc6_.toolTipTextData = "zoo.tooltip.popup.social.mail";
            }
            if(_loc5_ == 1)
            {
               _loc6_.toolTipTextData = "zoo.tooltip.popup.social.bonus";
            }
            if(_loc5_ == 2)
            {
               _loc6_.toolTipTextData = "zoo.tooltip.popup.social.news";
            }
            if(_loc5_ == 3)
            {
               _loc6_.toolTipTextData = "zoo.tooltip.mainmenubutton.ranking";
               TweenMax.to(_loc6_,0.5,{"colorMatrixFilter":{"saturation":0}});
               _loc6_.mouseEnabled = false;
            }
            if(_loc5_ == 4)
            {
               _loc6_.toolTipTextData = "zoo.tooltip.popup.social.invite";
            }
            this.socialButtons.push(_loc6_);
            _loc6_.x = _loc3_[_loc5_];
            _loc6_.y = _loc4_[_loc5_];
            _loc6_.visible = true;
            _loc6_.hideProgressBar();
            this.socialMainPic = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_COMMUNITY_CENTERPIC);
            this.addChild(this.socialMainPic);
            this.socialMainPic.mouseChildren = false;
            this.socialMainPic.mouseEnabled = false;
            this.socialMainPic.x = 0;
            this.socialMainPic.y = -5;
            this.socialMainPic.buttonMode = true;
            this.socialMainPic.useHandCursor = true;
            _loc5_++;
         }
         TweenLite.to(this,0.1,{
            "delay":0.05,
            "overwrite":0,
            "dropShadowFilter":{
               "color":0,
               "blurX":15,
               "blurY":15,
               "strength":0.75,
               "quality":1,
               "angle":90,
               "distance":10,
               "alpha":1,
               "index":0
            }
         });
         TweenLite.to(this,0.1,{
            "delay":0.1,
            "overwrite":0,
            "glowFilter":{
               "color":7576343,
               "blurX":100,
               "blurY":100,
               "strength":1.75,
               "alpha":1,
               "index":1
            }
         });
      }
      
      override public function setTargetItem(param1:ItemAbstract) : void
      {
      }
      
      override public function close() : void
      {
      }
   }
}

