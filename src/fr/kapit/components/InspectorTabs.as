package fr.kapit.components
{
   import flash.display.DisplayObject;
   import flash.events.EventDispatcher;
   import fr.kapit.assets.ComponentIcons;
   import fr.kapit.events.KapDebugEventDispatcher;
   import fr.kapit.events.OpenInspectorCommandEvent;
   import fr.kapit.introspection.events.InspectorActivatedEvent;
   import fr.kapit.tree.DebugComponent;
   import fr.kapit.utils.ApplicationUtils;
   import fr.kapit.utils.ClassUtils;
   import mx.containers.VBox;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   public class InspectorTabs extends VBox implements IKapDebugDataSetter
   {
      private var _1827565232_target:Object;
      
      public var targetName:String;
      
      public var host:Object;
      
      public var dispatcher:EventDispatcher;
      
      public var defaultComponents:Array;
      
      public var initialView:String = DebugComponent.NAME;
      
      private var dum1:StyleComponent;
      
      private var views:Object = {};
      
      public function InspectorTabs()
      {
         super();
         addEventListener(FlexEvent.CREATION_COMPLETE,this.this_creationCompleteHandler);
      }
      
      private function this_creationCompleteHandler(param1:FlexEvent) : void
      {
         removeEventListener(FlexEvent.CREATION_COMPLETE,this.this_creationCompleteHandler);
         KapDebugEventDispatcher.instance.addEventListener(OpenInspectorCommandEvent.NAME,this._onOpenInspector,false,0,true);
         this.activateView(this.initialView);
         if(!this.dispatcher)
         {
            this.dispatcher = ApplicationUtils.application;
         }
      }
      
      public function activateView(param1:String) : void
      {
         var _loc3_:KapDebugComponentFactory = null;
         var _loc2_:IKapDebugComponent = IKapDebugComponent(this.views[param1]);
         if(_loc2_)
         {
            this.selectedChild = _loc2_ as DisplayObject;
         }
         else
         {
            _loc3_ = ComponentManager.instance.getComponentFactory(param1);
            if(_loc3_)
            {
               _loc2_ = this.createChild(_loc3_);
               _loc2_.label = _loc3_.label;
               this.views[param1] = _loc2_;
            }
         }
         KapDebugEventDispatcher.instance.dispatchEvent(new InspectorActivatedEvent(param1,IKapDebugComponent(_loc2_).target));
      }
      
      public function closeView(param1:String) : void
      {
         var _loc2_:IKapDebugComponent = IKapDebugComponent(this.views[param1]);
         if(_loc2_)
         {
            _loc2_.dispose();
            delete this.views[param1];
            var _loc3_:int = 0;
            var _loc4_:* = this.views;
            for(param1 in _loc4_)
            {
               KapDebugEventDispatcher.instance.dispatchEvent(new OpenInspectorCommandEvent(param1,this._target));
            }
         }
      }
      
      public function get inspectorCount() : int
      {
         var _loc2_:Object = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.views)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function set selectedChild(param1:DisplayObject) : void
      {
         var _loc2_:DisplayObject = null;
         if(getChildren().length == 1)
         {
            _loc2_ = getChildAt(0);
            if(_loc2_ != param1)
            {
               removeChildAt(0);
               addChild(param1);
            }
         }
         else
         {
            addChild(param1);
         }
      }
      
      public function get selectedChild() : DisplayObject
      {
         if(getChildren().length == 1)
         {
            return getChildAt(0);
         }
         return null;
      }
      
      public function get activeViewName() : IKapDebugComponent
      {
         var _loc1_:IKapDebugComponent = IKapDebugComponent(this.selectedChild);
         return _loc1_ || null;
      }
      
      public function getView(param1:String) : IKapDebugComponent
      {
         return this.views[param1] as IKapDebugComponent;
      }
      
      public function setRoot(param1:Object, param2:String = "", param3:Object = null) : void
      {
         this.target = param1;
      }
      
      public function set target(param1:Object) : void
      {
         this._target = param1;
         label = ClassUtils.getLabelForDisplayNode(param1);
         icon = ComponentIcons.getClassIcon(param1);
      }
      
      public function get target() : Object
      {
         return this._target;
      }
      
      public function isTargetAcceptable(param1:Object) : Boolean
      {
         return true;
      }
      
      public function dispose() : void
      {
         var _loc1_:IKapDebugComponent = null;
         var _loc2_:String = null;
         KapDebugEventDispatcher.instance.removeEventListener(OpenInspectorCommandEvent.NAME,this._onOpenInspector);
         removeAllChildren();
         for(_loc2_ in this.views)
         {
            _loc1_ = this.views[_loc2_] as IKapDebugComponent;
            _loc1_.dispose();
            delete this.views[_loc2_];
         }
      }
      
      private function _onOpenInspector(param1:OpenInspectorCommandEvent) : void
      {
         if(!visible)
         {
            return;
         }
         if(param1.targetObject != this.target)
         {
            return;
         }
         var _loc2_:IKapDebugComponent = this.getView(param1.inspectorName);
         if(!_loc2_)
         {
            this.activateView(param1.inspectorName);
            _loc2_ = this.getView(param1.inspectorName);
         }
         _loc2_.setRoot(param1.targetObject,param1.name,param1.host);
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
      }
      
      private function createChild(param1:KapDebugComponentFactory) : IKapDebugComponent
      {
         var panelName:String = null;
         var factory:KapDebugComponentFactory = param1;
         var container:IKapDebugComponent = factory.newComponent();
         container.percentHeight = 100;
         container.percentWidth = 100;
         try
         {
            panelName = container["globalPanelName"] as String;
         }
         catch(e:Error)
         {
         }
         if(panelName)
         {
            this.target = ComponentManager.instance.getPanelObject(panelName);
         }
         container.setRoot(this.target,this.targetName,this.host);
         this.selectedChild = container as DisplayObject;
         return container;
      }
      
      [Bindable(event="propertyChange")]
      private function get _target() : Object
      {
         return this._1827565232_target;
      }
      
      private function set _target(param1:Object) : void
      {
         var _loc2_:Object = this._1827565232_target;
         if(_loc2_ !== param1)
         {
            this._1827565232_target = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_target",_loc2_,param1));
            }
         }
      }
   }
}

