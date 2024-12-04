package com.bigpoint.zoomumba.view.windows.news
{
   import buttons.extended.ButtonBuy;
   import buttons.tabs.TabButton;
   import buttons.tabs.TabButtonTinySkin;
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.news.NewsProxy;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetAutoFiller;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import flash.display.Sprite;
   import mx.core.UIComponent;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   import windows.core.LoaderImage;
   import windows.core.tabs.ITabsGroup;
   import windows.custom.news.NewsTabContent;
   import windows.custom.news.NewsTopContent;
   import windows.custom.news.NewsWindow;
   import windows.events.WindowCustomEvent;
   
   public class NewsWindowMediator extends WindowMediator
   {
      public static const NAME:String = "NewsWindowMediator";
      
      private const TOP_CONTENT_ID:int = 999;
      
      private const ASSETS_BATCH:int = 4;
      
      private var appProxy:AppProxy;
      
      private var newsProxy:NewsProxy;
      
      private var netHelperProxy:NetHelperProxy;
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      private var _currNrAssetsLoaded:int = 0;
      
      private var tabValues:Vector.<int>;
      
      private var msgType:String;
      
      public function NewsWindowMediator(param1:NewsWindow)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.appProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         this.newsProxy = facade.retrieveProxy(NewsProxy.NAME) as NewsProxy;
         this.netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
      }
      
      override public function init(param1:Object) : void
      {
         this.msgType = param1 == null ? NewsProxy.MSG_TYPE_HELLO : param1 as String;
         this._currNrAssetsLoaded = 0;
         this.window.preloaderVisibility = true;
         this.window.addEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleTabChanged);
         this.window.header.filePath = this.netHelperProxy.getHeaderPath("header_news");
         this.createTabs(this.window.getTabsGroup(),this.newsProxy.tabs);
         this.window.customContent(this.TOP_CONTENT_ID,NewsTopContent);
         AssetLibrary.sendAssetToFunction("SoniaSmall",this.assetLoaded);
         AssetLibrary.sendAssetToFunction("BubbleSmall",this.assetLoaded);
         AssetLibrary.sendAssetToFunction("WoodLath",this.assetLoaded);
         AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(Categories.ASSISTANCE,6),this.assetLoaded);
         this.topContent.labelMoney.value = this.newsProxy.getMoneyValue(this.msgType);
         this.topContent.textNewItems.htmlText = TextResourceModule.getText("zoo.news.text.subheader");
         var _loc2_:Object = this.newsProxy.getBubbleText(this.msgType);
         this.topContent.textLine1.htmlText = _loc2_.line1;
         this.topContent.textLine2.htmlText = _loc2_.line2;
         this.topContent.textLine3.htmlText = _loc2_.line3;
         this.topContent.moneyGroup.toolTip = this.topContent.labelMoney.toolTip = this.newsProxy.getMoneyValueToolTip(this.msgType);
         this.createNewsCards();
      }
      
      private function assetLoaded(param1:SWFAsset) : void
      {
         ++this._currNrAssetsLoaded;
         if(Boolean(param1) && Boolean(this.topContent))
         {
            switch(param1.id)
            {
               case "SoniaSmall":
               case "SoniaSmall.swf":
                  if(this.topContent.sonia != null && param1.getEmbededBitmapData("SoniaSmall") != null)
                  {
                     this.topContent.sonia.displayClass = param1.getEmbededBitmapData("SoniaSmall");
                  }
                  break;
               case "BubbleSmall":
               case "BubbleSmall.swf":
                  if(this.topContent.bubble != null && param1.getEmbededBitmapData("BubbleSmall") != null)
                  {
                     this.topContent.bubble.displayClass = param1.getEmbededBitmapData("BubbleSmall");
                  }
                  break;
               case "WoodLath":
               case "WoodLath.swf":
                  if(param1.getEmbededBitmapData("WoodLath") != null && this.topContent != null)
                  {
                     if(this.topContent.lineH != null)
                     {
                        this.topContent.lineH.source = param1.getEmbededBitmapData("WoodLath");
                     }
                     if(this.topContent.lineV != null)
                     {
                        this.topContent.lineV.source = param1.getEmbededBitmapData("WoodLath");
                     }
                  }
                  break;
               case AssetIds.getPreviewAssetId(Categories.ASSISTANCE,6):
               case AssetIds.getPreviewAssetId(Categories.ASSISTANCE,6) + ".swf":
                  if(this.topContent.moneyImg != null && param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR) != null)
                  {
                     this.topContent.moneyImg.displayClass = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
                  }
            }
         }
         if(this._currNrAssetsLoaded >= this.ASSETS_BATCH)
         {
            this.window.preloaderVisibility = false;
         }
      }
      
      private function createNewsCards() : void
      {
         this.topContent.cardGroupHolder.paginator.entriesPerPage = 1;
         this.cardGroupHolderMediator = new CardGroupHolderMediator(this.topContent.cardGroupHolder,CardHolderModes.NEWS_MODE);
         facade.registerMediator(this.cardGroupHolderMediator);
         this.cardGroupHolderMediator.mode = CardHolderModes.NEWS_MODE;
         this.cardGroupHolderMediator.dataProvider = this.newsProxy.cardHolderData;
      }
      
      private function createTabs(param1:ITabsGroup, param2:Vector.<int>) : void
      {
         var _loc4_:TabButton = null;
         var _loc3_:Group = param1 as Group;
         this.tabValues = param2;
         var _loc5_:int = 0;
         var _loc6_:int = int(param2.length);
         while(_loc5_ < _loc6_)
         {
            _loc4_ = new TabButton();
            _loc4_.index = _loc5_;
            _loc4_.label = StringHelper.romanize(_loc5_ + 1);
            _loc4_.contentClass = NewsTabContent;
            _loc4_.setStyle("skinClass",TabButtonTinySkin as Class);
            _loc3_.addElement(_loc4_);
            AssetAutoFiller.addNewsId(param2[_loc5_]);
            _loc5_++;
         }
         this.window.invalidateTabs();
      }
      
      private function handleTabChanged(param1:WindowCustomEvent) : void
      {
         if(param1.contentClass == NewsTabContent)
         {
            this.topContent.preloader.visible = true;
            AssetLibrary.sendAssetToFunction("news_" + this.tabValues[this.window.getTabsGroup().selectedIndex],this.newsAssetLoad);
         }
      }
      
      private function newsAssetLoad(param1:SWFAsset) : void
      {
         if(this.topContent)
         {
            this.topContent.preloader.visible = false;
         }
         var _loc2_:Sprite = param1.getEmbededSprite("InnerSPR");
         var _loc3_:Sprite = param1.getEmbededSprite("OuterSPR");
         var _loc4_:Object = param1.getEmbededObject("Config");
         if(_loc4_)
         {
            this.switchContent(_loc2_,_loc3_,_loc4_);
         }
      }
      
      override public function dispose() : void
      {
         this.window.customContent(this.TOP_CONTENT_ID,null);
         facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.NEWS_MODE.toString());
         if(this.window.hasEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED))
         {
            this.window.removeEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleTabChanged);
         }
      }
      
      private function get window() : NewsWindow
      {
         return this.viewComponent as NewsWindow;
      }
      
      private function get content() : NewsTabContent
      {
         return this.window.getContent() as NewsTabContent;
      }
      
      private function get topContent() : NewsTopContent
      {
         return this.window.getContent(this.TOP_CONTENT_ID) as NewsTopContent;
      }
      
      private function switchContent(param1:Sprite, param2:Sprite, param3:Object) : void
      {
         var _loc4_:SpriteVisualElement = null;
         var _loc5_:SpriteVisualElement = null;
         if(this.content)
         {
            this.content.inner.removeAllElements();
            this.content.outer.removeAllElements();
            _loc4_ = new SpriteVisualElement();
            _loc4_.addChild(param1);
            this.content.inner.addElement(_loc4_);
            _loc5_ = new SpriteVisualElement();
            _loc5_.addChild(param2);
            this.content.outer.addElement(_loc5_);
         }
         if(param3.xml)
         {
            this.createViaConfig(param3.xml);
            return;
         }
         throw Error("ERROR NEWS WINDOW MEDIATOR switchContent config.xml IS NULL -> please compile the \"Config.as\" in the swf-news-file");
      }
      
      private function createViaConfig(param1:XML) : void
      {
         var _loc2_:LoaderImage = null;
         var _loc3_:XML = null;
         var _loc4_:StandardText = null;
         var _loc5_:XML = null;
         var _loc6_:GradientText = null;
         var _loc7_:XML = null;
         var _loc8_:ButtonBuy = null;
         var _loc9_:XML = null;
         var _loc10_:Vector.<TextReplace> = null;
         var _loc11_:Array = null;
         var _loc12_:String = null;
         var _loc13_:Array = null;
         for each(_loc3_ in param1.images.image)
         {
            _loc2_ = new LoaderImage();
            _loc2_.filePath = this.netHelperProxy.getCustomPath(_loc3_.@folder,_loc3_.@fileName);
            this.addMXML(_loc2_,_loc3_);
         }
         for each(_loc5_ in param1.texts.text)
         {
            _loc4_ = new StandardText();
            if(_loc5_.@textAlign.length() > 0)
            {
               _loc4_.setStyle("textAlign",_loc5_.@textAlign);
            }
            if(_loc5_.@fontSize.length() > 0)
            {
               _loc4_.setStyle("fontSize",int(_loc5_.@fontSize));
            }
            this.addMXML(_loc4_,_loc5_);
         }
         for each(_loc7_ in param1.gTexts.gText)
         {
            _loc6_ = new GradientText();
            if(_loc7_.@textReplaces.length() > 0)
            {
               _loc10_ = new Vector.<TextReplace>();
               _loc11_ = String(_loc7_.@textReplaces).split(";");
               for each(_loc12_ in _loc11_)
               {
                  _loc13_ = _loc12_.split("=>");
                  _loc10_.push(new TextReplace(_loc13_[0],TextResourceModule.getText(_loc13_[1])));
               }
               _loc6_.htmlText = TextResourceModule.getTextReplaced(TextResourceModule.getText(_loc7_.@textId),_loc10_);
            }
            else
            {
               _loc6_.htmlText = TextResourceModule.getText(_loc7_.@textId);
            }
            if(_loc7_.@textAlign.length() > 0)
            {
               _loc6_.textAlign = _loc7_.@textAlign;
            }
            if(_loc7_.@fontSize.length() > 0)
            {
               _loc6_.fontSize = int(_loc7_.@fontSize);
            }
            this.addMXML(_loc6_,_loc7_);
         }
         for each(_loc9_ in param1.buttons.button)
         {
            _loc8_ = new ButtonBuy();
            _loc8_.note = String(_loc9_.@notification);
            _loc8_.param = String(_loc9_.@param);
            _loc8_.callbackClickFunction = this.clickFunction;
            _loc8_.label.text = TextResourceModule.getText(_loc9_.@labelId);
            this.addMXML(_loc8_,_loc9_);
         }
      }
      
      private function clickFunction(param1:ButtonBuy) : void
      {
         sendNotification(WinNote.CLOSE_ALL_WINDOWS);
         sendNotification(param1.note as String,param1.param);
      }
      
      private function addMXML(param1:UIComponent, param2:XML) : void
      {
         if(param2.@x.length() > 0)
         {
            param1.x = Number(param2.@x);
         }
         if(param2.@y.length() > 0)
         {
            param1.y = Number(param2.@y);
         }
         if(param2.@width.length() > 0)
         {
            param1.width = Number(param2.@width);
         }
         if(param2.@height.length() > 0)
         {
            param1.height = Number(param2.@height);
         }
         if(param2.@verticalCenter.length() > 0)
         {
            param1.verticalCenter = Number(param2.@verticalCenter);
         }
         if(param2.@horizontalCenter.length() > 0)
         {
            param1.horizontalCenter = Number(param2.@horizontalCenter);
         }
         if(this.window.getContent())
         {
            if(param2.@target == "O" || param2.@target == "o")
            {
               if((this.window.getContent() as NewsTabContent).outer)
               {
                  (this.window.getContent() as NewsTabContent).outer.addElement(param1);
               }
            }
            else if((this.window.getContent() as NewsTabContent).inner)
            {
               (this.window.getContent() as NewsTabContent).inner.addElement(param1);
            }
         }
      }
   }
}

