package fr.kapit.introspection.components
{
   import flash.events.MouseEvent;
   import fr.kapit.events.EventTreeItem;
   import fr.kapit.introspection.events.EventFilterSelectedEvent;
   import mx.collections.ICollectionView;
   import mx.collections.IViewCursor;
   import mx.controls.CheckBox;
   import mx.controls.Image;
   import mx.controls.Tree;
   import mx.controls.treeClasses.ITreeDataDescriptor;
   import mx.controls.treeClasses.TreeItemRenderer;
   import mx.controls.treeClasses.TreeListData;
   
   public class CheckTreeRenderer extends TreeItemRenderer
   {
      public static var STATE_CHECKED:String = "checked";
      
      public static var STATE_SCHRODINGER:String = "schrodinger";
      
      public static var STATE_UNCHECKED:String = "unchecked";
      
      protected var myCheckBox:CheckBox;
      
      protected var myImage:Image;
      
      private var imageHeight:Number = 6;
      
      private var imageWidth:Number = 6;
      
      private var inner:Class = CheckTreeRenderer_inner;
      
      public function CheckTreeRenderer()
      {
         super();
         mouseEnabled = false;
      }
      
      override public function set data(param1:Object) : void
      {
         if(!param1)
         {
            return;
         }
         super.data = param1;
         var _loc2_:Tree = Tree(this.parent.parent);
         this.setCheckState(this.myCheckBox,param1,param1.state);
         if(TreeListData(super.listData).item.isBranch == "true")
         {
            _loc2_.setStyle("defaultLeafIcon",null);
         }
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.myCheckBox = new CheckBox();
         this.myCheckBox.setStyle("verticalAlign","middle");
         this.myCheckBox.setStyle("paddingTop",14);
         this.myCheckBox.setStyle("paddingBottom",0);
         this.myCheckBox.addEventListener(MouseEvent.CLICK,this.checkBoxToggleHandler);
         addChild(this.myCheckBox);
         this.myImage = new Image();
         this.myImage.source = this.inner;
         this.myImage.addEventListener(MouseEvent.CLICK,this.imageToggleHandler);
         this.myImage.setStyle("verticalAlign","middle");
         addChild(this.myImage);
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         if(super.data)
         {
            if(super.icon != null)
            {
               this.myCheckBox.x = super.icon.x;
               this.myCheckBox.y = 2;
               super.icon.x = this.myCheckBox.x + this.myCheckBox.width + 17;
               super.label.x = super.icon.x + super.icon.width + 3;
            }
            else
            {
               this.myCheckBox.x = super.label.x;
               this.myCheckBox.y = 2;
               super.label.x = this.myCheckBox.x + this.myCheckBox.width + 17;
            }
            if(data.state == STATE_SCHRODINGER)
            {
               this.myImage.x = this.myCheckBox.x + 4;
               this.myImage.y = this.myCheckBox.y + 4;
               this.myImage.width = this.imageWidth;
               this.myImage.height = this.imageHeight;
            }
            else
            {
               this.myImage.x = 0;
               this.myImage.y = 0;
               this.myImage.width = 0;
               this.myImage.height = 0;
            }
         }
      }
      
      private function checkBoxToggleHandler(param1:MouseEvent) : void
      {
         var _loc2_:TreeListData = null;
         var _loc3_:Object = null;
         var _loc4_:Tree = null;
         var _loc5_:Boolean = false;
         var _loc6_:Object = null;
         if(data)
         {
            _loc2_ = TreeListData(this.listData);
            _loc3_ = _loc2_.item;
            _loc4_ = Tree(_loc2_.owner);
            _loc5_ = Boolean(this.myCheckBox.selected);
            if(_loc5_)
            {
               this.toggleChildren(data,_loc4_,STATE_CHECKED);
               dispatchEvent(new EventFilterSelectedEvent(EventFilterSelectedEvent.EVENT_ON,EventTreeItem(data).label,true));
            }
            else
            {
               this.toggleChildren(data,_loc4_,STATE_UNCHECKED);
               dispatchEvent(new EventFilterSelectedEvent(EventFilterSelectedEvent.EVENT_OFF,EventTreeItem(data).label,true));
            }
            _loc6_ = _loc4_.getParentItem(data);
            this.toggleParents(_loc6_,_loc4_,this.getState(_loc4_,_loc6_));
         }
      }
      
      private function getState(param1:Tree, param2:Object) : String
      {
         var _loc6_:ITreeDataDescriptor = null;
         var _loc7_:IViewCursor = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2 != null)
         {
            _loc6_ = param1.dataDescriptor;
            _loc7_ = _loc6_.getChildren(param2).createCursor();
            while(!_loc7_.afterLast)
            {
               if(_loc7_.current.state == STATE_CHECKED)
               {
                  _loc3_++;
               }
               else if(_loc7_.current.state == STATE_UNCHECKED)
               {
                  _loc5_++;
               }
               else
               {
                  _loc4_++;
               }
               _loc7_.moveNext();
            }
         }
         if(_loc3_ > 0 && _loc5_ > 0 || _loc4_ > 0)
         {
            return STATE_SCHRODINGER;
         }
         if(_loc3_ > 0)
         {
            return STATE_CHECKED;
         }
         return STATE_UNCHECKED;
      }
      
      private function imageToggleHandler(param1:MouseEvent) : void
      {
         this.myCheckBox.selected = !this.myCheckBox.selected;
         this.checkBoxToggleHandler(param1);
      }
      
      private function setCheckState(param1:CheckBox, param2:Object, param3:String) : void
      {
         if(param3 == STATE_CHECKED)
         {
            param1.selected = true;
         }
         else if(param3 == STATE_UNCHECKED)
         {
            param1.selected = false;
         }
         else if(param3 == STATE_SCHRODINGER)
         {
            param1.selected = false;
         }
      }
      
      private function toggleChildren(param1:Object, param2:Tree, param3:String) : void
      {
         var _loc4_:ITreeDataDescriptor = null;
         var _loc5_:ICollectionView = null;
         var _loc6_:IViewCursor = null;
         if(param1 == null)
         {
            return;
         }
         param1.state = param3;
         _loc4_ = param2.dataDescriptor;
         if(_loc4_.hasChildren(param1))
         {
            _loc5_ = _loc4_.getChildren(param1);
            _loc6_ = _loc5_.createCursor();
            while(!_loc6_.afterLast)
            {
               this.toggleChildren(_loc6_.current,param2,param3);
               _loc6_.moveNext();
            }
         }
      }
      
      private function toggleParents(param1:Object, param2:Tree, param3:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.state = param3;
         this.toggleParents(param2.getParentItem(param1),param2,this.getState(param2,param2.getParentItem(param1)));
      }
   }
}

