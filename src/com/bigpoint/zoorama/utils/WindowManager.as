package com.bigpoint.zoorama.utils
{
   import com.bigpoint.zoomumba.constants.PLAYFIELD;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.Window;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class WindowManager extends Mediator
   {
      private static var instance:WindowManager;
      
      public static const NAME:String = "WindowManager";
      
      private var _openWindowCount:int = 0;
      
      private var winLayer:Coreponent;
      
      private var modalLayer:Sprite;
      
      private var visibleWindows:Dictionary;
      
      public function WindowManager()
      {
         super(NAME);
      }
      
      public static function getInstance() : WindowManager
      {
         if(instance == null)
         {
            instance = new WindowManager();
         }
         return instance;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      public function initialize(param1:Coreponent, param2:Coreponent) : void
      {
         this.winLayer = param1;
         this.modalLayer = param2;
         param2.valign = Coreponent.SIZE_V_ALL;
         param2.halign = Coreponent.SIZE_H_ALL;
         if(param2)
         {
            param2.visible = false;
            param2.width = 4000;
            param2.height = 4000;
            param2.x = -1300;
            param2.y = -1300;
            this.winLayer.addChild(param2);
         }
         this.visibleWindows = new Dictionary();
      }
      
      public function showWindow(param1:Window) : void
      {
         var _loc2_:int = 0;
         if(this.visibleWindows[param1.name] == null)
         {
            if(!param1.isOpen)
            {
               ++this._openWindowCount;
            }
            this.visibleWindows[param1.name] = param1;
            this.winLayer.addChild(param1);
            if(param1.modal || this.modalLayer.visible)
            {
               this.modalLayer.visible = true;
               if(param1.modal)
               {
                  _loc2_ = this.winLayer.getChildIndex(param1) - 1;
                  this.winLayer.setChildIndex(this.modalLayer,_loc2_);
               }
            }
            else
            {
               this.modalLayer.visible = false;
            }
            param1.show();
            param1.stage.invalidate();
            TempGetterProxy.sendNotification(PLAYFIELD.ENABLE_ANIMATION,false);
         }
      }
      
      public function hideWindow(param1:Window) : void
      {
         var _loc2_:int = 0;
         if(this.visibleWindows[param1.name])
         {
            if(param1.isOpen)
            {
               --this._openWindowCount;
            }
            param1.hide();
            this.winLayer.removeChild(param1);
            delete this.visibleWindows[param1.name];
            if(this.modalLayer.visible)
            {
               _loc2_ = this.getVisibleWindowCount();
               if(_loc2_ >= 0)
               {
                  this.winLayer.setChildIndex(this.modalLayer,_loc2_);
               }
            }
            if(this.getVisibleWindowCount() == 0 && this.modalLayer.visible)
            {
               this.modalLayer.visible = false;
            }
            TempGetterProxy.sendNotification(PLAYFIELD.ENABLE_ANIMATION,true);
         }
      }
      
      public function hideWindowWithID(param1:String) : void
      {
         var _loc2_:Window = this.visibleWindows[param1];
         if(_loc2_)
         {
            this.hideWindow(_loc2_);
         }
      }
      
      public function hideAllWindows() : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:Window = null;
         var _loc5_:Window = null;
         var _loc1_:Array = [];
         for(_loc2_ in this.visibleWindows)
         {
            _loc4_ = this.visibleWindows[_loc2_] as Window;
            _loc1_.push(_loc4_);
         }
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc5_ = _loc1_[_loc3_];
            this.hideWindow(_loc5_);
            _loc3_++;
         }
         this._openWindowCount = 0;
      }
      
      public function bringWindowToFront(param1:Window) : void
      {
         var _loc2_:String = null;
         var _loc3_:Window = null;
         var _loc4_:int = 0;
         if(this.visibleWindows[param1.name] == null)
         {
            for(_loc2_ in this.visibleWindows)
            {
               _loc3_ = this.visibleWindows[_loc2_] as Window;
               if(_loc3_.name == param1.name)
               {
                  _loc4_ = this.getVisibleWindowCount();
                  this.winLayer.setChildIndex(param1,_loc4_);
               }
            }
         }
      }
      
      protected function getVisibleWindowCount() : int
      {
         return this.winLayer.numChildren - 1;
      }
      
      public function hasSomeWindowOpened() : Boolean
      {
         return this.getVisibleWindowCount() > 0;
      }
      
      protected function traceAllWindows() : void
      {
      }
      
      public function get openWindowCount() : int
      {
         return this._openWindowCount;
      }
   }
}

