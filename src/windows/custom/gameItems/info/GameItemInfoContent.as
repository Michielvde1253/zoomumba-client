package windows.custom.gameItems.info
{
   import buttons.simpleButton.BuyButtonGoldSkin;
   import buttons.simpleButton.BuyButtonNormalSkin;
   import custom.info.events.InfoSexChangeEvent;
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
   import general.paginator.Paginator;
   import mx.binding.*;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import utils.Color;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderInfoMarkSkin;
   
   use namespace mx_internal;
   
   public class GameItemInfoContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1474842281_inner:InnerGroup;
      
      private var _1221270899header:WindowHeader;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _414082947_perspective:GameItemInfoPerspectives;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function GameItemInfoContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._414082947_perspective = new GameItemInfoPerspectives();
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._GameItemInfoContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_gameItems_info_GameItemInfoContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return GameItemInfoContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._GameItemInfoContent_InnerGroup1_i(),this._GameItemInfoContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         GameItemInfoContent._watcherSetupUtil = param1;
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
      
      private function perspectiveInitialize(param1:FlexEvent) : void
      {
         this.perspective.addEventListener(InfoSexChangeEvent.CHANGED,this.dispatchAgain);
         if(this.perspective.created)
         {
            dispatchEvent(new FlexEvent(FlexEvent.UPDATE_COMPLETE));
         }
      }
      
      public function destroy() : void
      {
         this.perspective.removeEventListener(InfoSexChangeEvent.CHANGED,this.dispatchAgain);
         this._perspective = null;
      }
      
      private function get perspective() : GameItemInfoPerspectives
      {
         return this._perspective;
      }
      
      public function setPerspective(param1:String) : void
      {
         this.perspective.currentState = param1;
      }
      
      public function setExoticness(param1:int) : void
      {
         if(this.perspective.infoExoticness)
         {
            this.perspective.infoExoticness.stars = param1;
         }
      }
      
      public function setAttraction(param1:int) : void
      {
         if(this.perspective.infoAttraction)
         {
            this.perspective.infoAttraction.value = param1;
         }
      }
      
      public function setExpansion(param1:int) : void
      {
         if(this.perspective.infoExpansion)
         {
            this.perspective.infoExpansion.visible = param1 > 0;
            this.perspective.infoExpansion.value = param1;
         }
      }
      
      public function showLockTo(param1:Boolean, param2:int = 0) : void
      {
         if(this.perspective.infoLockTo)
         {
            this.perspective.infoLockTo.visible = param1;
         }
      }
      
      public function displayTypeAnimal(param1:int = 0) : void
      {
         this.perspective.displayTypeAnimal(param1);
      }
      
      public function setBuyable(param1:Boolean) : void
      {
         this.perspective.buyable = param1;
      }
      
      public function setSex(param1:Boolean) : void
      {
         this.perspective.setSex(param1);
      }
      
      public function setLock(param1:int, param2:Boolean) : void
      {
         if(this.perspective.infoLock)
         {
            this.perspective.infoLock.level = param1;
            this.perspective.infoLock.locked = param2;
         }
      }
      
      public function setLevelXP(param1:int, param2:int) : void
      {
         if(this.perspective.infoLevel)
         {
            this.perspective.infoLevel.level = param1;
            this.perspective.infoLevel.xpPercentage = param2;
         }
      }
      
      public function setFood(param1:DisplayObject) : void
      {
         if(this.perspective.infoFood)
         {
            this.perspective.infoFood.addContent(param1);
         }
      }
      
      public function getCageSpeciesPaginator() : Paginator
      {
         if(this.perspective.infoCageSpecies)
         {
            return this.perspective.infoCageSpecies.paginator;
         }
         return null;
      }
      
      public function addCageSpeciesContent(param1:DisplayObject) : void
      {
         if(this.perspective.infoCageSpecies)
         {
            this.perspective.infoCageSpecies.addContent(param1);
         }
      }
      
      public function setCageSpeciesMatch(param1:Boolean, param2:Boolean = true) : void
      {
         if(this.perspective.infoCageSpecies)
         {
            this.perspective.infoCageSpecies.match.visible = param1;
            this.perspective.infoCageSpecies.match.currentState = param2 ? "love" : "crazy";
         }
      }
      
      public function setText(param1:String) : void
      {
         this.perspective.textMain.text = param1;
      }
      
      public function setClock(param1:String) : void
      {
         if(this.perspective.labelClock)
         {
            this.perspective.labelClock.text = param1;
         }
      }
      
      public function setPrice(param1:int, param2:Object, param3:Boolean) : void
      {
         if(this.perspective.labelPrice)
         {
            this.perspective.labelPrice.value = param1;
            this.perspective.labelPrice.canAfford = param3;
            this.perspective.labelPrice.setDisplaySource(param2);
         }
      }
      
      public function setSpecialBonusPercentage(param1:int, param2:String) : void
      {
         if(this.perspective.labelSpecialPerc)
         {
            this.perspective.labelSpecialPerc.type = param2;
            this.perspective.labelSpecialPerc.text = "+" + param1 + "%";
         }
      }
      
      public function setBuyButton(param1:String, param2:String) : void
      {
         if(this.perspective.buttonBuy)
         {
            this.perspective.buttonBuy.label = param1;
            this.perspective.buttonBuy.enabled = true;
            this.perspective.buttonBuy.filters = [];
            switch(param2)
            {
               case "normal":
                  this.perspective.buttonBuy.setStyle("skinClass",BuyButtonNormalSkin);
                  break;
               case "deEmphasized":
                  this.perspective.buttonBuy.enabled = false;
                  this.perspective.buttonBuy.setStyle("skinClass",BuyButtonNormalSkin);
                  this.perspective.buttonBuy.filters = [Color.getColorMatrixFilter(Color.SEPIA)];
                  break;
               case "disabled":
                  this.perspective.buttonBuy.enabled = false;
                  this.perspective.buttonBuy.setStyle("skinClass",BuyButtonNormalSkin);
                  this.perspective.buttonBuy.filters = [Color.getColorMatrixFilter(Color.SEPIA)];
                  break;
               case "gold":
                  this.perspective.buttonBuy.setStyle("skinClass",BuyButtonGoldSkin);
            }
         }
      }
      
      public function addContent(param1:DisplayObject) : void
      {
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         if(this.perspective != null && param1 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < this.perspective.spriteContainer.numChildren)
            {
               _loc3_ = this.perspective.spriteContainer.getChildAt(_loc2_);
               this.perspective.spriteContainer.removeChild(_loc3_);
               _loc2_++;
            }
            this.perspective.spriteContainer.addChild(param1);
         }
      }
      
      private function dispatchAgain(param1:InfoSexChangeEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function _GameItemInfoContent_InnerGroup1_i() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.addEventListener("creationComplete",this.___inner_creationComplete);
         _loc1_.id = "_inner";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._inner = _loc1_;
         BindingManager.executeBindings(this,"_inner",this._inner);
         return _loc1_;
      }
      
      public function ___inner_creationComplete(param1:FlexEvent) : void
      {
         this.perspectiveInitialize(param1);
      }
      
      private function _GameItemInfoContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._GameItemInfoContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _GameItemInfoContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 22;
         _loc1_.setStyle("skinClass",WindowHeaderInfoMarkSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _GameItemInfoContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Array
         {
            var _loc1_:* = [_perspective];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"_inner.mxmlContent");
         result[1] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_40;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _inner() : InnerGroup
      {
         return this._1474842281_inner;
      }
      
      public function set _inner(param1:InnerGroup) : void
      {
         var _loc2_:Object = this._1474842281_inner;
         if(_loc2_ !== param1)
         {
            this._1474842281_inner = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_inner",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get header() : WindowHeader
      {
         return this._1221270899header;
      }
      
      public function set header(param1:WindowHeader) : void
      {
         var _loc2_:Object = this._1221270899header;
         if(_loc2_ !== param1)
         {
            this._1221270899header = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"header",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _perspective() : GameItemInfoPerspectives
      {
         return this._414082947_perspective;
      }
      
      private function set _perspective(param1:GameItemInfoPerspectives) : void
      {
         var _loc2_:Object = this._414082947_perspective;
         if(_loc2_ !== param1)
         {
            this._414082947_perspective = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_perspective",_loc2_,param1));
            }
         }
      }
   }
}

