package fr.kapit.popup
{
   import mx.core.IFlexDisplayObject;
   
   public interface IPopupView extends IFlexDisplayObject
   {
      function addCustomView(param1:String) : void;
      
      function addModule(param1:String) : void;
   }
}

