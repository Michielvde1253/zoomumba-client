package com.bigpoint.zoomumba.view.windows.recycling
{
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.features.recycling.RecyclingProxy;
   import com.bigpoint.zoomumba.model.features.recycling.vo.RecyclingCardInfoVo;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.user.material.MaterialProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.data.settings.MaterialShopData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.display.Sprite;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.recycling.RecyclingChooseContent;
   import windows.custom.recycling.RecyclingChooseWindow;
   
   public class RecyclingWindowChooseMediator extends WindowMediator
   {
      public static const NAME:String = "RecyclingWindowChooseMediator";
      
      private var window:RecyclingChooseWindow;
      
      private var _recyclingProxy:RecyclingProxy;
      
      private var _inventoryProxy:InventoryProxy;
      
      private var _playfieldProxy:PlayFieldProxy;
      
      private var _selectedSlotItem:RecyclingCardInfoVo;
      
      private var _materialProxy:MaterialProxy;
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      public function RecyclingWindowChooseMediator(param1:RecyclingChooseWindow)
      {
         super(NAME,param1);
         this.window = param1;
      }
      
      override public function onRegister() : void
      {
         this._recyclingProxy = facade.getProxy(RecyclingProxy) as RecyclingProxy;
         this._inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         this._playfieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         this._materialProxy = facade.retrieveProxy(MaterialProxy.NAME) as MaterialProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [GUINote.RECYCLING_CHOOSE_MATERIAL,GUINote.RECYCLING_CHOOSE_MATERIAL_CLOSE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case GUINote.RECYCLING_CHOOSE_MATERIAL:
               this.openProduceRecycleWindow(param1.getBody() as MaterialShopData);
               break;
            case GUINote.RECYCLING_CHOOSE_MATERIAL_CLOSE:
               handleWindowCloseClick();
         }
      }
      
      private function openProduceRecycleWindow(param1:MaterialShopData) : void
      {
         this._selectedSlotItem.materialShopData = param1;
         this._selectedSlotItem.slotDataVo.materialId = this._selectedSlotItem.materialShopData.itemId;
         this._selectedSlotItem.slotDataVo.amount = this._selectedSlotItem.materialShopData.materialCount;
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.RECYCLING_PRODUCE_WINDOW,"",this._selectedSlotItem));
      }
      
      override public function init(param1:Object) : void
      {
         this._selectedSlotItem = param1 as RecyclingCardInfoVo;
         this.window.preloaderVisibility = true;
         AssetLibrary.sendAssetToFunction("RecyclingWindow",this.handleAssetLoad);
      }
      
      private function handleAssetLoad(param1:SWFAsset) : void
      {
         this.content.header_bg.source = param1.getEmbededBitmapData("BackgroundChoose");
         var _loc2_:Sprite = param1.getEmbededSprite("header_icon");
         initDynamicTitle(TextResourceModule.getText("zoo.window.recycling.title"),_loc2_);
         this._recyclingProxy.getRecylceSlots();
         this.window.preloaderVisibility = false;
         this.createRecyclingCards();
      }
      
      private function createRecyclingCards() : void
      {
         if(this.cardGroupHolderMediator == null)
         {
            this.cardGroupHolderMediator = new CardGroupHolderMediator(this.content.cardGroupHolder,CardHolderModes.RECYCLING_CHOOSE_MODE);
            facade.registerMediator(this.cardGroupHolderMediator);
            this.content.cardGroupHolder.paginator.entriesPerPage = 8;
            this.content.cardGroupHolder.layoutDisplay.verticalGap = 13;
            this.cardGroupHolderMediator.mode = CardHolderModes.RECYCLING_CHOOSE_MODE;
         }
         this.cardGroupHolderMediator.forceRemoveItems();
         this.cardGroupHolderMediator.onRemove();
         this.cardGroupHolderMediator.dataProvider = this._playfieldProxy.getMaterialsWithConfigListAsObject(true);
      }
      
      public function get content() : RecyclingChooseContent
      {
         return this.window.getContent(0) as RecyclingChooseContent;
      }
      
      override public function onRemove() : void
      {
         this.cardGroupHolderMediator.forceRemoveItems();
         this.cardGroupHolderMediator.onRemove();
         facade.removeMediator(this.cardGroupHolderMediator.getMediatorName());
         super.onRemove();
      }
   }
}

