package com.bigpoint.zoomumba.view.windows.crafting.content
{
   import com.bigpoint.zoomumba.model.app.items.ItemStackVO;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import components.textfield.labelDisplay.LabelDisplay;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class ItemMaterialInfoView
   {
      public static const SLOTSTATE_NEED:String = "needMaterial";
      
      public static const SLOTSTATE_ENOUGHT:String = "enoughtMaterial";
      
      public static const SLOTSTATE_DISABLE:String = "deactive";
      
      private var _contentView:MovieClip;
      
      private var _labelView:LabelDisplay;
      
      private var _id:int;
      
      private var _graphicIcon:Sprite;
      
      private var _itemVo:ItemStackVO;
      
      public function ItemMaterialInfoView(param1:int, param2:MovieClip, param3:LabelDisplay)
      {
         super();
         this._contentView = param2;
         this._labelView = param3;
         this._id = param1;
         this.setSlotState(ItemMaterialInfoView.SLOTSTATE_DISABLE);
      }
      
      public function setSlotState(param1:String) : void
      {
         this._contentView.gotoAndStop(param1);
         if(param1 != ItemMaterialInfoView.SLOTSTATE_DISABLE && Boolean(this._graphicIcon))
         {
            this._contentView.addEventListener(MouseEvent.MOUSE_OVER,this.onItemMouseOver,false,0,true);
            this._contentView.addEventListener(MouseEvent.MOUSE_OUT,this.onItemMouseOut,false,0,true);
         }
         else
         {
            this._contentView.removeEventListener(MouseEvent.MOUSE_OVER,this.onItemMouseOver);
            this._contentView.removeEventListener(MouseEvent.MOUSE_OUT,this.onItemMouseOut);
         }
      }
      
      private function onItemMouseOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      private function onItemMouseOver(param1:MouseEvent) : void
      {
         if(Boolean(this._itemVo) && Boolean(this._graphicIcon))
         {
            TooltipNewManager.setToolTip(this._graphicIcon,TextResourceModule.getText(TextIdHelper.getCardName(this._itemVo.category,this._itemVo.itemId)));
         }
      }
      
      public function setIcon(param1:Sprite) : void
      {
         if(this._contentView)
         {
            this._graphicIcon = param1;
            (this._contentView.getChildByName("placeholder_mc") as MovieClip).addChild(this._graphicIcon);
         }
      }
      
      public function set labelText(param1:String) : void
      {
         if(this._labelView)
         {
            this._labelView.text = param1;
         }
      }
      
      public function set itemVo(param1:ItemStackVO) : void
      {
         this._itemVo = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function remove() : void
      {
         this._contentView.removeEventListener(MouseEvent.MOUSE_OVER,this.onItemMouseOver);
         this._contentView.removeEventListener(MouseEvent.MOUSE_OUT,this.onItemMouseOut);
      }
      
      private function update() : void
      {
         if(!this._contentView)
         {
         }
      }
   }
}

