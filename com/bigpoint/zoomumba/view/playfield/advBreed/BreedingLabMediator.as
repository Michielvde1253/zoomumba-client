package com.bigpoint.zoomumba.view.playfield.advBreed
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.playfield.advBreed.BreedingLabProxy;
   import com.bigpoint.zoomumba.view.playfield.BuildingMediator;
   import com.bigpoint.zoorama.data.settings.BreedingLabShopData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.mouseModule.MouseModule;
   import com.bigpoint.zoorama.utils.mouseModule.MouseState;
   import com.bigpoint.zoorama.view.field.items.BreedingLab;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import utils.ToolTipSpriteManager;
   
   public class BreedingLabMediator extends BuildingMediator
   {
      public static const NAME:String = "BreedingLabMediator";
      
      private var proxy:BreedingLabProxy;
      
      private var tooltipHolder:DisplayObject = null;
      
      public function BreedingLabMediator(param1:int, param2:int, param3:BreedingLab)
      {
         bitmapsDataStatus = new <BitmapData>[null,null];
         super(NAME,param1,param2,param3);
      }
      
      override public function listNotificationInterests() : Array
      {
         return super.listNotificationInterests().concat([Note.REFRESH_ADVANCED_BREEDING_BUILDING,Note.RESET_ADVANCED_BREEDING_BUILDING]);
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
         switch(param1.getName())
         {
            case Note.REFRESH_ADVANCED_BREEDING_BUILDING:
               this.refreshStatusIcon();
               break;
            case Note.RESET_ADVANCED_BREEDING_BUILDING:
               this.proxy.dispose();
               this.refreshStatusIcon();
         }
      }
      
      override public function onRegister() : void
      {
         this.proxy = facade.retrieveProxy(BreedingLabProxy.getFullName(catId,uniqueId)) as BreedingLabProxy;
         AssetLibrary.sendAssetToFunction("buildStatusAdvBreed",this.handleAssets);
         AssetLibrary.sendAssetToFunction("buildStatusFinished",this.handleAssets);
         var _loc1_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc2_:BreedingLabShopData = _loc1_.getBreedingLabData();
         building.sellable = _loc2_.sellable;
         building.sellReal = _loc2_.sellReal;
         building.sellVirtual = _loc2_.sellVirtual;
         super.onRegister();
      }
      
      private function handleAssets(param1:SWFAsset) : void
      {
         switch(param1.id)
         {
            case "buildStatusAdvBreed":
            case "buildStatusAdvBreed.swf":
               bitmapsDataStatus[0] = param1.getEmbededBitmapData("buildStatusAdvBreed");
               break;
            case "buildStatusFinished":
            case "buildStatusFinished.swf":
               bitmapsDataStatus[1] = param1.getEmbededBitmapData("buildStatusFinished");
         }
         this.refreshStatusIcon();
      }
      
      override protected function refreshStatusIcon() : void
      {
         switch(this.proxy.currentState)
         {
            case BreedingLabProxy.STATE_READY:
               this.fieldItem.assignIcon(bitmapsDataStatus[0]);
               break;
            case BreedingLabProxy.STATE_FINISHED:
               this.fieldItem.assignIcon(bitmapsDataStatus[1]);
               break;
            default:
               this.fieldItem.assignIcon(null);
         }
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
      
      public function get fieldItem() : BreedingLab
      {
         return building as BreedingLab;
      }
   }
}

