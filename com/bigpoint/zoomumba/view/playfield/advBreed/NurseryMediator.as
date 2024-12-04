package com.bigpoint.zoomumba.view.playfield.advBreed
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.playfield.advBreed.NurseryProxy;
   import com.bigpoint.zoomumba.view.playfield.BuildingMediator;
   import com.bigpoint.zoorama.data.settings.NurseryShopData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.mouseModule.MouseModule;
   import com.bigpoint.zoorama.utils.mouseModule.MouseState;
   import com.bigpoint.zoorama.view.field.items.Nursery;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import utils.ToolTipSpriteManager;
   
   public class NurseryMediator extends BuildingMediator
   {
      public static const NAME:String = "NurseryMediator";
      
      private var proxy:NurseryProxy;
      
      private var tooltipHolder:DisplayObject = null;
      
      public function NurseryMediator(param1:int, param2:int, param3:Nursery)
      {
         bitmapsDataStatus = new <BitmapData>[null,null];
         super(NAME,param1,param2,param3);
      }
      
      override public function listNotificationInterests() : Array
      {
         return super.listNotificationInterests().concat([Note.REFRESH_NURSERY_BUILDING,Note.RESET_NURSERY_BUILDING]);
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.REFRESH_NURSERY_BUILDING:
               this.refreshStatusIcon();
               break;
            case Note.RESET_NURSERY_BUILDING:
               this.proxy.dispose();
               this.refreshStatusIcon();
         }
         super.handleNotification(param1);
      }
      
      override public function onRegister() : void
      {
         this.proxy = facade.retrieveProxy(NurseryProxy.NAME) as NurseryProxy;
         AssetLibrary.sendAssetToFunction("buildStatusRaise",this.handleAssets);
         AssetLibrary.sendAssetToFunction("buildStatusFinished",this.handleAssets);
         var _loc1_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc2_:NurseryShopData = _loc1_.getNurseryData();
         building.sellable = _loc2_.sellable;
         building.sellReal = _loc2_.sellReal;
         building.sellVirtual = _loc2_.sellVirtual;
         super.onRegister();
      }
      
      override protected function refreshStatusIcon() : void
      {
         switch(this.proxy.currentState)
         {
            case NurseryProxy.STATE_READY:
               this.fieldItem.assignIcon(bitmapsDataStatus[0]);
               break;
            case NurseryProxy.STATE_FINISHED:
               this.fieldItem.assignIcon(bitmapsDataStatus[1]);
               break;
            default:
               this.fieldItem.assignIcon(null);
         }
      }
      
      private function handleAssets(param1:SWFAsset) : void
      {
         switch(param1.id)
         {
            case "buildStatusRaise":
            case "buildStatusRaise.swf":
               bitmapsDataStatus[0] = param1.getEmbededBitmapData("buildStatusRaise");
               break;
            case "buildStatusFinished":
            case "buildStatusFinished.swf":
               bitmapsDataStatus[1] = param1.getEmbededBitmapData("buildStatusFinished");
         }
         this.refreshStatusIcon();
      }
      
      override protected function handleStatusIconMouseOver(param1:MouseEvent) : void
      {
         if(this.tooltipHolder == null)
         {
            this.tooltipHolder = param1.currentTarget as DisplayObject;
            ToolTipSpriteManager.registerToolTip(this.tooltipHolder,TextResourceModule.getText(this.proxy.currentTooltipId));
         }
      }
      
      override protected function handleStatusIconMouseOut(param1:MouseEvent) : void
      {
         if(this.tooltipHolder)
         {
            ToolTipSpriteManager.unregisterToolTip(this.tooltipHolder);
            this.tooltipHolder = null;
         }
      }
      
      override protected function handleClick(param1:Event) : void
      {
         if(MouseModule.getInstance().mouseType != MouseState.DEFAULT)
         {
            if(MouseModule.getInstance().mouseType == MouseState.SELL_ITEM)
            {
               sendNotification(Note.SELL_PLAYFIELD_NEW_BUILDING,building);
            }
            else if(MouseModule.getInstance().mouseType == MouseState.STORE_ITEM)
            {
               sendNotification(Note.STORE_PLAYFIELD_NEW_BUILDING,building);
            }
         }
      }
      
      override public function onRemove() : void
      {
         this.handleStatusIconMouseOut(null);
         super.onRemove();
      }
      
      public function get fieldItem() : Nursery
      {
         return building as Nursery;
      }
   }
}

