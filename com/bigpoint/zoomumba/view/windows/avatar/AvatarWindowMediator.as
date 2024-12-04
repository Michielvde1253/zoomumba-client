package com.bigpoint.zoomumba.view.windows.avatar
{
   import com.bigpoint.utils.DisplayObjectHelper;
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.avatar.AvatarGeneratorProxy;
   import com.bigpoint.zoomumba.model.features.avatar.AvatarProxy;
   import com.bigpoint.zoomumba.model.features.avatar.vo.AvatarDescriptionVO;
   import com.bigpoint.zoomumba.model.features.avatar.vo.AvatarPartConfigVO;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.ConfirmationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetAutoFiller;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.features.avatar.AvatarOption;
   import flash.events.Event;
   import general.paginator.PaginatorEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.avatar.AvatarContent;
   import windows.custom.avatar.AvatarWindow;
   import windows.events.WindowCustomEvent;
   
   public class AvatarWindowMediator extends WindowMediator
   {
      public static const NAME:String = "AvatarWindowMediator";
      
      private const ASSETS_BATCH:int = 2;
      
      private var _currNrAssetsLoaded:int = 0;
      
      private var _currOptionsList:Vector.<AvatarPartConfigVO>;
      
      private var userProxy:UserProxy;
      
      private var avatarProxy:AvatarProxy;
      
      private var avatarGeneratorProxy:AvatarGeneratorProxy;
      
      private var netHelperProxy:NetHelperProxy;
      
      private var _currentSex:String = null;
      
      private var _currentCat:String = null;
      
      private var _tempMaleAvatar:AvatarDescriptionVO;
      
      private var _tempFemaleAvatar:AvatarDescriptionVO;
      
      public function AvatarWindowMediator(param1:AvatarWindow)
      {
         super(NAME,param1);
      }
      
      private function get myAvatarData() : AvatarDescriptionVO
      {
         return this._currentSex == "m" ? this._tempMaleAvatar : this._tempFemaleAvatar;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.AVATAR_CONFIG_DATA];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.AVATAR_CONFIG_DATA:
               this.updateList(param1.getBody() as Vector.<AvatarPartConfigVO>);
         }
      }
      
      override public function onRegister() : void
      {
         this.userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         this.avatarProxy = facade.retrieveProxy(AvatarProxy.NAME) as AvatarProxy;
         this.avatarGeneratorProxy = facade.retrieveProxy(AvatarGeneratorProxy.NAME) as AvatarGeneratorProxy;
         this.netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         var _loc1_:AvatarDescriptionVO = this.avatarProxy.getMyAvatar();
         if(_loc1_.gender == 0)
         {
            this._tempFemaleAvatar = new AvatarDescriptionVO();
            ObjectHelper.copyData(this._tempMaleAvatar = new AvatarDescriptionVO(),_loc1_);
            this._tempFemaleAvatar.gender = 1;
         }
         else
         {
            this._tempMaleAvatar = new AvatarDescriptionVO();
            ObjectHelper.copyData(this._tempFemaleAvatar = new AvatarDescriptionVO(),_loc1_);
            this._tempMaleAvatar.gender = 0;
         }
         this._currentSex = _loc1_.gender == 0 ? "m" : "f";
         this._currentCat = AvatarProxy.FACE;
      }
      
      override public function init(param1:Object) : void
      {
         this.window.preloaderVisibility = true;
         this._currNrAssetsLoaded = 0;
         this.content.groupSex.addEventListener(Event.CHANGE,this.handleChangeOfOption);
         this.content.groupCat.addEventListener(Event.CHANGE,this.handleChangeOfOption);
         this.content.paginator.addEventListener(PaginatorEvent.CHANGE_PAGE,this.handleChangeOfPage);
         this.window.addEventListener("avatarOptClicked",this.handleOptionSelected);
         AssetLibrary.sendAssetToFunction("WoodLath",this.handleAssetLoad);
         AssetLibrary.sendAssetToFunction("AvatarWindow",this.handleAssetLoad);
         this.content.txtUserName.text = this.userProxy.userName;
         this.window.header.filePath = this.netHelperProxy.getHeaderPath("header_avatar");
      }
      
      private function handleAssetLoad(param1:SWFAsset) : void
      {
         ++this._currNrAssetsLoaded;
         switch(param1.id)
         {
            case "AvatarWindow":
            case "AvatarWindow.swf":
               this.content.cardBd = param1.getEmbededBitmapData("PaperTape");
               this.content.catRadio0.content = param1.getEmbededSprite("Icon0");
               this.content.catRadio1.content = param1.getEmbededSprite("Icon1");
               this.content.catRadio2.content = param1.getEmbededSprite("Icon2");
               this.content.catRadio3.content = param1.getEmbededSprite("Icon3");
               this.content.catRadio4.content = param1.getEmbededSprite("Icon4");
               this.content.catRadio5.content = param1.getEmbededSprite("Icon5");
               break;
            case "WoodLath":
            case "WoodLath.swf":
               this.content.lineH1.source = param1.getEmbededBitmapData("WoodLath");
               this.content.lineH2.source = param1.getEmbededBitmapData("WoodLath");
               this.content.lineH3.source = param1.getEmbededBitmapData("WoodLath");
               this.content.lineV1.source = param1.getEmbededBitmapData("WoodLath");
               this.content.lineV2.source = param1.getEmbededBitmapData("WoodLath");
         }
         if(this._currNrAssetsLoaded >= this.ASSETS_BATCH)
         {
            this.content.groupSex.selectedValue = this._currentSex;
            this.content.groupCat.selectedValue = this._currentCat;
            this.handleChangeOfOption(null);
         }
      }
      
      private function updateList(param1:Vector.<AvatarPartConfigVO>) : void
      {
         this.window.preloaderVisibility = false;
         this._currOptionsList = param1;
         this.content.paginator.maxEntries = this._currOptionsList.length;
         this.content.paginator.currentPage = 0;
         this.handleOptionSelected(null);
      }
      
      private function handleChangeOfOption(param1:Event) : void
      {
         if(this.content.groupSex.selectedValue)
         {
            this._currentSex = this.content.groupSex.selectedValue as String;
         }
         if(this.content.groupCat.selectedValue)
         {
            this._currentCat = this.content.groupCat.selectedValue as String;
         }
         switch(this._currentCat)
         {
            case "fa":
               this.content.txtInfo.text = TextResourceModule.getText("zoo.avatar.heads");
               break;
            case "ey":
               this.content.txtInfo.text = TextResourceModule.getText("zoo.avatar.eyes");
               break;
            case "mo":
               this.content.txtInfo.text = TextResourceModule.getText("zoo.avatar.mouths");
               break;
            case "ha":
               this.content.txtInfo.text = TextResourceModule.getText("zoo.avatar.hair");
               break;
            case "ht":
               this.content.txtInfo.text = TextResourceModule.getText("zoo.avatar.hats");
               break;
            case "cl":
               this.content.txtInfo.text = TextResourceModule.getText("zoo.avatar.clothes");
         }
         this.avatarProxy.requestConfig(this._currentSex == "m" ? 0 : 1,this._currentCat);
      }
      
      private function handleOptionSelected(param1:Event) : void
      {
         this.myAvatarData.cl = this.myAvatarData.cl == 0 ? this.avatarProxy.retrieverConfig(this.myAvatarData.gender,"cl")[0].id : this.myAvatarData.cl;
         this.myAvatarData.ey = this.myAvatarData.ey == 0 ? this.avatarProxy.retrieverConfig(this.myAvatarData.gender,"ey")[0].id : this.myAvatarData.ey;
         this.myAvatarData.fa = this.myAvatarData.fa == 0 ? this.avatarProxy.retrieverConfig(this.myAvatarData.gender,"fa")[0].id : this.myAvatarData.fa;
         this.myAvatarData.ha = this.myAvatarData.ha == 0 ? this.avatarProxy.retrieverConfig(this.myAvatarData.gender,"ha")[0].id : this.myAvatarData.ha;
         this.myAvatarData.ht = this.myAvatarData.ht == 0 ? this.avatarProxy.retrieverConfig(this.myAvatarData.gender,"ht")[0].id : this.myAvatarData.ht;
         this.myAvatarData.mo = this.myAvatarData.mo == 0 ? this.avatarProxy.retrieverConfig(this.myAvatarData.gender,"mo")[0].id : this.myAvatarData.mo;
         this.myAvatarData.bg = this._currentSex == "m" ? 1 : 2;
         this.myAvatarData[this._currentCat] = !!param1 ? this.content.checkOption(param1.target as AvatarOption) : this.myAvatarData[this._currentCat];
         this.handleChangeOfPage(null);
         DisplayObjectHelper.removeChildren(this.content.sprContainer);
         DisplayObjectHelper.addChild(this.content.sprContainer,this.avatarGeneratorProxy.getAvatarSprite(this.myAvatarData,AvatarGeneratorProxy.SCALE_AVATAR_CREATOR));
      }
      
      private function handleChangeOfPage(param1:PaginatorEvent) : void
      {
         var _loc2_:AvatarPartConfigVO = null;
         this.content.clearOptions();
         var _loc3_:int = this.content.paginator.currentIndexPageIni;
         var _loc4_:int = this.content.paginator.currentIndexPageEnd;
         while(_loc3_ <= _loc4_)
         {
            _loc2_ = this._currOptionsList[_loc3_];
            this.content.addOption(_loc2_.id,new WrapedSprite(AssetAutoFiller.getAvatarId(this._currentCat,_loc2_.id),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,35),this.myAvatarData[this._currentCat] == _loc2_.id ? "selected" : "default");
            _loc3_++;
         }
      }
      
      override protected function handleWindowCloseClick(param1:WindowCustomEvent = null) : void
      {
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CONFIRMATION,"",new ConfirmationInitParams(TextResourceModule.getText("zoo.window.infoLayers.breedInInventory.title"),TextResourceModule.getText("zoo.window.infoLayers.avatar.X")),new WindowParams("",null,"",null,WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.AVATAR_WINDOW,""))));
      }
      
      override protected function handleWindowConfirm(param1:WindowCustomEvent = null) : void
      {
         this.avatarProxy.saveMyAvatar(this.myAvatarData);
         super.handleWindowConfirm(param1);
      }
      
      override public function dispose() : void
      {
         this._currOptionsList = null;
      }
      
      private function get content() : AvatarContent
      {
         return this.window.getContent(0) as AvatarContent;
      }
      
      private function get window() : AvatarWindow
      {
         return this.viewComponent as AvatarWindow;
      }
   }
}

