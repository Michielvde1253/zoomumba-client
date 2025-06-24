package fr.kapit.components
{
   import mx.core.IUIComponent;
   
   public interface IKapDebugComponent extends IKapDebugDataSetter, IUIComponent
   {
      function get className() : String;
      
      function get componentLabel() : String;
      
      function get componentName() : String;
      
      function dispose() : void;
      
      function get label() : String;
      
      function set label(param1:String) : void;
      
      function registerView(param1:String) : void;
   }
}

