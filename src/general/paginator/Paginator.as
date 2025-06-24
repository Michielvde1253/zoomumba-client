package general.paginator
{
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   
   public class Paginator extends EventDispatcher
   {
      private var _itIgnored:int;
      
      private var _itCounter:int;
      
      private var _entriesPerPage:uint = 0;
      
      private var _maxEntries:uint = 0;
      
      private var _prevButton:Button = null;
      
      private var _nextButton:Button = null;
      
      private var _firstButton:Button = null;
      
      private var _lastButton:Button = null;
      
      private var _currentPage:int = -1;
      
      private var _changeEvent:PaginatorEvent;
      
      private var _warningEvent:PaginatorWarningEvent;
      
      public var disableButtons:Boolean = false;
      
      public var forceAlwaysEnabledButtons:Boolean = false;
      
      public var hideInsteadOfDisable:Boolean = false;
      
      public function Paginator(param1:uint = 4294967295, param2:uint = 4294967295)
      {
         super();
         this._entriesPerPage = param1;
         this._maxEntries = param2;
         this._changeEvent = new PaginatorEvent(PaginatorEvent.CHANGE_PAGE);
         this._warningEvent = new PaginatorWarningEvent(PaginatorWarningEvent.REACHED_LIMIT);
      }
      
      public function get maxPages() : uint
      {
         return Math.max(Math.ceil(this._maxEntries / this._entriesPerPage) - 1,0);
      }
      
      public function get currentIndexPageIni() : int
      {
         return this.currentPage * this._entriesPerPage;
      }
      
      public function get currentIndexPageEnd() : int
      {
         var _loc1_:int = this.currentIndexPageIni + Math.max(this._entriesPerPage - 1,0);
         return _loc1_ >= this._maxEntries ? int(this._maxEntries - 1) : _loc1_;
      }
      
      public function get currentPage() : int
      {
         return this._currentPage;
      }
      
      public function get nextButton() : Button
      {
         return this._nextButton;
      }
      
      public function get prevButton() : Button
      {
         return this._prevButton;
      }
      
      public function get firstButton() : Button
      {
         return this._firstButton;
      }
      
      public function get lastButton() : Button
      {
         return this._lastButton;
      }
      
      public function get entriesPerPage() : uint
      {
         return this._entriesPerPage;
      }
      
      [Bindable(event="propertyChange")]
      public function get maxEntries() : uint
      {
         return this._maxEntries;
      }
      
      public function set currentPage(param1:int) : void
      {
         this._changeEvent.page = this._currentPage = param1;
         this._changeEvent.pageFirstIndex = this.currentIndexPageIni;
         this._changeEvent.pageLastIndex = this.currentIndexPageEnd;
         this.itReset();
         this.checkButtons();
         dispatchEvent(this._changeEvent);
      }
      
      public function setSearchMode() : void
      {
         this._currentPage = 0;
      }
      
      public function set nextButton(param1:Button) : void
      {
         this._nextButton = param1;
         if(this._nextButton != null)
         {
            this._nextButton.addEventListener(MouseEvent.CLICK,this.gotoNext);
            this.checkButtons();
         }
      }
      
      public function set prevButton(param1:Button) : void
      {
         this._prevButton = param1;
         if(this._prevButton != null)
         {
            this._prevButton.addEventListener(MouseEvent.CLICK,this.gotoPrev);
            this.checkButtons();
         }
      }
      
      public function set firstButton(param1:Button) : void
      {
         this._firstButton = param1;
         if(this._firstButton != null)
         {
            this._firstButton.addEventListener(MouseEvent.CLICK,this.gotoFirst);
            this.checkButtons();
         }
      }
      
      public function set lastButton(param1:Button) : void
      {
         this._lastButton = param1;
         if(this._lastButton != null)
         {
            this._lastButton.addEventListener(MouseEvent.CLICK,this.gotoLast);
            this.checkButtons();
         }
      }
      
      private function set _417636724maxEntries(param1:uint) : void
      {
         if(this._maxEntries != param1)
         {
            this._maxEntries = param1;
            this.checkButtons();
         }
      }
      
      public function set entriesPerPage(param1:uint) : void
      {
         this._entriesPerPage = param1;
         this.checkButtons();
      }
      
      private function checkButtons() : void
      {
         if(this._firstButton != null)
         {
            this._firstButton.visible = this.forceAlwaysEnabledButtons || this.maxPages > 0;
            if(this.hideInsteadOfDisable && !this.forceAlwaysEnabledButtons && this.currentPage == 0 || this.maxPages == 0)
            {
               this._firstButton.visible = false;
            }
            this._firstButton.enabled = this.forceAlwaysEnabledButtons || this.currentPage > 0 || this.disableButtons;
         }
         if(this._prevButton != null)
         {
            this._prevButton.visible = this.forceAlwaysEnabledButtons || this.maxPages > 0;
            if(this.hideInsteadOfDisable && !this.forceAlwaysEnabledButtons && this.currentPage == 0 || this.maxPages == 0)
            {
               this._prevButton.visible = false;
            }
            this._prevButton.enabled = this.forceAlwaysEnabledButtons || this.currentPage > 0 || this.disableButtons;
         }
         if(this._nextButton != null)
         {
            this._nextButton.visible = this.forceAlwaysEnabledButtons || this.maxPages > 0;
            if(this.hideInsteadOfDisable && !this.forceAlwaysEnabledButtons && this.currentPage == this.maxPages || this.maxPages == 0)
            {
               this._nextButton.visible = false;
            }
            this._nextButton.enabled = this.forceAlwaysEnabledButtons || this.currentPage < this.maxPages || this.disableButtons;
         }
         if(this._lastButton != null)
         {
            this._lastButton.visible = this.forceAlwaysEnabledButtons || this.maxPages > 0;
            if(this.hideInsteadOfDisable && !this.forceAlwaysEnabledButtons && this.currentPage == this.maxPages || this.maxPages == 0)
            {
               this._lastButton.visible = false;
            }
            this._lastButton.enabled = this.forceAlwaysEnabledButtons || this.currentPage < this.maxPages || this.disableButtons;
         }
      }
      
      private function gotoPrev(param1:MouseEvent) : void
      {
         if(this.currentPage != 0)
         {
            --this.currentPage;
         }
         else
         {
            this._warningEvent.maximum = false;
            dispatchEvent(this._warningEvent);
         }
      }
      
      public function jumpToFirstPage() : void
      {
         this.currentPage = 0;
      }
      
      private function gotoFirst(param1:MouseEvent) : void
      {
         this.jumpToFirstPage();
      }
      
      private function gotoNext(param1:MouseEvent) : void
      {
         if(this.currentPage != this.maxPages)
         {
            ++this.currentPage;
         }
         else
         {
            this._warningEvent.maximum = true;
            dispatchEvent(this._warningEvent);
         }
      }
      
      private function gotoLast(param1:MouseEvent) : void
      {
         this.currentPage = this.maxPages;
      }
      
      public function destroy() : void
      {
         if(this._prevButton != null)
         {
            this._prevButton.removeEventListener(MouseEvent.CLICK,this.gotoPrev);
         }
         if(this._nextButton != null)
         {
            this._nextButton.removeEventListener(MouseEvent.CLICK,this.gotoNext);
         }
         if(this._firstButton != null)
         {
            this._firstButton.removeEventListener(MouseEvent.CLICK,this.gotoFirst);
         }
         if(this._lastButton != null)
         {
            this._lastButton.removeEventListener(MouseEvent.CLICK,this.gotoLast);
         }
      }
      
      public function itReset() : void
      {
         this._itCounter = 0;
         this._itIgnored = 0;
      }
      
      public function itCurrent() : int
      {
         return this.currentIndexPageIni + this._itCounter + this._itIgnored;
      }
      
      public function itNext() : int
      {
         ++this._itCounter;
         return this.itCurrent();
      }
      
      public function itScape() : int
      {
         ++this._itIgnored;
         return this.itCurrent();
      }
      
      public function itHasNext() : Boolean
      {
         var _loc1_:* = this.currentIndexPageIni + this._itCounter <= this.currentIndexPageEnd;
         var _loc2_:* = this.itCurrent() < this.maxEntries;
         var _loc3_:Boolean = _loc1_ && _loc2_;
         if(!_loc3_)
         {
            this.maxEntries -= this._itIgnored;
         }
         return _loc3_;
      }
      
      public function set maxEntries(param1:uint) : void
      {
         var _loc2_:Object = this.maxEntries;
         if(_loc2_ !== param1)
         {
            this._417636724maxEntries = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maxEntries",_loc2_,param1));
            }
         }
      }
   }
}

