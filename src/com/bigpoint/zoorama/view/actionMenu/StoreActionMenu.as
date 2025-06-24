package com.bigpoint.zoorama.view.actionMenu
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   import com.bigpoint.zoorama.view.field.items.Store;
   import com.greensock.TweenLite;
   
   public class StoreActionMenu extends AbstractActionMenu
   {
      public static const STORE_MENU_ZOOM_Y_OFFSETS:Vector.<int> = Vector.<int>([40,70,150]);
      
      private var notifier:Notifier;
      
      private var targetStore:Store;
      
      private var storeProgressActionButton:ActionButton;
      
      private var storeProgressActionButtonVirtual:ActionButton;
      
      private var storeProgressActionButtonReal:ActionButton;
      
      private var useVirtualButton:Boolean = true;
      
      public function StoreActionMenu(param1:Notifier)
      {
         super();
         _menuType = ActionMenuTypes.MENU_TYPE_STORE;
         this.notifier = new Notifier(param1);
         this.storeProgressActionButtonVirtual = new ActionButton(this.notifier,this,this._menuType,ActionButton.PET_PENNY_PROGRESS_ACTION);
         this.storeProgressActionButtonReal = new ActionButton(this.notifier,this,this._menuType,ActionButton.ZOO_DOLLAR_PROGRESS_ACTION);
         this.removeChild(this.storeProgressActionButtonVirtual);
         this.removeChild(this.storeProgressActionButtonReal);
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
         this.targetStore = param1 as Store;
         this.useVirtualButton = this.targetStore.collectReal <= 0;
         if(this.storeProgressActionButton)
         {
            this.removeChild(this.storeProgressActionButton);
         }
         if(this.useVirtualButton)
         {
            this.storeProgressActionButton = this.storeProgressActionButtonVirtual;
         }
         else
         {
            this.storeProgressActionButton = this.storeProgressActionButtonReal;
         }
         this.addChild(this.storeProgressActionButton);
         this.storeProgressActionButton.setItemIndentifiers(Categories.STORE,this.targetStore.uniqueId);
         this.updateStoreActionMenu();
         this.startUpdateTimer();
      }
      
      override public function close() : void
      {
         this.stopUpdateTimer();
         this.targetStore.showCollectAnimation();
      }
      
      private function updateStoreActionMenu() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         if(this.targetStore.active)
         {
            _loc1_ = TimeManager.currentTime;
            if(this.targetStore.collectTimeStamp > TimeManager.currentTime)
            {
               _loc2_ = this.targetStore.collectTimeStamp - _loc1_;
               _loc3_ = Math.floor(_loc2_ / this.targetStore.collectTime * 100);
               this.storeProgressActionButton.showProgressBar();
               this.storeProgressActionButton.showPercentage(100 - _loc3_);
               this.storeProgressActionButton.diactivateButton();
               this.storeProgressActionButton.visible = true;
            }
            else
            {
               this.storeProgressActionButton.showPercentage(100);
               this.storeProgressActionButton.activateButton();
               this.stopUpdateTimer();
            }
         }
         else
         {
            this.storeProgressActionButton.showProgressBar();
            this.storeProgressActionButton.showPercentage(0);
            this.storeProgressActionButton.diactivateButton();
            this.storeProgressActionButton.visible = true;
         }
      }
      
      private function startUpdateTimer() : void
      {
         TimeManager.registerTickFunction(this.updateStoreActionMenu);
      }
      
      private function stopUpdateTimer() : void
      {
         TimeManager.unregisterTickFunction(this.updateStoreActionMenu);
      }
   }
}

