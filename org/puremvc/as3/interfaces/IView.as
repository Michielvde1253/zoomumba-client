package org.puremvc.as3.interfaces
{
   public interface IView
   {
      function registerObserver(param1:String, param2:IObserver) : void;
      
      function removeObserver(param1:String, param2:Object) : void;
      
      function notifyObservers(param1:INotification) : void;
      
      function registerMediator(param1:IMediator) : void;
      
      function retrieveMediator(param1:String) : IMediator;
      
      function removeMediator(param1:String) : IMediator;
      
      function hasMediator(param1:String) : Boolean;
   }
}

