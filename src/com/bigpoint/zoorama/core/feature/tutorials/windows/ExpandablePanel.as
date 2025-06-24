package com.bigpoint.zoorama.core.feature.tutorials.windows
{
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.zoorama.view.windows.ExpandableAbstract;
   import flash.display.Sprite;
   
   public class ExpandablePanel extends ExpandableAbstract
   {
      public function ExpandablePanel()
      {
         super();
      }
      
      public function init() : void
      {
         this.createDisplayElements();
      }
      
      override public function createDisplayElements() : void
      {
         super.createDisplayElements();
      }
      
      override public function set skin(param1:String) : void
      {
         super.skin = param1;
      }
      
      public function addIconToContainer(param1:String) : void
      {
         var _loc2_:Sprite = AddAssetItem.addSpriteToContainer(super.iconContainer,param1,"tutorialElements",0,0,false);
         super.iconContainer.addChild(_loc2_);
      }
      
      public function updateData(param1:String, param2:String) : void
      {
         if(super.iconContainer.numChildren > 0)
         {
            super.iconContainer.removeChildAt(0);
         }
         this.addIconToContainer(param2);
         textField.text = param1;
         scrollPane.update();
      }
   }
}

