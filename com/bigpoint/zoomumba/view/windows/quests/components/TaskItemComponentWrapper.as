package com.bigpoint.zoomumba.view.windows.quests.components
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import flash.events.MouseEvent;
   
   public class TaskItemComponentWrapper extends WrapedSprite
   {
      private var _animalId:int;
      
      public function TaskItemComponentWrapper(param1:String, param2:String, param3:int = 0, param4:int = 1)
      {
         this._animalId = param4;
         super(param1,param2,param3);
         this.addEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOver,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut,false,0,true);
      }
      
      private function handleMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(this,TextResourceModule.getText(TextIdHelper.getCardName(Categories.ANIMAL,this._animalId)),true);
      }
      
      private function handleMouseOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
   }
}

