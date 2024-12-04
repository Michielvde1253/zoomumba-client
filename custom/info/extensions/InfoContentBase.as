package custom.info.extensions
{
   import components.textfield.StandardText;
   import custom.info.core.AbstractInfo;
   import custom.info.groups.InfoDisplayGroupPreview;
   import custom.info.groups.InfoDisplayGroupRight;
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
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.VGroup;
   import spark.core.SpriteVisualElement;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderInfoMarkSkin;
   
   use namespace mx_internal;
   
   public class InfoContentBase extends AbstractInfo implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _InfoContentBase_StandardText1:StandardText;
      
      public var _InfoContentBase_WindowHeader1:WindowHeader;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function InfoContentBase()
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
         bindings = this._InfoContentBase_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_info_extensions_InfoContentBaseWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return InfoContentBase[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._InfoContentBase_InnerGroup1_c(),this._InfoContentBase_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         InfoContentBase._watcherSetupUtil = param1;
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
      
      private function _InfoContentBase_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._InfoContentBase_Group1_c(),this._InfoContentBase_Group2_c(),this._InfoContentBase_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentBase_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.right = 60;
         _loc1_.width = 200;
         _loc1_.top = 120;
         _loc1_.bottom = 90;
         _loc1_.mxmlContent = [this._InfoContentBase_StandardText1_i(),this._InfoContentBase_InfoDisplayGroupRight1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentBase_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "_InfoContentBase_StandardText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoContentBase_StandardText1 = _loc1_;
         BindingManager.executeBindings(this,"_InfoContentBase_StandardText1",this._InfoContentBase_StandardText1);
         return _loc1_;
      }
      
      private function _InfoContentBase_InfoDisplayGroupRight1_i() : InfoDisplayGroupRight
      {
         var _loc1_:InfoDisplayGroupRight = new InfoDisplayGroupRight();
         _loc1_.bottom = 0;
         _loc1_.id = "groupRight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         groupRight = _loc1_;
         BindingManager.executeBindings(this,"groupRight",groupRight);
         return _loc1_;
      }
      
      private function _InfoContentBase_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 50;
         _loc1_.top = 130;
         _loc1_.width = 300;
         _loc1_.maxWidth = 300;
         _loc1_.height = 240;
         _loc1_.maxHeight = 240;
         _loc1_.mxmlContent = [this._InfoContentBase_SpriteVisualElement1_i(),this._InfoContentBase_InfoDisplayGroupPreview1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentBase_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"container");
         container = _loc1_;
         BindingManager.executeBindings(this,"container",container);
         return _loc1_;
      }
      
      private function _InfoContentBase_InfoDisplayGroupPreview1_i() : InfoDisplayGroupPreview
      {
         var _loc1_:InfoDisplayGroupPreview = new InfoDisplayGroupPreview();
         _loc1_.id = "groupPreview";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         groupPreview = _loc1_;
         BindingManager.executeBindings(this,"groupPreview",groupPreview);
         return _loc1_;
      }
      
      private function _InfoContentBase_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.bottom = 55;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentBase_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._InfoContentBase_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoContentBase_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 18;
         _loc1_.setStyle("skinClass",WindowHeaderInfoMarkSkin);
         _loc1_.id = "_InfoContentBase_WindowHeader1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoContentBase_WindowHeader1 = _loc1_;
         BindingManager.executeBindings(this,"_InfoContentBase_WindowHeader1",this._InfoContentBase_WindowHeader1);
         return _loc1_;
      }
      
      private function _InfoContentBase_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_InfoContentBase_StandardText1.htmlText","text");
         result[1] = new Binding(this,null,null,"_InfoContentBase_WindowHeader1.text","title");
         result[2] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_40;
         },null,"_InfoContentBase_WindowHeader1.skinSize");
         return result;
      }
   }
}

