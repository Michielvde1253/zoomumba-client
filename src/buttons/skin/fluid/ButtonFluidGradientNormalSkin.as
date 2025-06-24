package buttons.skin.fluid
{
   import components.textfield.gradientText.GradientText;
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
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ButtonFluidGradientNormalSkin extends AbstractButtonFluidNormalSkin implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _491821181gradientText:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Patterns_swf_PatternNormal_213163820:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ButtonFluidGradientNormalSkin()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Patterns_swf_PatternNormal_213163820 = ButtonFluidGradientNormalSkin__embed_mxml__general_Patterns_swf_PatternNormal_213163820;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._ButtonFluidGradientNormalSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_buttons_skin_fluid_ButtonFluidGradientNormalSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ButtonFluidGradientNormalSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.texture = this._embed_mxml__general_Patterns_swf_PatternNormal_213163820;
         this._ButtonFluidGradientNormalSkin_GradientText1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ButtonFluidGradientNormalSkin._watcherSetupUtil = param1;
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
      
      override protected function init() : void
      {
         super.init();
         this.addElement(this.gradientText);
      }
      
      override protected function dispose() : void
      {
         if(this.getElementIndex(this.gradientText) != -1)
         {
            this.removeElement(this.gradientText);
         }
         super.dispose();
      }
      
      private function _ButtonFluidGradientNormalSkin_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.horizontalCenter = 0;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.verticalCenter = 0;
         _loc1_.id = "gradientText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.gradientText = _loc1_;
         BindingManager.executeBindings(this,"gradientText",this.gradientText);
         return _loc1_;
      }
      
      private function _ButtonFluidGradientNormalSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.label;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"gradientText.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get gradientText() : GradientText
      {
         return this._491821181gradientText;
      }
      
      public function set gradientText(param1:GradientText) : void
      {
         var _loc2_:Object = this._491821181gradientText;
         if(_loc2_ !== param1)
         {
            this._491821181gradientText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gradientText",_loc2_,param1));
            }
         }
      }
   }
}

