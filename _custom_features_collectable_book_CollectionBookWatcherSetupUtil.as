package
{
   import custom.features.collectable.book.CollectionBook;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_collectable_book_CollectionBookWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_collectable_book_CollectionBookWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CollectionBook.watcherSetupUtil = new _custom_features_collectable_book_CollectionBookWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("nextPage",{"propertyChange":true},[param4[1]],param2);
         param5[0] = new PropertyWatcher("prevPage",{"propertyChange":true},[param4[0]],param2);
         param5[8] = new PropertyWatcher("coverTitleSource",{"propertyChange":true},[param4[10]],param2);
         param5[2] = new PropertyWatcher("$pageLeftCoverSource",{"propertyChange":true},[param4[3]],param2);
         param5[9] = new PropertyWatcher("coverTitle",{"propertyChange":true},[param4[11]],param2);
         param5[10] = new PropertyWatcher("width",{"widthChanged":true},[param4[11]],null);
         param5[7] = new PropertyWatcher("$bookCoverSPRSource",{"propertyChange":true},[param4[9]],param2);
         param5[5] = new PropertyWatcher("$pageRightPaperSource",{"propertyChange":true},[param4[6]],param2);
         param5[4] = new PropertyWatcher("$pageLeftPaperSource",{"propertyChange":true},[param4[5]],param2);
         param5[6] = new PropertyWatcher("$lineHalfBookSource",{"propertyChange":true},[param4[7]],param2);
         param5[3] = new PropertyWatcher("$pageRightCoverSource",{"propertyChange":true},[param4[4]],param2);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
         param5[8].updateParent(param1);
         param5[2].updateParent(param1);
         param5[9].updateParent(param1);
         param5[9].addChild(param5[10]);
         param5[7].updateParent(param1);
         param5[5].updateParent(param1);
         param5[4].updateParent(param1);
         param5[6].updateParent(param1);
         param5[3].updateParent(param1);
      }
   }
}

