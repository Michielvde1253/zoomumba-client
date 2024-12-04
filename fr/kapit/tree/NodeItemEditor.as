package fr.kapit.tree
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
   import fr.kapit.controls.kComboBox;
   import fr.kapit.controls.kTextInput;
   import fr.kapit.introspection.nodes.DebugNode;
   import mx.binding.*;
   import mx.containers.HBox;
   import mx.controls.listClasses.BaseListData;
   import mx.controls.listClasses.IDropInListItemRenderer;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class NodeItemEditor extends HBox implements IBindingClient, IDropInListItemRenderer
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1360672740inputCombo:kComboBox;
      
      private var _1706957847inputText:kTextInput;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _listData:BaseListData;
      
      private var _dataChanged:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function NodeItemEditor()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":HBox,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":kTextInput,
                  "id":"inputText",
                  "events":{"enter":"__inputText_enter"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "visible":false,
                        "includeInLayout":false
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":kComboBox,
                  "id":"inputCombo",
                  "events":{"change":"__inputCombo_change"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "visible":false,
                        "includeInLayout":false
                     };
                  }
               })]};
            }
         });
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._NodeItemEditor_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_fr_kapit_tree_NodeItemEditorWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return NodeItemEditor[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         NodeItemEditor._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      override public function set data(param1:Object) : void
      {
         if(super.data != param1)
         {
            super.data = param1;
            this._dataChanged = true;
            invalidateProperties();
         }
      }
      
      override protected function commitProperties() : void
      {
         if(this._dataChanged)
         {
            if(this.node.type == Boolean)
            {
               this._activateCombo();
               if(this.inputCombo)
               {
                  this.inputCombo.selectedItem = this.node.target;
                  this._dataChanged = false;
               }
            }
            else
            {
               this._activateText();
               if(this.inputText)
               {
                  this.inputText.text = this.node.rawValueAsString;
                  this._dataChanged = false;
               }
            }
            invalidateDisplayList();
         }
      }
      
      private function get node() : DebugNode
      {
         return data as DebugNode;
      }
      
      public function set listData(param1:BaseListData) : void
      {
         this._listData = param1;
      }
      
      public function get listData() : BaseListData
      {
         return this._listData;
      }
      
      public function set text(param1:String) : void
      {
         if(this.node)
         {
            this.node.rawValue = param1;
         }
      }
      
      public function get text() : String
      {
         return !!this.node ? this.node.rawValueAsString : "";
      }
      
      private function _activateText() : void
      {
         if(this.inputText)
         {
            this.inputText.visible = true;
            this.inputText.includeInLayout = true;
            this.inputText.text = this.text;
         }
      }
      
      private function _activateCombo() : void
      {
         if(this.inputCombo)
         {
            this.inputCombo.visible = true;
            this.inputCombo.includeInLayout = true;
            this.inputCombo.selectedItem = this.node.target;
         }
      }
      
      public function __inputText_enter(param1:FlexEvent) : void
      {
         this.text = this.inputText.text;
      }
      
      public function __inputCombo_change(param1:ListEvent) : void
      {
         this.node.rawValue = this.inputCombo.selectedItem;
      }
      
      private function _NodeItemEditor_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return [true,false];
         },null,"inputCombo.dataProvider");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get inputCombo() : kComboBox
      {
         return this._1360672740inputCombo;
      }
      
      public function set inputCombo(param1:kComboBox) : void
      {
         var _loc2_:Object = this._1360672740inputCombo;
         if(_loc2_ !== param1)
         {
            this._1360672740inputCombo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"inputCombo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get inputText() : kTextInput
      {
         return this._1706957847inputText;
      }
      
      public function set inputText(param1:kTextInput) : void
      {
         var _loc2_:Object = this._1706957847inputText;
         if(_loc2_ !== param1)
         {
            this._1706957847inputText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"inputText",_loc2_,param1));
            }
         }
      }
   }
}

