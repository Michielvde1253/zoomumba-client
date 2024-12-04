package com.bigpoint.zoorama.view.gui.win.generals
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.feature.FeatureActiveReference;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.FileHashmap;
   import com.bigpoint.zoorama.utils.WindowManager;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.mouseModule.MouseModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.btn.BasicButton;
   import com.bigpoint.zoorama.view.gui.btn.RadioButton;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.mainmenu.MainMenuButton;
   import com.bigpoint.zoorama.view.gui.mainmenu.MouseToolNotice;
   import com.bigpoint.zoorama.view.gui.scrollbars.Scrollbar;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipManager;
   import com.greensock.TweenLite;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.system.SecurityDomain;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class Window extends Coreponent
   {
      public static const EVENT_WINDOW_SHOW:String = "windowShow";
      
      public static const EVENT_WINDOW_HIDE:String = "windowHide";
      
      public static const COMPONENT_INSTANCE_POST:String = "_INSTANCE";
      
      public static const COMPONENT_PREFIX_SCROLLCONTAINER:String = "SC";
      
      public static const COMPONENT_PREFIX_SCROLLBAR:String = "SB";
      
      public static const COMPONENT_PREFIX_RADIOBUTTON:String = "RB";
      
      public static const COMPONENT_PREFIX_TEXTFIELD:String = "TF";
      
      public static const COMPONENT_PREFIX_BUTTON:String = "BT";
      
      public static const COMPONENT_BUTTON_CONFIRMATION_CANCEL:String = "CANCEL";
      
      public static const COMPONENT_BUTTON_CONFIRMATION_OK:String = "OK";
      
      public static const COMPONENT_BUTTON_LABEL:String = "LABEL";
      
      public static const PLACEHOLDER_HEADER_TITLE:String = "HEADER";
      
      public static const PLACEHOLDER_HEADER_LINE:String = "HEADLINE";
      
      private var _isOpen:Boolean = false;
      
      protected var PRE_PATH:String = "assets/windows/content/";
      
      public var file:String;
      
      public var assetname:String;
      
      protected var loader:Loader;
      
      protected var loadedContent:Sprite;
      
      protected var isLoaded:Boolean = false;
      
      protected var HEADER_PATH:String = "/img/$local$/flash/window_headers/";
      
      protected var HEADER_FILEXTENSION:String = ".png";
      
      protected var useHeaderLoader:Boolean = false;
      
      protected var headerFilename:String;
      
      protected var headerURL:String;
      
      protected var headerLoader:Loader;
      
      protected var loadedHeader:Bitmap;
      
      protected var headerPositionX:Number = 0;
      
      protected var headerPositionY:Number = 0;
      
      protected var notifier:Notifier;
      
      protected var asset:SWFAsset;
      
      protected var windowButtonsParams:WindowButtonParams = new WindowButtonParams();
      
      public var modal:Boolean = false;
      
      protected var background:Sprite;
      
      protected var windowSkin:Sprite;
      
      protected var closeButton:BasicButton;
      
      protected var btnOK:MainMenuButton;
      
      protected var preloaderWheel:Sprite;
      
      protected var lateBindings:Array;
      
      private var previousMousePointerType:String;
      
      public function Window(param1:Notifier, param2:String = null, param3:WindowButtonParams = null)
      {
         super();
         this.notifier = new Notifier(param1);
         this.file = param2;
         if(param3)
         {
            this.windowButtonsParams = param3;
         }
         halign = Coreponent.ALIGN_H_CENTER;
         valign = Coreponent.ALIGN_V_CENTER;
      }
      
      protected function assignWindowSkin() : void
      {
         this.windowSkin = this.asset.getEmbededSprite(AssetConfig.DEFAULT_WINDOW);
         if(this.useHeaderLoader)
         {
            this.loadWindowHeader();
         }
         else
         {
            this.buildGUIAndLoadContent();
         }
      }
      
      protected function loadWindowHeader() : void
      {
         var _loc1_:URLRequest = null;
         if(this.headerFilename)
         {
            this.createHeaderLoader();
            this.headerURL = Settings.httpProtocolString + Settings.API_HOST + this.HEADER_PATH.split("$local$").join(Settings.LANGUAGE);
            this.headerURL += this.headerFilename + this.HEADER_FILEXTENSION;
            _loc1_ = new URLRequest(this.headerURL);
            this.headerLoader.load(_loc1_);
         }
      }
      
      protected function createHeaderLoader() : void
      {
         this.headerLoader = new Loader();
         this.headerLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.handleHeaderLoaderComplete);
         this.headerLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.handleHeaderLoaderError);
      }
      
      protected function handleHeaderLoaderComplete(param1:Event) : void
      {
         this.headerLoadFinished();
      }
      
      protected function handleHeaderLoaderError(param1:IOErrorEvent) : void
      {
         this.headerLoadFinished();
      }
      
      protected function headerLoadFinished() : void
      {
         this.buildGUIAndLoadContent();
      }
      
      protected function buildGUIAndLoadContent() : void
      {
         this.buildGUI();
         addChild(this.windowSkin);
         if(!this.isLoaded)
         {
            this.loadContent();
         }
         draw();
      }
      
      protected function buildGUI() : void
      {
         this.buildCloseButton();
         this.buildPreloaderWheel();
      }
      
      protected function buildCloseButton() : void
      {
         var _loc1_:Sprite = this.windowSkin.getChildByName("closeButton") as Sprite;
         if(_loc1_)
         {
            this.closeButton = new BasicButton();
            this.closeButton.skin = _loc1_;
            this.closeButton.sound = SoundEffectNames.SND_CONFIRMATION_CANCEL;
            this.closeButton.addEventListener(MouseEvent.CLICK,this.handleCloseWindowClick);
            this.closeButton.buttonMode = true;
            this.closeButton.useHandCursor = true;
            this.windowSkin.addChild(this.closeButton);
         }
      }
      
      protected function buildPreloaderWheel() : void
      {
         this.preloaderWheel = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_PRELOADER);
         if(Boolean(this.preloaderWheel) && Boolean(this.windowSkin) && Boolean(this.file))
         {
            this.preloaderWheel.x = this.windowSkin.width >> 1;
            this.preloaderWheel.y = this.windowSkin.height >> 1;
            this.preloaderWheel.alpha = 0;
            this.windowSkin.addChild(this.preloaderWheel);
         }
      }
      
      protected function buildHeader() : void
      {
         if(this.headerLoader)
         {
            this.headerLoader.x = this.headerPositionX;
            this.headerLoader.y = this.headerPositionY;
            addChild(this.headerLoader);
         }
      }
      
      protected function handleCloseWindowClick(param1:MouseEvent) : void
      {
         TooltipManager.getInstance().removeTooltip(true);
         if(this.windowButtonsParams.closeFunction != null)
         {
            this.autoClose();
            this.executeCallback(this.windowButtonsParams.closeFunction,this.windowButtonsParams.closeParams);
         }
         else
         {
            this.autoClose();
         }
      }
      
      protected function handleButtonCancelClick(param1:MouseEvent) : void
      {
         if(this.windowButtonsParams.cancelParams != null)
         {
         }
         if(this.windowButtonsParams.cancelFunction != null)
         {
            this.executeCallback(this.windowButtonsParams.cancelFunction,this.windowButtonsParams.cancelParams);
         }
         this.autoClose();
      }
      
      protected function handleButtonOKClick(param1:MouseEvent) : void
      {
         if(this.windowButtonsParams.confirmationParams != null)
         {
         }
         if(this.windowButtonsParams.confirmationFunction != null)
         {
            this.executeCallback(this.windowButtonsParams.confirmationFunction,this.windowButtonsParams.confirmationParams);
         }
         this.autoClose();
      }
      
      protected function autoClose() : void
      {
         WindowManager.getInstance().hideWindow(this);
      }
      
      protected function loadContent() : void
      {
         var _loc1_:* = null;
         var _loc2_:URLRequest = null;
         var _loc3_:LoaderContext = null;
         this.createContentLoader();
         if(this.file)
         {
            TweenLite.to(this.preloaderWheel,0.3,{"alpha":1});
            _loc1_ = this.PRE_PATH + this.file + ".swf";
            _loc1_ = FileHashmap.getFilenameWithHashFromCDNHost(_loc1_);
            _loc2_ = new URLRequest(_loc1_);
            if(Settings.isLocal)
            {
               this.loader.load(_loc2_);
            }
            else
            {
               _loc3_ = new LoaderContext();
               _loc3_.checkPolicyFile = false;
               _loc3_.applicationDomain = ApplicationDomain.currentDomain;
               _loc3_.securityDomain = SecurityDomain.currentDomain;
               this.loader.load(_loc2_,_loc3_);
            }
         }
      }
      
      private function createContentLoader() : void
      {
         var _loc1_:MovieClip = null;
         if(this.loader == null)
         {
            this.loader = new Loader();
            this.loader.alpha = 0;
            this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.handleURLLoaderComplete);
            this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.handleURLLoaderError);
            this.loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.handleURLLoaderProgress);
            _loc1_ = this.windowSkin.getChildByName("content_layer") as MovieClip;
            if(_loc1_)
            {
               _loc1_.addChild(this.loader);
            }
            else
            {
               addChild(this.loader);
            }
         }
      }
      
      protected function handleURLLoaderProgress(param1:ProgressEvent) : void
      {
      }
      
      protected function handleURLLoaderError(param1:IOErrorEvent) : void
      {
         this.loadContentFinished();
      }
      
      protected function handleURLLoaderComplete(param1:Event) : void
      {
         this.loadedContent = this.loader.content as Sprite;
         this.loadContentFinished();
      }
      
      protected function loadContentFinished() : void
      {
         this.isLoaded = true;
         this.contentComponentParser();
         this.assignLoadedContentGUI();
         this.buildHeader();
         TweenLite.to(this.preloaderWheel,0.2,{"alpha":0});
         TweenLite.to(this.loader,0.2,{"alpha":1});
         if(FeatureActiveReference.cashFieldItemsAsBitmap)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      protected function contentComponentParser() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         this.lateBindings = [];
         if(this.loadedContent)
         {
            for each(_loc1_ in this.loadedContent)
            {
               if(!_loc1_)
               {
                  continue;
               }
               _loc2_ = _loc1_.name;
               _loc3_ = _loc1_.name.split("_");
               _loc4_ = String(_loc3_[0]).toUpperCase();
               switch(_loc4_)
               {
                  case COMPONENT_PREFIX_SCROLLCONTAINER:
                     this.handleScrollContainer(_loc1_,_loc3_);
                     break;
                  case COMPONENT_PREFIX_SCROLLBAR:
                     this.connectScrollbarToClass(_loc1_,_loc3_,_loc2_);
                     break;
                  case COMPONENT_PREFIX_RADIOBUTTON:
                     this.connectRadioButtonToClass(_loc1_,_loc3_);
                     break;
                  case COMPONENT_PREFIX_TEXTFIELD:
                     this.connectTextfieldToClass(_loc1_,_loc3_);
                     break;
                  case COMPONENT_PREFIX_BUTTON:
                     this.connectButtonToClass(_loc1_,_loc3_);
                     break;
                  case PLACEHOLDER_HEADER_TITLE:
                     this.headerPositionX = _loc1_.x;
                     this.headerPositionY = _loc1_.y;
                     break;
                  case PLACEHOLDER_HEADER_LINE:
                     this.createHeadlineInstance(_loc1_);
                     break;
               }
            }
         }
      }
      
      protected function assignLoadedContentGUI() : void
      {
         this.lateBindingsCheck();
      }
      
      private function handleScrollContainer(param1:DisplayObject, param2:Array) : void
      {
         var _loc5_:DisplayObject = null;
         var _loc6_:TextField = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc3_:MovieClip = param1 as MovieClip;
         var _loc4_:MovieClip = _loc3_.getChildByName("content") as MovieClip;
         for each(_loc5_ in _loc4_)
         {
            _loc6_ = _loc5_ as TextField;
            if(_loc6_)
            {
               _loc6_.autoSize = TextFieldAutoSize.LEFT;
               _loc6_.wordWrap = true;
               _loc7_ = _loc6_.text.split(";")[0];
               _loc8_ = _loc6_.text.split(";")[1];
               _loc9_ = TextResourceModule.getText(_loc7_);
               _loc6_.text = _loc9_;
               if(_loc10_)
               {
                  _loc10_ = StyleModule[_loc8_];
                  StyleModule.setTextFieldStyle(_loc6_,StyleModule[_loc10_]);
               }
               else
               {
                  StyleModule.setTextFieldStyle(_loc6_,StyleModule.HEADER_12);
               }
            }
         }
      }
      
      private function connectScrollbarToClass(param1:DisplayObject, param2:Array, param3:String) : void
      {
         var _loc4_:DisplayObject = param1;
         _loc4_.visible = false;
         var _loc5_:Scrollbar = new Scrollbar();
         _loc5_.name = param3;
         _loc5_.skin = AssetLibrary.getMovieClip(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_SCROLLBAR);
         _loc5_.x = _loc4_.x;
         _loc5_.y = _loc4_.y;
         _loc5_.height = _loc4_.height;
         _loc5_.addEventListener(Scrollbar.EVENT_SLIDER_POSITION_CHANGED,this.handleScrollbarPositionChanged);
         this.loadedContent.addChild(_loc5_);
         var _loc6_:int = 0;
         var _loc7_:* = "";
         var _loc8_:int = int(param2.length - 1);
         _loc8_ = _loc8_ < 0 ? 0 : _loc8_;
         _loc6_ = 1;
         while(_loc6_ < _loc8_)
         {
            _loc7_ += param2[_loc6_];
            _loc7_ = _loc7_ + "_";
            _loc6_++;
         }
         _loc7_ += param2[_loc6_++];
         var _loc9_:Object = {
            "source":_loc5_,
            "target":_loc7_
         };
         this.lateBindings.push(_loc9_);
      }
      
      private function connectRadioButtonToClass(param1:DisplayObject, param2:Array) : void
      {
         var _loc3_:Sprite = param1 as Sprite;
         _loc3_.visible = false;
         var _loc4_:RadioButton = new RadioButton();
         var _loc5_:Sprite = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_RADIO_BUTTON_SETTINGS);
         _loc4_.name = _loc3_.name + COMPONENT_INSTANCE_POST;
         _loc4_.skin = _loc5_;
         _loc4_.groupId = param2[1];
         _loc4_.value = param2[2];
         _loc4_.deselect();
         _loc4_.x = _loc3_.x;
         _loc4_.y = _loc3_.y;
         this.loadedContent.addChild(_loc4_);
      }
      
      private function connectTextfieldToClass(param1:DisplayObject, param2:Array) : void
      {
         var _loc3_:TextField = param1 as TextField;
         var _loc4_:String = _loc3_.text.split(";")[0];
         var _loc5_:String = _loc3_.text.split(";")[1];
         var _loc6_:String = TextResourceModule.getText(_loc4_);
         _loc3_.wordWrap = true;
         _loc3_.text = _loc6_;
         var _loc7_:int = int(StyleModule[_loc5_]);
         if(_loc7_)
         {
            StyleModule.setTextFieldStyle(_loc3_,_loc7_);
         }
         else
         {
            StyleModule.setTextFieldStyle(_loc3_,StyleModule.HEADER_12);
         }
      }
      
      protected function connectButtonToClass(param1:DisplayObject, param2:Array) : void
      {
         var _loc4_:Sprite = null;
         var _loc5_:Sprite = null;
         var _loc6_:Sprite = null;
         var _loc7_:Sprite = null;
         var _loc8_:MainMenuButton = null;
         var _loc9_:String = null;
         var _loc10_:MovieClip = null;
         var _loc11_:Sprite = null;
         var _loc12_:String = null;
         var _loc13_:TextField = null;
         var _loc3_:String = param2[1];
         switch(_loc3_)
         {
            case COMPONENT_BUTTON_CONFIRMATION_OK:
               _loc4_ = this.loadedContent.getChildByName(COMPONENT_PREFIX_BUTTON + "_" + COMPONENT_BUTTON_CONFIRMATION_OK) as Sprite;
               _loc4_.visible = false;
               _loc5_ = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_WINDOW_CONFIRMATION_OK_BUTTON);
               this.btnOK = new MainMenuButton(this.notifier);
               this.btnOK.skin = _loc5_;
               this.btnOK.x = _loc4_.x;
               this.btnOK.y = _loc4_.y;
               this.loadedContent.addChild(this.btnOK);
               this.btnOK.addEventListener(MouseEvent.CLICK,this.handleButtonOKClick);
               break;
            case COMPONENT_BUTTON_CONFIRMATION_CANCEL:
               _loc6_ = this.loadedContent.getChildByName(COMPONENT_PREFIX_BUTTON + "_" + COMPONENT_BUTTON_CONFIRMATION_CANCEL) as Sprite;
               _loc6_.visible = false;
               _loc7_ = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_WINDOW_CONFIRMATION_CANCEL_BUTTON);
               _loc8_ = new MainMenuButton(this.notifier);
               _loc8_.x = _loc6_.x;
               _loc8_.y = _loc6_.y;
               _loc8_.skin = _loc7_;
               this.loadedContent.addChild(_loc8_);
               _loc8_.addEventListener(MouseEvent.CLICK,this.handleButtonCancelClick);
               break;
            case COMPONENT_BUTTON_LABEL:
               _loc9_ = COMPONENT_PREFIX_BUTTON + "_" + COMPONENT_BUTTON_LABEL + "_" + param2[2];
               _loc10_ = this.loadedContent.getChildByName(_loc9_) as MovieClip;
               _loc11_ = _loc10_.getChildByName("labelMC") as Sprite;
               _loc12_ = "-";
               if(_loc11_)
               {
                  _loc13_ = _loc11_.getChildByName("label") as TextField;
                  _loc12_ = _loc13_.text.split(";")[0];
               }
         }
      }
      
      private function createHeadlineInstance(param1:DisplayObject) : void
      {
         var _loc2_:Sprite = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_WINDOW_HEADLINE);
         if(_loc2_)
         {
            _loc2_.x = param1.x;
            _loc2_.y = param1.y;
            _loc2_.width = param1.width;
            this.loadedContent.addChild(_loc2_);
         }
         param1.visible = false;
      }
      
      private function lateBindingsCheck() : void
      {
         var _loc3_:Object = null;
         var _loc4_:DisplayObject = null;
         var _loc1_:int = int(this.lateBindings.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this.lateBindings[_loc2_];
            _loc4_ = this.loadedContent.getChildByName(_loc3_.target);
            if(_loc4_)
            {
               _loc3_.source["target"] = _loc4_;
            }
            _loc2_++;
         }
      }
      
      protected function getLatebindingSourceComponentByName(param1:String) : *
      {
         var _loc4_:Object = null;
         var _loc5_:* = undefined;
         var _loc6_:String = null;
         var _loc2_:int = int(this.lateBindings.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.lateBindings[_loc3_] as Object;
            if(_loc4_.source)
            {
               _loc5_ = _loc4_.source;
               _loc6_ = _loc5_.name;
               if(_loc6_ == param1)
               {
                  return _loc5_;
               }
            }
            _loc3_++;
         }
         return null;
      }
      
      private function handleScrollbarPositionChanged(param1:Event) : void
      {
         var _loc8_:Number = NaN;
         var _loc2_:Scrollbar = param1.currentTarget as Scrollbar;
         var _loc3_:Sprite = _loc2_.target;
         var _loc4_:Number = _loc2_.percent;
         var _loc5_:DisplayObject = _loc3_.getChildByName("content") as DisplayObject;
         var _loc6_:DisplayObject = _loc3_.getChildByName("mask") as DisplayObject;
         var _loc7_:Number = _loc5_.height - _loc6_.height;
         if(_loc7_ > 0)
         {
            _loc8_ = _loc7_ * _loc4_;
            _loc5_.y = -_loc8_;
         }
      }
      
      public function show() : void
      {
         this._isOpen = true;
         dispatchEvent(new Event(EVENT_WINDOW_SHOW));
         SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_WINDOW_OPENS);
         this.previousMousePointerType = MouseModule.getInstance().mouseType;
         this.notifier.dispatchNotice(new MouseToolNotice(MouseToolNotice.DEFAULT));
      }
      
      public function hide() : void
      {
         this._isOpen = false;
         dispatchEvent(new Event(EVENT_WINDOW_HIDE));
         if(this.previousMousePointerType)
         {
            this.notifier.dispatchNotice(new MouseToolNotice(this.previousMousePointerType));
         }
      }
      
      public function get isOpen() : Boolean
      {
         return this._isOpen;
      }
      
      public function isReady() : Boolean
      {
         return this.isLoaded && this.isOpen;
      }
      
      protected function executeCallback(param1:Function, param2:Array) : void
      {
         var _loc3_:int = 0;
         if(param2)
         {
            _loc3_ = int(param2.length);
            switch(_loc3_)
            {
               case 0:
                  param1();
                  break;
               case 1:
                  param1(param2[0]);
                  break;
               case 2:
                  param1(param2[0],param2[1]);
                  break;
               case 3:
                  param1(param2[0],param2[1],param2[2]);
                  break;
               case 4:
                  param1(param2[0],param2[1],param2[2],param2[3]);
                  break;
               case 5:
                  param1(param2[0],param2[1],param2[2],param2[3],param2[4]);
                  break;
               case 6:
                  param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5]);
                  break;
               case 7:
                  param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6]);
                  break;
               case 8:
                  param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7]);
                  break;
               case 9:
                  param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8]);
                  break;
               case 10:
                  param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9]);
            }
         }
         else
         {
            param1();
         }
      }
      
      protected function traceAllChilds() : void
      {
      }
   }
}

