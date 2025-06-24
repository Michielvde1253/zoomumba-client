package com.bigpoint.zoomumba.view.managmentCenter.components
{
   import com.bigpoint.zoomumba.model.managmentCenter.events.CircusBoxEvent;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.StoreData;
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmentCenterCircusBoxesVo;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.EventDispatcher;
   
   public class ManagmentCirusBoxes extends EventDispatcher
   {
      private var _asset:Sprite;
      
      private var _boxes:Vector.<ManagmentCircusBox>;
      
      public function ManagmentCirusBoxes(param1:Sprite)
      {
         super();
         this._asset = param1;
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:int = 0;
         var _loc2_:DisplayObject = null;
         var _loc3_:ManagmentCircusBox = null;
         var _loc4_:int = 0;
         if(this._asset)
         {
            _loc1_ = this._asset.numChildren + 1;
            this._asset.mouseEnabled = false;
            this._boxes = new Vector.<ManagmentCircusBox>();
            _loc4_ = 1;
            while(_loc4_ < _loc1_)
            {
               _loc2_ = this._asset.getChildByName("boxItem" + _loc4_ + "_mc");
               if(_loc2_ != null)
               {
                  _loc3_ = new ManagmentCircusBox(new ManagmentCenterCircusBoxesVo(_loc2_ as MovieClip,new StoreData()));
                  _loc3_.addEventListener(CircusBoxEvent.CIRCUS_OPEN_BOX,this.openBox);
                  this._boxes.push(_loc3_);
               }
               _loc4_++;
            }
         }
      }
      
      private function openBox(param1:CircusBoxEvent) : void
      {
         dispatchEvent(new CircusBoxEvent(CircusBoxEvent.CIRCUS_OPEN_BOX,param1.dataVo,param1.uniqueId));
      }
      
      public function updateView(param1:Vector.<StoreData>) : void
      {
         var _loc2_:StoreData = null;
         for each(_loc2_ in param1)
         {
            if(this.refreshBox(_loc2_) == false)
            {
               this.setNextBox(_loc2_);
            }
         }
         this.updateViewState();
      }
      
      private function updateViewState() : void
      {
         var _loc1_:ManagmentCircusBox = null;
         for each(_loc1_ in this._boxes)
         {
            _loc1_.refresh();
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:ManagmentCircusBox = null;
         for each(_loc1_ in this._boxes)
         {
            _loc1_.removeEventListener(CircusBoxEvent.CIRCUS_OPEN_BOX,this.openBox);
            _loc1_.destroy();
         }
      }
      
      private function setNextBox(param1:StoreData) : void
      {
         var _loc2_:ManagmentCircusBox = null;
         for each(_loc2_ in this._boxes)
         {
            if(_loc2_.storeData.uniqueId <= 0)
            {
               _loc2_.storeData = param1;
               return;
            }
         }
      }
      
      private function searchBox(param1:int) : ManagmentCircusBox
      {
         var _loc2_:ManagmentCircusBox = null;
         for each(_loc2_ in this._boxes)
         {
            if(_loc2_.storeData.uniqueId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function refreshBox(param1:StoreData) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._boxes.length)
         {
            if(this._boxes[_loc2_].storeData.uniqueId == param1.uniqueId)
            {
               this._boxes[_loc2_].storeData = param1;
               return true;
            }
            _loc2_++;
         }
         return false;
      }
   }
}

