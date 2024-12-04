package windows.core
{
   import mx.core.IFlexModuleFactory;
   import spark.components.Group;
   
   public class OuterGroup extends Group
   {
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function OuterGroup()
      {
         super();
         this.percentWidth = 100;
         this.percentHeight = 100;
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
   }
}

