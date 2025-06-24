package windows.custom.questsWindow
{
   import custom.features.collectable.book.CollectionBook;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import windows.core.OuterGroup;
   
   public class CollectablesTabContent extends Group
   {
      private var _3029737book:CollectionBook;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function CollectablesTabContent()
      {
         super();
         this.mxmlContent = [this._CollectablesTabContent_OuterGroup1_c()];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function _CollectablesTabContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._CollectablesTabContent_CollectionBook1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollectablesTabContent_CollectionBook1_i() : CollectionBook
      {
         var _loc1_:CollectionBook = new CollectionBook();
         _loc1_.horizontalCenter = 5;
         _loc1_.bottom = 75;
         _loc1_.id = "book";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.book = _loc1_;
         BindingManager.executeBindings(this,"book",this.book);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get book() : CollectionBook
      {
         return this._3029737book;
      }
      
      public function set book(param1:CollectionBook) : void
      {
         var _loc2_:Object = this._3029737book;
         if(_loc2_ !== param1)
         {
            this._3029737book = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"book",_loc2_,param1));
            }
         }
      }
   }
}

