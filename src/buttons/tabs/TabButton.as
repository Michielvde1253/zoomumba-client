package buttons.tabs
{
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.supportClasses.SkinnableComponent;
   
   public class TabButton extends SkinnableComponent
   {
      private static var _skinParts:Object = {
         "contentGroup":false,
         "stars":false
      };
      
      private var _active:Boolean = false;
      
      public var index:int;
      
      public var contentClass:*;
      
      private var _102727412label:String;
      
      [SkinPart(required="false")]
      public var contentGroup:Group;
      
      [SkinPart(required="false")]
      public var stars:Group;
      
      public function TabButton()
      {
         super();
      }
      
      public function get active() : Boolean
      {
         return this._active;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         this._active = !param1;
         super.enabled = true;
         invalidateSkinState();
      }
      
      override protected function getCurrentSkinState() : String
      {
         if(this.active)
         {
            return "active";
         }
         return currentState;
      }
      
      [Bindable(event="propertyChange")]
      public function get label() : String
      {
         return this._102727412label;
      }
      
      public function set label(param1:String) : void
      {
         var _loc2_:Object = this._102727412label;
         if(_loc2_ !== param1)
         {
            this._102727412label = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label",_loc2_,param1));
            }
         }
      }
   }
}

