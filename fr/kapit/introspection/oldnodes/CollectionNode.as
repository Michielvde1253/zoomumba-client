package fr.kapit.introspection.oldnodes
{
   import fr.kapit.introspection.AbstractLanguageElement;
   import fr.kapit.introspection.AccessorDescriptor;
   import fr.kapit.introspection.ClassProxy;
   import fr.kapit.introspection.ILanguageElement;
   import mx.collections.ArrayCollection;
   import mx.collections.ICollectionView;
   
   public class CollectionNode extends AbstractNode
   {
      protected var collection:ArrayCollection;
      
      public function CollectionNode(param1:String, param2:ArrayCollection, param3:Object = null)
      {
         var _loc4_:ILanguageElement = null;
         var _loc5_:String = null;
         var _loc6_:AbstractNode = null;
         var _loc7_:AccessorDescriptor = null;
         var _loc8_:Object = null;
         this.collection = new ArrayCollection();
         super(new AbstractLanguageElement(param1),param3);
         for each(_loc4_ in param2)
         {
            _loc6_ = NodeFactory.getNode(_loc4_,param3);
            this.collection.addItem(_loc6_);
         }
         for(_loc5_ in param3)
         {
            _loc7_ = new AccessorDescriptor();
            _loc7_.name = _loc5_;
            _loc8_ = param3[_loc5_];
            _loc7_.type = ClassProxy.getInstance().getDescriptor(_loc8_);
            _loc6_ = NodeFactory.getNode(_loc7_,param3);
            this.collection.addItem(_loc6_);
         }
      }
      
      override public function get children() : ICollectionView
      {
         return this.collection;
      }
      
      override public function hasChildren() : Boolean
      {
         return this.collection.length != 0;
      }
      
      override public function isBranch() : Boolean
      {
         return true;
      }
   }
}

