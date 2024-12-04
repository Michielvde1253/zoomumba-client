package fr.kapit.introspection.components
{
   import flash.display.DisplayObject;
   import fr.kapit.introspection.nodes.DisplayNode;
   
   public interface IDisplayListView
   {
      function set enableMove(param1:Boolean) : void;
      
      function set moveDownHandler(param1:Function) : void;
      
      function set moveLeftHandler(param1:Function) : void;
      
      function set moveRightHandler(param1:Function) : void;
      
      function set moveUpHandler(param1:Function) : void;
      
      function refresh() : void;
      
      function selectTreeItem(param1:DisplayObject) : void;
      
      function get selectedNode() : DisplayNode;
      
      function get tree() : DisplayListTree;
   }
}

