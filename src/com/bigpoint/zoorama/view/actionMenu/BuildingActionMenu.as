package com.bigpoint.zoorama.view.actionMenu
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoorama.notices.view.actionMenu.ActionMenuNotice;
   import com.bigpoint.zoorama.view.field.items.Building;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   
   public class BuildingActionMenu extends AbstractActionMenu
   {
      private var notifier:Notifier;
      
      private var targetItem:ItemAbstract;
      
      private var buildActionButton:ActionButton;
      
      public function BuildingActionMenu(param1:Notifier)
      {
         super();
         this._menuType = ActionMenuTypes.MENU_TYPE_BUILD;
         this.notifier = new Notifier(param1);
         this.buildActionButton = new ActionButton(this.notifier,this,this._menuType,ActionButton.BUILD_ACTON);
         this.y = -50;
      }
      
      override public function setTargetItem(param1:ItemAbstract) : void
      {
         this.targetItem = param1;
         TimeManager.registerTickFunction(this.updateBuildActionMenu);
         this.updateBuildActionMenu();
         this.buildActionButton.setItemIndentifiers(this.targetItem.category,this.targetItem.uniqueId);
      }
      
      private function updateBuildActionMenu() : void
      {
         var _loc3_:int = 0;
         var _loc1_:int = TimeManager.currentTime;
         var _loc2_:int = int(this.targetItem["buildTimeStamp"]);
         if(_loc2_ > 0)
         {
            _loc3_ = 100 - int((_loc2_ - _loc1_) / (this.targetItem as Building).buildTime * 100);
            this.buildActionButton.showPercentage(_loc3_);
         }
         else
         {
            this.notifier.dispatchNoticeToRoot(new ActionMenuNotice(ActionMenuNotice.CLOSE_ACTION_MENU));
         }
      }
      
      override public function close() : void
      {
         TimeManager.unregisterTickFunction(this.updateBuildActionMenu);
      }
   }
}

