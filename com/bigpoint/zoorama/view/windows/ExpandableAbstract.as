package com.bigpoint.zoorama.view.windows
{
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.components.scrollpane.ScollPaneComponent;
   import com.bigpoint.zoorama.view.gui.objects.createTextFieldItem;
   import com.bigpoint.zoorama.view.windows.interfaces.IExpand;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class ExpandableAbstract extends Sprite implements IExpand
   {
      private var panelSkin:Sprite;
      
      private var hintText:TextField;
      
      private var hintIcon:Sprite;
      
      private var panelScrollPane:ScollPaneComponent;
      
      public function ExpandableAbstract()
      {
         super();
      }
      
      public function createDisplayElements() : void
      {
         this.createTextField();
         this.createIconContainer();
      }
      
      public function set skin(param1:String) : void
      {
         this.panelSkin = AddAssetItem.addSpriteToContainer(this,param1,"WindowsAll",0,0,false);
         this.addChild(this.panelSkin);
      }
      
      public function setPosition(param1:int, param2:int) : void
      {
         this.x = param1;
         this.y = param2;
      }
      
      private function createTextField() : void
      {
         this.panelScrollPane = new ScollPaneComponent();
         this.panelScrollPane.setCoordinates(100,179);
         this.panelScrollPane.setPaneDimensions(260,50);
         this.hintText = createTextFieldItem.createNewTextField(0,0,260,50,true,true,"txtHint",TextFieldType.INPUT,StyleModule.HEADER_BOLD_12_LEFT,3480321,this.panelScrollPane.target,true,"left","advanced");
         this.hintText.text = "";
         this.panelScrollPane.init();
         this.addChild(this.panelScrollPane);
      }
      
      private function createIconContainer() : void
      {
         this.hintIcon = new Sprite();
         this.hintIcon.x = 55;
         this.hintIcon.y = 200;
         this.addChild(this.hintIcon);
      }
      
      public function get textField() : TextField
      {
         return this.hintText;
      }
      
      public function get iconContainer() : Sprite
      {
         return this.hintIcon;
      }
      
      public function get scrollPane() : ScollPaneComponent
      {
         return this.panelScrollPane;
      }
   }
}

