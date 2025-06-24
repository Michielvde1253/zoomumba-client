package com.bigpoint.zoorama.view.actionMenu
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   
   public class CleanActionMenu extends AbstractActionMenu
   {
      private var notifier:Notifier;
      
      private var targetItem:ItemAbstract;
      
      private var cleenTrashActionButton:ActionButton;
      
      public function CleanActionMenu(param1:Notifier)
      {
         super();
         this._menuType = ActionMenuTypes.MENU_TYPE_CLEAN;
         this.notifier = new Notifier(param1);
         this.cleenTrashActionButton = new ActionButton(this.notifier,this,this._menuType,ActionButton.CLEAN_TRASH_ACTON,false,SoundEffectNames.SND_ITEM_TRASH);
         this.y = -50;
      }
      
      override public function setTargetItem(param1:ItemAbstract) : void
      {
         this.targetItem = param1;
         this.cleenTrashActionButton.setItemIndentifiers(this.targetItem.category,this.targetItem.uniqueId);
         if(this.targetItem.category == Categories.TRASHBIN)
         {
            this.cleenTrashActionButton.sound = SoundEffectNames.SND_ITEM_TRASHBIN;
         }
         else if(this.targetItem.category == Categories.TRASHROAD)
         {
            this.cleenTrashActionButton.sound = SoundEffectNames.SND_ITEM_TRASH;
         }
      }
      
      override public function close() : void
      {
      }
   }
}

