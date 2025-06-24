package fr.kapit.watch
{
   import fr.kapit.assets.ComponentIcons;
   import mx.collections.ArrayCollection;
   
   public class ChangeTargetNode
   {
      private var _observer:ChangeObserver;
      
      public var parent:ChangeTargetNode;
      
      public var children:ArrayCollection;
      
      public var label:String;
      
      public var classz:Class;
      
      public var isWatchPoint:Boolean;
      
      public function ChangeTargetNode(param1:ChangeObserver, param2:String, param3:Class, param4:ChangeTargetNode = null)
      {
         super();
         this._observer = param1;
         this.label = param2;
         this.classz = param3;
         this.parent = param4;
         this._addInParentChildList();
      }
      
      public function get accessPath() : String
      {
         var _loc1_:Array = [];
         var _loc2_:* = "";
         var _loc3_:ChangeTargetNode = this;
         while(_loc3_)
         {
            _loc1_.push(_loc3_.label);
            _loc3_ = _loc3_.parent;
         }
         _loc1_.pop();
         var _loc4_:int = int(_loc1_.length - 1);
         while(_loc4_ >= 0)
         {
            _loc2_ += _loc1_[_loc4_];
            if(_loc4_ != 0)
            {
               _loc2_ += ".";
            }
            _loc4_--;
         }
         return _loc2_;
      }
      
      private function _addInParentChildList() : void
      {
         if(this.parent)
         {
            this.parent._addChild(this);
         }
      }
      
      private function _addChild(param1:ChangeTargetNode) : void
      {
         if(!this.children)
         {
            this.children = new ArrayCollection();
         }
         this.children.addItem(param1);
      }
      
      public function get icon() : Class
      {
         return ComponentIcons.getClassIcon(this.classz);
      }
   }
}

