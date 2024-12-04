package com.flexspy.imp
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   import mx.core.EdgeMetrics;
   import mx.events.PropertyChangeEvent;
   
   public class PropertyEditorItem extends EventDispatcher
   {
      private static var COLOR:String = "color";
      
      private static var COLORS:String = "colors";
      
      private var _editable:Boolean;
      
      private var _enumeration:String;
      
      private var _format:String;
      
      private var _type:String;
      
      private var _name:String;
      
      private var _uri:String;
      
      private var _value:*;
      
      public function PropertyEditorItem(param1:String)
      {
         super();
         _name = param1;
      }
      
      public function get type() : String
      {
         if(_type == null)
         {
            _type = detectType(value);
         }
         return _type;
      }
      
      public function get enumeration() : String
      {
         return _enumeration;
      }
      
      protected function detectFormat(param1:String, param2:String) : String
      {
         return "Undefined";
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set type(param1:String) : void
      {
         if(param1 != "")
         {
            _type = param1;
         }
      }
      
      public function set enumeration(param1:String) : void
      {
         _enumeration = param1;
      }
      
      [Bindable("valueChange")]
      public function get displayValue() : String
      {
         if(type == "Array")
         {
            return getArrayDisplayValue(value as Array);
         }
         return getItemDisplayValue(value);
      }
      
      private function set _1602416228editable(param1:Boolean) : void
      {
         if(param1 != _editable)
         {
            _editable = param1;
            dispatchEvent(new Event("editableChange"));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set editable(param1:Boolean) : void
      {
         var _loc2_:Object = this.editable;
         if(_loc2_ !== param1)
         {
            this._1602416228editable = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editable",_loc2_,param1));
         }
      }
      
      public function set uri(param1:String) : void
      {
         _uri = param1;
      }
      
      protected function getArrayDisplayValue(param1:Array) : String
      {
         var _loc3_:Object = null;
         var _loc2_:Array = new Array();
         for each(_loc3_ in param1)
         {
            _loc2_.push(getItemDisplayValue(_loc3_));
         }
         return _loc2_.join(", ");
      }
      
      [Bindable(event="propertyChange")]
      public function set value(param1:*) : void
      {
         var _loc2_:Object = this.value;
         if(_loc2_ !== param1)
         {
            this._111972721value = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"value",_loc2_,param1));
         }
      }
      
      public function get editable() : Boolean
      {
         return _editable;
      }
      
      public function set format(param1:String) : void
      {
         if(param1 != "")
         {
            _format = param1;
         }
      }
      
      public function get value() : *
      {
         return _value;
      }
      
      public function get displayName() : String
      {
         if(uri == null || uri == "")
         {
            return name;
         }
         return "{" + uri + "}" + name;
      }
      
      public function get format() : String
      {
         if(_format == null)
         {
            _format = detectFormat(name,type);
         }
         return _format;
      }
      
      protected function getItemDisplayValue(param1:*) : String
      {
         var _loc2_:EdgeMetrics = null;
         var _loc3_:Rectangle = null;
         var _loc4_:String = null;
         if(param1 == null)
         {
            return "";
         }
         if(type == "Class")
         {
            return Utils.formatClass(param1);
         }
         if(param1 is EdgeMetrics)
         {
            _loc2_ = EdgeMetrics(param1);
            return "EdgeMetrics(left=" + _loc2_.left + ", top=" + _loc2_.top + ", right=" + _loc2_.right + ", bottom=" + _loc2_.bottom + ")";
         }
         if(param1 is Rectangle)
         {
            _loc3_ = Rectangle(param1);
            return "Rectange(x=" + _loc3_.x + ", y=" + _loc3_.y + ", width=" + _loc3_.width + ", height=" + _loc3_.height + ")";
         }
         if(param1 is DisplayObject)
         {
            _loc4_ = getQualifiedClassName(param1);
            return Utils.formatDisplayObject(DisplayObject(param1),_loc4_);
         }
         return param1.toString();
      }
      
      private function set _111972721value(param1:*) : void
      {
         if(param1 != _value)
         {
            _value = param1;
            dispatchEvent(new Event("valueChange"));
         }
      }
      
      public function get uri() : String
      {
         return _uri;
      }
      
      protected function detectType(param1:Object) : String
      {
         var _loc2_:String = null;
         if(param1 != null)
         {
            return getQualifiedClassName(param1);
         }
         return "Undefined";
      }
   }
}

