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
   import fr.kapit.assets.ComponentIcons;
   import fr.kapit.assets.EmbeddedAssets;
   import fr.kapit.components.AbstractKapDebugComponent;
   import fr.kapit.components.ComponentManager;
   import fr.kapit.components.IKapDebugComponent;
   import fr.kapit.components.KapDebugComponentFactory;
   import fr.kapit.components.KapDebugShortcut;
   import fr.kapit.containers.kHBox;
   import fr.kapit.containers.kVDividedBox;
   import fr.kapit.controls.kCheckBox;
   import fr.kapit.controls.kComboBox;
   import fr.kapit.controls.kTextArea;
   import fr.kapit.controls.kTextInput;
   import fr.kapit.introspection.AccessorDescriptor;
   import fr.kapit.introspection.ClassDescriptor;
   import fr.kapit.introspection.ClassProxy;
   import fr.kapit.introspection.nodes.DebugNode;
   import fr.kapit.introspection.nodes.complex.XMLDebugNode;
   import fr.kapit.utils.ClassUtils;
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.containers.FormItem;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class DebugComponent extends AbstractKapDebugComponent implements IKapDebugComponent, IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public static var NAME:String = "DebugComponent";
      
      public static var LABEL:String = "Object inspector";
      
      private var _316292362classCombo:kComboBox;
      
      private var _198239087debugTree:IntrospectionTree;
      
      private var _920039124inheritedCombo:kCheckBox;
      
      private var _1035306812nodeValueTA:kTextArea;
      
      private var _1621666350textFilterText:kTextInput;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var selectedNode:DebugNode;
      
      private var _17743701rowCount:int = 15;
      
      private var _543578186isWatchTarget:Boolean = true;
      
      private var _1934499494dragActive:Boolean = false;
      
      private var _1907346583_comboClasses:Array;
      
      private var _338884225showRoot:Boolean = true;
      
      private var _name:String;
      
      private var _host:Object;
      
      private var initParams:Object;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function DebugComponent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":AbstractKapDebugComponent,
            "events":{"creationComplete":"___DebugComponent_AbstractKapDebugComponent1_creationComplete"},
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":kHBox,
                  "stylesFactory":function():void
                  {
                     this.verticalAlign = "middle";
                     this.horizontalGap = 10;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":FormItem,
                           "stylesFactory":function():void
                           {
                              this.horizontalGap = 0;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "label":"filter:",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":kTextInput,
                                    "id":"textFilterText",
                                    "events":{"change":"__textFilterText_change"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "width":60,
                                          "toolTip":"Filter (by name) attributes of the selected node "
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":kCheckBox,
                           "id":"inheritedCombo",
                           "events":{"click":"__inheritedCombo_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "label":"inherited",
                                 "selected":true,
                                 "toolTip":"Show/Hide inherited attributes of the selected node"
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":kComboBox,
                           "id":"classCombo",
                           "events":{"change":"__classCombo_change"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "maxWidth":120,
                                 "toolTip":"Filter (by class) attributes of the selected nodes"
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":kVDividedBox,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":IntrospectionTree,
                           "id":"debugTree",
                           "events":{"change":"__debugTree_change"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":85
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":kTextArea,
                           "id":"nodeValueTA",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":15,
                                 "editable":false
                              };
                           }
                        })]
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
         bindings = this._DebugComponent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_fr_kapit_tree_DebugComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DebugComponent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.addEventListener("creationComplete",this.___DebugComponent_AbstractKapDebugComponent1_creationComplete);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function get factory() : KapDebugComponentFactory
      {
         return new KapDebugComponentFactory(NAME,LABEL,DebugComponent,EmbeddedAssets.iconDebugOn,EmbeddedAssets.iconDebugOff,EmbeddedAssets.iconDebugOver,function(param1:Object):Boolean
         {
            return param1 != null;
         },new KapDebugShortcut(false,false,false,112,NAME));
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         DebugComponent._watcherSetupUtil = param1;
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
      
      private function isActive() : Boolean
      {
         return true;
      }
      
      private function onCreationComplete() : void
      {
         if(this.initParams)
         {
            this.debugTree.setRoot(this.initParams.target,this.initParams.name,this.initParams.host);
            this.selectedNode = this.debugTree.rootNode;
         }
      }
      
      private function _fillClassCombo() : void
      {
         var _loc1_:Object = null;
         var _loc3_:DebugNode = null;
         var _loc4_:Dictionary = null;
         var _loc5_:ArrayCollection = null;
         var _loc6_:AccessorDescriptor = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:Object = null;
         if(!this.debugTree)
         {
            _loc1_ = this.target;
         }
         else
         {
            _loc3_ = !!this.debugTree.selectedNode ? DebugNode(this.debugTree.selectedNode) : this.debugTree.rootNode;
            if(_loc3_)
            {
               _loc1_ = _loc3_.target;
            }
         }
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:ClassDescriptor = ClassProxy.getInstance().getDescriptor(_loc1_);
         if(_loc2_)
         {
            _loc4_ = new Dictionary();
            _loc5_ = _loc2_.allVariables;
            for each(_loc6_ in _loc5_)
            {
               if(_loc4_[_loc6_.type] == null)
               {
                  _loc4_[_loc6_.type] = true;
               }
            }
            _loc7_ = [{"label":"All"}];
            _loc8_ = [];
            for(_loc9_ in _loc4_)
            {
               _loc2_ = ClassDescriptor(_loc9_);
               _loc8_.push(_loc2_);
            }
            _loc8_.sortOn("label");
            this._comboClasses = _loc7_.concat(_loc8_);
         }
      }
      
      override public function registerView(param1:String) : void
      {
         ComponentManager.instance.registerView(DebugComponent,param1);
      }
      
      override public function set target(param1:Object) : void
      {
         super.target = param1;
      }
      
      override public function setRoot(param1:Object, param2:String = "", param3:Object = null) : void
      {
         this.target = param1;
         this._name = param2;
         this._host = param3;
         if(!this.debugTree)
         {
            this.initParams = {
               "target":param1,
               "name":param2,
               "host":param3
            };
         }
         else
         {
            if(!this.isActive() || param1 == this.debugTree.root)
            {
               return;
            }
            if(this.debugTree)
            {
               this.debugTree.setRoot(param1,param2,param3);
               callLater(this.selectFirst);
            }
         }
         if(!label)
         {
            label = ClassUtils.getInstanceLabel(param1);
         }
         if(!icon)
         {
            icon = ComponentIcons.getClassIcon(param1);
         }
         this._fillClassCombo();
      }
      
      public function selectFirst() : void
      {
         this.selectedNode = this.debugTree.rootNode;
         callLater(this.onChange,[null]);
      }
      
      public function addRoot(param1:Object, param2:String = "", param3:Object = null) : void
      {
         if(!this.isActive())
         {
            return;
         }
         this.debugTree.addRoot(param1,param2,param3);
      }
      
      public function addRootNode(param1:DebugNode) : void
      {
         if(!this.isActive())
         {
            return;
         }
         this.debugTree.addRootNode(param1);
      }
      
      public function get selectedItem() : DebugNode
      {
         return this.debugTree.selectedItem as DebugNode;
      }
      
      private function onFilterTextChange(param1:Event) : void
      {
         var _loc2_:String = null;
         if(this.selectedNode)
         {
            _loc2_ = this.textFilterText.text;
            this.selectedNode.nameFilter = _loc2_;
            this.debugTree.expandItem(this.selectedNode,false);
            this.debugTree.expandItem(this.selectedNode,true);
         }
      }
      
      private function onChange(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Object = null;
         this._fillClassCombo();
         if(this.debugTree.selectedItem != null)
         {
            this.selectedNode = DebugNode(this.debugTree.selectedItem);
            this.textFilterText.text = this.selectedNode.nameFilter;
            this.inheritedCombo.selected = this.selectedNode.showInherited;
            this.nodeValueTA.text = this.selectedNode is XMLDebugNode ? XMLDebugNode(this.selectedNode).xmlValue : this.selectedNode.displayValue;
            for each(_loc3_ in this._comboClasses)
            {
               if(_loc3_ is ClassDescriptor)
               {
                  if(ClassDescriptor(_loc3_).type == this.selectedNode.classFilter)
                  {
                     this.classCombo.selectedItem = _loc3_;
                     _loc2_ = true;
                     break;
                  }
               }
            }
            if(!_loc2_)
            {
               this.classCombo.selectedIndex = 0;
            }
         }
         if(param1)
         {
            dispatchEvent(param1.clone());
         }
      }
      
      private function setScopeFilter() : void
      {
         var _loc1_:Boolean = Boolean(this.inheritedCombo.selected);
         if(this.selectedNode)
         {
            this.selectedNode.showInherited = _loc1_;
            this.debugTree.expandItem(this.selectedNode,false);
            this.debugTree.expandItem(this.selectedNode,true);
         }
      }
      
      private function _setClassFilter() : void
      {
         var _loc3_:ClassDescriptor = null;
         var _loc1_:Object = this.classCombo.selectedItem;
         var _loc2_:DebugNode = !!this.debugTree.selectedNode ? DebugNode(this.debugTree.selectedNode) : this.debugTree.rootNode;
         if(_loc1_ is ClassDescriptor)
         {
            _loc3_ = ClassDescriptor(_loc1_);
            _loc2_.classFilter = _loc3_.type;
            this.debugTree.expandItem(_loc2_,false);
            this.debugTree.expandItem(_loc2_,true);
         }
         else
         {
            _loc2_.classFilter = null;
            this.debugTree.expandItem(_loc2_,false);
            this.debugTree.expandItem(_loc2_,true);
         }
      }
      
      public function ___DebugComponent_AbstractKapDebugComponent1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete();
      }
      
      public function __textFilterText_change(param1:Event) : void
      {
         this.onFilterTextChange(param1);
      }
      
      public function __inheritedCombo_click(param1:MouseEvent) : void
      {
         this.setScopeFilter();
      }
      
      public function __classCombo_change(param1:ListEvent) : void
      {
         this._setClassFilter();
      }
      
      public function __debugTree_change(param1:ListEvent) : void
      {
         this.onChange(param1);
      }
      
      private function _DebugComponent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"classCombo.rowCount","rowCount");
         result[1] = new Binding(this,function():Object
         {
            return _comboClasses;
         },null,"classCombo.dataProvider");
         result[2] = new Binding(this,null,null,"debugTree.isWatchTarget","isWatchTarget");
         result[3] = new Binding(this,null,null,"debugTree.dragActive","dragActive");
         result[4] = new Binding(this,null,null,"debugTree.showRoot","showRoot");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get classCombo() : kComboBox
      {
         return this._316292362classCombo;
      }
      
      public function set classCombo(param1:kComboBox) : void
      {
         var _loc2_:Object = this._316292362classCombo;
         if(_loc2_ !== param1)
         {
            this._316292362classCombo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"classCombo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get debugTree() : IntrospectionTree
      {
         return this._198239087debugTree;
      }
      
      public function set debugTree(param1:IntrospectionTree) : void
      {
         var _loc2_:Object = this._198239087debugTree;
         if(_loc2_ !== param1)
         {
            this._198239087debugTree = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"debugTree",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get inheritedCombo() : kCheckBox
      {
         return this._920039124inheritedCombo;
      }
      
      public function set inheritedCombo(param1:kCheckBox) : void
      {
         var _loc2_:Object = this._920039124inheritedCombo;
         if(_loc2_ !== param1)
         {
            this._920039124inheritedCombo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"inheritedCombo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get nodeValueTA() : kTextArea
      {
         return this._1035306812nodeValueTA;
      }
      
      public function set nodeValueTA(param1:kTextArea) : void
      {
         var _loc2_:Object = this._1035306812nodeValueTA;
         if(_loc2_ !== param1)
         {
            this._1035306812nodeValueTA = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nodeValueTA",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textFilterText() : kTextInput
      {
         return this._1621666350textFilterText;
      }
      
      public function set textFilterText(param1:kTextInput) : void
      {
         var _loc2_:Object = this._1621666350textFilterText;
         if(_loc2_ !== param1)
         {
            this._1621666350textFilterText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textFilterText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rowCount() : int
      {
         return this._17743701rowCount;
      }
      
      public function set rowCount(param1:int) : void
      {
         var _loc2_:Object = this._17743701rowCount;
         if(_loc2_ !== param1)
         {
            this._17743701rowCount = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rowCount",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get isWatchTarget() : Boolean
      {
         return this._543578186isWatchTarget;
      }
      
      public function set isWatchTarget(param1:Boolean) : void
      {
         var _loc2_:Object = this._543578186isWatchTarget;
         if(_loc2_ !== param1)
         {
            this._543578186isWatchTarget = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isWatchTarget",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dragActive() : Boolean
      {
         return this._1934499494dragActive;
      }
      
      public function set dragActive(param1:Boolean) : void
      {
         var _loc2_:Object = this._1934499494dragActive;
         if(_loc2_ !== param1)
         {
            this._1934499494dragActive = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dragActive",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _comboClasses() : Array
      {
         return this._1907346583_comboClasses;
      }
      
      private function set _comboClasses(param1:Array) : void
      {
         var _loc2_:Object = this._1907346583_comboClasses;
         if(_loc2_ !== param1)
         {
            this._1907346583_comboClasses = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_comboClasses",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get showRoot() : Boolean
      {
         return this._338884225showRoot;
      }
      
      public function set showRoot(param1:Boolean) : void
      {
         var _loc2_:Object = this._338884225showRoot;
         if(_loc2_ !== param1)
         {
            this._338884225showRoot = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showRoot",_loc2_,param1));
            }
         }
      }
   }
}

