package fr.kapit.components
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
   import fr.kapit.introspection.ClassDescriptor;
   import fr.kapit.introspection.ClassProxy;
   import fr.kapit.introspection.oldnodes.AbstractNode;
   import fr.kapit.introspection.oldnodes.ClassNode;
   import fr.kapit.menu.ContextMenuHelper;
   import fr.kapit.tree.ClassDescTreeDescriptor;
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.containers.VBox;
   import mx.controls.Tree;
   import mx.controls.treeClasses.ITreeDataDescriptor;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ClassOutlineComponent extends AbstractKapDebugComponent implements IKapDebugComponent, IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public static var NAME:String = "ClassOutlineComponent";
      
      public static var LABEL:String = "Outline";
      
      private var _110624852tree2:Tree;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var outlineDataProvider:ArrayCollection;
      
      public var targetDescriptor:ClassDescriptor;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ClassOutlineComponent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":AbstractKapDebugComponent,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":VBox,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Tree,
                           "id":"tree2",
                           "events":{"change":"__tree2_change"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "iconFunction":_getIconForTree
                              };
                           }
                        })]
                     };
                  }
               })]};
            }
         });
         this.outlineDataProvider = new ArrayCollection();
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._ClassOutlineComponent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_fr_kapit_components_ClassOutlineComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ClassOutlineComponent[param1];
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
      
      public static function get factory() : KapDebugComponentFactory
      {
         return new KapDebugComponentFactory(NAME,LABEL,ClassOutlineComponent,EmbeddedAssets.iconOutlineOn,EmbeddedAssets.iconOutlineOff,EmbeddedAssets.iconOutlineOver,null,new KapDebugShortcut(false,false,false,116,NAME));
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ClassOutlineComponent._watcherSetupUtil = param1;
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
      
      override public function setRoot(param1:Object, param2:String = "", param3:Object = null) : void
      {
         super.target = param1;
         this.targetDescriptor = param1 is ClassDescriptor ? param1 as ClassDescriptor : ClassProxy.getInstance().getDescriptor(param1);
         this._createOutline();
      }
      
      override public function registerView(param1:String) : void
      {
         ComponentManager.instance.registerView(ClassOutlineComponent,param1);
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this.tree2)
         {
            this.tree2.dataProvider = this.outlineDataProvider;
            callLater(this._initialOpen);
         }
      }
      
      private function _initialOpen() : void
      {
         try
         {
            this.tree2.expandItem(this.outlineDataProvider[0],true);
         }
         catch(e:Error)
         {
         }
      }
      
      private function _createOutline() : void
      {
         this.outlineDataProvider = new ArrayCollection([new ClassNode(this.targetDescriptor,null,true)]);
         invalidateProperties();
      }
      
      private function _getClassIconForList(param1:ClassDescriptor) : Class
      {
         return ComponentIcons.getClassIcon(param1.type);
      }
      
      private function _getIconForTree(param1:AbstractNode) : Class
      {
         var _loc2_:Object = null;
         var _loc3_:ClassDescriptor = null;
         if(param1 is ClassNode)
         {
            _loc3_ = ClassDescriptor(ClassNode(param1).descriptor);
            if(_loc3_ is ClassDescriptor)
            {
               _loc2_ = ClassDescriptor(_loc3_).type;
            }
         }
         if(_loc2_)
         {
            return ComponentIcons.getClassIcon(_loc2_);
         }
         return null;
      }
      
      private function _onChange() : void
      {
         ContextMenuHelper.prepareDebugNodeMenu(this,this.tree2.selectedItem);
      }
      
      public function __tree2_change(param1:ListEvent) : void
      {
         this._onChange();
      }
      
      private function _ClassOutlineComponent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():ITreeDataDescriptor
         {
            return new ClassDescTreeDescriptor();
         },null,"tree2.dataDescriptor");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get tree2() : Tree
      {
         return this._110624852tree2;
      }
      
      public function set tree2(param1:Tree) : void
      {
         var _loc2_:Object = this._110624852tree2;
         if(_loc2_ !== param1)
         {
            this._110624852tree2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tree2",_loc2_,param1));
            }
         }
      }
   }
}

