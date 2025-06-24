package fr.kapit.menu
{
   import flash.display.InteractiveObject;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   import fr.kapit.components.ComponentManager;
   import fr.kapit.components.KapDebugComponentFactory;
   import fr.kapit.utils.ClassUtils;
   
   public class ContextMenuHelper
   {
      private static var customItems:Array = [];
      
      private static var menu:ContextMenu = new ContextMenu();
      
      public function ContextMenuHelper()
      {
         super();
      }
      
      public static function fillContextMenu(param1:InteractiveObject, param2:Object, param3:String = null) : void
      {
         var _loc6_:ContextMenuItem = null;
         var _loc8_:String = null;
         var _loc9_:KapDebugComponentFactory = null;
         var _loc10_:ContextMenuHandler = null;
         var _loc4_:ContextMenu = param1.contextMenu;
         var _loc5_:Array = [];
         var _loc7_:Array = ComponentManager.instance.componentNames;
         for each(_loc8_ in _loc7_)
         {
            _loc9_ = ComponentManager.instance.getComponentFactory(_loc8_);
            if(Boolean(param2) && _loc9_.canAccept(param2))
            {
               _loc6_ = new ContextMenuItem("Show " + _loc9_.label + " for: " + (!!param3 ? param3 : ClassUtils.getLabelForDisplayNode(param2)));
               _loc10_ = new ContextMenuHandler(_loc6_,param2,_loc9_);
               _loc5_.push(_loc6_);
            }
         }
         _loc4_.customItems = _loc5_;
      }
      
      public static function prepareDebugNodeMenu(param1:InteractiveObject, param2:Object, param3:String = null) : void
      {
         menu.hideBuiltInItems();
         customItems.splice(0);
         _buildContextMenu(param2,param3);
         menu.customItems = customItems;
         param1.contextMenu = menu;
      }
      
      private static function _buildContextMenu(param1:Object, param2:String = null) : void
      {
         var _loc3_:ContextMenuItem = null;
         var _loc5_:String = null;
         var _loc6_:KapDebugComponentFactory = null;
         var _loc7_:ContextMenuHandler = null;
         var _loc4_:Array = ComponentManager.instance.componentNames;
         for each(_loc5_ in _loc4_)
         {
            _loc6_ = ComponentManager.instance.getComponentFactory(_loc5_);
            if(Boolean(param1) && _loc6_.canAccept(param1))
            {
               _loc3_ = new ContextMenuItem("Show " + _loc6_.label + " for: " + (!!param2 ? param2 : ClassUtils.getLabelForDisplayNode(param1)));
               _loc7_ = new ContextMenuHandler(_loc3_,param1,_loc6_);
               customItems.push(_loc3_);
            }
         }
      }
   }
}

