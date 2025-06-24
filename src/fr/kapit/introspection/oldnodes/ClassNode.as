package fr.kapit.introspection.oldnodes
{
   import fr.kapit.introspection.ClassDescriptor;
   import mx.collections.ArrayCollection;
   import mx.collections.ICollectionView;
   
   public class ClassNode extends AbstractNode
   {
      public var variables:CollectionNode;
      
      private var _children:ArrayCollection = new ArrayCollection();
      
      public function ClassNode(param1:ClassDescriptor, param2:Object = null, param3:Boolean = false)
      {
         super(param1,param2);
         if(param3 && Boolean(this.classDescriptor.parents.length))
         {
            this._children.addItem(new CollectionNode("parents",this.classDescriptor.parents));
         }
         if(this.classDescriptor.accessors.length)
         {
            this.variables = new CollectionNode("variables",this.classDescriptor.accessors,param2);
            this._children.addItem(this.variables);
         }
         if(this.classDescriptor.children.length)
         {
            this._children.addItem(new CollectionNode("children",this.classDescriptor.children));
         }
         if(this.classDescriptor.methods.length)
         {
            this._children.addItem(new CollectionNode("methods",this.classDescriptor.methods));
         }
         if(this.classDescriptor.interfaces.length)
         {
            this._children.addItem(new CollectionNode("interfaces",this.classDescriptor.interfaces));
         }
      }
      
      override public function get children() : ICollectionView
      {
         return this._children;
      }
      
      public function get classDescriptor() : ClassDescriptor
      {
         return descriptor as ClassDescriptor;
      }
      
      override public function hasChildren() : Boolean
      {
         return true;
      }
      
      override public function get label() : String
      {
         return this.classDescriptor.label;
      }
   }
}

