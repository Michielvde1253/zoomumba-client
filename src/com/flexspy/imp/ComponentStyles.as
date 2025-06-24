package com.flexspy.imp
{
   import com.flexspy.imp.metadata.FrameworkMetadata;
   import com.flexspy.imp.metadata.StyleMetadata;
   import flash.events.Event;
   import mx.collections.ArrayCollection;
   import mx.collections.Sort;
   import mx.collections.SortField;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.controls.DataGrid;
   import mx.controls.Text;
   import mx.controls.TextInput;
   import mx.controls.dataGridClasses.DataGridColumn;
   import mx.core.ClassFactory;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.PropertyChangeEvent;
   import mx.events.PropertyChangeEventKind;
   import mx.styles.IStyleClient;
   
   public class ComponentStyles extends VBox
   {
      private static var COLOR:String = "color";
      
      private static var COLORS:String = "colors";
      
      private var _unfilteredComponentProperties:Array;
      
      private var _currentEditor:EditorClassFactory;
      
      private var _componentTable:DataGrid;
      
      private var _componentProperties:ArrayCollection = new ArrayCollection();
      
      private var _filter:String;
      
      private var _currentObject:IStyleClient;
      
      public function ComponentStyles()
      {
         super();
         this.label = "Styles";
         this.setStyle("paddingLeft",10);
         this.setStyle("paddingRight",10);
         this.setStyle("paddingBottom",10);
      }
      
      private function updateFilter(param1:Event) : void
      {
         _filter = TextInput(param1.target).text;
         updateTableContent();
      }
      
      private function addObjectProperties(param1:IStyleClient) : void
      {
         var _loc3_:PropertyEditorItem = null;
         var _loc4_:String = null;
         var _loc6_:StyleMetadata = null;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         var _loc2_:Array = new Array();
         var _loc5_:Array = FrameworkMetadata.getClassStyles(param1);
         if(_loc5_.length > 0)
         {
            for each(_loc6_ in _loc5_)
            {
               _loc3_ = createPropertyEditorItem(param1,_loc6_);
               if(_loc3_ != null)
               {
                  _loc2_.push(_loc3_.name);
                  _unfilteredComponentProperties.push(_loc3_);
               }
            }
         }
         else
         {
            _loc7_ = param1.nonInheritingStyles;
            if(_loc7_ != null)
            {
               for(_loc4_ in _loc7_)
               {
                  _loc3_ = inspectStyle(param1,_loc4_,_loc7_,_loc2_,false);
                  if(_loc3_ != null)
                  {
                     _loc2_.push(_loc3_.name);
                     _unfilteredComponentProperties.push(_loc3_);
                  }
               }
            }
            _loc8_ = param1.inheritingStyles;
            if(_loc8_ != null)
            {
               for(_loc4_ in _loc8_)
               {
                  _loc3_ = inspectStyle(param1,_loc4_,_loc8_,_loc2_,true);
                  if(_loc3_ != null)
                  {
                     _loc2_.push(_loc3_.name);
                     _unfilteredComponentProperties.push(_loc3_);
                  }
               }
            }
         }
      }
      
      public function editCell() : void
      {
         var _loc5_:DataGridValueEnumEditor = null;
         var _loc6_:DataGridValueBooleanEditor = null;
         var _loc1_:int = int(_componentTable.selectedIndex);
         var _loc2_:ArrayCollection = _componentTable.dataProvider as ArrayCollection;
         var _loc3_:PropertyEditorItem = PropertyEditorItem(_loc2_.getItemAt(_loc1_));
         var _loc4_:String = _loc3_.type;
         if(_loc4_ == "String" && _loc3_.enumeration != "")
         {
            _loc5_ = new DataGridValueEnumEditor();
            _loc5_.enumaration = _loc3_.enumeration;
            _loc5_.editedValue = _loc3_.value;
            _currentEditor.activeInstance = _loc5_;
         }
         else if(_loc4_ == "Boolean")
         {
            _loc6_ = new DataGridValueBooleanEditor();
            _loc6_.editedValue = _loc3_.value;
            _currentEditor.activeInstance = _loc6_;
         }
         else
         {
            _currentEditor.activeInstance = new DataGridValueEditor();
         }
         _componentTable.editedItemPosition = {
            "columnIndex":1,
            "rowIndex":_loc1_
         };
      }
      
      private function onCollectionChange(param1:CollectionEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:PropertyChangeEvent = null;
         var _loc5_:Object = null;
         if(_currentObject != null && param1.kind == CollectionEventKind.UPDATE)
         {
            _loc2_ = param1.items;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc4_ = _loc2_[_loc3_] as PropertyChangeEvent;
               if(_loc4_ != null && _loc4_.kind == PropertyChangeEventKind.UPDATE)
               {
                  _loc5_ = _loc4_.source;
                  updateStyleValue(_loc5_.name,_loc5_.value);
               }
               _loc3_++;
            }
         }
      }
      
      public function updateStyleValue(param1:String, param2:*) : void
      {
         _currentObject.setStyle(param1,param2);
      }
      
      private function updateTableContent() : void
      {
         var _loc4_:Sort = null;
         var _loc1_:Array = filterList(_unfilteredComponentProperties,_filter);
         var _loc2_:ArrayCollection = new ArrayCollection(_loc1_);
         _loc2_.addEventListener(CollectionEvent.COLLECTION_CHANGE,onCollectionChange,false,0,true);
         var _loc3_:ArrayCollection = _componentTable.dataProvider as ArrayCollection;
         if(_loc3_ != null)
         {
            _loc2_.sort = _loc3_.sort;
         }
         else
         {
            _loc4_ = new Sort();
            _loc4_.fields = [new SortField("name",true)];
            _loc2_.sort = _loc4_;
         }
         _loc2_.refresh();
         _componentTable.dataProvider = _loc2_;
      }
      
      private function filterList(param1:Array, param2:String) : Array
      {
         var _loc5_:PropertyEditorItem = null;
         var _loc6_:String = null;
         var _loc3_:Array = new Array();
         var _loc4_:String = param2 == null || param2.length == 0 ? null : param2.toLocaleLowerCase();
         for each(_loc5_ in param1)
         {
            _loc6_ = _loc5_.name;
            if(_loc4_ == null || _loc6_.toLocaleLowerCase().indexOf(_loc4_) >= 0)
            {
               _loc3_.push(_loc5_);
            }
         }
         return _loc3_;
      }
      
      private function createPropertyEditorItem(param1:IStyleClient, param2:StyleMetadata) : PropertyEditorItem
      {
         var _loc3_:PropertyEditorItem = new StyleEditorItem(param2.name);
         _loc3_.value = param1.getStyle(param2.name);
         _loc3_.format = param2.format;
         _loc3_.type = param2.type;
         _loc3_.enumeration = param2.enumeration;
         _loc3_.editable = _loc3_.type == "Number" || _loc3_.type == "String" || _loc3_.type == "int" || _loc3_.type == "uint" || _loc3_.type == "Boolean";
         return _loc3_;
      }
      
      public function showComponentStyles(param1:Object) : void
      {
         _unfilteredComponentProperties = new Array();
         _currentObject = param1 as IStyleClient;
         if(_currentObject != null)
         {
            addObjectProperties(_currentObject);
         }
         updateTableContent();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         var _loc1_:HBox = new HBox();
         var _loc2_:Text = new Text();
         _loc2_.text = "Filter";
         _loc1_.addChild(_loc2_);
         var _loc3_:TextInput = new TextInput();
         _loc3_.addEventListener("change",updateFilter);
         _loc1_.addChild(_loc3_);
         this.addChild(_loc1_);
         _currentEditor = new EditorClassFactory();
         _currentEditor.activeInstance = new DataGridValueEditor();
         var _loc4_:DataGridColumn = new DataGridColumn();
         _loc4_.width = 160;
         _loc4_.headerText = "Style";
         _loc4_.dataField = "name";
         _loc4_.editable = false;
         var _loc5_:DataGridColumn = new DataGridColumn();
         _loc5_.headerText = "Value";
         _loc5_.dataField = "value";
         _loc5_.editable = false;
         _loc5_.editorDataField = "editedValue";
         _loc5_.itemRenderer = new ClassFactory(StyleDataGridValueRenderer);
         _loc5_.itemEditor = _currentEditor;
         _componentTable = new EditableDataGrid();
         _componentTable.percentWidth = 100;
         _componentTable.percentHeight = 100;
         _componentTable.columns = [_loc4_,_loc5_];
         this.addChild(_componentTable);
      }
      
      private function inspectStyle(param1:IStyleClient, param2:String, param3:Object, param4:Array, param5:Boolean) : PropertyEditorItem
      {
         if(param2 == null || param2.length == 0 || param2.charAt(0) == "$" || param4.indexOf(param2) >= 0)
         {
            return null;
         }
         var _loc6_:PropertyEditorItem = new StyleEditorItem(param2);
         _loc6_.value = param3[param2];
         _loc6_.editable = false;
         return _loc6_;
      }
   }
}

