package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.notices.gui.window.WindowNotice;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.components.scrollbar.ScollingComponent;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.mainmenu.MainMenuButton;
   import com.bigpoint.zoorama.view.gui.objects.createTextFieldItem;
   import com.bigpoint.zoorama.view.windows.WindowAbstract;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class WindowItemWentToInventory extends WindowAbstract
   {
      private var notice:WindowNotice;
      
      private var notifier:Notifier;
      
      private var scrollbar:ScollingComponent;
      
      private var mainText:TextField;
      
      private var mainTitle:TextField;
      
      private var btnOK:MainMenuButton;
      
      private var skinOk:Sprite;
      
      private var btnCancel:MainMenuButton;
      
      private var skinCancel:Sprite;
      
      private var infoMark:Sprite;
      
      public function WindowItemWentToInventory(param1:WindowNotice, param2:Notifier)
      {
         super();
         this._isPrimary = true;
         this.notice = param1;
         this.notifier = new Notifier(param2);
      }
      
      override public function startWindow() : void
      {
         super.offsetY = 30;
         super.setWindowPosition();
         this.setInnerContent();
         this.setOuterContent();
      }
      
      override public function setOuterContent() : void
      {
         this.infoMark = AddAssetItem.addSpriteToContainer(super.outer,AssetConfig.ASSET_HEADER_EXCLAMATION_ICON,AssetConfig.WINDOW_HEADERS,0,-60);
         this.infoMark["$right"].width = 165;
         this.skinCancel = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_WINDOW_CONFIRMATION_CANCEL_BUTTON);
         this.skinCancel.addEventListener(MouseEvent.CLICK,this.handleCloseClick);
         this.btnCancel = new MainMenuButton(this.notifier);
         this.btnCancel.skin = this.skinCancel;
         this.btnCancel.skin.x = 45;
         this.btnCancel.skin.y = 175;
         super.outer.addChild(this.skinCancel);
         this.skinOk = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_WINDOW_CONFIRMATION_OK_BUTTON);
         this.skinOk.addEventListener(MouseEvent.CLICK,this.handleOkClick);
         this.btnOK = new MainMenuButton(this.notifier);
         this.btnOK.skin = this.skinOk;
         this.btnOK.skin.x = 145;
         this.btnOK.skin.y = 175;
         super.outer.addChild(this.skinOk);
      }
      
      override public function setInnerContent() : void
      {
         this.mainTitle = createTextFieldItem.createNewTextField(90,10,170,20,true,true,"tf",TextFieldType.DYNAMIC,StyleModule.HEADER_BOLD_20_CENTER,MainConfig.PRICE_TXT_COLOR_ENABLE_BROWN,super.inner,false);
         this.mainText = createTextFieldItem.createNewTextField(18,95,240,220,true,true,"tf",TextFieldType.DYNAMIC,StyleModule.HEADER_BOLD_12_CENTER,MainConfig.PRICE_TXT_COLOR_ENABLE_BROWN,super.inner,false);
         this.scrollbar = new ScollingComponent(540,85,this.mainText,220,220,12);
         super.inner.addChild(this.scrollbar);
         this.mainTitle.text = TextResourceModule.getText("zoo.window.infoLayers.easterNotification.title");
         this.mainText.htmlText = TextResourceModule.getText("zoo.window.infoLayers.easterNotification.text");
         GUITemplates.redrawText(this.mainTitle,this.mainText);
         this.scrollbar.updateScroller();
      }
      
      override protected function handleCloseClick(param1:MouseEvent) : void
      {
         close();
      }
      
      private function handleOkClick(param1:MouseEvent) : void
      {
         close();
      }
   }
}

