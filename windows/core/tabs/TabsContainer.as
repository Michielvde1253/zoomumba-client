package windows.core.tabs
{
   import buttons.tabs.TabButton;
   import com.greensock.TweenLite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import mx.core.IVisualElement;
   import spark.components.Group;
   import windows.core.tabs.events.TabsGroupEvent;
   import windows.events.WindowCustomEvent;
   
   public class TabsContainer extends Group
   {
      private var _group:Group;
      
      private var _tabsReferences:Dictionary = null;
      
      private var _tabEvent:WindowCustomEvent = new WindowCustomEvent(WindowCustomEvent.WINDOW_CONTENT_UPDATED);
      
      public function TabsContainer()
      {
         super();
      }
      
      public function invalidate() : void
      {
         var _loc1_:TabButton = null;
         this.dispose();
         if(this._tabsReferences == null)
         {
            this._tabsReferences = new Dictionary();
         }
         var _loc2_:int = 0;
         while(_loc2_ < this._group.numElements)
         {
            if(this._group.getElementAt(_loc2_) is TabButton)
            {
               _loc1_ = this._group.getElementAt(_loc2_) as TabButton;
               _loc1_.addEventListener(MouseEvent.CLICK,this.handleTabClick);
               this._tabsReferences[_loc1_.index] = _loc1_;
               if(_loc1_.index == (this._group as ITabsGroup).selectedIndex)
               {
                  this.switchContent(_loc1_);
               }
            }
            _loc2_++;
         }
      }
      
      private function dispose() : void
      {
         var _loc1_:TabButton = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._group.numElements)
         {
            if(this._group.getElementAt(_loc2_) is TabButton && Boolean(this._tabsReferences))
            {
               _loc1_ = this._group.getElementAt(_loc2_) as TabButton;
               _loc1_.removeEventListener(MouseEvent.CLICK,this.handleTabClick);
               this._tabsReferences[_loc1_.index] = null;
            }
            _loc2_++;
         }
         _loc1_ = null;
         this._tabsReferences = null;
      }
      
      override public function addElement(param1:IVisualElement) : IVisualElement
      {
         if(param1 is ITabsGroup)
         {
            this._group = param1 as Group;
            this._group.addEventListener(TabsGroupEvent.INDEX_CHANGED,this.switchIndexHandler);
            this.invalidate();
         }
         return super.addElement(param1);
      }
      
      override public function removeElement(param1:IVisualElement) : IVisualElement
      {
         if(param1 is ITabsGroup)
         {
            this._group = param1 as Group;
            this._group.removeEventListener(TabsGroupEvent.INDEX_CHANGED,this.switchIndexHandler);
            this.dispose();
         }
         this._group = null;
         return super.removeElement(param1);
      }
      
      private function set activateAllTabs(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(this._group)
         {
            _loc2_ = 0;
            while(_loc2_ < this._group.numElements)
            {
               if(this._group.getElementAt(_loc2_) is TabButton)
               {
                  TabButton(this._group.getElementAt(_loc2_)).enabled = param1;
               }
               _loc2_++;
            }
         }
      }
      
      protected function handleTabClick(param1:MouseEvent) : void
      {
         if(param1.currentTarget is TabButton)
         {
            (this._group as ITabsGroup).selectedIndex = (param1.currentTarget as TabButton).index;
         }
      }
      
      protected function switchIndexHandler(param1:TabsGroupEvent) : void
      {
         if(param1.index in this._tabsReferences)
         {
            this.switchContent(this._tabsReferences[param1.index]);
            return;
         }
         throw new Error("This index (" + param1.index + ") does not exists in your tab group!");
      }
      
      private function switchContent(param1:TabButton) : void
      {
         this.activateAllTabs = true;
         param1.enabled = false;
         TweenLite.killDelayedCallsTo(this.switchContentHandler);
         TweenLite.delayedCall(0.05,this.switchContentHandler,[param1]);
      }
      
      private function switchContentHandler(... rest) : void
      {
         var _loc2_:TabButton = rest[0] as TabButton;
         this._tabEvent.contentClass = _loc2_.contentClass;
         dispatchEvent(this._tabEvent);
      }
   }
}

