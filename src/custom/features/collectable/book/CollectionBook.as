package custom.features.collectable.book
{
   import buttons.skin.sign.ButtonArrowSkin;
   import custom.features.collectable.book.component.RibbonBar;
   import custom.features.collectable.book.content.CollBookContPageCategory;
   import custom.features.collectable.book.content.CollBookContPageMain;
   import custom.features.collectable.book.content.CollBookContPageSec;
   import custom.features.collectable.book.events.BookStateEvent;
   import custom.features.collectable.button.CollWindowButton;
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
   import general.paginator.Paginator;
   import mx.binding.*;
   import mx.controls.Image;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class CollectionBook extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _CollectionBook_BitmapImage1:BitmapImage;
      
      public var _CollectionBook_HGroup1:HGroup;
      
      public var _CollectionBook_HGroup2:HGroup;
      
      public var _CollectionBook_HGroup4:HGroup;
      
      public var _CollectionBook_HGroup5:HGroup;
      
      private var _1208674726_CollectionBook_HGroup6:HGroup;
      
      public var _CollectionBook_Image2:Image;
      
      public var _CollectionBook_Image3:Image;
      
      public var _CollectionBook_Image6:Image;
      
      private var _318058509contCategLeft:CollBookContPageCategory;
      
      private var _1275540182contCategRight:CollBookContPageCategory;
      
      private var _1585699061contInternLeft:CollBookContPageMain;
      
      private var _1906369640contInternRight:CollBookContPageSec;
      
      private var _94852023cover:HGroup;
      
      private var _1242339553coverTitle:Image;
      
      private var _1989774883exchange:CollWindowButton;
      
      private var _3198785help:CollWindowButton;
      
      private var _1424273442nextPage:Button;
      
      private var _859215670pageLeft:Image;
      
      private var _871542989pageRight:Image;
      
      private var _1011692561paginator:Paginator;
      
      private var _1113514890preloader:Image;
      
      private var _1274534046prevPage:Button;
      
      private var _1572967543ribonBar:RibbonBar;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1110417475label1:String;
      
      private var _1110417474label2:String;
      
      private var _1110417473label3:String;
      
      private var _1110417472label4:String;
      
      private var _1451884636coverTitleSource:String;
      
      private var _957319889$lineHalfBookSource:*;
      
      private var _727266982$bookCoverSPRSource:*;
      
      private var _1428967991$pageRightCoverSource:*;
      
      private var _1691482078$pageRightPaperSource:*;
      
      private var _593525496$pageLeftCoverSource:*;
      
      private var _580991731$pageLeftPaperSource:*;
      
      private var _currentIndex:int;
      
      private var _event:BookStateEvent;
      
      private var _embed_mxml__general_Decorations_swf_LoaderProgress_1407024497:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CollectionBook()
      {
         var watchers:Array;
         var _CollectionBook_BitmapImage1_factory:DeferredInstanceFromFunction;
         var _CollectionBook_Button1_factory:DeferredInstanceFromFunction;
         var _CollectionBook_Button2_factory:DeferredInstanceFromFunction;
         var _CollectionBook_CollWindowButton1_factory:DeferredInstanceFromFunction;
         var _CollectionBook_CollWindowButton2_factory:DeferredInstanceFromFunction;
         var _CollectionBook_HGroup1_factory:DeferredInstanceFromFunction;
         var _CollectionBook_HGroup2_factory:DeferredInstanceFromFunction;
         var _CollectionBook_HGroup3_factory:DeferredInstanceFromFunction;
         var _CollectionBook_HGroup4_factory:DeferredInstanceFromFunction;
         var _CollectionBook_HGroup5_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._event = new BookStateEvent(BookStateEvent.CHANGED);
         this._embed_mxml__general_Decorations_swf_LoaderProgress_1407024497 = CollectionBook__embed_mxml__general_Decorations_swf_LoaderProgress_1407024497;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CollectionBook_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_collectable_book_CollectionBookWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CollectionBook[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 600;
         this.height = 305;
         this.mxmlContent = [this._CollectionBook_Image1_i(),this._CollectionBook_RibbonBar1_i(),this._CollectionBook_HGroup6_i()];
         this.currentState = "cover";
         this._CollectionBook_Paginator1_i();
         _CollectionBook_BitmapImage1_factory = new DeferredInstanceFromFunction(this._CollectionBook_BitmapImage1_i);
         _CollectionBook_Button1_factory = new DeferredInstanceFromFunction(this._CollectionBook_Button1_i);
         _CollectionBook_Button2_factory = new DeferredInstanceFromFunction(this._CollectionBook_Button2_i);
         _CollectionBook_CollWindowButton1_factory = new DeferredInstanceFromFunction(this._CollectionBook_CollWindowButton1_i);
         _CollectionBook_CollWindowButton2_factory = new DeferredInstanceFromFunction(this._CollectionBook_CollWindowButton2_i);
         _CollectionBook_HGroup1_factory = new DeferredInstanceFromFunction(this._CollectionBook_HGroup1_i);
         _CollectionBook_HGroup2_factory = new DeferredInstanceFromFunction(this._CollectionBook_HGroup2_i);
         _CollectionBook_HGroup3_factory = new DeferredInstanceFromFunction(this._CollectionBook_HGroup3_i);
         _CollectionBook_HGroup4_factory = new DeferredInstanceFromFunction(this._CollectionBook_HGroup4_i);
         _CollectionBook_HGroup5_factory = new DeferredInstanceFromFunction(this._CollectionBook_HGroup5_i);
         states = [new State({
            "name":"cover",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CollectionBook_HGroup3_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["ribonBar"]
            }),new SetProperty().initializeFromObject({
               "target":"ribonBar",
               "name":"y",
               "value":295
            })]
         }),new State({
            "name":"categories",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CollectionBook_Button2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["ribonBar"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollectionBook_Button1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["ribonBar"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollectionBook_HGroup4_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["ribonBar"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollectionBook_BitmapImage1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["ribonBar"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollectionBook_HGroup2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["ribonBar"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollectionBook_HGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["preloader"]
            })]
         }),new State({
            "name":"page",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CollectionBook_CollWindowButton2_factory,
               "destination":"_CollectionBook_HGroup6",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollectionBook_CollWindowButton1_factory,
               "destination":"_CollectionBook_HGroup6",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollectionBook_Button2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["ribonBar"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollectionBook_Button1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["ribonBar"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollectionBook_HGroup5_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["ribonBar"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollectionBook_BitmapImage1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["ribonBar"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollectionBook_HGroup2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["ribonBar"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollectionBook_HGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["preloader"]
            })]
         })];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CollectionBook._watcherSetupUtil = param1;
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
      
      public function get currentIndex() : int
      {
         return this._currentIndex;
      }
      
      public function switchState(param1:String, param2:int) : void
      {
         this._event.indexChanged = this._currentIndex != Math.min(param2,this.ribonBar.amount);
         this._event.index = this._currentIndex = Math.min(param2,this.ribonBar.amount);
         if(currentState != param1)
         {
            currentState = param1;
         }
         else
         {
            this._event.state = param1;
            this._event.stateChanged = false;
            dispatchEvent(this._event);
         }
         this.ribonBar.activateRibbon(this._currentIndex);
      }
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         super.stateChanged(param1,param2,param3);
         this._event.state = param2;
         this._event.stateChanged = param2 != param1;
         dispatchEvent(this._event);
      }
      
      private function _CollectionBook_Paginator1_i() : Paginator
      {
         var _loc1_:Paginator = new Paginator();
         this.paginator = _loc1_;
         BindingManager.executeBindings(this,"paginator",this.paginator);
         return _loc1_;
      }
      
      private function _CollectionBook_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_LoaderProgress_1407024497;
         _loc1_.id = "preloader";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.preloader = _loc1_;
         BindingManager.executeBindings(this,"preloader",this.preloader);
         return _loc1_;
      }
      
      private function _CollectionBook_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = -1;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._CollectionBook_Image2_i(),this._CollectionBook_Image3_i()];
         _loc1_.id = "_CollectionBook_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollectionBook_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_CollectionBook_HGroup1",this._CollectionBook_HGroup1);
         return _loc1_;
      }
      
      private function _CollectionBook_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = -1;
         _loc1_.id = "_CollectionBook_Image2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollectionBook_Image2 = _loc1_;
         BindingManager.executeBindings(this,"_CollectionBook_Image2",this._CollectionBook_Image2);
         return _loc1_;
      }
      
      private function _CollectionBook_Image3_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.id = "_CollectionBook_Image3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollectionBook_Image3 = _loc1_;
         BindingManager.executeBindings(this,"_CollectionBook_Image3",this._CollectionBook_Image3);
         return _loc1_;
      }
      
      private function _CollectionBook_RibbonBar1_i() : RibbonBar
      {
         var _loc1_:RibbonBar = new RibbonBar();
         _loc1_.x = 40;
         _loc1_.y = 290;
         _loc1_.id = "ribonBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ribonBar = _loc1_;
         BindingManager.executeBindings(this,"ribonBar",this.ribonBar);
         return _loc1_;
      }
      
      private function _CollectionBook_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 5;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._CollectionBook_Image4_i(),this._CollectionBook_Image5_i()];
         _loc1_.id = "_CollectionBook_HGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollectionBook_HGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_CollectionBook_HGroup2",this._CollectionBook_HGroup2);
         return _loc1_;
      }
      
      private function _CollectionBook_Image4_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = -1;
         _loc1_.right = 0;
         _loc1_.id = "pageLeft";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pageLeft = _loc1_;
         BindingManager.executeBindings(this,"pageLeft",this.pageLeft);
         return _loc1_;
      }
      
      private function _CollectionBook_Image5_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.left = 0;
         _loc1_.id = "pageRight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pageRight = _loc1_;
         BindingManager.executeBindings(this,"pageRight",this.pageRight);
         return _loc1_;
      }
      
      private function _CollectionBook_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = -3;
         _loc1_.initialized(this,"_CollectionBook_BitmapImage1");
         this._CollectionBook_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_CollectionBook_BitmapImage1",this._CollectionBook_BitmapImage1);
         return _loc1_;
      }
      
      private function _CollectionBook_HGroup3_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = -1;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = true;
         _loc1_.buttonMode = true;
         _loc1_.useHandCursor = true;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._CollectionBook_Group2_c(),this._CollectionBook_Group3_c()];
         _loc1_.id = "cover";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cover = _loc1_;
         BindingManager.executeBindings(this,"cover",this.cover);
         return _loc1_;
      }
      
      private function _CollectionBook_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 260.5;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollectionBook_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 270;
         _loc1_.mxmlContent = [this._CollectionBook_Image6_i(),this._CollectionBook_Image7_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollectionBook_Image6_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.left = 0;
         _loc1_.id = "_CollectionBook_Image6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollectionBook_Image6 = _loc1_;
         BindingManager.executeBindings(this,"_CollectionBook_Image6",this._CollectionBook_Image6);
         return _loc1_;
      }
      
      private function _CollectionBook_Image7_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.y = 20;
         _loc1_.id = "coverTitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.coverTitle = _loc1_;
         BindingManager.executeBindings(this,"coverTitle",this.coverTitle);
         return _loc1_;
      }
      
      private function _CollectionBook_HGroup4_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._CollectionBook_CollBookContPageCategory1_i(),this._CollectionBook_CollBookContPageCategory2_i()];
         _loc1_.id = "_CollectionBook_HGroup4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollectionBook_HGroup4 = _loc1_;
         BindingManager.executeBindings(this,"_CollectionBook_HGroup4",this._CollectionBook_HGroup4);
         return _loc1_;
      }
      
      private function _CollectionBook_CollBookContPageCategory1_i() : CollBookContPageCategory
      {
         var _loc1_:CollBookContPageCategory = new CollBookContPageCategory();
         _loc1_.currentState = "main";
         _loc1_.id = "contCategLeft";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contCategLeft = _loc1_;
         BindingManager.executeBindings(this,"contCategLeft",this.contCategLeft);
         return _loc1_;
      }
      
      private function _CollectionBook_CollBookContPageCategory2_i() : CollBookContPageCategory
      {
         var _loc1_:CollBookContPageCategory = new CollBookContPageCategory();
         _loc1_.currentState = "slave";
         _loc1_.id = "contCategRight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contCategRight = _loc1_;
         BindingManager.executeBindings(this,"contCategRight",this.contCategRight);
         return _loc1_;
      }
      
      private function _CollectionBook_HGroup5_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._CollectionBook_CollBookContPageMain1_i(),this._CollectionBook_CollBookContPageSec1_i()];
         _loc1_.id = "_CollectionBook_HGroup5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollectionBook_HGroup5 = _loc1_;
         BindingManager.executeBindings(this,"_CollectionBook_HGroup5",this._CollectionBook_HGroup5);
         return _loc1_;
      }
      
      private function _CollectionBook_CollBookContPageMain1_i() : CollBookContPageMain
      {
         var _loc1_:CollBookContPageMain = new CollBookContPageMain();
         _loc1_.id = "contInternLeft";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contInternLeft = _loc1_;
         BindingManager.executeBindings(this,"contInternLeft",this.contInternLeft);
         return _loc1_;
      }
      
      private function _CollectionBook_CollBookContPageSec1_i() : CollBookContPageSec
      {
         var _loc1_:CollBookContPageSec = new CollBookContPageSec();
         _loc1_.id = "contInternRight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contInternRight = _loc1_;
         BindingManager.executeBindings(this,"contInternRight",this.contInternRight);
         return _loc1_;
      }
      
      private function _CollectionBook_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.scaleX = -0.49;
         _loc1_.scaleY = 0.49;
         _loc1_.verticalCenter = 0;
         _loc1_.left = 0;
         _loc1_.setStyle("skinClass",ButtonArrowSkin);
         _loc1_.id = "prevPage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.prevPage = _loc1_;
         BindingManager.executeBindings(this,"prevPage",this.prevPage);
         return _loc1_;
      }
      
      private function _CollectionBook_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.scaleX = 0.49;
         _loc1_.scaleY = 0.49;
         _loc1_.verticalCenter = 0;
         _loc1_.right = 0;
         _loc1_.setStyle("skinClass",ButtonArrowSkin);
         _loc1_.id = "nextPage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nextPage = _loc1_;
         BindingManager.executeBindings(this,"nextPage",this.nextPage);
         return _loc1_;
      }
      
      private function _CollectionBook_HGroup6_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.bottom = -85;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [];
         _loc1_.id = "_CollectionBook_HGroup6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollectionBook_HGroup6 = _loc1_;
         BindingManager.executeBindings(this,"_CollectionBook_HGroup6",this._CollectionBook_HGroup6);
         return _loc1_;
      }
      
      private function _CollectionBook_CollWindowButton1_i() : CollWindowButton
      {
         var _loc1_:CollWindowButton = new CollWindowButton();
         _loc1_.currentState = "help";
         _loc1_.readyToGo = false;
         _loc1_.id = "help";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.help = _loc1_;
         BindingManager.executeBindings(this,"help",this.help);
         return _loc1_;
      }
      
      private function _CollectionBook_CollWindowButton2_i() : CollWindowButton
      {
         var _loc1_:CollWindowButton = new CollWindowButton();
         _loc1_.currentState = "gift";
         _loc1_.readyToGo = false;
         _loc1_.id = "exchange";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.exchange = _loc1_;
         BindingManager.executeBindings(this,"exchange",this.exchange);
         return _loc1_;
      }
      
      private function _CollectionBook_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"paginator.prevButton","prevPage");
         result[1] = new Binding(this,null,null,"paginator.nextButton","nextPage");
         result[2] = new Binding(this,function():Array
         {
            var _loc1_:* = [new DropShadowFilter(2,90,4401440,0.3,4,2,15,3)];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"_CollectionBook_HGroup1.filters");
         result[3] = new Binding(this,null,null,"_CollectionBook_Image2.source","$pageLeftCoverSource");
         result[4] = new Binding(this,null,null,"_CollectionBook_Image3.source","$pageRightCoverSource");
         result[5] = new Binding(this,null,null,"pageLeft.source","$pageLeftPaperSource");
         result[6] = new Binding(this,null,null,"pageRight.source","$pageRightPaperSource");
         result[7] = new Binding(this,null,null,"_CollectionBook_BitmapImage1.source","$lineHalfBookSource");
         result[8] = new Binding(this,function():Array
         {
            var _loc1_:* = [new DropShadowFilter(2,90,4401440,0.3,4,2,15,3)];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"cover.filters");
         result[9] = new Binding(this,null,null,"_CollectionBook_Image6.source","$bookCoverSPRSource");
         result[10] = new Binding(this,null,null,"coverTitle.source","coverTitleSource");
         result[11] = new Binding(this,function():Number
         {
            return 160 - coverTitle.width / 2;
         },null,"coverTitle.x");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CollectionBook_HGroup6() : HGroup
      {
         return this._1208674726_CollectionBook_HGroup6;
      }
      
      public function set _CollectionBook_HGroup6(param1:HGroup) : void
      {
         var _loc2_:Object = this._1208674726_CollectionBook_HGroup6;
         if(_loc2_ !== param1)
         {
            this._1208674726_CollectionBook_HGroup6 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CollectionBook_HGroup6",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contCategLeft() : CollBookContPageCategory
      {
         return this._318058509contCategLeft;
      }
      
      public function set contCategLeft(param1:CollBookContPageCategory) : void
      {
         var _loc2_:Object = this._318058509contCategLeft;
         if(_loc2_ !== param1)
         {
            this._318058509contCategLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contCategLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contCategRight() : CollBookContPageCategory
      {
         return this._1275540182contCategRight;
      }
      
      public function set contCategRight(param1:CollBookContPageCategory) : void
      {
         var _loc2_:Object = this._1275540182contCategRight;
         if(_loc2_ !== param1)
         {
            this._1275540182contCategRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contCategRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contInternLeft() : CollBookContPageMain
      {
         return this._1585699061contInternLeft;
      }
      
      public function set contInternLeft(param1:CollBookContPageMain) : void
      {
         var _loc2_:Object = this._1585699061contInternLeft;
         if(_loc2_ !== param1)
         {
            this._1585699061contInternLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contInternLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contInternRight() : CollBookContPageSec
      {
         return this._1906369640contInternRight;
      }
      
      public function set contInternRight(param1:CollBookContPageSec) : void
      {
         var _loc2_:Object = this._1906369640contInternRight;
         if(_loc2_ !== param1)
         {
            this._1906369640contInternRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contInternRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cover() : HGroup
      {
         return this._94852023cover;
      }
      
      public function set cover(param1:HGroup) : void
      {
         var _loc2_:Object = this._94852023cover;
         if(_loc2_ !== param1)
         {
            this._94852023cover = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cover",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get coverTitle() : Image
      {
         return this._1242339553coverTitle;
      }
      
      public function set coverTitle(param1:Image) : void
      {
         var _loc2_:Object = this._1242339553coverTitle;
         if(_loc2_ !== param1)
         {
            this._1242339553coverTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"coverTitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get exchange() : CollWindowButton
      {
         return this._1989774883exchange;
      }
      
      public function set exchange(param1:CollWindowButton) : void
      {
         var _loc2_:Object = this._1989774883exchange;
         if(_loc2_ !== param1)
         {
            this._1989774883exchange = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"exchange",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get help() : CollWindowButton
      {
         return this._3198785help;
      }
      
      public function set help(param1:CollWindowButton) : void
      {
         var _loc2_:Object = this._3198785help;
         if(_loc2_ !== param1)
         {
            this._3198785help = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"help",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get nextPage() : Button
      {
         return this._1424273442nextPage;
      }
      
      public function set nextPage(param1:Button) : void
      {
         var _loc2_:Object = this._1424273442nextPage;
         if(_loc2_ !== param1)
         {
            this._1424273442nextPage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nextPage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pageLeft() : Image
      {
         return this._859215670pageLeft;
      }
      
      public function set pageLeft(param1:Image) : void
      {
         var _loc2_:Object = this._859215670pageLeft;
         if(_loc2_ !== param1)
         {
            this._859215670pageLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pageLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pageRight() : Image
      {
         return this._871542989pageRight;
      }
      
      public function set pageRight(param1:Image) : void
      {
         var _loc2_:Object = this._871542989pageRight;
         if(_loc2_ !== param1)
         {
            this._871542989pageRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pageRight",_loc2_,param1));
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
      public function get preloader() : Image
      {
         return this._1113514890preloader;
      }
      
      public function set preloader(param1:Image) : void
      {
         var _loc2_:Object = this._1113514890preloader;
         if(_loc2_ !== param1)
         {
            this._1113514890preloader = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"preloader",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get prevPage() : Button
      {
         return this._1274534046prevPage;
      }
      
      public function set prevPage(param1:Button) : void
      {
         var _loc2_:Object = this._1274534046prevPage;
         if(_loc2_ !== param1)
         {
            this._1274534046prevPage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"prevPage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ribonBar() : RibbonBar
      {
         return this._1572967543ribonBar;
      }
      
      public function set ribonBar(param1:RibbonBar) : void
      {
         var _loc2_:Object = this._1572967543ribonBar;
         if(_loc2_ !== param1)
         {
            this._1572967543ribonBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ribonBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get label1() : String
      {
         return this._1110417475label1;
      }
      
      public function set label1(param1:String) : void
      {
         var _loc2_:Object = this._1110417475label1;
         if(_loc2_ !== param1)
         {
            this._1110417475label1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get label2() : String
      {
         return this._1110417474label2;
      }
      
      public function set label2(param1:String) : void
      {
         var _loc2_:Object = this._1110417474label2;
         if(_loc2_ !== param1)
         {
            this._1110417474label2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get label3() : String
      {
         return this._1110417473label3;
      }
      
      public function set label3(param1:String) : void
      {
         var _loc2_:Object = this._1110417473label3;
         if(_loc2_ !== param1)
         {
            this._1110417473label3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get label4() : String
      {
         return this._1110417472label4;
      }
      
      public function set label4(param1:String) : void
      {
         var _loc2_:Object = this._1110417472label4;
         if(_loc2_ !== param1)
         {
            this._1110417472label4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get coverTitleSource() : String
      {
         return this._1451884636coverTitleSource;
      }
      
      public function set coverTitleSource(param1:String) : void
      {
         var _loc2_:Object = this._1451884636coverTitleSource;
         if(_loc2_ !== param1)
         {
            this._1451884636coverTitleSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"coverTitleSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get $lineHalfBookSource() : *
      {
         return this._957319889$lineHalfBookSource;
      }
      
      public function set $lineHalfBookSource(param1:*) : void
      {
         var _loc2_:Object = this._957319889$lineHalfBookSource;
         if(_loc2_ !== param1)
         {
            this._957319889$lineHalfBookSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"$lineHalfBookSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get $bookCoverSPRSource() : *
      {
         return this._727266982$bookCoverSPRSource;
      }
      
      public function set $bookCoverSPRSource(param1:*) : void
      {
         var _loc2_:Object = this._727266982$bookCoverSPRSource;
         if(_loc2_ !== param1)
         {
            this._727266982$bookCoverSPRSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"$bookCoverSPRSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get $pageRightCoverSource() : *
      {
         return this._1428967991$pageRightCoverSource;
      }
      
      public function set $pageRightCoverSource(param1:*) : void
      {
         var _loc2_:Object = this._1428967991$pageRightCoverSource;
         if(_loc2_ !== param1)
         {
            this._1428967991$pageRightCoverSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"$pageRightCoverSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get $pageRightPaperSource() : *
      {
         return this._1691482078$pageRightPaperSource;
      }
      
      public function set $pageRightPaperSource(param1:*) : void
      {
         var _loc2_:Object = this._1691482078$pageRightPaperSource;
         if(_loc2_ !== param1)
         {
            this._1691482078$pageRightPaperSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"$pageRightPaperSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get $pageLeftCoverSource() : *
      {
         return this._593525496$pageLeftCoverSource;
      }
      
      public function set $pageLeftCoverSource(param1:*) : void
      {
         var _loc2_:Object = this._593525496$pageLeftCoverSource;
         if(_loc2_ !== param1)
         {
            this._593525496$pageLeftCoverSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"$pageLeftCoverSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get $pageLeftPaperSource() : *
      {
         return this._580991731$pageLeftPaperSource;
      }
      
      public function set $pageLeftPaperSource(param1:*) : void
      {
         var _loc2_:Object = this._580991731$pageLeftPaperSource;
         if(_loc2_ !== param1)
         {
            this._580991731$pageLeftPaperSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"$pageLeftPaperSource",_loc2_,param1));
            }
         }
      }
   }
}

