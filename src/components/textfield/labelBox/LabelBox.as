package components.textfield.labelBox
{
   import components.textfield.gradientText.GradientText;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.supportClasses.SkinnableComponent;
   import spark.primitives.BitmapImage;
   
   public class LabelBox extends SkinnableComponent
   {
      private static var _skinParts:Object = {
         "gradientText":false,
         "imgBackground":false,
         "container":false
      };
      
      [SkinPart(required="false")]
      public var container:Group;
      
      [SkinPart(required="false")]
      public var imgBackground:BitmapImage;
      
      [SkinPart(required="false")]
      public var gradientText:GradientText;
      
      private var _1301532860backgroundScale:Number = 0.25;
      
      private var _365601008fontSize:Number = 14;
      
      private var _value:String = "";
      
      public function LabelBox()
      {
         super();
      }
      
      [Bindable(event="propertyChange")]
      public function get value() : String
      {
         return this._value;
      }
      
      private function set _111972721value(param1:String) : void
      {
         this._value = param1.length < 15 ? param1 : param1.slice(0,12).concat("...");
         if(skin)
         {
            skin.invalidateDisplayList();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundScale() : Number
      {
         return this._1301532860backgroundScale;
      }
      
      public function set backgroundScale(param1:Number) : void
      {
         var _loc2_:Object = this._1301532860backgroundScale;
         if(_loc2_ !== param1)
         {
            this._1301532860backgroundScale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundScale",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fontSize() : Number
      {
         return this._365601008fontSize;
      }
      
      public function set fontSize(param1:Number) : void
      {
         var _loc2_:Object = this._365601008fontSize;
         if(_loc2_ !== param1)
         {
            this._365601008fontSize = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fontSize",_loc2_,param1));
            }
         }
      }
      
      public function set value(param1:String) : void
      {
         var _loc2_:Object = this.value;
         if(_loc2_ !== param1)
         {
            this._111972721value = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"value",_loc2_,param1));
            }
         }
      }
   }
}

