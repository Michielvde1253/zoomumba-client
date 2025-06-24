package com.bigpoint.zoorama.view.windows
{
   import com.bigpoint.utils.DisplayObjectHelper;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.view.windows.interfaces.IWindow;
   import com.bigpoint.zoorama.view.windows.tabbing.TabbingManager;
   import flash.display.Loader;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   
   public class WindowAbstract extends Sprite implements IWindow
   {
      public var persistent:Boolean = false;
      
      internal var _windowId:int;
      
      internal var classId:Class;
      
      protected var _isPrimary:Boolean = false;
      
      internal var _isOpen:Boolean = false;
      
      private var windowContainer:Sprite;
      
      private var isTabbed:int;
      
      private var _tabTypes:String;
      
      private var _tabText:Vector.<String>;
      
      private var _tabs:TabbingManager;
      
      private var dWidth:int;
      
      private var dHeight:int;
      
      private var _offsetX:int = 0;
      
      private var _offsetY:int = 0;
      
      private var useModal:Boolean;
      
      private var modal:Sprite;
      
      private var modalColour:int = 0;
      
      private var modalAlpha:Number = 0.4;
      
      private var _btClose:Sprite;
      
      private var _inner:Sprite;
      
      private var _outer:Sprite;
      
      private var _below:Sprite;
      
      private var _header:Sprite;
      
      private var _bgId:int;
      
      private var _background:Sprite;
      
      private var _headerFileName:String;
      
      protected var headerURL:String;
      
      protected var headerLoader:Loader;
      
      protected var HEADER_PATH:String = "/img/$local$/flash/window_headers/";
      
      protected var HEADER_FILEXTENSION:String = ".png";
      
      public function WindowAbstract()
      {
         super();
      }
      
      public function init(param1:int, param2:Class, param3:int, param4:int, param5:String, param6:Boolean, param7:int, param8:int, param9:String = null, param10:Vector.<String> = null) : void
      {
         this._windowId = param1;
         this.classId = param2;
         this.dWidth = MainConfig.STAGE_DEFALT_WIDTH;
         this.dHeight = MainConfig.STAGE_DEFALT_HEIGHT;
         this.useModal = param6;
         this.setModal();
         this._bgId = param8;
         this.isTabbed = param7;
         this._tabTypes = param9;
         this._tabText = param10;
         this.skin(param5);
      }
      
      public function startWindow() : void
      {
         this.setWindowPosition();
      }
      
      public function setModal() : void
      {
         var _loc1_:Shape = null;
         if(this.useModal)
         {
            this.modal = new Sprite();
            _loc1_ = new Shape();
            _loc1_.graphics.beginFill(this.modalColour);
            _loc1_.graphics.drawRect(0,0,this.dWidth,this.dHeight);
            _loc1_.graphics.endFill();
            this.modal.addChild(_loc1_);
            this.modal.alpha = this.modalAlpha;
            this.addChild(this.modal);
            this.modal.visible = true;
            if(Settings.SCALE_TEST)
            {
               this.modal.scaleX = 1.5;
               this.modal.scaleY = 1.5;
            }
         }
      }
      
      protected function setWindowPosition() : void
      {
         this.container.x = this.dWidth / 2 - this.container.width / 2 + this._offsetX;
         this.container.y = this.dHeight / 2 - this.container.height / 2 + this._offsetY;
      }
      
      public function changeModalLayer(param1:int, param2:int) : void
      {
         if(this.modal)
         {
            this.modal.width = 5000;
            this.modal.height = 5000;
            this.modal.x = -2500;
            this.modal.y = -2500;
            return;
         }
      }
      
      protected function setBackGround() : void
      {
         var bgA:Sprite = null;
         var bgB:Sprite = null;
         try
         {
            bgA = this._background.getChildByName("mcStandardBack") as Sprite;
         }
         catch(e:Error)
         {
         }
         try
         {
            bgB = this._background.getChildByName("mcTimberBack") as Sprite;
         }
         catch(e:Error)
         {
         }
         if(this._bgId == 1)
         {
            if(bgA)
            {
               bgA.visible = true;
            }
            if(bgB)
            {
               bgB.visible = false;
            }
         }
         else if(this._bgId == 2)
         {
            if(bgA)
            {
               bgA.visible = false;
            }
            if(bgB)
            {
               bgB.visible = true;
            }
         }
      }
      
      public function setHeader() : void
      {
         this.createHeaderLoader();
         this.headerURL = Settings.httpProtocolString + Settings.API_HOST + this.HEADER_PATH.split("$local$").join(Settings.LANGUAGE);
         this.headerURL += this._headerFileName + this.HEADER_FILEXTENSION;
         var _loc1_:URLRequest = new URLRequest(this.headerURL);
         this.headerLoader.load(_loc1_);
      }
      
      protected function createHeaderLoader() : void
      {
         this.headerLoader = new Loader();
         this.headerLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.handleHeaderLoaderComplete);
      }
      
      protected function handleHeaderLoaderComplete(param1:Event) : void
      {
         var _loc2_:Sprite = new Sprite();
         DisplayObjectHelper.removeChildren(this._header);
         _loc2_.addChild(this.headerLoader);
         _loc2_.x = -_loc2_.width / 2;
         this._header.addChild(_loc2_);
      }
      
      public function setOuterContent() : void
      {
      }
      
      public function setInnerContent() : void
      {
      }
      
      public function setBelowContent() : void
      {
      }
      
      public function loadSWFAssets() : void
      {
      }
      
      public function skin(param1:String) : void
      {
         this.windowContainer = AssetLibrary.getSprite("WindowsAll",param1);
         this.addChild(this.windowContainer);
         this.getContentAreas();
         this.addCloseButton();
      }
      
      protected function getContentAreas() : void
      {
         this._inner = this.windowContainer.getChildByName("mcInnerContent") as Sprite;
         this._outer = this.windowContainer.getChildByName("mcOuterContent") as Sprite;
         try
         {
            this._below = this.windowContainer.getChildByName("mcBelowContent") as Sprite;
         }
         catch(e:Error)
         {
         }
         this._header = this.windowContainer.getChildByName("mcHeader") as Sprite;
         this._background = this.windowContainer.getChildByName("mcBackground") as Sprite;
         this.setBackGround();
         this.checkIsTabbed();
         this.startWindow();
      }
      
      public function addCloseButton() : void
      {
         var _loc1_:Sprite = null;
         _loc1_ = this.windowContainer.getChildByName("buttonClose") as Sprite;
         this._btClose = AssetLibrary.getSprite("components",AssetConfig.ASSET_WINDOW_CLOSE);
         this._btClose.x = _loc1_.x;
         this._btClose.y = _loc1_.y;
         this._btClose.buttonMode = true;
         this._btClose.useHandCursor = true;
         this.windowContainer.removeChild(_loc1_);
         this.windowContainer.addChild(this._btClose);
         this._btClose.addEventListener(MouseEvent.MOUSE_DOWN,this.handleCloseClick);
      }
      
      protected function checkIsTabbed() : void
      {
         if(this.isTabbed > 0)
         {
            this._tabs = new TabbingManager(this._inner,this._outer,this.isTabbed,this._tabTypes,this._tabText);
         }
      }
      
      protected function handleCloseClick(param1:MouseEvent) : void
      {
         this.close();
      }
      
      public function close() : void
      {
         WindowManagerNew.closeWindow(this);
      }
      
      public function setModalVisibility(param1:String) : void
      {
         switch(param1)
         {
            case "on":
               this.modal.visible = true;
               break;
            case "off":
               this.modal.visible = false;
         }
      }
      
      public function get w() : int
      {
         return this.dWidth;
      }
      
      public function get h() : int
      {
         return this.dHeight;
      }
      
      public function get offsetX() : int
      {
         return this._offsetX;
      }
      
      public function get offsetY() : int
      {
         return this._offsetY;
      }
      
      public function set offsetX(param1:int) : void
      {
         this._offsetX = param1;
      }
      
      public function set offsetY(param1:int) : void
      {
         this._offsetY = param1;
      }
      
      public function get container() : Sprite
      {
         return this.windowContainer;
      }
      
      public function get inner() : Sprite
      {
         return this._inner;
      }
      
      public function get outer() : Sprite
      {
         return this._outer;
      }
      
      public function get below() : Sprite
      {
         return this._below;
      }
      
      public function get header() : Sprite
      {
         return this._header;
      }
      
      public function set headerFileName(param1:String) : void
      {
         this._headerFileName = param1;
      }
      
      public function get headerFileName() : String
      {
         return this._headerFileName;
      }
      
      public function get tabsManager() : TabbingManager
      {
         return this._tabs;
      }
      
      public function get modalLayer() : Sprite
      {
         return this.modal;
      }
      
      public function get isPrimary() : Boolean
      {
         return this._isPrimary;
      }
      
      public function get isOpen() : Boolean
      {
         return this._isOpen;
      }
      
      public function get windowId() : int
      {
         return this._windowId;
      }
      
      public function get btClose() : Sprite
      {
         return this._btClose;
      }
      
      public function set btClose(param1:Sprite) : void
      {
         this._btClose = param1;
      }
      
      public function preClose() : void
      {
      }
      
      public function preOpen() : void
      {
      }
      
      public function dispose() : void
      {
      }
   }
}

