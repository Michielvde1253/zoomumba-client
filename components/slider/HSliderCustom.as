package components.slider
{
   import mx.events.PropertyChangeEvent;
   import spark.components.HSlider;
   
   public class HSliderCustom extends HSlider
   {
      private static var _skinParts:Object = {
         "dataTip":false,
         "track":false,
         "thumb":false
      };
      
      private var _540966339thumbContent:*;
      
      public function HSliderCustom()
      {
         super();
      }
      
      [Bindable(event="propertyChange")]
      public function get thumbContent() : *
      {
         return this._540966339thumbContent;
      }
      
      public function set thumbContent(param1:*) : void
      {
         var _loc2_:Object = this._540966339thumbContent;
         if(_loc2_ !== param1)
         {
            this._540966339thumbContent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumbContent",_loc2_,param1));
            }
         }
      }
   }
}

