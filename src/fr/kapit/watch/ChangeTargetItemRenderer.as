package fr.kapit.watch
{
   import mx.controls.treeClasses.TreeItemRenderer;
   
   public class ChangeTargetItemRenderer extends TreeItemRenderer
   {
      public function ChangeTargetItemRenderer()
      {
         super();
      }
      
      public function get node() : ChangeTargetNode
      {
         return data as ChangeTargetNode;
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         var _loc2_:ChangeTargetNode = param1 as ChangeTargetNode;
         if(_loc2_)
         {
            if(_loc2_.isWatchPoint)
            {
               setStyle("color",16711680);
            }
            else
            {
               setStyle("color",0);
            }
         }
      }
      
      public function toggleState() : void
      {
         if(Boolean(this.node) && this.node.isWatchPoint)
         {
            setStyle("color",16711680);
         }
         else
         {
            setStyle("color",0);
         }
         invalidateProperties();
         invalidateDisplayList();
      }
   }
}

