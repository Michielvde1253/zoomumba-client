package com.bigpoint.zoomumba.model.playfield.advBreed
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.utils.timeManager.TimeTrack;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.ItemServerVO;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.inventory.vo.InventoryTabs;
   import com.bigpoint.zoomumba.model.playfield.vo.NurseryVO;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class NurseryProxy extends Proxy
   {
      public static const NAME:String = "NurseryProxy";
      
      public static const STATE_READY:int = 1;
      
      public static const STATE_RUNNING:int = 2;
      
      public static const STATE_FINISHED:int = 3;
      
      private static const STATES_TOOLTIPS:Array = [null,"zoo.nursery.tooltip.nurseryEmpty","zoo.nursery.tooltip.nurseryRaising","zoo.nursery.tooltip.nurseryDone"];
      
      private var raiseTimeTrack:TimeTrack;
      
      private var _raiseTime:int = -1;
      
      private var _raiseStarted:int = -1;
      
      private var _animalId:int;
      
      private var _animalUniqueId:int;
      
      private var _raiseAnimalIdReward:int = -1;
      
      private var _currentState:int = 1;
      
      public var selectedRaiseTime:int = 0;
      
      public var selectedAnimals:Vector.<int> = new <int>[-1];
      
      public var selectedPrice:ItemServerVO = new ItemServerVO();
      
      public var raiseInstantPrice:ItemServerVO = new ItemServerVO();
      
      public function NurseryProxy(param1:int, param2:int, param3:Object = null)
      {
         super(NurseryProxy.NAME,param3);
      }
      
      public static function getFullName(param1:int, param2:int) : String
      {
         return NAME + "_" + param1 + "_" + param2;
      }
      
      public function get currentState() : int
      {
         return this._currentState;
      }
      
      public function get currentTooltipId() : String
      {
         return STATES_TOOLTIPS[this._currentState];
      }
      
      override public function onRegister() : void
      {
         this.raiseTimeTrack = TimeManager.creatEmptyTrack(this.raisingEnded);
         this.updateData(this.nursery);
      }
      
      private function raisingEnded() : void
      {
         this._currentState = NurseryProxy.STATE_FINISHED;
         sendNotification(Note.REFRESH_NURSERY_BUILDING);
      }
      
      public function updateData(param1:Object) : void
      {
         this.data = param1;
         this.selectedAnimals = new <int>[this.getBabyForSpecie(param1["usedItemId1"])];
         this.setBuildingState();
      }
      
      private function getBabyForSpecie(param1:int) : int
      {
         if(param1 <= 0)
         {
            return -1;
         }
         var _loc2_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         return _loc2_.getChildAnimalData(param1).animalId;
      }
      
      private function setBuildingState() : void
      {
         if(this.nursery.end == 0)
         {
            this._currentState = NurseryProxy.STATE_READY;
         }
         else if(this.nursery.end > TimeManager.currentTime)
         {
            this._currentState = NurseryProxy.STATE_RUNNING;
         }
         else
         {
            this._currentState = NurseryProxy.STATE_FINISHED;
         }
         TimeManager.updateTrackTime(this.raiseTimeTrack,this.nursery.end);
         sendNotification(Note.REFRESH_NURSERY_BUILDING);
      }
      
      public function get nursery() : NurseryVO
      {
         return this.data as NurseryVO;
      }
      
      public function getCardsForBabys() : Vector.<Object>
      {
         var _loc1_:Vector.<Object> = new Vector.<Object>();
         var _loc2_:InventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         var _loc3_:Vector.<Object> = _loc2_.getTabContentByTab(InventoryTabs.ANIMALS);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(AnimalShopData(_loc3_[_loc4_]["0"]).child == 1 && AnimalShopData(_loc3_[_loc4_]["0"]).raisable == 1)
            {
               _loc1_.push(_loc3_[_loc4_]["0"]);
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function dispose() : void
      {
         this.selectedRaiseTime = 0;
         this.selectedAnimals = new <int>[-1];
         this.selectedPrice = new ItemServerVO();
         this.raiseInstantPrice = new ItemServerVO();
      }
      
      private function parseData() : void
      {
      }
   }
}

