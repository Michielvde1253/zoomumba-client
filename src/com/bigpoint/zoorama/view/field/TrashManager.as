package com.bigpoint.zoorama.view.field
{
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import com.bigpoint.zoorama.data.fieldItems.TrashRoadData;
   import com.bigpoint.zoorama.view.field.items.TrashBin;
   import flash.geom.Point;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class TrashManager extends Mediator
   {
      public static const NAME:String = "TrashManager";
      
      public static const TRASH_PILE_AMMOUNTS:Vector.<int> = Vector.<int>([20,100,500,2500,10000]);
      
      private const roadPercentageToUse:Number = 0.6;
      
      private var roadTable:RoadItemTable;
      
      private var trashBins:Vector.<TrashBin> = new Vector.<TrashBin>();
      
      private var trashRoadDatas:Vector.<TrashRoadData> = new Vector.<TrashRoadData>();
      
      private var cleanTrashRoadsStack:Vector.<CleanTrashInfo> = new Vector.<CleanTrashInfo>();
      
      private var cleanTrashBinsStack:Vector.<CleanTrashInfo> = new Vector.<CleanTrashInfo>();
      
      public function TrashManager(param1:RoadItemTable)
      {
         super(NAME);
         this.roadTable = param1;
         if(Settings.TUTORIAL_ACTIVE)
         {
            TutorialInjectionManager.getInstance().injectTrashManager(this);
         }
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
      
      public function distributeBinTrash(param1:int, param2:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this.cleanTrashBinsStack.length)
         {
            if(this.cleanTrashBinsStack[_loc3_].commandId <= param2)
            {
               this.cleanTrashBinsStack.shift();
               _loc3_--;
            }
            else
            {
               param1 -= this.cleanTrashBinsStack[_loc3_].ammount;
            }
            _loc3_++;
         }
         if(param1 >= 0)
         {
            _loc4_ = 0;
            _loc5_ = 0;
            while(_loc5_ < this.trashBins.length)
            {
               _loc4_ += this.trashBins[_loc5_].capacity;
               _loc5_++;
            }
            _loc6_ = param1;
            if(param1 >= _loc4_)
            {
               _loc5_ = 0;
               while(_loc5_ < this.trashBins.length)
               {
                  this.trashBins[_loc5_].trashAmmount = this.trashBins[_loc5_].capacity;
                  _loc6_ -= this.trashBins[_loc5_].capacity;
                  _loc5_++;
               }
               if(_loc6_ > 0)
               {
               }
            }
            else if(param1 == 0)
            {
               _loc5_ = 0;
               while(_loc5_ < this.trashBins.length)
               {
                  this.trashBins[_loc5_].trashAmmount = 0;
                  _loc5_++;
               }
            }
            else
            {
               this.trashBins.sort(this.sortTrashByCleanTime);
               _loc5_ = 0;
               while(_loc5_ < this.trashBins.length)
               {
                  if(this.trashBins[_loc5_].capacity > _loc6_)
                  {
                     this.trashBins[_loc5_].trashAmmount = _loc6_;
                     _loc6_ = 0;
                  }
                  else
                  {
                     this.trashBins[_loc5_].trashAmmount = this.trashBins[_loc5_].capacity;
                     _loc6_ -= this.trashBins[_loc5_].capacity;
                  }
                  _loc5_++;
               }
            }
         }
      }
      
      private function sortTrashByCleanTime(param1:TrashBin, param2:TrashBin) : int
      {
         return param1.cleanTimeStamp - param2.cleanTimeStamp;
      }
      
      public function distributeRoadTrash(param1:int, param2:int) : Vector.<FieldItemData>
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Vector.<int> = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Boolean = false;
         var _loc12_:int = 0;
         var _loc13_:TrashRoadData = null;
         var _loc14_:Point = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:TrashRoadData = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.cleanTrashRoadsStack.length)
         {
            if(this.cleanTrashRoadsStack[_loc3_].commandId <= param2)
            {
               this.cleanTrashRoadsStack.shift();
               _loc3_--;
            }
            else
            {
               param1 -= this.cleanTrashRoadsStack[_loc3_].ammount;
            }
            _loc3_++;
         }
         var _loc4_:Vector.<FieldItemData> = new Vector.<FieldItemData>();
         if(param1 >= 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            while(_loc6_ < this.trashRoadDatas.length)
            {
               _loc5_ += this.trashRoadDatas[_loc6_].trashAmount;
               _loc6_++;
            }
            if(param1 > _loc5_)
            {
               _loc7_ = this.roadTable.getAllRoadsIds();
               _loc8_ = Math.floor(_loc7_.length * this.roadPercentageToUse) - this.trashRoadDatas.length;
               _loc6_ = 0;
               while(_loc6_ < this.trashRoadDatas.length)
               {
                  _loc11_ = false;
                  _loc12_ = 0;
                  while(_loc12_ < _loc7_.length)
                  {
                     if(this.trashRoadDatas[_loc6_].uniqueId == _loc7_[_loc12_])
                     {
                        _loc7_.splice(_loc12_,1);
                        _loc11_ = true;
                        break;
                     }
                     _loc12_++;
                  }
                  if(_loc11_)
                  {
                  }
                  _loc6_++;
               }
               _loc9_ = param1 - _loc5_;
               if(!this.trashRoadDatas.length)
               {
                  _loc13_ = new TrashRoadData();
                  _loc13_.uniqueId = 0;
                  if(_loc9_ > TRASH_PILE_AMMOUNTS[0])
                  {
                     _loc13_.trashAmount = TRASH_PILE_AMMOUNTS[0];
                     _loc9_ -= TRASH_PILE_AMMOUNTS[0];
                  }
                  else
                  {
                     _loc13_.trashAmount = _loc9_;
                     _loc9_ = 0;
                  }
                  _loc14_ = this.roadTable.getRoadCords(0);
                  _loc13_.posX = _loc14_.x;
                  _loc13_.posY = _loc14_.y;
                  _loc13_.itemId = 1;
                  this.trashRoadDatas.push(_loc13_);
                  if(_loc13_.trashAmount > 0)
                  {
                     _loc4_.push(_loc13_);
                  }
               }
               _loc10_ = 0;
               while(_loc10_ < TRASH_PILE_AMMOUNTS.length)
               {
                  _loc8_ = Math.floor(_loc8_ / 2);
                  _loc15_ = 0;
                  while(_loc15_ < _loc8_)
                  {
                     _loc13_ = new TrashRoadData();
                     if(_loc9_ > TRASH_PILE_AMMOUNTS[_loc10_])
                     {
                        _loc13_.trashAmount = TRASH_PILE_AMMOUNTS[_loc10_];
                        _loc9_ -= TRASH_PILE_AMMOUNTS[_loc10_];
                     }
                     else
                     {
                        _loc13_.trashAmount = _loc9_;
                        _loc9_ = 0;
                     }
                     _loc16_ = Math.floor(Math.random() * _loc7_.length);
                     _loc17_ = int(_loc7_.splice(_loc16_,1)[0]);
                     _loc13_.uniqueId = _loc17_;
                     _loc14_ = this.roadTable.getRoadCords(_loc17_);
                     _loc13_.posX = _loc14_.x;
                     _loc13_.posY = _loc14_.y;
                     _loc13_.itemId = 1;
                     this.trashRoadDatas.push(_loc13_);
                     if(_loc13_.trashAmount > 0)
                     {
                        _loc4_.push(_loc13_ as FieldItemData);
                     }
                     if(_loc9_ <= 0)
                     {
                        break;
                     }
                     _loc15_++;
                  }
                  _loc10_++;
               }
               if(_loc9_ > 0)
               {
                  _loc18_ = Math.floor(_loc9_ / this.trashRoadDatas.length);
                  _loc6_ = 0;
                  while(_loc6_ < this.trashRoadDatas.length)
                  {
                     this.trashRoadDatas[_loc6_].trashAmount += _loc18_;
                     _loc9_ -= _loc18_;
                     _loc6_++;
                  }
                  if(_loc9_ > 0)
                  {
                     this.trashRoadDatas[0].trashAmount += _loc9_;
                  }
                  _loc4_ = new Vector.<FieldItemData>();
                  _loc6_ = 0;
                  while(_loc6_ < this.trashRoadDatas.length)
                  {
                     if(this.trashRoadDatas[_loc6_].trashAmount > 0)
                     {
                        _loc4_.push(this.trashRoadDatas[_loc6_] as FieldItemData);
                     }
                     _loc6_++;
                  }
               }
            }
            else
            {
               _loc9_ = _loc5_ - param1;
               while(_loc9_ > 0)
               {
                  _loc19_ = this.trashRoadDatas[0];
                  _loc6_ = 0;
                  while(_loc6_ < this.trashRoadDatas.length)
                  {
                     if(_loc19_.trashAmount < this.trashRoadDatas[_loc6_].trashAmount)
                     {
                        _loc19_ = this.trashRoadDatas[_loc6_];
                     }
                     _loc6_++;
                  }
                  if(_loc19_.trashAmount > 0)
                  {
                     if(_loc19_.trashAmount > _loc9_)
                     {
                        _loc19_.trashAmount -= _loc9_;
                        _loc9_ = 0;
                     }
                     else
                     {
                        _loc19_.del = 1;
                        _loc9_ -= _loc19_.trashAmount;
                        _loc19_.trashAmount = 0;
                     }
                     _loc4_.push(_loc19_ as FieldItemData);
                  }
                  else
                  {
                     _loc9_ = 0;
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public function addTrashBin(param1:TrashBin) : void
      {
         this.trashBins.push(param1);
      }
      
      public function removeTrashBin(param1:TrashBin) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.trashBins.length)
         {
            if(param1.uniqueId == this.trashBins[_loc2_].uniqueId)
            {
               this.trashBins.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
      }
      
      public function clearTrashInBin(param1:int, param2:int, param3:int) : void
      {
         this.cleanTrashBinsStack.push(new CleanTrashInfo(param2,param3));
      }
      
      public function clearTrashFromRoad(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         while(_loc5_ < this.trashRoadDatas.length)
         {
            if(this.trashRoadDatas[_loc5_].uniqueId == param1)
            {
               this.trashRoadDatas.splice(_loc5_,1);
               _loc4_ = true;
               break;
            }
            _loc5_++;
         }
         if(_loc4_)
         {
         }
         this.cleanTrashRoadsStack.push(new CleanTrashInfo(param2,param3));
      }
      
      public function clearAllData() : void
      {
         this.trashBins = new Vector.<TrashBin>();
         this.trashRoadDatas = new Vector.<TrashRoadData>();
         this.cleanTrashRoadsStack = new Vector.<CleanTrashInfo>();
         this.cleanTrashBinsStack = new Vector.<CleanTrashInfo>();
      }
   }
}

class CleanTrashInfo
{
   public var ammount:int;
   
   public var commandId:int;
   
   public function CleanTrashInfo(param1:int, param2:int)
   {
      super();
      this.ammount = param1;
      this.commandId = param2;
   }
}
