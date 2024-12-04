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
   
   use namespace mx_internal;
   
   public class DataGridValueEnumEditor extends Canvas implements IBindingClient, IListItemRenderer
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil;
      
      private var _774743565possibleValues:ArrayCollection = new ArrayCollection();
      
      private var _editedValue:Object;
      
      mx_internal var _bindingsByDestination:Object = {};
      
      mx_internal var _bindingsBeginWithWord:Object = {};
      
      mx_internal var _watchers:Array = [];
      
      private var _612288131combobox:ComboBox;
      
      mx_internal var _bindings:Array = [];
      
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
                     "percentWidth":100,
                     "minWidth":0,
                     "visible":true
                  };
               }
            })]};
         }
      });
      
      public function DataGridValueEnumEditor()
      {
         super();
         mx_internal::_document = this;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.addEventListener("creationComplete",___DataGridValueEnumEditor_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         DataGridValueEnumEditor._watcherSetupUtil = param1;
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
      private function get possibleValues() : ArrayCollection
      {
         return this._774743565possibleValues;
      }
      
      public function get editedValue() : Object
      {
         if(combobox == null)
         {
            return _editedValue;
         }
         return combobox.selectedItem;
      }
      
      public function set enumaration(param1:String) : void
      {
         var _loc2_:String = null;
         for each(_loc2_ in param1.split(","))
         {
            possibleValues.addItem(_loc2_);
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:DataGridValueEnumEditor = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _DataGridValueEnumEditor_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_flexspy_imp_DataGridValueEnumEditorWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },bindings,watchers);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         super.initialize();
      }
      
      private function onClose(param1:DropdownEvent) : void
      {
         var _loc2_:KeyboardEvent = new KeyboardEvent(KeyboardEvent.KEY_DOWN);
         _loc2_.charCode = Keyboard.ENTER;
         dispatchEvent(_loc2_);
      }
      
      public function set editedValue(param1:Object) : void
      {
         _editedValue = param1;
      }
      
      private function _DataGridValueEnumEditor_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Object
         {
            return possibleValues;
         },function(param1:Object):void
         {
            combobox.dataProvider = param1;
         },"combobox.dataProvider");
         result[0] = binding;
         return result;
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
      
      private function _DataGridValueEnumEditor_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = possibleValues;
      }
      
      override public function parentChanged(param1:DisplayObjectContainer) : void
      {
         super.parentChanged(param1);
         if(param1 == null && combobox != null)
         {
            combobox.close();
         }
      }
      
      public function ___DataGridValueEnumEditor_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         onCreationComplete();
      }
      
      private function onCreationComplete() : void
      {
         combobox.selectedItem = _editedValue;
         combobox.addEventListener(DropdownEvent.CLOSE,onClose);
         combobox.open();
         focusManager.setFocus(combobox);
      }
      
      [Bindable(event="propertyChange")]
      public function get combobox() : ComboBox
      {
         return this._612288131combobox;
      }
   }
}

