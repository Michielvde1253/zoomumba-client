package fr.kapit.components
{
   import fr.kapit.controls.kDataGrid;
   import mx.collections.ArrayCollection;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   
   public class DataGridAutoScroll extends kDataGrid
   {
      public var autoSelect:Boolean = false;
      
      public var isActive:Boolean = true;
      
      public function DataGridAutoScroll()
      {
         super();
      }
      
      override public function set dataProvider(param1:Object) : void
      {
         super.dataProvider = param1;
         if(dataProvider is ArrayCollection)
         {
            ArrayCollection(dataProvider).addEventListener(CollectionEvent.COLLECTION_CHANGE,this._onCollectionChange,false,0,true);
         }
      }
      
      public function selectLastItem() : void
      {
         var _loc1_:int = ArrayCollection(dataProvider).length - 1;
         if(_loc1_ >= 0)
         {
            if(this.autoSelect)
            {
               selectedItem = ArrayCollection(dataProvider).getItemAt(_loc1_);
            }
            scrollToIndex(_loc1_);
         }
      }
      
      public function selectNewItem(param1:Object) : void
      {
         var _loc2_:int = int(ArrayCollection(dataProvider).getItemIndex(param1));
         if(_loc2_ >= 0)
         {
            if(this.autoSelect)
            {
               selectedItem = ArrayCollection(dataProvider).getItemAt(_loc2_);
            }
            scrollToIndex(_loc2_);
         }
      }
      
      private function _onCollectionChange(param1:CollectionEvent) : void
      {
         var _loc2_:Object = null;
         if(param1.kind == CollectionEventKind.ADD)
         {
            _loc2_ = param1.items[0];
            if(this.isActive)
            {
               callLater(this.selectNewItem,[_loc2_]);
            }
         }
      }
   }
}

