package windows.custom.advBreeding.steps
{
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import buttons.skin.sign.ButtonArrowSkin;
   import components.image.BackgroundImage;
   import components.image.CircularDisplayImage;
   import components.image.StandardImage;
   import components.textfield.StandardText;
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
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   use namespace mx_internal;
   
   public class AdvancedBreedingStep1 extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _89695958_nextBtn:Button;
      
      private var _2040003050_prevBtn:Button;
      
      private var _1212609315btnContinue:Button;
      
      private var _1378241396bubble:StandardImage;
      
      private var _428816093circularDisplay:CircularDisplayImage;
      
      private var _1011692561paginator:Paginator;
      
      private var _109620778sonia:StandardImage;
      
      private var _1365610521textBubble:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AdvancedBreedingStep1()
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
         bindings = this._AdvancedBreedingStep1_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_advBreeding_steps_AdvancedBreedingStep1WatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AdvancedBreedingStep1[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._AdvancedBreedingStep1_InnerGroup1_c(),this._AdvancedBreedingStep1_OuterGroup1_c()];
         this._AdvancedBreedingStep1_Paginator1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AdvancedBreedingStep1._watcherSetupUtil = param1;
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
      
      private function _AdvancedBreedingStep1_Paginator1_i() : Paginator
      {
         var _loc1_:Paginator = new Paginator();
         _loc1_.entriesPerPage = 1;
         this.paginator = _loc1_;
         BindingManager.executeBindings(this,"paginator",this.paginator);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep1_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._AdvancedBreedingStep1_BackgroundImage1_c(),this._AdvancedBreedingStep1_StandardImage1_i(),this._AdvancedBreedingStep1_StandardText1_i(),this._AdvancedBreedingStep1_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep1_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 1.3;
         _loc1_.y = 75;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep1_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.x = 165;
         _loc1_.y = 60;
         _loc1_.id = "bubble";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bubble = _loc1_;
         BindingManager.executeBindings(this,"bubble",this.bubble);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep1_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 350;
         _loc1_.x = 225;
         _loc1_.y = 96;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "textBubble";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textBubble = _loc1_;
         BindingManager.executeBindings(this,"textBubble",this.textBubble);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep1_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.verticalCenter = 60;
         _loc1_.mxmlContent = [this._AdvancedBreedingStep1_Button1_i(),this._AdvancedBreedingStep1_Group2_c(),this._AdvancedBreedingStep1_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep1_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.scaleX = -1;
         _loc1_.setStyle("skinClass",ButtonArrowSkin);
         _loc1_.id = "_prevBtn";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._prevBtn = _loc1_;
         BindingManager.executeBindings(this,"_prevBtn",this._prevBtn);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep1_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._AdvancedBreedingStep1_BackgroundImage2_c(),this._AdvancedBreedingStep1_CircularDisplayImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep1_BackgroundImage2_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 1.1;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep1_CircularDisplayImage1_i() : CircularDisplayImage
      {
         var _loc1_:CircularDisplayImage = new CircularDisplayImage();
         _loc1_.maskScale = 1.1;
         _loc1_.currentState = "maskCircle";
         _loc1_.id = "circularDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.circularDisplay = _loc1_;
         BindingManager.executeBindings(this,"circularDisplay",this.circularDisplay);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep1_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.setStyle("skinClass",ButtonArrowSkin);
         _loc1_.id = "_nextBtn";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._nextBtn = _loc1_;
         BindingManager.executeBindings(this,"_nextBtn",this._nextBtn);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep1_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._AdvancedBreedingStep1_StandardImage2_i(),this._AdvancedBreedingStep1_Button3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep1_StandardImage2_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.x = 34;
         _loc1_.y = 63;
         _loc1_.id = "sonia";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sonia = _loc1_;
         BindingManager.executeBindings(this,"sonia",this.sonia);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep1_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "goto 2";
         _loc1_.width = 136;
         _loc1_.height = 42;
         _loc1_.bottom = 22;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.addEventListener("click",this.__btnContinue_click);
         _loc1_.id = "btnContinue";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnContinue = _loc1_;
         BindingManager.executeBindings(this,"btnContinue",this.btnContinue);
         return _loc1_;
      }
      
      public function __btnContinue_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("continueClicked"));
      }
      
      private function _AdvancedBreedingStep1_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"paginator.nextButton","_nextBtn");
         _loc1_[1] = new Binding(this,null,null,"paginator.prevButton","_prevBtn");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _nextBtn() : Button
      {
         return this._89695958_nextBtn;
      }
      
      public function set _nextBtn(param1:Button) : void
      {
         var _loc2_:Object = this._89695958_nextBtn;
         if(_loc2_ !== param1)
         {
            this._89695958_nextBtn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_nextBtn",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _prevBtn() : Button
      {
         return this._2040003050_prevBtn;
      }
      
      public function set _prevBtn(param1:Button) : void
      {
         var _loc2_:Object = this._2040003050_prevBtn;
         if(_loc2_ !== param1)
         {
            this._2040003050_prevBtn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_prevBtn",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnContinue() : Button
      {
         return this._1212609315btnContinue;
      }
      
      public function set btnContinue(param1:Button) : void
      {
         var _loc2_:Object = this._1212609315btnContinue;
         if(_loc2_ !== param1)
         {
            this._1212609315btnContinue = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnContinue",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bubble() : StandardImage
      {
         return this._1378241396bubble;
      }
      
      public function set bubble(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1378241396bubble;
         if(_loc2_ !== param1)
         {
            this._1378241396bubble = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubble",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get circularDisplay() : CircularDisplayImage
      {
         return this._428816093circularDisplay;
      }
      
      public function set circularDisplay(param1:CircularDisplayImage) : void
      {
         var _loc2_:Object = this._428816093circularDisplay;
         if(_loc2_ !== param1)
         {
            this._428816093circularDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"circularDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get paginator() : Paginator
      {
         return this._1011692561paginator;
      }
      
      public function set paginator(param1:Paginator) : void
      {
         var _loc2_:Object = this._1011692561paginator;
         if(_loc2_ !== param1)
         {
            this._1011692561paginator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"paginator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sonia() : StandardImage
      {
         return this._109620778sonia;
      }
      
      public function set sonia(param1:StandardImage) : void
      {
         var _loc2_:Object = this._109620778sonia;
         if(_loc2_ !== param1)
         {
            this._109620778sonia = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sonia",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textBubble() : StandardText
      {
         return this._1365610521textBubble;
      }
      
      public function set textBubble(param1:StandardText) : void
      {
         var _loc2_:Object = this._1365610521textBubble;
         if(_loc2_ !== param1)
         {
            this._1365610521textBubble = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textBubble",_loc2_,param1));
            }
         }
      }
   }
}

