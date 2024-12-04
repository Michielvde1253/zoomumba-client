package fr.kapit.model
{
   import fr.kapit.event.SelectedTargetChangeEvent;
   import fr.kapit.events.KapDebugEventDispatcher;
   
   public class ApplicationModel
   {
      private static var _instance:ApplicationModel;
      
      private var _selectedTarget:Object;
      
      public var selectedInspectorName:String;
      
      public function ApplicationModel()
      {
         super();
         if(!_instance)
         {
            _instance = this;
            return;
         }
         throw new Error("already created");
      }
      
      public static function get instance() : ApplicationModel
      {
         if(!_instance)
         {
            new ApplicationModel();
         }
         return _instance;
      }
      
      public function set selectedTarget(param1:Object) : void
      {
         this._selectedTarget = param1;
         KapDebugEventDispatcher.instance.dispatchEvent(new SelectedTargetChangeEvent(param1));
      }
      
      public function get selectedTarget() : Object
      {
         return this._selectedTarget;
      }
   }
}

