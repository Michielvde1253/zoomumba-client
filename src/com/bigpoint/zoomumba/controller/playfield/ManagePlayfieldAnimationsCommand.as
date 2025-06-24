package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldAnimationProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.components.animals.AnimData;
   import com.bigpoint.zoomumba.view.app.ApplicationMediator;
   import com.bigpoint.zoorama.view.field.PlayField;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   import flash.geom.Point;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ManagePlayfieldAnimationsCommand extends SimpleCommand
   {
      public function ManagePlayfieldAnimationsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc17_:Cage = null;
         var _loc18_:Vector.<AnimData> = null;
         var _loc19_:int = 0;
         var _loc20_:Vector.<AnimData> = null;
         var _loc21_:int = 0;
         var _loc22_:Vector.<AnimData> = null;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:AnimData = null;
         var _loc2_:PlayFieldAnimationProxy = facade.retrieveProxy(PlayFieldAnimationProxy.NAME) as PlayFieldAnimationProxy;
         var _loc3_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc4_:PlayField = facade.retrieveMediator(PlayField.NAME) as PlayField;
         var _loc5_:ApplicationMediator = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         var _loc6_:int = _loc2_.getMaxPossibleAnimations();
         if(_loc2_.isPaused)
         {
            _loc6_ = 0;
         }
         var _loc7_:Point = _loc4_.getStageToFieldCords(new Point());
         var _loc8_:Point = _loc4_.getStageToFieldCords(new Point(_loc5_.STAGE_WIDTH,_loc5_.STAGE_HEIGHT));
         var _loc9_:int = _loc7_.x + _loc7_.y - 1;
         var _loc10_:int = _loc8_.x + _loc8_.y + 1;
         var _loc11_:int = _loc7_.x - _loc7_.y - 1;
         var _loc12_:int = _loc8_.x - _loc8_.y - 1;
         var _loc13_:Vector.<ItemAbstract> = _loc3_.getItemsByCategory(Categories.CAGE);
         var _loc14_:Vector.<AnimData> = new Vector.<AnimData>();
         var _loc15_:Vector.<AnimData> = new Vector.<AnimData>();
         var _loc16_:int = 0;
         while(_loc16_ < _loc13_.length)
         {
            _loc17_ = _loc13_[_loc16_] as Cage;
            if(_loc17_.vertical >= _loc11_ && _loc17_.vertical <= _loc12_ && _loc17_.horizontal >= _loc9_ && _loc17_.horizontal <= _loc10_)
            {
               _loc18_ = _loc17_.getRunningAnims();
               _loc19_ = 0;
               while(_loc19_ < _loc18_.length)
               {
                  _loc14_.push(_loc18_[_loc19_]);
                  _loc19_++;
               }
               _loc20_ = _loc17_.getStopedAnims();
               _loc21_ = 0;
               while(_loc21_ < _loc20_.length)
               {
                  _loc15_.push(_loc20_[_loc21_]);
                  _loc21_++;
               }
            }
            else
            {
               _loc22_ = _loc17_.getRunningAnims();
               _loc23_ = 0;
               while(_loc23_ < _loc22_.length)
               {
                  _loc22_[_loc23_].showStill();
                  _loc23_++;
               }
            }
            _loc16_++;
         }
         while(_loc14_.length < _loc6_ && _loc15_.length > 0)
         {
            _loc24_ = Math.floor(Math.random() * _loc15_.length);
            _loc25_ = _loc15_.splice(_loc24_,1)[0];
            _loc25_.playRandamAnim();
            _loc14_.push(_loc25_);
         }
         while(_loc14_.length > _loc6_)
         {
            _loc24_ = Math.floor(Math.random() * _loc14_.length);
            _loc25_ = _loc14_.splice(_loc24_,1)[0];
            _loc25_.showStill();
         }
      }
   }
}

