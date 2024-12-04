package windows.core
{
   import com.bigpoint.zoomumba.constants.BackgroundHeader;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
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
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.core.IVisualElement;
   import mx.core.UIComponent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import org.puremvc.as3.patterns.facade.Facade;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.supportClasses.SkinnableComponent;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   import windows.core.tabs.ITabsGroup;
   import windows.core.tabs.TabsContainer;
   import windows.events.WindowCustomEvent;
   
   public class AbstractWindow extends SkinnableComponent
   {
      private static const SULFIX_INNER:String = "_inner";
      
      private static const SULFIX_OUTER:String = "_outer";
      
      private static var _skinParts:Object = {
         "viewport":true,
         "tabsContainer":false,
         "dynamicTitle":true,
         "preloaderImage":true,
         "cancelButton":true,
         "modalLayer":true,
         "innerContainer":true,
         "borderImage":false,
         "outerContainer":true,
         "closeButton":true,
         "header":true,
         "okButton":true
      };
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      [SkinPart(required="true")]
      public var viewport:Group;
      
      [SkinPart(required="true")]
      public var innerContainer:Group;
      
      [SkinPart(required="true")]
      public var outerContainer:Group;
      
      [SkinPart(required="true")]
      public var dynamicTitle:UIComponent;
      
      [SkinPart(required="true")]
      public var header:LoaderImage;
      
      [SkinPart(required="true")]
      public var closeButton:Button;
      
      [SkinPart(required="true")]
      public var okButton:Button;
      
      [SkinPart(required="true")]
      public var preloaderImage:Image;
      
      [SkinPart(required="true")]
      public var cancelButton:Button;
      
      [SkinPart(required="true")]
      public var modalLayer:SpriteVisualElement;
      
      [SkinPart(required="false")]
      public var borderImage:BitmapImage;
      
      [SkinPart(required="false")]
      public var tabsContainer:TabsContainer;
      
      private var bg2:Class = AbstractWindow_bg2;
      
      private var bg3:Class = AbstractWindow_bg3;
      
      private var bg4:Class = AbstractWindow_bg4;
      
      private var tab:Class = AbstractWindow_tab;
      
      private var _1764385150backgroundPattern:Class = this.bg2;
      
      private var _339276609tabDistanceFromTop:int = 100;
      
      private var _1927392155tabDistanceFromLeft:int = 50;
      
      private var _cancelWidth:int = -1;
      
      private var _cancelHeight:int = -1;
      
      private var _okWidth:int = -1;
      
      private var _okHeight:int = -1;
      
      private var _currentContentId:int = 0;
      
      private var _backgroundId:int = 4;
      
      private var _useTabLayout:Boolean = false;
      
      private var _created:Boolean = false;
      
      private var _cancelButtonVisibility:Boolean = false;
      
      private var _okButtonVisibility:Boolean = false;
      
      private var _preloaderVisibility:Boolean = false;
      
      private var _contentsClass:Array = [];
      
      private var _contentsInstances:Array = [];
      
      private var _innerReferences:Array = [];
      
      private var _outerReferences:Array = [];
      
      private var _currentBGState:String = null;
      
      private var _tabsReference:IVisualElement = null;
      
      private var _okEvent:WindowCustomEvent = new WindowCustomEvent(WindowCustomEvent.CONFIRM_CLICKED);
      
      private var _closeEvent:WindowCustomEvent = new WindowCustomEvent(WindowCustomEvent.CLOSE_BUTTON_CLICKED);
      
      private var _cancelEvent:WindowCustomEvent = new WindowCustomEvent(WindowCustomEvent.CANCEL_CLICKED);
      
      private var _renderedEvent:WindowCustomEvent = new WindowCustomEvent(WindowCustomEvent.WINDOW_VISUALLY_CREATED);
      
      public function AbstractWindow()
      {
         super();
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.addEventListener("creationComplete",this.___AbstractWindow_SkinnableComponent1_creationComplete);
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
      
      [Bindable(event="backgroundChanged")]
      public function get background() : int
      {
         return this._backgroundId;
      }
      
      [Bindable(event="useTabLayoutChanged")]
      public function get useTabLayout() : Boolean
      {
         return this._useTabLayout;
      }
      
      public function set background(param1:int) : void
      {
         if(!this._useTabLayout)
         {
            this._backgroundId = Math.max(Math.min(param1,5),2);
            this._currentBGState = "bg" + this._backgroundId;
            dispatchEvent(new Event("backgroundChanged"));
            this.backgroundPattern = this[this._currentBGState];
            invalidateSkinState();
         }
      }
      
      public function set useTabLayout(param1:Boolean) : void
      {
         this._useTabLayout = param1;
         if(this._useTabLayout)
         {
            this._currentBGState = "tab";
            dispatchEvent(new Event("useTabLayoutChanged"));
            this.backgroundPattern = this[this._currentBGState];
            invalidateSkinState();
         }
      }
      
      override protected function getCurrentSkinState() : String
      {
         return this._currentBGState == "tab" ? "tab" : "default";
      }
      
      private function created(param1:FlexEvent) : void
      {
         var event:FlexEvent = param1;
         this._created = true;
         this.content = this._contentsClass[this._currentContentId];
         this.cancelButtonVisibility = this._cancelButtonVisibility;
         this.okButtonVisibility = this._okButtonVisibility;
         this.preloaderVisibility = this._preloaderVisibility;
         dispatchEvent(this._renderedEvent);
         this.okButton.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            dispatchEvent(_okEvent);
         });
         this.cancelButton.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            dispatchEvent(_cancelEvent);
         });
         this.closeButton.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            dispatchEvent(_closeEvent);
         });
         addEventListener(WindowCustomEvent.WINDOW_CONTENT_UPDATED,function(param1:WindowCustomEvent):void
         {
            setContent(param1.containerId,param1.contentClass);
         });
      }
      
      public function initDynamicTitle(param1:String, param2:Sprite, param3:int, param4:int) : void
      {
         var _loc8_:Bitmap = null;
         var _loc10_:Sprite = null;
         var _loc5_:Sprite = AssetLibrary.getSprite(BackgroundHeader.HEASER_ASSET_NAME,BackgroundHeader.HEASER_ASSET_OBJ_TEXT);
         var _loc6_:Sprite = AssetLibrary.getSprite(BackgroundHeader.HEASER_ASSET_NAME,BackgroundHeader.HEASER_ASSET_OBJ_MASK);
         var _loc7_:Sprite = AssetLibrary.getSprite(BackgroundHeader.HEASER_ASSET_NAME,BackgroundHeader.HEASER_ASSET_OBJ_FRAME);
         _loc8_ = AssetLibrary.getBitmap(BackgroundHeader.HEASER_ASSET_NAME,BackgroundHeader.HEASER_ASSET_OBJ_BACKGROUND);
         var _loc9_:Bitmap = AssetLibrary.getBitmap(BackgroundHeader.HEASER_ASSET_NAME,BackgroundHeader.HEASER_ASSET_OBJ_BACKGROUND);
         _loc10_ = AssetLibrary.getSprite(BackgroundHeader.HEASER_ASSET_NAME,BackgroundHeader.HEASER_ASSET_OBJ_ICON);
         var _loc11_:Number = 0.85;
         _loc7_.scaleX = _loc11_;
         _loc7_.scaleY = _loc11_;
         _loc6_.scaleX = _loc11_;
         _loc6_.scaleY = _loc11_;
         _loc10_.scaleY = _loc11_;
         _loc10_.scaleX = _loc11_;
         if(param2)
         {
            _loc10_.x = _loc7_.width / 2 * -1 + _loc10_.width / 2 + 5;
            _loc10_.y = 5;
            (_loc10_["iconHolder_mc"] as MovieClip).addChild(param2);
         }
         var _loc12_:AppConfigProxy = Facade.getInstance().retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         var _loc13_:String = _loc12_.language;
         if(_loc13_ == "ru" || _loc13_ == "el" || _loc13_ == "bg")
         {
            (_loc5_["title_txt"] as TextField).visible = false;
            (_loc5_["title_fallback_txt"] as TextField).text = param1;
         }
         else
         {
            (_loc5_["title_fallback_txt"] as TextField).visible = false;
            (_loc5_["title_txt"] as TextField).text = param1;
         }
         var _loc14_:Sprite = new Sprite();
         var _loc15_:Sprite = new Sprite();
         _loc15_.y = _loc8_.height / 2 * -1;
         _loc15_.x = _loc8_.width * -1;
         _loc15_.addChild(_loc8_);
         _loc9_.x += _loc9_.width;
         _loc15_.addChild(_loc9_);
         _loc15_.mask = _loc6_;
         _loc14_.addChild(_loc15_);
         _loc14_.addChild(_loc6_);
         _loc14_.addChild(_loc7_);
         _loc14_.addChild(_loc5_);
         if(param2)
         {
            _loc14_.addChild(_loc10_);
         }
         _loc14_.x = this.innerContainer.width / param3;
         _loc14_.y += _loc14_.height / param4;
         this.dynamicTitle.addChild(_loc14_);
      }
      
      private function setContent(param1:int, param2:Class) : void
      {
         this._currentContentId = param1;
         if(param2 != null)
         {
            this._contentsClass[param1] = param2;
         }
         if(this._created)
         {
            if(param2 == null)
            {
               if(this._innerReferences[param1 + SULFIX_INNER])
               {
                  this.innerContainer.removeElement(this._innerReferences[param1 + SULFIX_INNER]);
                  this._innerReferences = this.removeValue(this._innerReferences,param1 + SULFIX_INNER);
               }
               if(this._outerReferences[param1 + SULFIX_OUTER])
               {
                  this.outerContainer.removeElement(this._outerReferences[param1 + SULFIX_OUTER]);
                  this._outerReferences = this.removeValue(this._outerReferences,param1 + SULFIX_OUTER);
               }
               this._contentsClass = this.removeValue(this._contentsClass,param1);
               this._contentsInstances = this.removeValue(this._contentsInstances,param1);
               this.visualSort();
            }
            else
            {
               if(Boolean(this._innerReferences[param1 + SULFIX_INNER]) || Boolean(this._outerReferences[param1 + SULFIX_OUTER]))
               {
                  this.setContent(param1,null);
                  this._contentsClass[param1] = param2;
               }
               this._contentsInstances[param1] = new param2();
               this.fillContent();
            }
         }
      }
      
      private function fillContent() : void
      {
         var _loc1_:int = this._currentContentId;
         var _loc2_:Group = this._contentsInstances[_loc1_] as Group;
         var _loc3_:int = int(_loc2_.numElements);
         var _loc4_:IVisualElement = null;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc4_ = _loc2_.getElementAt(_loc6_);
            if(_loc4_ is UIComponent)
            {
               if(_loc4_ is InnerGroup)
               {
                  this._innerReferences[_loc1_ + SULFIX_INNER] = _loc4_;
                  this.innerContainer.addElement(_loc4_);
                  _loc5_ = true;
               }
               else if(_loc4_ is OuterGroup)
               {
                  this._outerReferences[_loc1_ + SULFIX_OUTER] = _loc4_;
                  this.outerContainer.addElement(_loc4_);
                  _loc5_ = true;
               }
               else if(this._tabsReference == null && this.tabsContainer != null && _loc4_ is ITabsGroup)
               {
                  if(!this.useTabLayout)
                  {
                     throw new Error("To work with tabs you need to set useTabLayout = true in your window");
                  }
                  this._tabsReference = _loc4_;
                  this.tabsContainer.addElement(_loc4_);
                  _loc5_ = true;
               }
            }
            _loc6_++;
         }
         dispatchEvent(new WindowCustomEvent(WindowCustomEvent.WINDOW_CONTENT_CHANGED,_loc1_,this._contentsClass[_loc1_]));
      }
      
      private function visualSort() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         for(_loc1_ in this._contentsInstances)
         {
            for(_loc2_ in this._contentsInstances)
            {
               this.sortVisualContents(this.innerContainer,this._innerReferences,SULFIX_INNER,_loc1_,_loc2_);
               this.sortVisualContents(this.outerContainer,this._outerReferences,SULFIX_OUTER,_loc1_,_loc2_);
            }
         }
      }
      
      private function removeValue(param1:Array, param2:*) : Array
      {
         var _loc4_:String = null;
         param1[param2] = null;
         var _loc3_:Array = [];
         for(_loc4_ in param1)
         {
            if(param1[_loc4_] != null)
            {
               _loc3_[_loc4_] = param1[_loc4_];
            }
         }
         return _loc3_;
      }
      
      private function sortVisualContents(param1:Group, param2:Array, param3:String, param4:String, param5:String) : void
      {
         var _loc6_:IVisualElement = null;
         var _loc7_:IVisualElement = null;
         if(Boolean(param2[param4 + param3]) && Boolean(param2[param5 + param3]))
         {
            _loc6_ = param2[param4 + param3];
            _loc7_ = param2[param5 + param3];
            if(param4 > param5 && param1.getElementIndex(_loc6_) < param1.getElementIndex(_loc7_) || param5 > param4 && param1.getElementIndex(_loc7_) < param1.getElementIndex(_loc6_))
            {
               param1.swapElements(_loc6_,_loc7_);
            }
         }
      }
      
      public function set cancelButtonVisibility(param1:Boolean) : void
      {
         this._cancelButtonVisibility = param1;
         if(this._created && this.cancelButton && Boolean(this.cancelButton.owner))
         {
            this._cancelWidth = this._cancelWidth == -1 ? int(this.cancelButton.width) : this._cancelWidth;
            this._cancelHeight = this._cancelHeight == -1 ? int(this.cancelButton.height) : this._cancelHeight;
            this.cancelButton.visible = param1;
            this.cancelButton.width = param1 ? this._cancelWidth : 0;
            this.cancelButton.height = param1 ? this._cancelHeight : 0;
         }
      }
      
      public function set okButtonVisibility(param1:Boolean) : void
      {
         this._okButtonVisibility = param1;
         if(this._created && this.okButton && Boolean(this.okButton.owner))
         {
            this._okWidth = this._okWidth == -1 ? int(this.okButton.width) : this._okWidth;
            this._okHeight = this._okHeight == -1 ? int(this.okButton.height) : this._okHeight;
            this.okButton.visible = param1;
            this.okButton.width = param1 ? this._okWidth : 0;
            this.okButton.height = param1 ? this._okHeight : 0;
         }
      }
      
      public function set preloaderVisibility(param1:Boolean) : void
      {
         this._preloaderVisibility = param1;
         if(this._created && Boolean(this.preloaderImage))
         {
            this.preloaderImage.visible = param1;
            if(Boolean(this.preloaderImage) && this.preloaderImage.content is MovieClip)
            {
               if(param1)
               {
                  (this.preloaderImage.content as MovieClip).play();
               }
               else
               {
                  (this.preloaderImage.content as MovieClip).stop();
               }
            }
            this.innerContainer.visible = !param1;
            this.outerContainer.visible = !param1;
            this.preloaderImage.verticalCenter = this._useTabLayout ? this.tabDistanceFromTop / 2 : 0;
         }
      }
      
      public function set content(param1:Class) : void
      {
         this.setContent(0,param1);
      }
      
      public function customContent(param1:int, param2:Class) : void
      {
         this.setContent(param1,param2);
      }
      
      public function getContent(param1:int = 0) : Group
      {
         return this._contentsInstances[param1] as Group;
      }
      
      public function getTabsGroup() : ITabsGroup
      {
         return this._tabsReference as ITabsGroup;
      }
      
      public function invalidateTabs() : void
      {
         this.tabsContainer.invalidate();
      }
      
      public function dispose() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this._contentsInstances)
         {
            this.setContent(int(_loc1_),null);
         }
         if(this.tabsContainer != null && this._tabsReference != null)
         {
            this.tabsContainer.removeElement(this._tabsReference);
            this._tabsReference = null;
         }
      }
      
      public function ___AbstractWindow_SkinnableComponent1_creationComplete(param1:FlexEvent) : void
      {
         this.created(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundPattern() : Class
      {
         return this._1764385150backgroundPattern;
      }
      
      public function set backgroundPattern(param1:Class) : void
      {
         var _loc2_:Object = this._1764385150backgroundPattern;
         if(_loc2_ !== param1)
         {
            this._1764385150backgroundPattern = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundPattern",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tabDistanceFromTop() : int
      {
         return this._339276609tabDistanceFromTop;
      }
      
      public function set tabDistanceFromTop(param1:int) : void
      {
         var _loc2_:Object = this._339276609tabDistanceFromTop;
         if(_loc2_ !== param1)
         {
            this._339276609tabDistanceFromTop = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tabDistanceFromTop",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tabDistanceFromLeft() : int
      {
         return this._1927392155tabDistanceFromLeft;
      }
      
      public function set tabDistanceFromLeft(param1:int) : void
      {
         var _loc2_:Object = this._1927392155tabDistanceFromLeft;
         if(_loc2_ !== param1)
         {
            this._1927392155tabDistanceFromLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tabDistanceFromLeft",_loc2_,param1));
            }
         }
      }
   }
}

