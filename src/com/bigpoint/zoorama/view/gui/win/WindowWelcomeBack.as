package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.DisplayObjectHelper;
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.LocalizationPath;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.data.settings.WelcomeBackItem;
   import com.bigpoint.zoorama.notices.gui.window.WelcomeBackWindowNotice;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.components.scrollbar.ScollingComponent;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.mainmenu.MainMenuButton;
   import com.bigpoint.zoorama.view.gui.objects.createTextFieldItem;
   import com.bigpoint.zoorama.view.windows.WindowAbstract;
   import flash.display.Bitmap;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.utils.Dictionary;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class WindowWelcomeBack extends WindowAbstract
   {
      private var notice:WelcomeBackWindowNotice;
      
      private var notifier:Notifier;
      
      private var mainText:TextField;
      
      private var scrollbar:ScollingComponent;
      
      private var bigIcon:Sprite;
      
      private var headlineSkin:Sprite;
      
      private var btnOK:MainMenuButton;
      
      private var mainTitle:TextField;
      
      private var prizesContainer:Sprite;
      
      private var skinOk:Sprite;
      
      private var starsLeft:Sprite;
      
      private var starsRight:Sprite;
      
      public function WindowWelcomeBack()
      {
         super();
         this._isPrimary = true;
      }
      
      override public function startWindow() : void
      {
         super.offsetY = 30;
         super.setWindowPosition();
      }
      
      public function updateData(param1:WelcomeBackWindowNotice, param2:Notifier) : void
      {
         this.notice = param1;
         this.notifier = new Notifier(param2);
         this.setInnerContent();
         this.setOuterContent();
         this.createPrizes();
      }
      
      private function createPrizes() : void
      {
         var count:int;
         var assetShopItemDataRef:Dictionary = null;
         var i:WelcomeBackItem = null;
         var shopItemData:ShopItemData = null;
         var id:String = null;
         var filterAssists:Boolean = false;
         var amount:int = 0;
         var a:int = 0;
         var b:int = 0;
         while(a < this.notice.prices.length)
         {
            if(this.notice.prices[a].type == "assist")
            {
               amount = this.notice.prices[a].amount;
               b++;
            }
            if(b >= 6)
            {
               filterAssists = true;
               break;
            }
            a++;
         }
         if(filterAssists)
         {
            this.notice.prices = this.notice.prices.filter(function(param1:WelcomeBackItem, param2:int, param3:Vector.<WelcomeBackItem>):Boolean
            {
               return param1.type != "assist";
            });
            this.notice.prices.push(new WelcomeBackItem("user",999,amount));
         }
         count = 0;
         assetShopItemDataRef = new Dictionary(true);
         for each(i in this.notice.prices)
         {
            shopItemData = AssetIds.getShopItemData(i.type,i.id,i.amount);
            if(shopItemData.categoryId == Categories.CATEGORY_UNDEFINED)
            {
               this.addItem(AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,shopItemData.linkageId),count++,shopItemData.count,shopItemData.countType);
            }
            else
            {
               id = AssetIds.getPreviewAssetId(shopItemData.categoryId,shopItemData.itemId,shopItemData.level);
               assetShopItemDataRef[id] = shopItemData;
               AssetLibrary.sendAssetToFunction(id,function(param1:SWFAsset):void
               {
                  addItem(param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR),count++,assetShopItemDataRef[param1.id].count,assetShopItemDataRef[param1.id].countType);
               });
            }
         }
      }
      
      private function addItem(param1:DisplayObjectContainer, param2:int, param3:int, param4:String) : void
      {
         param1.x = param2 * 100;
         var _loc5_:String = StringHelper.numberFormater(param3,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         _loc5_ = _loc5_ + param4;
         var _loc6_:Bitmap = GUITemplates.createMaskedGradientTextfield(TextResourceModule.getText(_loc5_),StyleModule.HEADER_BOLD_14);
         param1.addChild(_loc6_);
         _loc6_.x = -_loc6_.width / 2;
         _loc6_.y = param1.height / 2 + 5;
         this.prizesContainer.addChild(param1);
         this.prizesContainer.x = 300 - (param1.x >> 1);
      }
      
      override public function setOuterContent() : void
      {
         this.bigIcon = AddAssetItem.addSpriteToContainer(super.outer,AssetConfig.ICON_WELCOMEBACK_WINDOW,"WindowGeneralHeaders",30,-10);
         this.skinOk = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_WINDOW_CONFIRMATION_OK_BUTTON);
         this.btnOK = new MainMenuButton(this.notifier);
         this.skinOk.addEventListener(MouseEvent.CLICK,this.handleCloseClick);
         this.btnOK.skin = this.skinOk;
         this.btnOK.skin.x = 275;
         this.btnOK.skin.y = 380;
         super.outer.addChild(this.skinOk);
         this.starsLeft = AssetLibrary.getMovieClip(AssetConfig.ASSET_COMMONS_SYMBOLS,"StarsEffectMC");
         this.starsRight = AssetLibrary.getMovieClip(AssetConfig.ASSET_COMMONS_SYMBOLS,"StarsEffectMC");
         this.starsLeft.scaleX = -1;
         this.starsLeft.x = 60;
         this.starsRight.x = 560;
         this.starsLeft.y = this.starsRight.y = 225;
         super.outer.addChild(this.starsLeft);
         super.outer.addChild(this.starsRight);
      }
      
      override public function setInnerContent() : void
      {
         var _loc1_:UserProxy = Facade.getInstance().getProxy(UserProxy);
         this.headlineSkin = AddAssetItem.addSpriteToContainer(super.inner,AssetConfig.GUI_WINDOW_HEADLINE,AssetConfig.ASSET_GAME_GUI,170,65);
         this.headlineSkin.width = 380;
         var _loc2_:String = TextResourceModule.getTextReplaced("zoo.window.welcomeBack.title",Vector.<TextReplace>([new TextReplace("%username%",_loc1_.userName)]));
         this.mainTitle = createTextFieldItem.createNewTextField(115,_loc2_.length > 34 ? 30 : 20,480,20,true,true,"tf",TextFieldType.DYNAMIC,_loc2_.length > 34 ? StyleModule.HEADER_BOLD_12_CENTER : StyleModule.HEADER_BOLD_20_CENTER,MainConfig.PRICE_TXT_COLOR_ENABLE_BROWN,super.inner,false);
         this.mainTitle.text = _loc2_;
         this.mainText = createTextFieldItem.createNewTextField(180,85,345,120,true,true,"tf",TextFieldType.DYNAMIC,StyleModule.HEADER_BOLD_12,MainConfig.PRICE_TXT_COLOR_ENABLE_BROWN,super.inner,false);
         this.scrollbar = new ScollingComponent(530,85,this.mainText,120,120,9);
         super.inner.addChild(this.scrollbar);
         this.mainText.htmlText = TextResourceModule.getText("zoo.window.welcomeBack.info");
         GUITemplates.redrawText(this.mainText);
         this.scrollbar.updateScroller();
         this.prizesContainer = new Sprite();
         this.prizesContainer.y = 265;
         super.inner.addChild(this.prizesContainer);
      }
      
      override protected function handleCloseClick(param1:MouseEvent) : void
      {
         super.handleCloseClick(param1);
         if(this.notice.closeFunction != null)
         {
            this.notice.closeFunction.apply(this.notice,this.notice.closeFunctionParams);
         }
      }
      
      override public function preClose() : void
      {
         DisplayObjectHelper.removeChildren(this.prizesContainer);
         super.inner.removeChild(this.headlineSkin);
         super.inner.removeChild(this.scrollbar);
         super.inner.removeChild(this.mainTitle);
         super.inner.removeChild(this.mainText);
         super.inner.removeChild(this.prizesContainer);
         super.outer.removeChild(this.skinOk);
         super.outer.removeChild(this.bigIcon);
         super.outer.removeChild(this.starsLeft);
         super.outer.removeChild(this.starsRight);
      }
   }
}

