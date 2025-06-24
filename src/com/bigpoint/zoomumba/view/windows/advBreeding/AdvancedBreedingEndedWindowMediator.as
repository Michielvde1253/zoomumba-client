package com.bigpoint.zoomumba.view.windows.advBreeding
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.utils.custom.advSpots.AutomatorAdvFillableSpot;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.ResponseName;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.ItemServerVO;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.advBreed.BreedingLabProxy;
   import com.bigpoint.zoomumba.view.playfield.BuildingMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.advBreeding.ended.AdvancedBreedingEndedContent;
   import windows.custom.advBreeding.ended.AdvancedBreedingEndedWindow;
   
   public class AdvancedBreedingEndedWindowMediator extends WindowMediator
   {
      public static const NAME:String = "AdvancedBreedingEndedWindowMediator";
      
      private var labId:int = 0;
      
      private var breedingLabProxy:BreedingLabProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var animals:Vector.<int> = new <int>[-1,-1];
      
      private var chances:Vector.<Object> = new <Object>[null,null,null];
      
      public function AdvancedBreedingEndedWindowMediator(param1:AdvancedBreedingEndedWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.SHOW_ADVANCED_BREEDING_RESULT];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         switch(param1.getName())
         {
            case Note.SHOW_ADVANCED_BREEDING_RESULT:
               for(_loc2_ in param1.getBody())
               {
                  if(_loc2_ == ResponseName.ADVANCED_BREEDING_REWARDS)
                  {
                     _loc3_ = param1.getBody()[_loc2_].r;
                     _loc4_ = ObjectHelper.lengthOf(_loc3_);
                     if(_loc4_ == 2)
                     {
                        this.breedingLabProxy.rewardAnimal = new ItemServerVO(_loc3_[0].type,_loc3_[0].aId,1);
                        this.breedingLabProxy.rewardSecond = new ItemServerVO(_loc3_[1].type,_loc3_[1].id,_loc3_[1].cnt);
                     }
                     if(_loc4_ == 3)
                     {
                        this.breedingLabProxy.rewardAnimal = new ItemServerVO(_loc3_[0].type,_loc3_[0].aId,1);
                        this.breedingLabProxy.rewardSecondAnimal = new ItemServerVO(_loc3_[1].type,_loc3_[1].aId,1);
                        this.breedingLabProxy.rewardSecond = new ItemServerVO(_loc3_[2].type,_loc3_[2].id,_loc3_[2].cnt);
                     }
                  }
               }
               this.showWindow();
         }
      }
      
      override public function onRegister() : void
      {
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
      }
      
      override public function init(param1:Object) : void
      {
         this.labId = param1 as int;
         this.window.preloaderVisibility = true;
         this.breedingLabProxy = facade.retrieveProxy(BuildingMediator.getFullName(BreedingLabProxy.NAME,Categories.BREEDING_LAB,this.labId)) as BreedingLabProxy;
         this.animals = new <int>[-1,-1];
         this.chances = new <Object>[null,null,null];
         if(this.breedingLabProxy.lab.usedItemType1 != 0)
         {
            this.animals[0] = this.itemConfigProxy.getMaleAnimalData(this.breedingLabProxy.lab.usedItemId1).itemId;
         }
         if(this.breedingLabProxy.lab.usedItemType2 != 0)
         {
            this.animals[1] = this.itemConfigProxy.getFemaleAnimalData(this.breedingLabProxy.lab.usedItemId2).itemId;
         }
         if(this.breedingLabProxy.lab.usedItemType3 != 0)
         {
            this.chances[0] = {
               "category":this.breedingLabProxy.lab.usedItemType3,
               "itemId":this.breedingLabProxy.lab.usedItemId3
            };
         }
         if(this.breedingLabProxy.lab.usedItemType4 != 0)
         {
            this.chances[1] = {
               "category":this.breedingLabProxy.lab.usedItemType4,
               "itemId":this.breedingLabProxy.lab.usedItemId4
            };
         }
         if(this.breedingLabProxy.lab.usedItemType5 != 0)
         {
            this.chances[2] = {
               "category":this.breedingLabProxy.lab.usedItemType5,
               "itemId":this.breedingLabProxy.lab.usedItemId5
            };
         }
         AssetLibrary.sendAssetToFunction("StarsStaticLeft",this.handleStarsLoaded);
         var _loc2_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         _loc2_.callServer(NET.END_ADVANCED_BREEDING_NET,[this.labId]).addCallbackIfTrue(Note.SHOW_ADVANCED_BREEDING_RESULT).sendNow();
      }
      
      private function handleStarsLoaded(param1:SWFAsset) : void
      {
         if(Boolean(this.content) && Boolean(this.content.starsLeft))
         {
            this.content.starsLeft.displayClass = param1.getEmbededBitmapData("StarsStaticLeft");
            this.content.starsRight.displayClass = param1.getEmbededBitmapData("StarsStaticLeft");
         }
      }
      
      private function showWindow() : void
      {
         var eventProxy:GlobalEventProxy = null;
         var itemType:int = 0;
         var size:int = 0;
         this.window.preloaderVisibility = false;
         if(this.content)
         {
            this.content.header.text = TextResourceModule.getText("zoo.window.infoLayers.purchaseConfirmed.title");
            eventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
            if(eventProxy.isEventActive(EventTypes.BREEDING_EVENT))
            {
               this.content.textTop.htmlText = TextResourceModule.getText("zoo.advancedBreed.layer.success.1Twins");
               this.content.textBottom.htmlText = TextResourceModule.getText("zoo.advancedBreed.layer.success.2Twins");
            }
            else
            {
               this.content.textTop.htmlText = TextResourceModule.getText("zoo.advancedBreed.layer.success.1");
               this.content.textBottom.htmlText = TextResourceModule.getText("zoo.advancedBreed.layer.success.2");
            }
            AutomatorAdvFillableSpot.fillAnimals(this.animals,this.itemConfigProxy,this.content,"spotAnimal",[AutomatorAdvFillableSpot.STATE_ONLY_DISPLAY_ANIMAL_MALE,AutomatorAdvFillableSpot.STATE_ONLY_DISPLAY_ANIMAL_FEMALE]);
            AutomatorAdvFillableSpot.fillChance(this.chances,this.content,"spotChance",AutomatorAdvFillableSpot.STATE_ONLY_DISPLAY,true);
            if(this.breedingLabProxy.rewardSecondAnimal)
            {
               this.content.previewSecondAnimal.visible = true;
               this.content.previewSecondAnimal.y = -75;
               this.content.previewSecondAnimal.displayClass = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.ANIMAL,this.breedingLabProxy.rewardSecondAnimal.id),AssetConfig.DEFAULT_INFO_SPR,0,-1,60,1,function(... rest):void
               {
                  content.previewSecondAnimal.y = 75;
               });
               this.content.previewAnimal.y = 0;
               this.content.previewAnimal.displayClass = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.ANIMAL,this.breedingLabProxy.rewardAnimal.id),AssetConfig.DEFAULT_INFO_SPR,0,-1,60,1,function(... rest):void
               {
                  content.previewAnimal.y = 0;
               });
            }
            else
            {
               this.content.previewAnimal.verticalCenter = 0;
               this.content.previewAnimal.displayClass = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.ANIMAL,this.breedingLabProxy.rewardAnimal.id),AssetConfig.DEFAULT_INFO_SPR,0,150,120,1,function(... rest):void
               {
                  content.previewAnimal.verticalCenter = 8;
               });
            }
            itemType = ItemTypeHelper.typeToCategory(this.breedingLabProxy.rewardSecond.type);
            size = -1;
            if(itemType == Categories.USER && this.breedingLabProxy.rewardSecond.id == 0)
            {
               size = 45;
            }
            this.content.textReward.text = this.breedingLabProxy.rewardSecond.cnt.toString();
            this.content.rewardPreview.displayClass = new WrapedSprite(AssetIds.getPreviewAssetId(itemType,this.breedingLabProxy.rewardSecond.id),AssetConfig.DEFAULT_INFO_SPR,0,size,size,1);
         }
      }
      
      override public function dispose() : void
      {
      }
      
      private function get content() : AdvancedBreedingEndedContent
      {
         return this.window.getContent() as AdvancedBreedingEndedContent;
      }
      
      private function get window() : AdvancedBreedingEndedWindow
      {
         return this.viewComponent as AdvancedBreedingEndedWindow;
      }
   }
}

