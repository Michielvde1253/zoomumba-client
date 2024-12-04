package com.bigpoint.zoomumba.view.windows.crafting
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.CraftingConstants;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import windows.custom.crafting.IntroCraftingContent;
   import windows.custom.crafting.IntroCraftingWindow;
   
   public class IntroCraftingMediator extends WindowMediator
   {
      public static const NAME:String = "IntroCraftingMediator";
      
      private var _craftingProxy:CraftingProxy;
      
      private var _isInit:Boolean;
      
      private var _infoButton:MovieClip;
      
      private var _infoTween:TweenLite;
      
      public function IntroCraftingMediator(param1:IntroCraftingWindow)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
      }
      
      override public function init(param1:Object) : void
      {
         this._isInit = false;
         this.window.preloaderVisibility = true;
         AssetLibrary.sendAssetToFunction("CraftingWindow",this.handleAssetLoad);
      }
      
      private function handleAssetLoad(param1:SWFAsset) : void
      {
         this.content.header_bg.source = param1.getEmbededBitmapData("BackgroundIntro");
         this.content.characterIcon.source = param1.getEmbededBitmapData("uschi");
         this.content.bubbleText.text = TextResourceModule.getText("zoo.window.crafting.intro.text");
         this.content.categorieTitle.text = TextResourceModule.getText("zoo.window.crafting.intro.chooseCategorie");
         this.content.categorie1Button.label = TextResourceModule.getText("zoo.shop.tabbar.cages");
         this.content.categorie2Button.label = TextResourceModule.getText("zoo.shop.tabbar.buildings");
         this.content.categorie3Button.label = TextResourceModule.getText("zoo.shop.tabbar.decorations");
         this.content.categorie4Button.label = TextResourceModule.getText("zoo.shop.tabbar.roads");
         this.content.categorie1Button.addEventListener(MouseEvent.CLICK,this.onPressCategorieButton);
         this.content.categorie1Button.name = CraftingConstants.CRAFTING_TAB_HABITAT.toString();
         this.content.categorie2Button.addEventListener(MouseEvent.CLICK,this.onPressCategorieButton);
         this.content.categorie2Button.name = CraftingConstants.CRAFTING_TAB_STORES.toString();
         this.content.categorie3Button.addEventListener(MouseEvent.CLICK,this.onPressCategorieButton);
         this.content.categorie3Button.name = CraftingConstants.CRAFTING_TAB_DECO.toString();
         this.content.categorie4Button.addEventListener(MouseEvent.CLICK,this.onPressCategorieButton);
         this.content.categorie4Button.name = CraftingConstants.CRAFTING_TAB_ROADS.toString();
         if(this.craftingProxy.getUserBlueprintRewardIdsByCategorie(Categories.DECOR).length <= 0)
         {
            this.content.categorie3Button.enabled = false;
         }
         if(this.craftingProxy.getUserBlueprintRewardIdsByCategorie(Categories.STORE).length <= 0)
         {
            this.content.categorie2Button.enabled = false;
         }
         if(this.craftingProxy.getUserBlueprintRewardIdsByCategorie(Categories.CAGE).length <= 0)
         {
            this.content.categorie1Button.enabled = false;
         }
         if(this.craftingProxy.getUserBlueprintRewardIdsByCategorie(Categories.TRASHBIN).concat(this.craftingProxy.getUserBlueprintRewardIdsByCategorie(Categories.ROAD)).length <= 0)
         {
            this.content.categorie4Button.enabled = false;
         }
         this._infoButton = param1.getEmbededMovieClip("infoButton");
         this._infoButton.mouseChildren = true;
         this._infoButton.mouseEnabled = true;
         this._infoButton.useHandCursor = true;
         this._infoButton.buttonMode = true;
         this._infoButton.addEventListener(MouseEvent.CLICK,this.openHelpComic);
         this._infoButton.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver,false,0,true);
         this._infoButton.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut,false,0,true);
         this._infoButton.gotoAndStop("out");
         var _loc2_:Sprite = param1.getEmbededSprite("header_icon");
         initDynamicTitle(TextResourceModule.getText("zoo.window.crafting.intro.title"),_loc2_);
         this.content.infoButton.useHandCursor = true;
         this.content.infoButton.addChild(this._infoButton);
         this.content.iconBlueprint.source = param1.getEmbededBitmapData("CardIcon");
         var _loc3_:int = int(this.craftingProxy.blueprintRewards.length);
         var _loc4_:int = this.craftingProxy.getUserBlueprintCount();
         var _loc5_:String = TextResourceModule.getText("zoo.window.crafting.intro.blueprintRewards");
         _loc5_ = _loc5_.replace("%mycards%",_loc4_.toString());
         _loc5_ = _loc5_.replace("%allcards%",_loc3_.toString());
         this.content.blueprintRewards.text = _loc5_;
         this.window.preloaderVisibility = false;
         this._isInit = true;
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this._infoButton.gotoAndStop("over");
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this._infoButton.gotoAndStop("out");
      }
      
      private function onPressCategorieButton(param1:MouseEvent) : void
      {
         var _loc2_:int = parseInt(param1.target.name as String);
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CRAFTING_CHOOSE_WINDOW,"",_loc2_));
         handleWindowCloseClick();
      }
      
      private function openHelpComic(param1:MouseEvent) : void
      {
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CRAFTING_COMIC_WINDOW));
      }
      
      override public function onRemove() : void
      {
         if(this.content)
         {
            this.content.categorie1Button.removeEventListener(MouseEvent.CLICK,this.onPressCategorieButton);
            this.content.categorie2Button.removeEventListener(MouseEvent.CLICK,this.onPressCategorieButton);
            this.content.categorie3Button.removeEventListener(MouseEvent.CLICK,this.onPressCategorieButton);
            this.content.categorie4Button.removeEventListener(MouseEvent.CLICK,this.onPressCategorieButton);
         }
         if(this._infoButton)
         {
            this._infoButton.removeEventListener(MouseEvent.CLICK,this.openHelpComic);
            this._infoButton.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
            this._infoButton.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         }
         super.onRemove();
      }
      
      public function get craftingProxy() : CraftingProxy
      {
         if(this._craftingProxy == null)
         {
            this._craftingProxy = facade.getProxy(CraftingProxy) as CraftingProxy;
         }
         return this._craftingProxy;
      }
      
      private function get content() : IntroCraftingContent
      {
         return this.window.getContent() as IntroCraftingContent;
      }
      
      private function get window() : IntroCraftingWindow
      {
         return this.viewComponent as IntroCraftingWindow;
      }
   }
}

