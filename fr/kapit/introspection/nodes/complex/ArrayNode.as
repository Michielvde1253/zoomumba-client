package fr.kapit.introspection.nodes.complex
{
   import fr.kapit.introspection.nodes.DebugNode;
   import fr.kapit.introspection.nodes.NodeCollection;
   import fr.kapit.introspection.nodes.NodeFactory;
   import fr.kapit.utils.ClassUtils;
   import mx.binding.utils.BindingUtils;
   import mx.collections.ArrayCollection;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   
   public class ArrayNode extends ObjectNode
   {
      public static const ITEMS_PER_NODE:int = 100;
      
      public var dataArray:ArrayCollection;
      
      public var isGroupNode:Boolean = false;
      
      public var lastIndex:int = -1;
      
      public function ArrayNode(param1:Object, param2:String, param3:Object = null)
      {
         super(param1,param2,param3);
         this.setArrayCollection();
      }
      
      override public function get displayValue() : String
      {
         var _loc1_:String = ClassUtils.getShortClassName(target);
         if(firstIndex >= 0 && this.lastIndex >= 0)
         {
            return _loc1_ + " [" + firstIndex + "..." + this.lastIndex + "]";
         }
         return _loc1_;
      }
      
      override public function get label() : String
      {
         if(!this.isGroupNode)
         {
            return super.label;
         }
         return "[" + firstIndex + "..." + this.lastIndex + "]";
      }
      
      public function get length() : int
      {
         return this.dataArray != null ? int(this.dataArray.length) : 0;
      }
      
      override protected function buildDynamicAttributes() : void
      {
      }
      
      override protected function getChildNodes() : NodeCollection
      {
         var _loc1_:NodeCollection = null;
         var _loc2_:NodeCollection = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:DebugNode = null;
         if(!this.isGroupNode)
         {
            _loc1_ = super.getChildNodes();
         }
         else
         {
            _loc1_ = new NodeCollection();
         }
         if(firstIndex == -1 && this.lastIndex == -1)
         {
            _loc3_ = this.length / ITEMS_PER_NODE;
            _loc4_ = this.length % ITEMS_PER_NODE;
            if(_loc3_ == 1 && _loc4_ == 0)
            {
               _loc3_ = 0;
            }
            else if(_loc3_ != 0 && _loc4_ != 0)
            {
               _loc3_++;
            }
            firstIndex = 0;
            this.lastIndex = this.length;
         }
         if(_loc3_ > 0)
         {
            _loc2_ = new NodeCollection(true,false);
            this.buildGroupNodes(_loc3_,_loc2_);
         }
         else
         {
            _loc2_ = new NodeCollection(false,true);
            this.buildItemNodes(_loc2_);
         }
         if(_loc1_)
         {
            for each(_loc5_ in _loc1_)
            {
               _loc2_.addItem(_loc5_);
            }
         }
         return _loc2_;
      }
      
      private function buildGroupNodes(param1:int, param2:NodeCollection) : void
      {
         var _loc7_:ArrayNode = null;
         var _loc3_:Object = this.target;
         var _loc4_:Object = this.host;
         var _loc5_:String = this.name;
         var _loc6_:int = 0;
         while(_loc6_ < param1)
         {
            _loc7_ = new ArrayNode(_loc3_,_loc5_,_loc4_);
            _loc7_.firstIndex = _loc6_ * ITEMS_PER_NODE;
            _loc7_.lastIndex = Math.min(this.length,(_loc6_ + 1) * ITEMS_PER_NODE);
            _loc7_.isGroupNode = true;
            param2.addItem(_loc7_);
            _loc6_++;
         }
      }
      
      private function buildItemNodes(param1:NodeCollection) : void
      {
         var _loc5_:Object = null;
         var _loc6_:DebugNode = null;
         var _loc2_:Object = this.dataArray;
         var _loc3_:String = this.name;
         var _loc4_:int = firstIndex;
         while(_loc4_ < this.lastIndex)
         {
            _loc5_ = this.dataArray[_loc4_];
            _loc6_ = NodeFactory.newNode(_loc5_,_loc3_,_loc2_,_loc4_);
            param1.addItem(_loc6_);
            _loc4_++;
         }
      }
      
      private function onDataArrayChange(param1:CollectionEvent) : void
      {
         initialized = false;
         var _loc2_:int = firstIndex;
         var _loc3_:int = this.lastIndex;
         firstIndex = -1;
         this.lastIndex = -1;
         label = "";
         if(this.isGroupNode)
         {
            if(param1.kind == CollectionEventKind.ADD)
            {
               if(param1.location >= _loc2_ && param1.location < _loc3_)
               {
                  if(listData != null)
                  {
                     children.dispatchEvent(param1.clone());
                  }
               }
            }
         }
      }
      
      private function setArrayCollection() : void
      {
         if(target is Array)
         {
            this.dataArray = new ArrayCollection(target as Array);
            BindingUtils.bindSetter(this.setLabel,target,"length");
         }
         else if(target is ArrayCollection)
         {
            this.dataArray = target as ArrayCollection;
         }
         if(this.dataArray)
         {
            this.dataArray.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onDataArrayChange);
         }
      }
      
      private function setLabel(param1:Object) : void
      {
         label = "";
      }
   }
}

