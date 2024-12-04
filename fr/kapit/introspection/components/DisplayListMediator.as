package fr.kapit.introspection.components
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import fr.kapit.introspection.nodes.DisplayNode;
   
   public class DisplayListMediator
   {
      private var _tree:DisplayListTree;
      
      private var _view:IDisplayListView;
      
      public function DisplayListMediator(param1:IDisplayListView)
      {
         super();
         this._view = param1;
         this._tree = this._view.tree;
         this._view.moveDownHandler = this._onMoveDown;
         this._view.moveUpHandler = this._onMoveUp;
         this._view.moveLeftHandler = this._onMoveLeft;
         this._view.moveRightHandler = this._onMoveRight;
      }
      
      public function get selectedNode() : DisplayNode
      {
         return this._view.selectedNode;
      }
      
      private function _onMoveDown() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:int = 0;
         var _loc4_:DisplayObject = null;
         if(this.selectedNode)
         {
            _loc1_ = this.selectedNode.displayObject;
            _loc2_ = _loc1_.parent;
            if(_loc2_)
            {
               _loc3_ = _loc2_.getChildIndex(_loc1_);
               if(_loc3_ + 1 < _loc2_.numChildren)
               {
                  _loc4_ = _loc2_.getChildAt(_loc3_ + 1);
                  _loc2_.removeChild(_loc1_);
                  _loc2_.addChildAt(_loc1_,_loc3_ + 1);
               }
            }
         }
      }
      
      private function _onMoveLeft() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:DisplayObjectContainer = null;
         if(this.selectedNode)
         {
            _loc1_ = this.selectedNode.displayObject;
            _loc2_ = _loc1_.parent;
            if(_loc2_)
            {
               _loc3_ = _loc2_.parent;
               if(_loc3_)
               {
                  _loc2_.removeChild(_loc1_);
                  _loc3_.addChildAt(_loc1_,0);
               }
            }
         }
      }
      
      private function _onMoveRight() : void
      {
      }
      
      private function _onMoveUp() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:int = 0;
         var _loc4_:DisplayObject = null;
         if(this.selectedNode)
         {
            _loc1_ = this.selectedNode.displayObject;
            _loc2_ = _loc1_.parent;
            if(_loc2_)
            {
               _loc3_ = _loc2_.getChildIndex(_loc1_);
               if(_loc3_ != 0)
               {
                  _loc4_ = _loc2_.getChildAt(_loc3_ - 1);
                  _loc2_.removeChild(_loc1_);
                  _loc2_.addChildAt(_loc1_,_loc3_ - 1);
               }
            }
         }
      }
   }
}

