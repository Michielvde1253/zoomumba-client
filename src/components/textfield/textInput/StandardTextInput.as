package components.textfield.textInput
{
   import flash.events.Event;
   import flash.events.FocusEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Label;
   import spark.components.TextInput;
   import spark.events.TextOperationEvent;
   
   public class StandardTextInput extends TextInput
   {
      private static var _skinParts:Object = {
         "promptDisplay":false,
         "textDisplay":false
      };
      
      [SkinPart(required="false")]
      public var promptDisplay:Label;
      
      private var _prompt:String = "";
      
      private var _focused:Boolean = false;
      
      private var _1608459359promptColor:uint = 0;
      
      public function StandardTextInput()
      {
         super();
         this.addEventListener(FlexEvent.VALUE_COMMIT,this.textChangedHandler,false,0,true);
         this.addEventListener(TextOperationEvent.CHANGE,this.textChangedHandler,false,0,true);
      }
      
      [Bindable(event="propertyChange")]
      public function get prompt() : String
      {
         return this._prompt;
      }
      
      private function set _979805852prompt(param1:String) : void
      {
         if(this._prompt != param1)
         {
            this._prompt = param1;
            if(this.promptDisplay != null)
            {
               this.promptDisplay.text = param1;
            }
         }
      }
      
      private function textChangedHandler(param1:Event) : void
      {
         invalidateSkinState();
      }
      
      override protected function focusInHandler(param1:FocusEvent) : void
      {
         super.focusInHandler(param1);
         this._focused = true;
         invalidateSkinState();
      }
      
      override protected function focusOutHandler(param1:FocusEvent) : void
      {
         super.focusOutHandler(param1);
         this._focused = false;
         invalidateSkinState();
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.promptDisplay)
         {
            this.promptDisplay.text = this.prompt;
         }
      }
      
      override protected function getCurrentSkinState() : String
      {
         if(this.prompt.length > 0 && text.length == 0 && !this._focused)
         {
            return "prompting";
         }
         return super.getCurrentSkinState();
      }
      
      [Bindable(event="propertyChange")]
      public function get promptColor() : uint
      {
         return this._1608459359promptColor;
      }
      
      public function set promptColor(param1:uint) : void
      {
         var _loc2_:Object = this._1608459359promptColor;
         if(_loc2_ !== param1)
         {
            this._1608459359promptColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"promptColor",_loc2_,param1));
            }
         }
      }
      
      public function set prompt(param1:String) : void
      {
         var _loc2_:Object = this.prompt;
         if(_loc2_ !== param1)
         {
            this._979805852prompt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"prompt",_loc2_,param1));
            }
         }
      }
   }
}

