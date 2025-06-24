package fr.kapit.introspection.nodes
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.EventDispatcher;
   import flash.sampler.getSize;
   import fr.kapit.assets.ComponentIcons;
   import fr.kapit.utils.ClassUtils;
   import mx.collections.ArrayCollection;
   import mx.controls.Tree;
   import mx.core.BitmapAsset;
   import mx.core.Container;
   import mx.events.ChildExistenceChangedEvent;
   import mx.skins.ProgrammaticSkin;
   import mx.utils.UIDUtil;
   
   public class DisplayNode extends EventDispatcher
   {
      public var _name:String;
      
      public var shortVarName:String;
      
      public var type:String;
      
      public var uid:String;
      
      private var _children:ArrayCollection;
      
      private var _childrenComputed:Boolean;
      
      private var _displayObject:DisplayObject;
      
      private var _parent:DisplayNode;
      
      private var _parentTree:Tree;
      
      public function DisplayNode(param1:DisplayObject, param2:DisplayNode, param3:Tree)
      {
         super();
         this._displayObject = param1;
         this._parent = param2;
         this.type = param1.toString();
         this._name = ClassUtils.getShortClassName(param1);
         var _loc4_:int = int(this.type.lastIndexOf("."));
         this.shortVarName = _loc4_ < 0 ? this.type : this.type.substr(_loc4_ + 1);
         this.uid = UIDUtil.createUID();
         this._parentTree = param3;
      }
      
      private static function containsChild(param1:ArrayCollection, param2:DisplayObject) : Boolean
      {
         var _loc3_:DisplayNode = null;
         for each(_loc3_ in param1)
         {
            if(_loc3_ is DisplayNode && DisplayNode(_loc3_).displayObject == param2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get children() : ArrayCollection
      {
         if(!this._childrenComputed)
         {
            this._children = this._getChildren();
            this._childrenComputed = true;
         }
         return this._children;
      }
      
      public function get className() : String
      {
         return this._name;
      }
      
      public function get displayObject() : DisplayObject
      {
         return this._displayObject;
      }
      
      public function getObjectOfType(param1:String) : Array
      {
         var _loc2_:Array = [];
         this._getObjectOfType(_loc2_,param1);
         return _loc2_;
      }
      
      public function getStatistics() : Array
      {
         var _loc5_:String = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Object = {};
         var _loc4_:Array = [];
         this._getStatistics(_loc3_);
         for(_loc5_ in _loc3_)
         {
            _loc4_.push({
               "type":_loc5_,
               "count":_loc3_[_loc5_].count,
               "size":_loc3_[_loc5_].size
            });
            _loc1_ += int(_loc3_[_loc5_].count);
            _loc2_ += int(_loc3_[_loc5_].size);
         }
         _loc4_.push({
            "type":"total",
            "count":_loc1_,
            "size":_loc2_
         });
         return _loc4_;
      }
      
      public function get icon() : Class
      {
         var _loc2_:Class = null;
         var _loc1_:String = this.className;
         return ComponentIcons.getClassIcon(this.displayObject);
      }
      
      public function get name() : String
      {
         return this.shortVarName + ":" + this._name;
      }
      
      public function get parent() : DisplayNode
      {
         return this._parent;
      }
      
      public function get xml() : XML
      {
         var _loc1_:String = "";
         _loc1_ = this._getXMLString(this,_loc1_);
         return new XML(_loc1_);
      }
      
      private function _getChildren() : ArrayCollection
      {
         var _loc3_:int = 0;
         var _loc4_:DisplayObject = null;
         var _loc1_:DisplayObjectContainer = this._displayObject as DisplayObjectContainer;
         if(_loc1_ == null)
         {
            return null;
         }
         var _loc2_:ArrayCollection = new ArrayCollection();
         if(_loc1_ is Container)
         {
            _loc3_ = 0;
            while(_loc3_ < Container(_loc1_).rawChildren.numChildren)
            {
               _loc4_ = Container(_loc1_).rawChildren.getChildAt(_loc3_);
               if(!(_loc4_ is ProgrammaticSkin || _loc4_ is BitmapAsset))
               {
                  if(_loc4_ != null && !containsChild(_loc2_,_loc4_))
                  {
                     _loc2_.addItem(new DisplayNode(_loc4_,this,this._parentTree));
                  }
               }
               _loc3_++;
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_.numChildren)
            {
               _loc4_ = _loc1_.getChildAt(_loc3_);
               if(!(_loc4_ is ProgrammaticSkin || _loc4_ is BitmapAsset))
               {
                  if(_loc4_ != null && !containsChild(_loc2_,_loc4_))
                  {
                     _loc2_.addItem(new DisplayNode(_loc4_,this,this._parentTree));
                  }
               }
               _loc3_++;
            }
         }
         this._displayObject.addEventListener(ChildExistenceChangedEvent.CHILD_ADD,this._onChildAdd);
         this._displayObject.addEventListener(ChildExistenceChangedEvent.CHILD_REMOVE,this._onChildRemove);
         return _loc2_.length == 0 ? null : _loc2_;
      }
      
      private function _getObjectOfType(param1:Array, param2:String, param3:DisplayNode = null) : void
      {
         var _loc5_:DisplayNode = null;
         var _loc6_:String = null;
         var _loc4_:ArrayCollection = !!param3 ? param3._getChildren() : this._getChildren();
         for each(_loc5_ in _loc4_)
         {
            _loc6_ = _loc5_._name;
            if(param2 == _loc6_)
            {
               param1.push(_loc5_.displayObject);
            }
            this._getObjectOfType(param1,param2,_loc5_);
         }
      }
      
      private function _getStatistics(param1:Object, param2:DisplayNode = null) : void
      {
         var _loc4_:DisplayNode = null;
         var _loc5_:String = null;
         var _loc6_:Object = null;
         var _loc3_:ArrayCollection = !!param2 ? param2._getChildren() : this._getChildren();
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = _loc4_._name;
            _loc6_ = param1[_loc5_];
            if(!_loc6_)
            {
               _loc6_ = {};
               _loc6_.count = 0;
               _loc6_.size = 0;
            }
            _loc6_.count += 1;
            _loc6_.size += getSize(_loc4_);
            param1[_loc5_] = _loc6_;
            this._getStatistics(param1,_loc4_);
         }
      }
      
      private function _getXMLString(param1:DisplayNode, param2:String) : String
      {
         var _loc4_:DisplayNode = null;
         param2 += "<displayNode label=\'" + param1.name + "\'>";
         var _loc3_:ArrayCollection = param1.children;
         if(Boolean(_loc3_) && Boolean(_loc3_.length))
         {
            param2 += "<children>";
            for each(_loc4_ in _loc3_)
            {
               param2 = this._getXMLString(_loc4_,param2);
            }
            param2 += "</children>";
         }
         return param2 + "</displayNode>";
      }
      
      private function _onChildAdd(param1:ChildExistenceChangedEvent) : void
      {
         this._children = this._getChildren();
         this._refreshNodeInTree();
      }
      
      private function _onChildRemove(param1:ChildExistenceChangedEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Object = param1.relatedObject;
         if(this._children)
         {
            _loc3_ = 0;
            while(_loc3_ < this._children.length)
            {
               if(_loc2_ == DisplayNode(this._children.getItemAt(_loc3_)).displayObject)
               {
                  this._children.removeItemAt(_loc3_);
                  this._refreshNodeInTree();
                  break;
               }
               _loc3_++;
            }
         }
      }
      
      private function _refreshNodeInTree() : void
      {
         if(this._parentTree)
         {
            if(this._parentTree.isItemOpen(this))
            {
               this._parentTree.expandItem(this,false);
               this._parentTree.expandItem(this,true);
            }
            else if(this._parent != null)
            {
               this._parentTree.expandItem(this._parent,false);
               this._parentTree.expandItem(this._parent,true);
            }
         }
      }
   }
}

