package fr.kapit.components
{
   public class KapDebugShortcut
   {
      public var altKey:Boolean;
      
      public var componentName:String;
      
      public var ctrlKey:Boolean;
      
      public var keyCode:uint;
      
      public var shiftKey:Boolean;
      
      public function KapDebugShortcut(param1:Boolean, param2:Boolean, param3:Boolean, param4:uint, param5:String)
      {
         super();
         this.altKey = param1;
         this.ctrlKey = param2;
         this.shiftKey = param3;
         param4 = param4;
         this.componentName = param5;
      }
   }
}

