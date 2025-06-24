package com.flexspy.imp
{
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.containers.Canvas;
   import mx.controls.ComboBox;
   import mx.controls.listClasses.IListItemRenderer;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.DropdownEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class DataGridValueBooleanEditor extends Canvas implements IListItemRenderer
   {
      private var _774743565possibleValues:ArrayCollection = new ArrayCollection();
      
      private var _editedValue:Object;
      
      private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
         "type":Canvas,
         "propertiesFactory":function():Object
         {
            return {"childDescriptors":[new UIComponentDescriptor({
               "type":ComboBox,
               "id":"combobox",
               "stylesFactory":function():void
               {
                  this.top = "0";
                  this.left = "1";
                  this.right = "0";
                  this.bottom = "1";
               },
               "propertiesFactory":function():Object
               {
                  return {
                     "dataProvider":[true,false],
                     "percentWidth":100,
                     "minWidth":0,
                     "visible":true
                  };
               }
            })]};
         }
      });
      
      private var _612288131combobox:ComboBox;
      
      public function DataGridValueBooleanEditor()
      {
         super();
         mx_internal::_document = this;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.addEventListener("creationComplete",___DataGridValueBooleanEditor_Canvas1_creationComplete);
      }
      
      private function onClose(param1:DropdownEvent) : void
      {
         var _loc2_:KeyboardEvent = new KeyboardEvent(KeyboardEvent.KEY_DOWN);
         _loc2_.charCode = Keyboard.ENTER;
         dispatchEvent(_loc2_);
      }
      
      public function ___DataGridValueBooleanEditor_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         onCreationComplete();
      }
      
      public function get editedValue() : Boolean
      {
         if(combobox == null)
         {
            return _editedValue;
         }
         return combobox.selectedItem;
      }
      
      override public function parentChanged(param1:DisplayObjectContainer) : void
      {
         super.parentChanged(param1);
         if(param1 == null && combobox != null)
         {
            combobox.close();
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get possibleValues() : ArrayCollection
      {
         return this._774743565possibleValues;
      }
      
      private function set possibleValues(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._774743565possibleValues;
         if(_loc2_ !== param1)
         {
            this._774743565possibleValues = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"possibleValues",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         super.initialize();
      }
      
      public function set combobox(param1:ComboBox) : void
      {
         var _loc2_:Object = this._612288131combobox;
         if(_loc2_ !== param1)
         {
            this._612288131combobox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"combobox",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get combobox() : ComboBox
      {
         return this._612288131combobox;
      }
      
      private function onCreationComplete() : void
      {
         combobox.selectedItem = _editedValue;
         combobox.addEventListener(DropdownEvent.CLOSE,onClose);
         combobox.open();
         focusManager.setFocus(combobox);
      }
      
      public function set editedValue(param1:Boolean) : void
      {
         _editedValue = param1;
      }
   }
}

