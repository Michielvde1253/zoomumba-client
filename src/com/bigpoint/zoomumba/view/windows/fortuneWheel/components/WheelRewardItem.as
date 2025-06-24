package com.bigpoint.zoomumba.view.windows.fortuneWheel.components
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.features.fortuneWheel.vo.FortuneWheelRewardVO;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import flash.events.MouseEvent;
   
   public class WheelRewardItem extends WrapedSprite
   {
      private var reward:FortuneWheelRewardVO;
      
      public function WheelRewardItem(param1:String, param2:String, param3:int, param4:FortuneWheelRewardVO)
      {
         this.reward = param4;
         super(param1,param2,param3);
         this.addEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOver,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut,false,0,true);
      }
      
      private function handleMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(this,this.tooltip,true);
      }
      
      private function handleMouseOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      private function get tooltip() : String
      {
         var _loc1_:ShopItemData = AssetIds.getShopItemData(ItemTypeHelper.categoryToType(this.reward.category),this.reward.id,this.reward.count);
         var _loc2_:String = this.reward.count + "x " + _loc1_.localizedName;
         switch(this.reward.category)
         {
            case Categories.ASSISTANCE:
               _loc2_ = TextResourceModule.getText("zoo.wheel.assistant." + this.reward.id + ".hour." + this.reward.count);
               break;
            case Categories.POWERUP:
               _loc2_ = _loc1_.localizedName;
         }
         return _loc2_;
      }
   }
}

