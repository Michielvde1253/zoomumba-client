package custom.features.collectable.book.content
{
   import custom.features.collectable.book.component.CollBookPageItem;
   import custom.features.collectable.book.component.CollBookPageMain;
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.DropShadowFilter;
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
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.VGroup;
   
   use namespace mx_internal;
   
   public class CollBookContPageMain extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _100525951item2:CollBookPageItem;
      
      private var _100525952item3:CollBookPageItem;
      
      private var _3343801main:CollBookPageMain;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CollBookContPageMain()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CollBookContPageMain_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_collectable_book_content_CollBookContPageMainWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CollBookContPageMain[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 240;
         this.height = 280;
         this.mxmlContent = [this._CollBookContPageMain_VGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CollBookContPageMain._watcherSetupUtil = param1;
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
      
      private function _CollBookContPageMain_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.top = 10;
         _loc1_.mxmlContent = [this._CollBookContPageMain_CollBookPageMain1_i(),this._CollBookContPageMain_CollBookPageItem1_i(),this._CollBookContPageMain_CollBookPageItem2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollBookContPageMain_CollBookPageMain1_i() : CollBookPageMain
      {
         var _loc1_:CollBookPageMain = new CollBookPageMain();
         _loc1_.id = "main";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.main = _loc1_;
         BindingManager.executeBindings(this,"main",this.main);
         return _loc1_;
      }
      
      private function _CollBookContPageMain_CollBookPageItem1_i() : CollBookPageItem
      {
         var _loc1_:CollBookPageItem = new CollBookPageItem();
         _loc1_.type = "type1";
         _loc1_.currentState = "left";
         _loc1_.pageRefId = 2;
         _loc1_.id = "item2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.item2 = _loc1_;
         BindingManager.executeBindings(this,"item2",this.item2);
         return _loc1_;
      }
      
      private function _CollBookContPageMain_CollBookPageItem2_i() : CollBookPageItem
      {
         var _loc1_:CollBookPageItem = null;
         _loc1_ = new CollBookPageItem();
         _loc1_.type = "type2";
         _loc1_.currentState = "left";
         _loc1_.showBottomRow = false;
         _loc1_.pageRefId = 3;
         _loc1_.id = "item3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.item3 = _loc1_;
         BindingManager.executeBindings(this,"item3",this.item3);
         return _loc1_;
      }
      
      private function _CollBookContPageMain_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Array
         {
            var _loc1_:* = [new DropShadowFilter(1,65,0,0.4,6,6,0.8)];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"main.filters");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get item2() : CollBookPageItem
      {
         return this._100525951item2;
      }
      
      public function set item2(param1:CollBookPageItem) : void
      {
         var _loc2_:Object = this._100525951item2;
         if(_loc2_ !== param1)
         {
            this._100525951item2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"item2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get item3() : CollBookPageItem
      {
         return this._100525952item3;
      }
      
      public function set item3(param1:CollBookPageItem) : void
      {
         var _loc2_:Object = this._100525952item3;
         if(_loc2_ !== param1)
         {
            this._100525952item3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"item3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get main() : CollBookPageMain
      {
         return this._3343801main;
      }
      
      public function set main(param1:CollBookPageMain) : void
      {
         var _loc2_:Object = this._3343801main;
         if(_loc2_ !== param1)
         {
            this._3343801main = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"main",_loc2_,param1));
            }
         }
      }
   }
}

