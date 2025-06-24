package fr.kapit.components
{
   public interface IKapDebugDataSetter
   {
      function setRoot(param1:Object, param2:String = "", param3:Object = null) : void;
      
      function get target() : Object;
      
      function set target(param1:Object) : void;
   }
}

