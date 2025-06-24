package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.GuiNotice;
   import com.bigpoint.zoorama.view.gui.btn.BasicButton;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.scrollbars.Scrollbar;
   import com.bigpoint.zoorama.view.gui.win.generals.SizedMediumWindow;
   import com.greensock.TweenLite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class MiniTutorialWindow extends SizedMediumWindow
   {
      private static var MAX_PAGE_INDEX:int = 9;
      
      private static var PAGE_IDS:Array = ["1","2","3","4","5","6","6b","7","8"];
      
      private static const PAGE_WIDTH:int = 440;
      
      private static var isAssetlibaryInitializedForTutorialPages:Boolean = false;
      
      protected var PAGES_PATH:String = "/img/$local$/flash/window_minitutorials/";
      
      private var currentPageIndex:int = 1;
      
      private var loadedPageCount:int;
      
      private var pageContainerXOffset:int;
      
      private var tfInfoContainer:MovieClip;
      
      private var tfInfo:TextField;
      
      private var scrollbar:Scrollbar;
      
      private var btnPageDownSkin:MovieClip;
      
      private var btnPageUpSkin:MovieClip;
      
      private var pageContainer:MovieClip;
      
      private var pageContainerMask:MovieClip;
      
      private var pageUpButton:BasicButton;
      
      private var pageDownButton:BasicButton;
      
      public function MiniTutorialWindow(param1:Notifier)
      {
         var _loc2_:String = null;
         _loc2_ = "Minitutorial";
         name = "Minitutorial";
         modal = true;
         useHeaderLoader = true;
         headerFilename = "header_tutorial";
         super(param1,_loc2_);
      }
      
      override protected function autoClose() : void
      {
         super.autoClose();
         notifier.dispatchNotice(new GuiNotice(GuiNotice.CLOSE_MAIN_WINDOW));
      }
      
      override public function draw() : void
      {
         if(Settings.SCALE_TEST)
         {
            halign = Coreponent.ALIGN_H_LEFT;
            valign = Coreponent.ALIGN_V_TOP;
            this.x = 143;
            this.y = 65;
         }
         super.draw();
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         var _loc1_:MovieClip = loadedContent.getChildByName("SC_TF_INFO") as MovieClip;
         if(_loc1_)
         {
            this.tfInfoContainer = _loc1_.getChildByName("content") as MovieClip;
            this.tfInfo = this.tfInfoContainer.getChildByName("tf") as TextField;
            if(this.tfInfo)
            {
               StyleModule.setTextFieldStyle(this.tfInfo,StyleModule.HEADER_12);
               StyleModule.setTextFieldCSS(this.tfInfo);
            }
         }
         this.scrollbar = getLatebindingSourceComponentByName("SB_SC_TF_INFO") as Scrollbar;
         this.scrollbar.update();
         this.btnPageUpSkin = loadedContent.getChildByName("btnPageUpSkin") as MovieClip;
         this.btnPageDownSkin = loadedContent.getChildByName("btnPageDownSkin") as MovieClip;
         this.pageContainer = loadedContent.getChildByName("pageContainer") as MovieClip;
         this.pageContainerMask = loadedContent.getChildByName("pageMask") as MovieClip;
         this.pageContainerMask.cacheAsBitmap = true;
         this.pageContainer.cacheAsBitmap = true;
         this.pageContainer.mask = this.pageContainerMask;
         this.pageContainerXOffset = this.pageContainer.x;
         if(this.btnPageDownSkin)
         {
            this.pageDownButton = new BasicButton();
            this.pageDownButton.skin = this.btnPageDownSkin;
            this.pageDownButton.tweenMouseOverParams = [null,0.3,{"colorMatrixFilter":{
               "contrast":1.4,
               "brightness":1.4
            }}];
            this.pageDownButton.tweenMouseOutParams = [null,0.3,{"colorMatrixFilter":{
               "contrast":0.9,
               "brightness":0.9
            }}];
            this.pageDownButton.addEventListener(MouseEvent.CLICK,this.handlePageDownButtonClick);
            loadedContent.addChild(this.pageDownButton);
         }
         if(this.btnPageUpSkin)
         {
            this.pageUpButton = new BasicButton();
            this.pageUpButton.skin = this.btnPageUpSkin;
            this.pageUpButton.tweenMouseOverParams = [null,0.3,{"colorMatrixFilter":{
               "contrast":1.4,
               "brightness":1.4
            }}];
            this.pageUpButton.tweenMouseOutParams = [null,0.3,{"colorMatrixFilter":{
               "contrast":0.9,
               "brightness":0.9
            }}];
            this.pageUpButton.addEventListener(MouseEvent.CLICK,this.handlePageUpButtonClick);
            loadedContent.addChild(this.pageUpButton);
         }
         this.startTutorialPagesLoad();
         super.assignLoadedContentGUI();
         btnOK.visible = false;
         this.currentPageIndex = 1;
         this.updatePages();
      }
      
      private function startTutorialPagesLoad() : void
      {
         var _loc2_:String = null;
         var _loc3_:MiniTutorialPage = null;
         this.loadedPageCount = 0;
         this.initializeAssetlibraryForTutorialPages();
         var _loc1_:int = 0;
         while(_loc1_ < MAX_PAGE_INDEX)
         {
            _loc2_ = PAGE_IDS[_loc1_];
            _loc3_ = new MiniTutorialPage(_loc2_,isAssetlibaryInitializedForTutorialPages);
            _loc3_.name = "page_" + _loc2_;
            _loc3_.greenArrow = this.createGreenArrow();
            _loc3_.load();
            this.pageContainer.addChild(_loc3_);
            _loc1_++;
         }
         isAssetlibaryInitializedForTutorialPages = true;
         this.initalizePagesPostion();
      }
      
      private function createGreenArrow() : Bitmap
      {
         var clazz:Class = null;
         var bmp:Bitmap = null;
         var bmpData:BitmapData = null;
         try
         {
            clazz = loader.contentLoaderInfo.applicationDomain.getDefinition("GreenArrow") as Class;
            bmpData = new clazz() as BitmapData;
            bmp = new Bitmap(bmpData);
         }
         catch(error:Error)
         {
         }
         return bmp;
      }
      
      protected function initializeAssetlibraryForTutorialPages() : void
      {
         var _loc1_:String = null;
         if(!isAssetlibaryInitializedForTutorialPages)
         {
            _loc1_ = Settings.httpProtocolString + Settings.API_HOST + this.PAGES_PATH.split("$local$").join(Settings.LANGUAGE);
         }
      }
      
      private function initalizePagesPostion() : void
      {
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:DisplayObject = null;
         var _loc1_:int = this.pageContainer.numChildren;
         var _loc2_:int = 1;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = _loc3_ + 1;
            _loc4_ = PAGE_IDS[_loc3_];
            _loc5_ = _loc3_ * PAGE_WIDTH;
            _loc6_ = this.pageContainer.getChildByName("page_" + _loc4_) as DisplayObject;
            if(_loc6_)
            {
               _loc6_.x = _loc5_;
               _loc6_.y = 0;
            }
            _loc3_++;
         }
      }
      
      private function handlePageDownButtonClick(param1:MouseEvent) : void
      {
         if(this.currentPageIndex - 1 >= 1)
         {
            --this.currentPageIndex;
         }
         this.updatePages();
      }
      
      private function handlePageUpButtonClick(param1:MouseEvent) : void
      {
         if(this.currentPageIndex + 1 <= MAX_PAGE_INDEX)
         {
            this.currentPageIndex += 1;
         }
         this.updatePages();
      }
      
      private function updatePages() : void
      {
         this.showPage();
         this.updateButtons();
         this.updateInfoText();
      }
      
      private function showPage() : void
      {
         var _loc1_:int = this.pageContainerXOffset - (this.currentPageIndex - 1) * PAGE_WIDTH;
         TweenLite.to(this.pageContainer,0.4,{"x":_loc1_});
      }
      
      private function updateButtons() : void
      {
         btnOK.visible = false;
         switch(this.currentPageIndex)
         {
            case 1:
               this.pageDownButton.visible = false;
               break;
            case MAX_PAGE_INDEX:
               this.pageUpButton.visible = false;
               btnOK.visible = true;
               break;
            default:
               this.pageUpButton.visible = true;
               this.pageDownButton.visible = true;
         }
      }
      
      private function updateInfoText() : void
      {
         var _loc1_:String = PAGE_IDS[this.currentPageIndex - 1];
         var _loc2_:String = "zoo.window.minitutorial.infopage." + _loc1_;
         var _loc3_:String = TextResourceModule.getText(_loc2_);
         this.tfInfo.text = "<span class=\'thin12\'>" + _loc3_ + "</span>";
         this.tfInfoContainer.y = 0;
         this.scrollbar.sliderPositionInPercent = 0;
      }
   }
}

