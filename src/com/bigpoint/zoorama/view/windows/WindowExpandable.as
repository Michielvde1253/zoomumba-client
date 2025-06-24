package com.bigpoint.zoorama.view.windows
{
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.feature.tutorials.windows.ExpandablePanel;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.btn.SpriteButtonController;
   import com.greensock.TweenMax;
   import com.greensock.easing.Circ;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class WindowExpandable extends WindowAbstract
   {
      public var expandablePanel:ExpandablePanel;
      
      public var openExpandButton:Sprite;
      
      public var closeExpandButton:Sprite;
      
      private var panelStatus:String = "closed";
      
      public function WindowExpandable()
      {
         super();
      }
      
      override public function setBelowContent() : void
      {
         if(!this.expandablePanel)
         {
            this.expandablePanel = new ExpandablePanel();
            this.expandablePanel.skin = AssetConfig.ASSET_WINDOW_EXPANSIONPANEL;
            this.expandablePanel.setPosition(50,0);
            this.expandablePanel.init();
            super.below.addChild(this.expandablePanel);
         }
      }
      
      public function setExpandableButton(param1:String, param2:String, param3:String) : void
      {
         if(!this.openExpandButton)
         {
            this.openExpandButton = AddAssetItem.addSpriteToContainer(super.outer,param1,param3,435,267,false);
            this.closeExpandButton = AddAssetItem.addSpriteToContainer(super.outer,param2,param3,435,267,false);
            new SpriteButtonController(this.openExpandButton,true,this.handleHelpPanelExpansion,null,TextResourceModule.getText("zoo.tooltip.tutorial.openPanel"));
            new SpriteButtonController(this.closeExpandButton,true,this.handleHelpPanelExpansion,null,TextResourceModule.getText("zoo.tooltip.tutorial.closePanel"));
            this.openExpandButton.useHandCursor = true;
            this.openExpandButton.buttonMode = true;
            this.openExpandButton.mouseChildren = false;
            this.closeExpandButton.useHandCursor = true;
            this.closeExpandButton.buttonMode = true;
            this.closeExpandButton.mouseChildren = false;
            this.closeExpandButton.visible = false;
         }
      }
      
      public function handleHelpPanelExpansion(param1:MouseEvent) : void
      {
         if(param1.target == this.openExpandButton)
         {
            this.panelStatus = "opened";
            this.closeExpandButton.visible = true;
            this.openExpandButton.visible = false;
            TweenMax.to(this.expandablePanel,0.5,{
               "y":140,
               "ease":Circ.easeInOut
            });
         }
         else if(param1.target == this.closeExpandButton)
         {
            this.panelStatus = "closed";
            this.closeExpandButton.visible = false;
            this.openExpandButton.visible = true;
            TweenMax.to(this.expandablePanel,0.5,{
               "y":0,
               "ease":Circ.easeInOut
            });
         }
         SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_BUTTON_CLICK_3);
      }
      
      public function hardClosePanel() : void
      {
         if(this.panelStatus == "opened")
         {
            this.panelStatus = "closed";
            this.closeExpandButton.visible = false;
            this.openExpandButton.visible = true;
            TweenMax.to(this.expandablePanel,0.5,{
               "y":0,
               "ease":Circ.easeInOut
            });
         }
      }
      
      public function setPanelContent() : void
      {
      }
      
      public function makePanelVisible(param1:Boolean) : void
      {
         this.hardClosePanel();
      }
   }
}

