package fr.kapit.tree
{
   import flash.events.Event;
   import fr.kapit.introspection.nodes.DebugNode;
   import mx.controls.treeClasses.TreeItemRenderer;
   import mx.events.CollectionEvent;
   import mx.events.FlexEvent;
   
   public class NodeItemRenderer extends TreeItemRenderer
   {
      public function NodeItemRenderer()
      {
         super();
         addEventListener(FlexEvent.CREATION_COMPLETE,this._onComplete);
      }
      
      private function _onComplete(param1:Event) : void
      {
         removeEventListener(FlexEvent.CREATION_COMPLETE,this._onComplete);
         label.multiline = false;
      }
      
      override public function set data(param1:Object) : void
      {
         var _loc2_:DebugNode = null;
         if(data)
         {
            DebugNode(data).removeEventListener(CollectionEvent.COLLECTION_CHANGE,this.onCollectionChange);
         }
         if(param1 is DebugNode)
         {
            _loc2_ = DebugNode(param1);
            _loc2_.listData = this.listData;
            if(Boolean(_loc2_.children) && !_loc2_.children.willTrigger(CollectionEvent.COLLECTION_CHANGE))
            {
               _loc2_.children.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onCollectionChange);
            }
         }
         super.data = param1;
      }
      
      public function get node() : DebugNode
      {
         return data as DebugNode;
      }
      
      private function onCollectionChange(param1:CollectionEvent) : void
      {
         if(listData)
         {
            IntrospectionTree(listData.owner).refresh(param1.clone());
         }
      }
   }
}

