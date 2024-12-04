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
   import mx.controls.ColorPicker;
   import mx.controls.Image;
   import mx.controls.Label;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.ColorPickerEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class StyleDataGridValueRenderer extends Canvas implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil;
      
      private var _2025208835valueLabel:Label;
      
      mx_internal var _bindingsByDestination:Object = {};
      
      mx_internal var _bindingsBeginWithWord:Object = {};
      
      mx_internal var _watchers:Array = [];
      
      private var _1454002652editButton:Image;
      
      private var _embed_mxml____assets_Edit_png_1865286250:Class = StyleDataGridValueRenderer__embed_mxml____assets_Edit_png_1865286250;
      
      private var _885706193colorPicker:ColorPicker;
      
      mx_internal var _bindings:Array = [];
      
      private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
         "type":Canvas,
         "propertiesFactory":function():Object
         {
            return {"childDescriptors":[new UIComponentDescriptor({
               "type":ColorPicker,
               "id":"colorPicker",
               "events":{"change":"__colorPicker_change"},
               "stylesFactory":function():void
               {
                  this.left = "4";
                  this.top = "0";
               },
               "propertiesFactory":function():Object
               {
                  return {
                     "width":16,
                     "height":16
                  };
               }
            }),new UIComponentDescriptor({
               "type":Label,
               "id":"valueLabel",
               "stylesFactory":function():void
               {
                  this.left = "2";
                  this.top = "0";
                  this.right = "15";
                  this.bottom = "0";
               },
               "propertiesFactory":function():Object
               {
                  return {"minWidth":0};
               }
            }),new UIComponentDescriptor({
               "type":Image,
               "id":"editButton",
               "events":{"click":"__editButton_click"},
               "stylesFactory":function():void
               {
                  this.right = "4";
                  this.top = "2";
               },
               "propertiesFactory":function():Object
               {
                  return {
                     "source":_embed_mxml____assets_Edit_png_1865286250,
                     "width":9,
                     "height":9
                  };
               }
            })]};
         }
      });
      
      public function StyleDataGridValueRenderer()
      {
         super();
         mx_internal::_document = this;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.addEventListener("creationComplete",___StyleDataGridValueRenderer_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         StyleDataGridValueRenderer._watcherSetupUtil = param1;
      }
      
      private function _StyleDataGridValueRenderer_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = data.displayValue;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            valueLabel.text = param1;
         },"valueLabel.text");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return data.editable;
         },function(param1:Boolean):void
         {
            editButton.visible = param1;
         },"editButton.visible");
         result[1] = binding;
         return result;
      }
      
      public function __editButton_click(param1:MouseEvent) : void
      {
         onClickEditButton();
      }
      
      public function ___StyleDataGridValueRenderer_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         onCreationComplete();
      }
      
      private function _StyleDataGridValueRenderer_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = data.displayValue;
         _loc1_ = data.editable;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:StyleDataGridValueRenderer = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _StyleDataGridValueRenderer_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_flexspy_imp_StyleDataGridValueRendererWatcherSetupUtil");
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
      
      [Bindable(event="propertyChange")]
      public function get colorPicker() : ColorPicker
      {
         return this._885706193colorPicker;
      }
      
      [Bindable(event="propertyChange")]
      public function get valueLabel() : Label
      {
         return this._2025208835valueLabel;
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         updateButtonStates(PropertyEditorItem(data));
      }
      
      public function set valueLabel(param1:Label) : void
      {
         var _loc2_:Object = this._2025208835valueLabel;
         if(_loc2_ !== param1)
         {
            this._2025208835valueLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"valueLabel",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get editButton() : Image
      {
         return this._1454002652editButton;
      }
      
      public function set colorPicker(param1:ColorPicker) : void
      {
         var _loc2_:Object = this._885706193colorPicker;
         if(_loc2_ !== param1)
         {
            this._885706193colorPicker = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorPicker",_loc2_,param1));
         }
      }
      
      private function onClickEditButton() : void
      {
         var _loc1_:PropertyEditorItem = PropertyEditorItem(data);
         if(colorPicker != null && Boolean(colorPicker.visible))
         {
            colorPicker.open();
         }
         else
         {
            ComponentStyles(owner.parent).editCell();
         }
      }
      
      private function onCreationComplete() : void
      {
         updateButtonStates(PropertyEditorItem(data));
      }
      
      public function set editButton(param1:Image) : void
      {
         var _loc2_:Object = this._1454002652editButton;
         if(_loc2_ !== param1)
         {
            this._1454002652editButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editButton",_loc2_,param1));
         }
      }
      
      private function onSelectedColorChange() : void
      {
         var _loc1_:PropertyEditorItem = PropertyEditorItem(data);
         _loc1_.value = colorPicker.selectedColor;
         valueLabel.text = data.displayValue;
         ComponentStyles(owner.parent).updateStyleValue(_loc1_.name,_loc1_.value);
      }
      
      private function updateButtonStates(param1:PropertyEditorItem) : void
      {
         if(editButton == null || colorPicker == null)
         {
            return;
         }
         if(param1 != null && param1.editable)
         {
            if(param1 != null && param1.format == "Color" && param1.type != "Array")
            {
               colorPicker.visible = true;
               colorPicker.selectedColor = uint(param1.value);
               valueLabel.setStyle("left",22);
            }
            else
            {
               colorPicker.visible = false;
               valueLabel.setStyle("left",2);
            }
         }
         else
         {
            colorPicker.visible = false;
            valueLabel.setStyle("left",2);
         }
      }
      
      public function __colorPicker_change(param1:ColorPickerEvent) : void
      {
         onSelectedColorChange();
      }
   }
}

