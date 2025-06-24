package custom.mainMenu
{
   import buttons.extended.ButtonCircularZoomable;
   import buttons.skin.circularZoomable.ButtonCustomCircularSkin;
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
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
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.states.AddItems;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.VGroup;
   
   use namespace mx_internal;
   
   public class SettingsMenu extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _SettingsMenu_ButtonCircularZoomable1:ButtonCircularZoomable;
      
      private var _1254350186_SettingsMenu_VGroup1:VGroup;
      
      private var _410956671container:VGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_ComponentIcons_swf_HudOptionSettings_323694880:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SettingsMenu()
      {
         var bindings:Array;
         var watchers:Array;
         var _SettingsMenu_VGroup2_factory:DeferredInstanceFromFunction;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__components_ComponentIcons_swf_HudOptionSettings_323694880 = SettingsMenu__embed_mxml__components_ComponentIcons_swf_HudOptionSettings_323694880;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._SettingsMenu_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_mainMenu_SettingsMenuWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SettingsMenu[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._SettingsMenu_VGroup1_i()];
         this.currentState = "closed";
         _SettingsMenu_VGroup2_factory = new DeferredInstanceFromFunction(this._SettingsMenu_VGroup2_i);
         states = [new State({
            "name":"closed",
            "overrides":[]
         }),new State({
            "name":"opened",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SettingsMenu_VGroup2_factory,
               "destination":"_SettingsMenu_VGroup1",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         })];
         _SettingsMenu_VGroup2_factory.getInstance();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SettingsMenu._watcherSetupUtil = param1;
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
         super.initialize();
      }
      
      private function _SettingsMenu_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.right = 0;
         _loc1_.maxWidth = 55;
         _loc1_.mxmlContent = [this._SettingsMenu_ButtonCircularZoomable1_i()];
         _loc1_.id = "_SettingsMenu_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SettingsMenu_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_SettingsMenu_VGroup1",this._SettingsMenu_VGroup1);
         return _loc1_;
      }
      
      private function _SettingsMenu_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.width = 86;
         _loc1_.maxWidth = 86;
         _loc1_.minWidth = 86;
         _loc1_.paddingLeft = 12;
         _loc1_.paddingBottom = -26;
         _loc1_.horizontalAlign = "center";
         _loc1_.id = "container";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.container = _loc1_;
         BindingManager.executeBindings(this,"container",this.container);
         return _loc1_;
      }
      
      private function _SettingsMenu_ButtonCircularZoomable1_i() : ButtonCircularZoomable
      {
         var _loc1_:ButtonCircularZoomable = new ButtonCircularZoomable();
         _loc1_.bgScale = 0.4;
         _loc1_.iconClass = this._embed_mxml__components_ComponentIcons_swf_HudOptionSettings_323694880;
         _loc1_.setStyle("skinClass",ButtonCustomCircularSkin);
         _loc1_.addEventListener("click",this.___SettingsMenu_ButtonCircularZoomable1_click);
         _loc1_.id = "_SettingsMenu_ButtonCircularZoomable1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SettingsMenu_ButtonCircularZoomable1 = _loc1_;
         BindingManager.executeBindings(this,"_SettingsMenu_ButtonCircularZoomable1",this._SettingsMenu_ButtonCircularZoomable1);
         return _loc1_;
      }
      
      public function ___SettingsMenu_ButtonCircularZoomable1_click(param1:MouseEvent) : void
      {
         currentState = currentState == "opened" ? "closed" : "opened";
      }
      
      private function _SettingsMenu_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Array
         {
            var _loc1_:* = [0.7,0.8];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"_SettingsMenu_ButtonCircularZoomable1.iconScales");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SettingsMenu_VGroup1() : VGroup
      {
         return this._1254350186_SettingsMenu_VGroup1;
      }
      
      public function set _SettingsMenu_VGroup1(param1:VGroup) : void
      {
         var _loc2_:Object = this._1254350186_SettingsMenu_VGroup1;
         if(_loc2_ !== param1)
         {
            this._1254350186_SettingsMenu_VGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SettingsMenu_VGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get container() : VGroup
      {
         return this._410956671container;
      }
      
      public function set container(param1:VGroup) : void
      {
         var _loc2_:Object = this._410956671container;
         if(_loc2_ !== param1)
         {
            this._410956671container = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"container",_loc2_,param1));
            }
         }
      }
   }
}

