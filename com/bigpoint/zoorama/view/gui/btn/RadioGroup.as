package com.bigpoint.zoorama.view.gui.btn
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class RadioGroup extends EventDispatcher
   {
      public static var EVENT_SELECTION_CHANGED:String = "selectionChanged";
      
      protected var group:Vector.<RadioButton>;
      
      protected var selectedRadio:RadioButton;
      
      public var id:String;
      
      public function RadioGroup()
      {
         super();
         this.group = new Vector.<RadioButton>();
      }
      
      public function addRadioButton(param1:RadioButton) : void
      {
         this.group.push(param1);
      }
      
      public function deselectAll() : void
      {
         var _loc3_:RadioButton = null;
         var _loc1_:int = int(this.group.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this.group[_loc2_] as RadioButton;
            _loc3_.deselect();
            _loc2_++;
         }
      }
      
      public function select(param1:RadioButton) : void
      {
         this.selectedRadio = param1;
         dispatchEvent(new Event(EVENT_SELECTION_CHANGED));
      }
      
      public function getSelected() : RadioButton
      {
         return this.selectedRadio;
      }
      
      public function getSelectionValue() : String
      {
         return this.selectedRadio.value;
      }
   }
}

