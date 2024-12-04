package fr.kapit.introspection.nodes
{
   import mx.collections.ArrayCollection;
   import mx.collections.Sort;
   import mx.collections.SortField;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.PropertyChangeEvent;
   
   public class NodeCollection extends ArrayCollection
   {
      private var _2024620045sortAsc:Boolean = true;
      
      private var _nameFilter:String = "";
      
      private var _showInherited:Boolean = true;
      
      private var _typeFilter:Class = null;
      
      private var filterFunctions:Array;
      
      public function NodeCollection(param1:Boolean = false, param2:Boolean = false, param3:Boolean = true)
      {
         var _loc4_:Sort = null;
         this.filterFunctions = [];
         super();
         if(param3)
         {
            _loc4_ = new Sort();
            if(param2)
            {
               _loc4_.fields = [new SortField("index",false,false,true)];
            }
            else if(param1)
            {
               _loc4_.fields = [new SortField("name",true,false,false),new SortField("firstIndex",false,false,true)];
            }
            else
            {
               _loc4_.fields = [new SortField("name",true,false,false)];
            }
            this.sort = _loc4_;
         }
      }
      
      public function hasNode(param1:String, param2:Object) : Boolean
      {
         var _loc3_:DebugNode = null;
         for each(_loc3_ in this)
         {
            if(_loc3_.name == param1 && _loc3_.host == param2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get nameFilter() : String
      {
         return this._nameFilter;
      }
      
      private function set _1130373661nameFilter(param1:String) : void
      {
         if(this._nameFilter != param1)
         {
            this._nameFilter = param1;
            this.addFilter(this.acceptName);
            refresh();
            dispatchEvent(new CollectionEvent(CollectionEventKind.UPDATE));
         }
      }
      
      public function get showInherited() : Boolean
      {
         return this._showInherited;
      }
      
      private function set _2096274525showInherited(param1:Boolean) : void
      {
         if(this._showInherited != param1)
         {
            this._showInherited = param1;
            this.addFilter(this.acceptScope);
            refresh();
         }
      }
      
      public function get typeFilter() : Class
      {
         return this._typeFilter;
      }
      
      private function set _1805225134typeFilter(param1:Class) : void
      {
         if(this._typeFilter != param1)
         {
            this._typeFilter = param1;
            if(param1 != null)
            {
               this.addFilter(this.acceptType);
            }
            else
            {
               this.removeFilter(this.acceptType);
            }
            refresh();
            dispatchEvent(new CollectionEvent(CollectionEventKind.UPDATE));
         }
      }
      
      protected function getSortFields() : Array
      {
         return [new SortField("name",true,false,false)];
      }
      
      private function acceptName(param1:DebugNode) : Boolean
      {
         return param1.name.indexOf(this._nameFilter) == 0 || this._nameFilter == null || this._nameFilter.length == 0;
      }
      
      private function acceptNode(param1:DebugNode) : Boolean
      {
         var _loc3_:Function = null;
         var _loc2_:Boolean = true;
         for each(_loc3_ in this.filterFunctions)
         {
            _loc2_ &&= Boolean(_loc3_(param1));
            if(!_loc2_)
            {
               break;
            }
         }
         return _loc2_;
      }
      
      private function acceptScope(param1:DebugNode) : Boolean
      {
         return this._showInherited || param1.isDirectAttribute;
      }
      
      private function acceptType(param1:DebugNode) : Boolean
      {
         return param1.typeDescriptor.isCompatibleClass(this._typeFilter);
      }
      
      private function addFilter(param1:Function) : void
      {
         if(this.filterFunctions.indexOf(param1) < 0)
         {
            this.filterFunctions.push(param1);
         }
         if(filterFunction == null)
         {
            filterFunction = this.acceptNode;
         }
      }
      
      private function removeFilter(param1:Function) : void
      {
         if(this.filterFunctions.indexOf(param1) >= 0)
         {
            this.filterFunctions.splice(this.filterFunctions.indexOf(param1),1);
         }
         if(this.filterFunctions.length == 0)
         {
            this.filterFunction = null;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sortAsc() : Boolean
      {
         return this._2024620045sortAsc;
      }
      
      public function set sortAsc(param1:Boolean) : void
      {
         var _loc2_:Object = this._2024620045sortAsc;
         if(_loc2_ !== param1)
         {
            this._2024620045sortAsc = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sortAsc",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set nameFilter(param1:String) : void
      {
         var _loc2_:Object = this.nameFilter;
         if(_loc2_ !== param1)
         {
            this._1130373661nameFilter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameFilter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set showInherited(param1:Boolean) : void
      {
         var _loc2_:Object = this.showInherited;
         if(_loc2_ !== param1)
         {
            this._2096274525showInherited = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showInherited",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set typeFilter(param1:Class) : void
      {
         var _loc2_:Object = this.typeFilter;
         if(_loc2_ !== param1)
         {
            this._1805225134typeFilter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"typeFilter",_loc2_,param1));
            }
         }
      }
   }
}

