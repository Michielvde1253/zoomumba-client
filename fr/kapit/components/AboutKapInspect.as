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
   import fr.kapit.Version;
   import fr.kapit.assets.EmbeddedAssets;
   import fr.kapit.controls.kTextArea;
   import fr.kapit.tree.IntrospectionTree;
   import fr.kapit.utils.ApplicationUtils;
   import mx.binding.*;
   import mx.containers.HBox;
   import mx.containers.TitleWindow;
   import mx.controls.Image;
   import mx.controls.Label;
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class AboutKapInspect extends TitleWindow implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _765318028capabilitiesTree:IntrospectionTree;
      
      private var _1028633754credits:kTextArea;
      
      private var _475186705flashPlayerDetails:kTextArea;
      
      private var _730926937flashPlayerVersion:kTextArea;
      
      private var _2027202756logoIcon:Image;
      
      private var _670487542versioning:Label;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _AboutKapInspect_StylesInit_done:Boolean = false;
      
      private var _embed_mxml__fr_kapit_assets_icons_kapinspect_png_168423776:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AboutKapInspect()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":TitleWindow,
            "events":{
               "close":"___AboutKapInspect_TitleWindow1_close",
               "initialize":"___AboutKapInspect_TitleWindow1_initialize",
               "creationComplete":"___AboutKapInspect_TitleWindow1_creationComplete"
            },
            "stylesFactory":function():void
            {
               this.borderColor = 10731790;
               this.titleStyleName = "popupTitle";
               this.borderThicknessBottom = 15;
               this.borderThicknessLeft = 1;
               this.borderThicknessRight = 1;
               this.borderAlpha = 1;
               this.horizontalAlign = "left";
               this.paddingLeft = 10;
               this.paddingRight = 10;
               this.paddingBottom = 10;
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Image,
                  "id":"logoIcon",
                  "events":{"click":"__logoIcon_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "source":_embed_mxml__fr_kapit_assets_icons_kapinspect_png_168423776,
                        "buttonMode":true,
                        "useHandCursor":true,
                        "mouseChildren":false
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Label,
                  "id":"versioning",
                  "stylesFactory":function():void
                  {
                     this.paddingTop = -5;
                  }
               }),new UIComponentDescriptor({
                  "type":kTextArea,
                  "id":"flashPlayerDetails",
                  "stylesFactory":function():void
                  {
                     this.paddingLeft = 5;
                     this.backgroundColor = 12834859;
                     this.textAlign = "left";
                     this.fontWeight = "bold";
                     this.color = 16777215;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "height":20,
                        "selectable":false,
                        "text":"Flash Player"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":HBox,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":kTextArea,
                           "stylesFactory":function():void
                           {
                              this.paddingRight = 2;
                              this.textAlign = "right";
                              this.borderThickness = 0;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "selectable":false,
                                 "percentWidth":50,
                                 "htmlText":"Version<br>PlayerDebug<br>Application size"
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":kTextArea,
                           "id":"flashPlayerVersion",
                           "stylesFactory":function():void
                           {
                              this.paddingLeft = 2;
                              this.textAlign = "left";
                              this.borderThickness = 0;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":50,
                                 "selectable":false,
                                 "verticalScrollPolicy":"off"
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":kTextArea,
                  "id":"credits",
                  "stylesFactory":function():void
                  {
                     this.paddingLeft = 5;
                     this.backgroundColor = 12834859;
                     this.textAlign = "left";
                     this.fontWeight = "bold";
                     this.color = 16777215;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "height":20,
                        "selectable":false,
                        "text":"Capabilities"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":IntrospectionTree,
                  "id":"capabilitiesTree",
                  "events":{"creationComplete":"__capabilitiesTree_creationComplete"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "height":150
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":kTextArea,
                  "stylesFactory":function():void
                  {
                     this.paddingLeft = 5;
                     this.backgroundColor = 12834859;
                     this.textAlign = "left";
                     this.fontWeight = "bold";
                     this.color = 16777215;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "height":20,
                        "selectable":false,
                        "text":"Credits"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Text,
                  "events":{"click":"___AboutKapInspect_Text1_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "buttonMode":true,
                        "useHandCursor":true,
                        "mouseChildren":false,
                        "htmlText":"<b>Aranud</b> for his great StyleSheet component from FlexSpy"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Text,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "htmlText":"<b>Manish Jetani</b> and <b>Nisheet Jain</b> for their so cool ResizeableTitleWindow, home of KapInspect"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Text,
                  "events":{"click":"___AboutKapInspect_Text3_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "buttonMode":true,
                        "useHandCursor":true,
                        "mouseChildren":false,
                        "htmlText":"<b>All developers</b> of the FlexLib library, used for its nifty SuperTabNavigator component"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Text,
                  "events":{"click":"___AboutKapInspect_Text4_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "buttonMode":true,
                        "useHandCursor":true,
                        "mouseChildren":false,
                        "htmlText":"<b>Oaxoa</b>for his dockbar component from which derived ours"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Text,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "htmlText":"Many other smart guys from the Flex community that helped us through their blogs and articles on this wonderful technology"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Text,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "htmlText":"And our dear customers for providing us such hard projects that we had to develop this tool, that finally benefited all with an enhanced productivity and knowledge of our teams"
                     };
                  }
               })]};
            }
         });
         this._embed_mxml__fr_kapit_assets_icons_kapinspect_png_168423776 = AboutKapInspect__embed_mxml__fr_kapit_assets_icons_kapinspect_png_168423776;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._AboutKapInspect_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_fr_kapit_components_AboutKapInspectWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AboutKapInspect[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.layout = "vertical";
         this.showCloseButton = true;
         this.verticalScrollPolicy = "auto";
         this.horizontalScrollPolicy = "off";
         this.alpha = 1;
         this.addEventListener("close",this.___AboutKapInspect_TitleWindow1_close);
         this.addEventListener("initialize",this.___AboutKapInspect_TitleWindow1_initialize);
         this.addEventListener("creationComplete",this.___AboutKapInspect_TitleWindow1_creationComplete);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AboutKapInspect._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.borderColor = 10731790;
            this.titleStyleName = "popupTitle";
            this.borderThicknessBottom = 15;
            this.borderThicknessLeft = 1;
            this.borderThicknessRight = 1;
            this.borderAlpha = 1;
            this.horizontalAlign = "left";
            this.paddingLeft = 10;
            this.paddingRight = 10;
            this.paddingBottom = 10;
         };
         mx_internal::_AboutKapInspect_StylesInit();
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      private function _onCreationComplete() : void
      {
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this._onKeyDown,false,Number.MAX_VALUE);
         this.versioning.text = "© KapIT 2008-2009 | Release " + Version.VERSION_NUMBER;
         this.versioning.text += " - Build " + Version.BUILD_NUMBER.split(" ")[1];
         this.flashPlayerVersion.htmlText = Capabilities.version + "<br>";
         this.flashPlayerVersion.htmlText += String(Capabilities.isDebugger) + "<br>";
         this.flashPlayerVersion.htmlText += String(root.loaderInfo.bytesTotal) + "<br>";
      }
      
      private function _onInitialize() : void
      {
         var _loc1_:int = 0;
         if(ApplicationUtils.application)
         {
            _loc1_ = int(ApplicationUtils.application.height);
            this.maxHeight = _loc1_ - 20;
         }
      }
      
      private function _gotoKapIT() : void
      {
         navigateToURL(new URLRequest("http://www.kapit.fr"));
      }
      
      private function _gotoKapInspect() : void
      {
         navigateToURL(new URLRequest("http://lab.kapit.fr/display/kapinspect/Kap+Inspect"));
      }
      
      private function _gotoFlexSpy() : void
      {
         navigateToURL(new URLRequest("http://code.google.com/p/fxspy/"));
      }
      
      private function _gotoFlexLib() : void
      {
         navigateToURL(new URLRequest("http://code.google.com/p/flexlib/"));
      }
      
      private function _gotoDockBar() : void
      {
         navigateToURL(new URLRequest("http://blog.oaxoa.com/2008/06/12/flex-macos-like-dockbar-component/"));
      }
      
      private function _onClose() : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._onKeyDown);
         PopUpManager.removePopUp(this);
      }
      
      private function _onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 27)
         {
            this._onClose();
         }
      }
      
      private function _onTreeComplete() : void
      {
         this.capabilitiesTree.addRoot(Capabilities,"Capabilities");
         this.capabilitiesTree.addRoot(System,"System");
      }
      
      public function ___AboutKapInspect_TitleWindow1_close(param1:CloseEvent) : void
      {
         this._onClose();
      }
      
      public function ___AboutKapInspect_TitleWindow1_initialize(param1:FlexEvent) : void
      {
         this._onInitialize();
      }
      
      public function ___AboutKapInspect_TitleWindow1_creationComplete(param1:FlexEvent) : void
      {
         this._onCreationComplete();
      }
      
      public function __logoIcon_click(param1:MouseEvent) : void
      {
         this._gotoKapInspect();
      }
      
      public function __capabilitiesTree_creationComplete(param1:FlexEvent) : void
      {
         this._onTreeComplete();
      }
      
      public function ___AboutKapInspect_Text1_click(param1:MouseEvent) : void
      {
         this._gotoFlexSpy();
      }
      
      public function ___AboutKapInspect_Text3_click(param1:MouseEvent) : void
      {
         this._gotoFlexLib();
      }
      
      public function ___AboutKapInspect_Text4_click(param1:MouseEvent) : void
      {
         this._gotoDockBar();
      }
      
      private function _AboutKapInspect_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Array
         {
            var _loc1_:* = [13426973,10731790];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },function(param1:Array):void
         {
            this.setStyle("headerColors",param1);
         },"this.headerColors");
         result[1] = new Binding(this,function():Class
         {
            return EmbeddedAssets.miniLogo;
         },null,"this.titleIcon");
         return result;
      }
      
      mx_internal function _AboutKapInspect_StylesInit() : void
      {
         var style:CSSStyleDeclaration = null;
         var effects:Array = null;
         var conditions:Array = null;
         var condition:CSSCondition = null;
         var selector:CSSSelector = null;
         if(mx_internal::_AboutKapInspect_StylesInit_done)
         {
            return;
         }
         mx_internal::_AboutKapInspect_StylesInit_done = true;
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","popupTitle");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".popupTitle");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.color = 16777215;
               this.fontFamily = "Arial";
               this.fontSize = 14;
            };
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get capabilitiesTree() : IntrospectionTree
      {
         return this._765318028capabilitiesTree;
      }
      
      public function set capabilitiesTree(param1:IntrospectionTree) : void
      {
         var _loc2_:Object = this._765318028capabilitiesTree;
         if(_loc2_ !== param1)
         {
            this._765318028capabilitiesTree = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"capabilitiesTree",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get credits() : kTextArea
      {
         return this._1028633754credits;
      }
      
      public function set credits(param1:kTextArea) : void
      {
         var _loc2_:Object = this._1028633754credits;
         if(_loc2_ !== param1)
         {
            this._1028633754credits = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"credits",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get flashPlayerDetails() : kTextArea
      {
         return this._475186705flashPlayerDetails;
      }
      
      public function set flashPlayerDetails(param1:kTextArea) : void
      {
         var _loc2_:Object = this._475186705flashPlayerDetails;
         if(_loc2_ !== param1)
         {
            this._475186705flashPlayerDetails = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"flashPlayerDetails",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get flashPlayerVersion() : kTextArea
      {
         return this._730926937flashPlayerVersion;
      }
      
      public function set flashPlayerVersion(param1:kTextArea) : void
      {
         var _loc2_:Object = this._730926937flashPlayerVersion;
         if(_loc2_ !== param1)
         {
            this._730926937flashPlayerVersion = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"flashPlayerVersion",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logoIcon() : Image
      {
         return this._2027202756logoIcon;
      }
      
      public function set logoIcon(param1:Image) : void
      {
         var _loc2_:Object = this._2027202756logoIcon;
         if(_loc2_ !== param1)
         {
            this._2027202756logoIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"logoIcon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get versioning() : Label
      {
         return this._670487542versioning;
      }
      
      public function set versioning(param1:Label) : void
      {
         var _loc2_:Object = this._670487542versioning;
         if(_loc2_ !== param1)
         {
            this._670487542versioning = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"versioning",_loc2_,param1));
            }
         }
      }
   }
}

