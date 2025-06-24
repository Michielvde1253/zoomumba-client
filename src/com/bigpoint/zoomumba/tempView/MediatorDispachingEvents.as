package com.bigpoint.zoomumba.tempView
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class MediatorDispachingEvents extends Mediator implements IEventDispatcher
   {
      private var hackEventDispacher:EventDispatcher = new EventDispatcher();
      
      public function MediatorDispachingEvents(param1:String, param2:Object = null)
      {
         super(param1,param2);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this.hackEventDispacher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this.hackEventDispacher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this.hackEventDispacher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this.hackEventDispacher.removeEventListener(param1,param2,param3);
      }
      
      public function toString() : String
      {
         return this.hackEventDispacher.toString();
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this.hackEventDispacher.willTrigger(param1);
      }
   }
}

