package com.bigpoint.zoomumba.view.windows.quests.reword
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.windows.quests.QuestRewordWindowInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.display.MovieClip;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.questsWindow.components.RewardItemComponent;
   import windows.custom.questsWindow.rewordWindow.QuestRewordContent;
   import windows.custom.questsWindow.rewordWindow.QuestRewordWindow;
   
   public class QuestRewordWindowMediator extends WindowMediator
   {
      public static const NAME:String = "QuestRewordWindowMediator";
      
      private var windowContent:QuestRewordContent;
      
      public function QuestRewordWindowMediator(param1:QuestRewordWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
      }
      
      override public function init(param1:Object) : void
      {
         var _loc5_:int = 0;
         this.windowContent = (viewComponent as QuestRewordWindow).getContent(0) as QuestRewordContent;
         var _loc2_:QuestRewordWindowInitParams = param1 as QuestRewordWindowInitParams;
         this.windowContent.header.title.text = TextResourceModule.getText("zoo.quests.daily.window.achievereward.title");
         AssetLibrary.sendAssetToFunction("quest_reward",this.handleWindowAssets);
         this.windowContent.info.text = TextResourceModule.getText("zoo.quests.daily.window.achievereward.info");
         var _loc3_:int = 0;
         if(_loc2_.rewordData.experience > 0)
         {
            _loc3_++;
            this.showRewordItem(Categories.USER,UserResources.EXPERIENCE,_loc2_.rewordData.experience,_loc3_);
         }
         if(_loc2_.rewordData.realMoney > 0)
         {
            _loc3_++;
            this.showRewordItem(Categories.USER,UserResources.REAL_MONEY,_loc2_.rewordData.realMoney,_loc3_);
         }
         if(_loc2_.rewordData.virtualMoney > 0)
         {
            _loc3_++;
            this.showRewordItem(Categories.USER,UserResources.VIRTUAL_MONEY,_loc2_.rewordData.virtualMoney,_loc3_);
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.rewordData.resources.length)
         {
            _loc5_ = _loc2_.rewordData.resources[_loc4_];
            if(_loc5_ > 0)
            {
               if(_loc3_ < 3)
               {
                  _loc3_++;
                  this.showRewordItem(Categories.RESOURCES,_loc4_,_loc5_,_loc3_);
               }
            }
            _loc4_++;
         }
         this.windowContent.item1.visible = false;
         this.windowContent.item2.visible = false;
         this.windowContent.item3.visible = false;
         switch(_loc3_)
         {
            case 1:
               this.windowContent.item1.visible = true;
               this.windowContent.item1.horizontalCenter = 4;
               this.windowContent.item1.y = 195;
               break;
            case 2:
               this.windowContent.item1.visible = true;
               this.windowContent.item2.visible = true;
               this.windowContent.item1.horizontalCenter = -65;
               this.windowContent.item2.horizontalCenter = 65;
               this.windowContent.item1.y = 195;
               this.windowContent.item2.y = 195;
               break;
            case 3:
               this.windowContent.item1.visible = true;
               this.windowContent.item2.visible = true;
               this.windowContent.item3.visible = true;
               this.windowContent.item1.horizontalCenter = -65;
               this.windowContent.item2.horizontalCenter = 65;
               this.windowContent.item3.horizontalCenter = 4;
               this.windowContent.item1.y = 225;
               this.windowContent.item2.y = 225;
               this.windowContent.item3.y = 180;
         }
      }
      
      private function showRewordItem(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:RewardItemComponent = this.windowContent["item" + param4] as RewardItemComponent;
         _loc5_.currentState = "vertical";
         _loc5_.amount = String(param3);
         _loc5_.thumb.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(param1,param2),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
      }
      
      private function handleWindowAssets(param1:SWFAsset) : void
      {
         this.windowContent.windowLogo.addChild(param1.getEmbededSprite("WindowLogoSPR"));
         var _loc2_:MovieClip = param1.getEmbededMovieClip("StarAnimMC");
         this.windowContent.starHolder.addChild(_loc2_);
         _loc2_.x = 70;
         _loc2_.y = 105;
         _loc2_.scaleX = -1;
         _loc2_ = param1.getEmbededMovieClip("StarAnimMC");
         this.windowContent.starHolder.addChild(_loc2_);
         _loc2_.x = 390;
         _loc2_.y = 105;
      }
      
      override public function dispose() : void
      {
      }
   }
}

