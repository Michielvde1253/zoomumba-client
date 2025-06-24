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
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.objects.createTextFieldItem;
   import com.bigpoint.zoorama.view.windows.WindowAbstract;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class WindowVisitorWishes extends WindowAbstract
   {
      private var notice:WindowNotice;
      
      private var notifier:Notifier;
      
      private var mainText:TextField;
      
      private var mainTitle:TextField;
      
      private var icon:Sprite;
      
      private var infoMark:Sprite;
      
      public function WindowVisitorWishes(param1:WindowNotice, param2:Notifier)
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
         this.infoMark = AddAssetItem.addSpriteToContainer(super.outer,"InfoSPR",AssetConfig.WINDOW_HEADERS,5,-60);
         this.infoMark["$right"].width = 250;
         AssetLibrary.sendAssetToFunction(AssetConfig.ASSET_VISITOR_WISHES_WINDOW,this.handleAssets);
      }
      
      override public function setInnerContent() : void
      {
         this.mainTitle = createTextFieldItem.createNewTextField(90,0,250,20,true,true,"tf",TextFieldType.DYNAMIC,StyleModule.HEADER_BOLD_18_CENTER,MainConfig.PRICE_TXT_COLOR_ENABLE_BROWN,super.inner,false);
         this.mainText = createTextFieldItem.createNewTextField(25,100,230,100,true,true,"tf",TextFieldType.DYNAMIC,StyleModule.HEADER_BOLD_12_LEFT,MainConfig.PRICE_TXT_COLOR_ENABLE_BROWN,super.inner,false);
      }
      
      private function handleAssets(param1:SWFAsset) : void
      {
         this.icon = param1.getEmbededSprite("sprInfoIconWish");
         this.icon.x = 260;
         this.icon.y = 50;
         super.outer.addChild(this.icon);
      }
      
      public function updateData() : void
      {
         this.mainTitle.text = TextResourceModule.getText("zoo.window.wishes.title");
         this.mainText.htmlText = TextResourceModule.getText("zoo.window.wishes.text");
         GUITemplates.redrawText(this.mainTitle,this.mainText);
      }
   }
}

