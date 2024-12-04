package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
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
   
   public class WindowStorageUnlock extends WindowAbstract
   {
      private var notice:WindowNotice;
      
      private var notifier:Notifier;
      
      private var scrollbar:ScollingComponent;
      
      private var mainText:TextField;
      
      private var mainTitle:TextField;
      
      private var btnOK:MainMenuButton;
      
      private var skinOk:Sprite;
      
      private var storageAsset:Sprite;
      
      private var infoMark:Sprite;
      
      public function WindowStorageUnlock(param1:WindowNotice, param2:Notifier)
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
         this.infoMark = AddAssetItem.addSpriteToContainer(super.outer,AssetConfig.ASSET_HEADER_INFO_ICON,AssetConfig.WINDOW_HEADERS,60,-5);
         this.infoMark["$right"].width = 400;
         this.skinOk = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_WINDOW_CONFIRMATION_OK_BUTTON);
         this.btnOK = new MainMenuButton(this.notifier);
         this.skinOk.addEventListener(MouseEvent.CLICK,handleCloseClick);
         this.btnOK.skin = this.skinOk;
         this.btnOK.skin.x = 275;
         this.btnOK.skin.y = 380;
         super.outer.addChild(this.skinOk);
      }
      
      override public function setInnerContent() : void
      {
         this.mainTitle = createTextFieldItem.createNewTextField(115,15,480,20,true,true,"tf",TextFieldType.DYNAMIC,StyleModule.HEADER_BOLD_20_CENTER,MainConfig.PRICE_TXT_COLOR_ENABLE_BROWN,super.inner,false);
         this.mainText = createTextFieldItem.createNewTextField(320,85,210,220,true,true,"tf",TextFieldType.DYNAMIC,StyleModule.HEADER_BOLD_12,MainConfig.PRICE_TXT_COLOR_ENABLE_BROWN,super.inner,false);
         this.scrollbar = new ScollingComponent(540,85,this.mainText,220,220,12);
         super.inner.addChild(this.scrollbar);
         AssetLibrary.sendAssetToFunction(AssetConfig.ASSET_STORAGE_WINDOW,this.handleAssets);
      }
      
      public function updateData() : void
      {
         this.mainTitle.text = TextResourceModule.getText("zoo.storage.firstExpansion.title");
         this.mainText.text = TextResourceModule.getText("zoo.storage.firstExpansion.text");
         GUITemplates.redrawText(this.mainTitle,this.mainText);
         this.scrollbar.updateScroller();
      }
      
      private function handleAssets(param1:SWFAsset) : void
      {
         this.storageAsset = param1.getEmbededSprite("WaterAndFood");
         this.storageAsset.x = 180;
         this.storageAsset.y = 240;
         super.inner.addChild(this.storageAsset);
      }
   }
}

