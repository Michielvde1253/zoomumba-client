package fr.kapit.introspection.oldnodes
{
   import fr.kapit.introspection.ILanguageElement;
   import mx.collections.ICollectionView;
   import mx.controls.listClasses.BaseListData;
   import mx.controls.listClasses.IDropInListItemRenderer;
   
   public class AbstractNode implements IDropInListItemRenderer
   {
      public var descriptor:ILanguageElement;
      
      public var target:Object;
      
      private var _listData:BaseListData;
      
      public function AbstractNode(param1:ILanguageElement, param2:Object = null)
      {
         super();
         this.descriptor = param1;
         this.target = param2;
      }
      
      public function get children() : ICollectionView
      {
         return null;
      }
      
      public function getData() : Object
      {
         return null;
      }
      
      public function hasChildren() : Boolean
      {
         return false;
      }
      
      public function isBranch() : Boolean
      {
         return this.hasChildren();
      }
      
      public function get label() : String
      {
         return this.descriptor.name;
      }
      
      public function get listData() : BaseListData
      {
         return this._listData;
      }
      
      public function set listData(param1:BaseListData) : void
      {
         this._listData = param1;
      }
   }
}

