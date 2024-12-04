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
   import mx.containers.Canvas;
   import mx.controls.TextInput;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class DataGridValueEditor extends Canvas
   {
      private var _1004197030textArea:TextInput;
      
      private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
         "type":Canvas,
         "propertiesFactory":function():Object
         {
            return {"childDescriptors":[new UIComponentDescriptor({
               "type":TextInput,
               "id":"textArea",
               "stylesFactory":function():void
               {
                  this.left = "0";
                  this.top = "0";
                  this.bottom = "0";
                  this.right = "0";
               }
            })]};
         }
      });
      
      public function DataGridValueEditor()
      {
         super();
         mx_internal::_document = this;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.addEventListener("creationComplete",___DataGridValueEditor_Canvas1_creationComplete);
      }
      
      public function get editedValue() : *
      {
         if(textArea.text == "[undefined]")
         {
            return undefined;
         }
         if(textArea.text == "[null]")
         {
            return null;
         }
         return textArea.text;
      }
      
      public function ___DataGridValueEditor_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         onCreationComplete();
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         super.initialize();
      }
      
      [Bindable(event="propertyChange")]
      public function get textArea() : TextInput
      {
         return this._1004197030textArea;
      }
      
      public function set textArea(param1:TextInput) : void
      {
         var _loc2_:Object = this._1004197030textArea;
         if(_loc2_ !== param1)
         {
            this._1004197030textArea = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textArea",_loc2_,param1));
         }
      }
      
      private function onCreationComplete() : void
      {
         var _loc1_:PropertyEditorItem = PropertyEditorItem(data);
         if(_loc1_.value === undefined)
         {
            textArea.text = "[undefined]";
         }
         else if(_loc1_.value === null)
         {
            textArea.text = "[null]";
         }
         else
         {
            textArea.text = String(_loc1_.value);
         }
         textArea.selectionBeginIndex = 0;
         textArea.selectionEndIndex = textArea.text.length;
         focusManager.activate();
         focusManager.setFocus(textArea);
      }
   }
}

