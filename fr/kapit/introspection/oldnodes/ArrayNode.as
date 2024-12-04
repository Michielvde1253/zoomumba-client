package fr.kapit.introspection.oldnodes
{
   import fr.kapit.introspection.AccessorDescriptor;
   import fr.kapit.introspection.ClassProxy;
   import fr.kapit.introspection.ILanguageElement;
   import mx.collections.ArrayCollection;
   import mx.collections.ICollectionView;
   
   public class ArrayNode extends VariableNode
   {
      public static const ITEMS_PER_NODES:int = 100;
      
      private var dataArray:ArrayCollection;
      
      private var firstIndex:int;
      
      private var isFirst:Boolean = true;
      
      private var isGroupNode:Boolean;
      
      private var lastIndex:int;
      
      private var nodes:ArrayCollection = null;
      
      public function ArrayNode(param1:ILanguageElement, param2:Object = null, param3:int = 0, param4:int = -1)
      {
         var _loc5_:Object = null;
         super(param1,param2);
         this.firstIndex = param3;
         this.lastIndex = param4;
         if(param2)
         {
            if(param2 is Array)
            {
               this.dataArray = new ArrayCollection(param2 as Array);
            }
            else if(param2 is ArrayCollection)
            {
               this.dataArray = param2 as ArrayCollection;
            }
            else
            {
               _loc5_ = param2[param1.name];
               if((Boolean(_loc5_)) && _loc5_ is Array)
               {
                  this.dataArray = new ArrayCollection(_loc5_ as Array);
               }
               else if(Boolean(_loc5_) && _loc5_ is ArrayCollection)
               {
                  this.dataArray = _loc5_ as ArrayCollection;
               }
            }
         }
      }
      
      override public function get children() : ICollectionView
      {
         var _loc1_:int = 0;
         if(this.dataArray != null)
         {
            _loc1_ = int(this.dataArray.length);
            if(this.isFirst)
            {
               this.buildAll();
               this.isFirst = false;
            }
         }
         return this.nodes;
      }
      
      override public function getData() : Object
      {
         return super.getData();
      }
      
      override public function hasChildren() : Boolean
      {
         return !!this.dataArray ? this.dataArray.length != 0 : super.hasChildren();
      }
      
      override public function isBranch() : Boolean
      {
         return this.hasChildren();
      }
      
      override public function get label() : String
      {
         var _loc1_:String = this.isGroupNode ? "" : variableDescriptor.name;
         if(this.lastIndex != -1)
         {
            _loc1_ += "[" + this.firstIndex + ".." + this.lastIndex + "]";
         }
         return _loc1_;
      }
      
      private function buildAll() : void
      {
         var _loc2_:int = 0;
         this.nodes = new ArrayCollection();
         var _loc1_:int = !!this.dataArray ? int(this.dataArray.length) : 0;
         if(this.lastIndex == -1)
         {
            _loc2_ = _loc1_ / ITEMS_PER_NODES;
            if(_loc2_ == 0)
            {
               this.lastIndex = _loc1_;
               this.buildItemNodes();
            }
            else
            {
               this.buildGroupNodes(_loc2_);
            }
         }
         else
         {
            this.buildItemNodes();
         }
      }
      
      private function buildGroupNodes(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:ArrayNode = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1)
         {
            _loc3_ = _loc2_ * ITEMS_PER_NODES;
            _loc4_ = Math.min(this.dataArray.length,_loc3_ + ITEMS_PER_NODES);
            _loc5_ = new ArrayNode(descriptor,target,_loc3_,_loc4_);
            _loc5_.isGroupNode = true;
            this.nodes.addItem(_loc5_);
            _loc2_++;
         }
      }
      
      private function buildItemNodes() : void
      {
         var _loc2_:Object = null;
         var _loc3_:AccessorDescriptor = null;
         var _loc4_:AbstractNode = null;
         this.isGroupNode = false;
         var _loc1_:int = this.firstIndex;
         while(_loc1_ < this.lastIndex)
         {
            _loc2_ = this.dataArray[_loc1_];
            _loc3_ = new AccessorDescriptor();
            _loc3_.name = String(_loc1_);
            _loc3_.type = ClassProxy.getInstance().getDescriptor(_loc2_);
            _loc4_ = NodeFactory.getNode(_loc3_,this.dataArray);
            VariableNode(_loc4_).index = _loc1_;
            if(_loc2_ is Array || _loc2_ is ArrayCollection)
            {
               ArrayNode(_loc4_).dataArray = _loc2_ is Array ? new ArrayCollection(_loc2_ as Array) : _loc2_ as ArrayCollection;
            }
            this.nodes.addItem(_loc4_);
            _loc1_++;
         }
      }
   }
}

