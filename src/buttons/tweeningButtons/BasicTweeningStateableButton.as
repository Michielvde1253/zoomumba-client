package buttons.tweeningButtons
{
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.core.IFlexModuleFactory;
   import mx.filters.*;
   import mx.styles.*;
   
   public class BasicTweeningStateableButton extends BasicTweeningButton
   {
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var buttonsStates:Vector.<ButtonState> = new Vector.<ButtonState>();
      
      public var currentButtonState:ButtonState;
      
      public function BasicTweeningStateableButton()
      {
         super();
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function get CURRENT_STATE() : String
      {
         return this.currentButtonState.STATE_NAME;
      }
      
      public function set CURRENT_STATE(param1:String) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.buttonsStates.length)
         {
            if(this.buttonsStates[_loc2_].STATE_NAME == param1)
            {
               this.currentButtonState = this.buttonsStates[_loc2_];
            }
            _loc2_++;
         }
         upSkin = this.currentButtonState.STATE_UP_SKIN;
         overSkin = this.currentButtonState.STATE_OVER_SKIN;
      }
      
      public function defineState(param1:Array) : void
      {
         var _loc2_:ButtonState = new ButtonState();
         _loc2_.STATE_NAME = param1[0];
         _loc2_.STATE_UP_SKIN = param1[1];
         _loc2_.STATE_OVER_SKIN = param1[2];
         this.buttonsStates.push(_loc2_);
         if(this.buttonsStates.length == 1)
         {
            this.CURRENT_STATE = _loc2_.STATE_NAME;
         }
      }
   }
}

