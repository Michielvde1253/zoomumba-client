package com.bigpoint.zoomumba.view.gui.powerupPanel
{
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.features.powerup.PowerupProxy;
   import com.bigpoint.zoomumba.model.features.powerup.vo.PowerupItemConstants;
   import com.bigpoint.zoomumba.model.features.powerup.vo.PowerupItemType;
   import com.bigpoint.zoomumba.model.features.powerup.vo.PowerupItemVO;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenLite;
   import custom.mainInterface.powerupPanel.PowerupItem;
   import custom.mainInterface.powerupPanel.PowerupPanel;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class PowerupPanelMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "PowerupPanelMediator";
      
      private var powerupItems:Vector.<PowerupItem>;
      
      private var powerupProxy:PowerupProxy;
      
      public function PowerupPanelMediator(param1:PowerupPanel)
      {
         super(NAME,param1);
         this.powerupItems = new Vector.<PowerupItem>();
      }
      
      override public function onRegister() : void
      {
         this.powerupPanel.alpha = 0;
         this.powerupProxy = facade.retrieveProxy(PowerupProxy.NAME) as PowerupProxy;
      }
      
      private function startTimeTrack() : void
      {
         TimeManager.registerTickFunction(this.updateTimes);
      }
      
      private function updateTimes() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.powerupItems.length)
         {
            this.powerupItems[_loc1_].timerText.text = TimeFormat.secondsToBigTimeString(this.powerupItems[_loc1_].timeRemaining);
            --this.powerupItems[_loc1_].timeRemaining;
            if(this.powerupItems[_loc1_].timeRemaining < 0)
            {
               this.powerupProxy.removeItem(this.powerupItems[_loc1_].itemID);
               this.removeItem(this.powerupItems[_loc1_],_loc1_);
            }
            _loc1_++;
         }
      }
      
      public function addPack(param1:PowerupItemVO) : void
      {
         var _loc2_:PowerupItem = null;
         var _loc3_:Sprite = null;
         if(param1)
         {
            if(this.powerupItems.length == 0)
            {
               this.startTimeTrack();
               this.showPanel();
            }
            _loc2_ = new PowerupItem();
            _loc2_.timeRemaining = param1.endTime - TimeManager.currentTime;
            _loc2_.itemID = param1.pid;
            _loc2_.tooltipID = this.getToltip(param1.pid);
            if(this.getItemIcon(param1.pid) == PowerupItemConstants.ICON_BOARDGAME_100_MORE)
            {
               _loc3_ = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.POWERUP,PowerupItemType.BOARDGAME_DROP_BOOSTER),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,-1,0.725);
               _loc3_.x += 5;
               _loc2_.addIcon(_loc3_);
            }
            else
            {
               _loc2_.addIcon(AssetLibrary.getSprite(AssetConfig.ASSET_FILE_POWERUP_ICONS,this.getItemIcon(param1.pid)));
            }
            this.powerupPanel.iconContainer.addElement(_loc2_);
            this.powerupItems.push(_loc2_);
            _loc2_.addEventListener(MouseEvent.MOUSE_OVER,this.handleItemMouseOver);
            _loc2_.addEventListener(MouseEvent.MOUSE_OUT,this.handleItemMouseOut);
            this.layoutItems();
         }
      }
      
      private function getToltip(param1:int) : String
      {
         var _loc2_:String = "";
         if(PowerupItemConstants.TOOLTIP_TEXTS.length > param1 && Boolean(PowerupItemConstants.TOOLTIP_TEXTS[param1]))
         {
            _loc2_ = PowerupItemConstants.TOOLTIP_TEXTS[param1];
         }
         return _loc2_;
      }
      
      private function getItemIcon(param1:int) : String
      {
         var _loc2_:String = "";
         if(PowerupItemConstants.ICONS.length > param1 && Boolean(PowerupItemConstants.ICONS[param1]))
         {
            _loc2_ = PowerupItemConstants.ICONS[param1];
         }
         return _loc2_;
      }
      
      private function handleItemMouseOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      private function handleItemMouseOver(param1:MouseEvent) : void
      {
         var _loc2_:PowerupItem = param1.currentTarget as PowerupItem;
         TooltipNewManager.setToolTip(_loc2_,TextResourceModule.getText(_loc2_.tooltipID),false);
      }
      
      public function removeItem(param1:PowerupItem, param2:int) : void
      {
         this.powerupItems.splice(param2,1);
         this.powerupPanel.iconContainer.removeElement(param1);
         if(this.powerupItems.length == 0)
         {
            this.stopTimeTrack();
            this.hidePanel();
         }
         this.layoutItems();
      }
      
      private function stopTimeTrack() : void
      {
         TimeManager.unregisterTickFunction(this.updateTimes);
      }
      
      private function hidePanel() : void
      {
         TweenLite.to(this.powerupPanel,0.4,{"alpha":0});
      }
      
      private function showPanel() : void
      {
         TweenLite.to(this.powerupPanel,0.4,{"alpha":1});
      }
      
      private function layoutItems() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.powerupItems.length)
         {
            TweenLite.to(this.powerupItems[_loc1_],0.4,{
               "x":this.powerupPanel.iconContainer.getChildAt(_loc1_).x,
               "y":this.powerupPanel.iconContainer.getChildAt(_loc1_).y
            });
            _loc1_++;
         }
         this.powerupPanel.refreshDropPosition(this.powerupItems.length);
      }
      
      private function updateItemData(param1:int) : void
      {
         var _loc2_:PowerupItemVO = this.powerupProxy.getPowerupById(param1);
         var _loc3_:int = 0;
         while(_loc3_ < this.powerupItems.length)
         {
            if(this.powerupItems[_loc3_].itemID == param1)
            {
               this.powerupItems[_loc3_].timeRemaining = _loc2_.endTime - TimeManager.currentTime;
            }
            _loc3_++;
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.POWERUP_ITEM_MODIFIED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.POWERUP_ITEM_MODIFIED:
               this.updateItemData(param1.getBody() as int);
         }
      }
      
      private function get powerupPanel() : PowerupPanel
      {
         return this.viewComponent as PowerupPanel;
      }
   }
}

