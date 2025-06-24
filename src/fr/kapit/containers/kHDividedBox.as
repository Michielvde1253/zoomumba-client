package fr.kapit.containers
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
   import fr.kapit.skin.BorderSkinWithShadow;
   import fr.kapit.skin.FocusSkin;
   import fr.kapit.skin.TabBorderSkinWithBackground;
   import fr.kapit.skin.TabSkin;
   import mx.binding.*;
   import mx.containers.HDividedBox;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.skins.halo.HaloBorder;
   import mx.skins.halo.HaloFocusRect;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class kHDividedBox extends HDividedBox
   {
      private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":HDividedBox});
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _kHDividedBox_StylesInit_done:Boolean = false;
      
      private var _embed_css_KapITComponents_swf_kComboBox_editableDisabledSkin_767376159:Class = kHDividedBox__embed_css_KapITComponents_swf_kComboBox_editableDisabledSkin_767376159;
      
      private var _embed_css_KapITComponents_swf_kScrollBar_trackUpSkin_281116678:Class = kHDividedBox__embed_css_KapITComponents_swf_kScrollBar_trackUpSkin_281116678;
      
      private var _embed_css_KapITComponents_swf_kDividedBox_verticalCursor_587192139:Class = kHDividedBox__embed_css_KapITComponents_swf_kDividedBox_verticalCursor_587192139;
      
      private var _embed_css_KapITComponents_swf_kScrollBar_thumbUpSkin_1433627803:Class = kHDividedBox__embed_css_KapITComponents_swf_kScrollBar_thumbUpSkin_1433627803;
      
      private var _embed_css_KapITComponents_swf_kScrollBar_upArrowOverSkin_766245078:Class = kHDividedBox__embed_css_KapITComponents_swf_kScrollBar_upArrowOverSkin_766245078;
      
      private var _embed_css_KapITComponents_swf_kScrollBar_downArrowUpSkin_2141391050:Class = kHDividedBox__embed_css_KapITComponents_swf_kScrollBar_downArrowUpSkin_2141391050;
      
      private var _embed_css_KapITComponents_swf_kDividedBox_horizontalCursor_1013389719:Class = kHDividedBox__embed_css_KapITComponents_swf_kDividedBox_horizontalCursor_1013389719;
      
      private var _embed_css_KapITComponents_swf_kScrollBar_trackOverSkin_1762976781:Class = kHDividedBox__embed_css_KapITComponents_swf_kScrollBar_trackOverSkin_1762976781;
      
      private var _embed_css_KapITComponents_swf_kScrollBar_thumbIcon_253178714:Class = kHDividedBox__embed_css_KapITComponents_swf_kScrollBar_thumbIcon_253178714;
      
      private var _embed_css_KapITComponents_swf_kScrollBar_upArrowDisabledSkin_977525842:Class = kHDividedBox__embed_css_KapITComponents_swf_kScrollBar_upArrowDisabledSkin_977525842;
      
      private var _embed_css_KapITComponents_swf_kScrollBar_trackDisabledSkin_2027751755:Class = kHDividedBox__embed_css_KapITComponents_swf_kScrollBar_trackDisabledSkin_2027751755;
      
      private var _embed_css_KapITComponents_swf_kComboBox_editableOverSkin_2043166727:Class = kHDividedBox__embed_css_KapITComponents_swf_kComboBox_editableOverSkin_2043166727;
      
      private var _embed_css_KapITComponents_swf_kTree_disclosureOpenIcon_1930422001:Class = kHDividedBox__embed_css_KapITComponents_swf_kTree_disclosureOpenIcon_1930422001;
      
      private var _embed_css_KapITComponents_swf_kScrollBar_thumbOverSkin_867229266:Class = kHDividedBox__embed_css_KapITComponents_swf_kScrollBar_thumbOverSkin_867229266;
      
      private var _embed_css_KapITComponents_swf_kScrollBar_downArrowOverSkin_62075329:Class = kHDividedBox__embed_css_KapITComponents_swf_kScrollBar_downArrowOverSkin_62075329;
      
      private var _embed_css_KapITComponents_swf_kScrollBar_upArrowUpSkin_552402995:Class = kHDividedBox__embed_css_KapITComponents_swf_kScrollBar_upArrowUpSkin_552402995;
      
      private var _embed_css_KapITComponents_swf_kTree_folderClosedIcon_706738564:Class = kHDividedBox__embed_css_KapITComponents_swf_kTree_folderClosedIcon_706738564;
      
      private var _embed_css_KapITComponents_swf_kDividedBox_dividerSkin_93301549:Class = kHDividedBox__embed_css_KapITComponents_swf_kDividedBox_dividerSkin_93301549;
      
      private var _embed_css_KapITComponents_swf_kTree_defaultLeafIcon_803570285:Class = kHDividedBox__embed_css_KapITComponents_swf_kTree_defaultLeafIcon_803570285;
      
      private var _embed_css_KapITComponents_swf_kTree_disclosureClosedIcon_746874557:Class = kHDividedBox__embed_css_KapITComponents_swf_kTree_disclosureClosedIcon_746874557;
      
      private var _embed_css_KapITComponents_swf_kScrollBar_downArrowDisabledSkin_356892247:Class = kHDividedBox__embed_css_KapITComponents_swf_kScrollBar_downArrowDisabledSkin_356892247;
      
      private var _embed_css_KapITComponents_swf_kComboBox_editableUpSkin_1663967998:Class = kHDividedBox__embed_css_KapITComponents_swf_kComboBox_editableUpSkin_1663967998;
      
      private var _embed_css_KapITComponents_swf_kDataGrid_sortArrowSkin_1348335407:Class = kHDividedBox__embed_css_KapITComponents_swf_kDataGrid_sortArrowSkin_1348335407;
      
      private var _embed_css_KapITComponents_swf_kTree_folderOpenIcon_180147598:Class = kHDividedBox__embed_css_KapITComponents_swf_kTree_folderOpenIcon_180147598;
      
      public function kHDividedBox()
      {
         super();
         mx_internal::_document = this;
         this.tabEnabled = false;
         this.styleName = "kDividedBox";
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         mx_internal::_kHDividedBox_StylesInit();
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      mx_internal function _kHDividedBox_StylesInit() : void
      {
         var style:CSSStyleDeclaration = null;
         var effects:Array = null;
         var conditions:Array = null;
         var condition:CSSCondition = null;
         var selector:CSSSelector = null;
         if(mx_internal::_kHDividedBox_StylesInit_done)
         {
            return;
         }
         mx_internal::_kHDividedBox_StylesInit_done = true;
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kButton");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fillColor = 16777215;
               this.kerning = false;
               this.iconColor = 1118481;
               this.textRollOverColor = 2831164;
               this.horizontalAlign = "left";
               this.shadowCapColor = 14015965;
               this.backgroundAlpha = 1;
               this.filled = true;
               this.roundedBottomCorners = true;
               this.fontThickness = 0;
               this.focusBlendMode = "normal";
               this.fillColors = [16777215,13421772,16777215,15658734];
               this.horizontalGap = 8;
               this.borderCapColor = 9542041;
               this.buttonColor = 7305079;
               this.indentation = 17;
               this.selectionDisabledColor = 14540253;
               this.closeDuration = 250;
               this.embedFonts = false;
               this.paddingTop = 0;
               this.letterSpacing = 0;
               this.focusAlpha = 0.4;
               this.bevel = true;
               this.fontSize = 9;
               this.shadowColor = 15658734;
               this.borderAlpha = 1;
               this.paddingLeft = 5;
               this.fontWeight = "normal";
               this.indicatorGap = 14;
               this.focusSkin = FocusSkin;
               this.dropShadowEnabled = false;
               this.leading = 0;
               this.borderSkin = HaloBorder;
               this.fontSharpness = 0;
               this.modalTransparencyDuration = 100;
               this.borderThickness = 1;
               this.backgroundSize = "auto";
               this.borderStyle = "solid";
               this.borderColor = 12040892;
               this.fontAntiAliasType = "advanced";
               this.errorColor = 16711680;
               this.shadowDistance = 2;
               this.horizontalGridLineColor = 16250871;
               this.stroked = false;
               this.modalTransparencyColor = 14540253;
               this.cornerRadius = 0;
               this.verticalAlign = "top";
               this.textIndent = 0;
               this.fillAlphas = [0.6,0.4,0.75,0.65];
               this.verticalGridLineColor = 14015965;
               this.themeColor = 40447;
               this.version = "2.0.1";
               this.shadowDirection = "center";
               this.modalTransparency = 0.5;
               this.repeatInterval = 35;
               this.openDuration = 250;
               this.textAlign = "left";
               this.fontFamily = "Verdana";
               this.textSelectedColor = 2831164;
               this.paddingBottom = 0;
               this.strokeWidth = 1;
               this.fontGridFitType = "pixel";
               this.horizontalGridLines = false;
               this.useRollOver = true;
               this.verticalGridLines = true;
               this.repeatDelay = 500;
               this.fontStyle = "normal";
               this.dropShadowColor = 0;
               this.focusThickness = 2;
               this.verticalGap = 6;
               this.disabledColor = 11187123;
               this.paddingRight = 5;
               this.focusRoundedCorners = "tl tr bl br";
               this.borderSides = "left top right bottom";
               this.disabledIconColor = 10066329;
               this.modalTransparencyBlur = 3;
               this.color = 3355443;
               this.selectionDuration = 250;
               this.highlightAlphas = [0.3,0];
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kComboBox");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kComboBox");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fillColor = 16777215;
               this.kerning = false;
               this.iconColor = 1118481;
               this.textRollOverColor = 2831164;
               this.horizontalAlign = "left";
               this.shadowCapColor = 14015965;
               this.backgroundAlpha = 1;
               this.filled = true;
               this.editableUpSkin = _embed_css_KapITComponents_swf_kComboBox_editableUpSkin_1663967998;
               this.roundedBottomCorners = true;
               this.fontThickness = 0;
               this.focusBlendMode = "normal";
               this.fillColors = [16777215,13421772,16777215,15658734];
               this.horizontalGap = 8;
               this.borderCapColor = 9542041;
               this.buttonColor = 7305079;
               this.indentation = 17;
               this.selectionDisabledColor = 14540253;
               this.closeDuration = 250;
               this.embedFonts = false;
               this.dropdownStyleName = "kDropdownStyle";
               this.paddingTop = 0;
               this.letterSpacing = 0;
               this.editableDownSkin = _embed_css_KapITComponents_swf_kComboBox_editableOverSkin_2043166727;
               this.focusAlpha = 0.4;
               this.textInputStyleName = "kComboBoxTextInput";
               this.bevel = true;
               this.fontSize = 9;
               this.shadowColor = 15658734;
               this.borderAlpha = 1;
               this.editableDisabledSkin = _embed_css_KapITComponents_swf_kComboBox_editableDisabledSkin_767376159;
               this.paddingLeft = 0;
               this.fontWeight = "normal";
               this.indicatorGap = 14;
               this.focusSkin = FocusSkin;
               this.dropShadowEnabled = false;
               this.leading = 2;
               this.borderSkin = HaloBorder;
               this.fontSharpness = 0;
               this.modalTransparencyDuration = 100;
               this.borderThickness = 1;
               this.backgroundSize = "auto";
               this.borderStyle = "solid";
               this.borderColor = 12040892;
               this.fontAntiAliasType = "advanced";
               this.errorColor = 16711680;
               this.shadowDistance = 2;
               this.horizontalGridLineColor = 16250871;
               this.stroked = false;
               this.modalTransparencyColor = 14540253;
               this.cornerRadius = 0;
               this.verticalAlign = "top";
               this.textIndent = 0;
               this.fillAlphas = [0.6,0.4,0.75,0.65];
               this.verticalGridLineColor = 14015965;
               this.themeColor = 40447;
               this.version = "2.0.1";
               this.shadowDirection = "center";
               this.modalTransparency = 0.5;
               this.repeatInterval = 35;
               this.openDuration = 250;
               this.editableOverSkin = _embed_css_KapITComponents_swf_kComboBox_editableOverSkin_2043166727;
               this.textAlign = "left";
               this.fontFamily = "Verdana";
               this.textSelectedColor = 2831164;
               this.paddingBottom = 0;
               this.strokeWidth = 1;
               this.fontGridFitType = "pixel";
               this.horizontalGridLines = false;
               this.useRollOver = true;
               this.verticalGridLines = true;
               this.repeatDelay = 500;
               this.fontStyle = "normal";
               this.dropShadowColor = 0;
               this.focusThickness = 2;
               this.verticalGap = 6;
               this.disabledColor = 11187123;
               this.paddingRight = 0;
               this.focusRoundedCorners = "tl tr bl br";
               this.borderSides = "left top right bottom";
               this.disabledIconColor = 10066329;
               this.modalTransparencyBlur = 3;
               this.color = 3355443;
               this.selectionDuration = 250;
               this.highlightAlphas = [0.3,0];
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kComboBoxTextInput");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kComboBoxTextInput");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fillColor = 16777215;
               this.kerning = false;
               this.iconColor = 1118481;
               this.textRollOverColor = 2831164;
               this.horizontalAlign = "left";
               this.shadowCapColor = 14015965;
               this.backgroundAlpha = 1;
               this.filled = true;
               this.roundedBottomCorners = true;
               this.fontThickness = 0;
               this.focusBlendMode = "normal";
               this.fillColors = [16777215,13421772,16777215,15658734];
               this.horizontalGap = 8;
               this.borderCapColor = 9542041;
               this.buttonColor = 7305079;
               this.indentation = 17;
               this.selectionDisabledColor = 14540253;
               this.closeDuration = 250;
               this.embedFonts = false;
               this.paddingTop = 0;
               this.letterSpacing = 0;
               this.focusAlpha = 0.4;
               this.bevel = true;
               this.fontSize = 10;
               this.shadowColor = 15658734;
               this.borderAlpha = 1;
               this.paddingLeft = 0;
               this.fontWeight = "normal";
               this.indicatorGap = 14;
               this.focusSkin = HaloFocusRect;
               this.dropShadowEnabled = false;
               this.leading = 2;
               this.borderSkin = HaloBorder;
               this.fontSharpness = 0;
               this.modalTransparencyDuration = 100;
               this.borderThickness = 1;
               this.backgroundSize = "auto";
               this.borderStyle = "solid";
               this.borderColor = 12040892;
               this.fontAntiAliasType = "advanced";
               this.errorColor = 16711680;
               this.shadowDistance = 2;
               this.horizontalGridLineColor = 16250871;
               this.stroked = false;
               this.modalTransparencyColor = 14540253;
               this.cornerRadius = 0;
               this.verticalAlign = "top";
               this.textIndent = 0;
               this.fillAlphas = [0.6,0.4,0.75,0.65];
               this.verticalGridLineColor = 14015965;
               this.themeColor = 40447;
               this.version = "2.0.1";
               this.shadowDirection = "center";
               this.modalTransparency = 0.5;
               this.repeatInterval = 35;
               this.openDuration = 250;
               this.textAlign = "left";
               this.fontFamily = "Verdana";
               this.textSelectedColor = 2831164;
               this.paddingBottom = 0;
               this.strokeWidth = 1;
               this.fontGridFitType = "pixel";
               this.horizontalGridLines = false;
               this.useRollOver = true;
               this.verticalGridLines = true;
               this.repeatDelay = 500;
               this.fontStyle = "normal";
               this.dropShadowColor = 0;
               this.focusThickness = 2;
               this.verticalGap = 6;
               this.disabledColor = 11187123;
               this.paddingRight = 0;
               this.focusRoundedCorners = "tl tr bl br";
               this.borderSides = "left top right bottom";
               this.disabledIconColor = 10066329;
               this.modalTransparencyBlur = 3;
               this.color = 734012;
               this.selectionDuration = 250;
               this.highlightAlphas = [0.3,0];
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kDataGrid");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kDataGrid");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fillColor = 16777215;
               this.kerning = false;
               this.iconColor = 1118481;
               this.textRollOverColor = 2831164;
               this.horizontalAlign = "left";
               this.shadowCapColor = 14015965;
               this.backgroundAlpha = 1;
               this.filled = true;
               this.roundedBottomCorners = true;
               this.fontThickness = 0;
               this.focusBlendMode = "normal";
               this.fillColors = [16777215,13421772,16777215,15658734];
               this.horizontalGap = 8;
               this.borderCapColor = 9542041;
               this.buttonColor = 7305079;
               this.indentation = 17;
               this.selectionDisabledColor = 14540253;
               this.closeDuration = 250;
               this.embedFonts = false;
               this.paddingTop = 0;
               this.letterSpacing = 0;
               this.rollOverColor = 16772044;
               this.focusAlpha = 0.4;
               this.bevel = true;
               this.fontSize = 9;
               this.shadowColor = 15658734;
               this.borderAlpha = 1;
               this.paddingLeft = 0;
               this.fontWeight = "normal";
               this.indicatorGap = 14;
               this.focusSkin = HaloFocusRect;
               this.dropShadowEnabled = false;
               this.leading = 2;
               this.borderSkin = HaloBorder;
               this.fontSharpness = 0;
               this.modalTransparencyDuration = 100;
               this.borderThickness = 1;
               this.backgroundSize = "auto";
               this.borderStyle = "solid";
               this.borderColor = 10592673;
               this.fontAntiAliasType = "advanced";
               this.errorColor = 16711680;
               this.shadowDistance = 2;
               this.horizontalGridLineColor = 16250871;
               this.stroked = false;
               this.modalTransparencyColor = 14540253;
               this.cornerRadius = 0;
               this.verticalAlign = "top";
               this.textIndent = 0;
               this.fillAlphas = [0.6,0.4,0.75,0.65];
               this.verticalGridLineColor = 14015965;
               this.themeColor = 40447;
               this.version = "2.0.1";
               this.shadowDirection = "center";
               this.modalTransparency = 0.5;
               this.repeatInterval = 35;
               this.openDuration = 250;
               this.textAlign = "left";
               this.fontFamily = "Verdana";
               this.textSelectedColor = 2831164;
               this.paddingBottom = 0;
               this.strokeWidth = 1;
               this.sortArrowSkin = _embed_css_KapITComponents_swf_kDataGrid_sortArrowSkin_1348335407;
               this.fontGridFitType = "pixel";
               this.verticalScrollBarStyleName = "kScrollBar";
               this.horizontalGridLines = false;
               this.horizontalScrollBarStyleName = "kScrollBar";
               this.useRollOver = true;
               this.verticalGridLines = true;
               this.repeatDelay = 500;
               this.fontStyle = "normal";
               this.dropShadowColor = 0;
               this.focusThickness = 2;
               this.selectionColor = 16766617;
               this.verticalGap = 6;
               this.disabledColor = 11187123;
               this.paddingRight = 0;
               this.focusRoundedCorners = "tl tr bl br";
               this.borderSides = "left top right bottom";
               this.disabledIconColor = 10066329;
               this.modalTransparencyBlur = 3;
               this.color = 3355443;
               this.selectionDuration = 250;
               this.highlightAlphas = [0.3,0];
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kDropdownStyle");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kDropdownStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fillColor = 16777215;
               this.kerning = false;
               this.iconColor = 1118481;
               this.textRollOverColor = 2831164;
               this.horizontalAlign = "left";
               this.shadowCapColor = 14015965;
               this.backgroundAlpha = 1;
               this.filled = true;
               this.roundedBottomCorners = true;
               this.fontThickness = 0;
               this.focusBlendMode = "normal";
               this.fillColors = [16777215,13421772,16777215,15658734];
               this.horizontalGap = 8;
               this.borderCapColor = 9542041;
               this.buttonColor = 7305079;
               this.indentation = 17;
               this.selectionDisabledColor = 14540253;
               this.closeDuration = 250;
               this.embedFonts = false;
               this.paddingTop = 0;
               this.letterSpacing = 0;
               this.rollOverColor = 16772044;
               this.focusAlpha = 0.4;
               this.bevel = true;
               this.fontSize = 10;
               this.shadowColor = 15658734;
               this.borderAlpha = 1;
               this.paddingLeft = 0;
               this.fontWeight = "normal";
               this.indicatorGap = 14;
               this.focusSkin = HaloFocusRect;
               this.dropShadowEnabled = false;
               this.leading = 2;
               this.borderSkin = HaloBorder;
               this.fontSharpness = 0;
               this.modalTransparencyDuration = 100;
               this.borderThickness = 1;
               this.backgroundSize = "auto";
               this.borderStyle = "solid";
               this.borderColor = 12040892;
               this.fontAntiAliasType = "advanced";
               this.errorColor = 16711680;
               this.shadowDistance = 2;
               this.horizontalGridLineColor = 16250871;
               this.stroked = false;
               this.modalTransparencyColor = 14540253;
               this.cornerRadius = 3;
               this.verticalAlign = "top";
               this.textIndent = 0;
               this.fillAlphas = [0.6,0.4,0.75,0.65];
               this.verticalGridLineColor = 14015965;
               this.themeColor = 40447;
               this.version = "2.0.1";
               this.shadowDirection = "center";
               this.modalTransparency = 0.5;
               this.repeatInterval = 35;
               this.openDuration = 250;
               this.textAlign = "left";
               this.fontFamily = "Verdana";
               this.textSelectedColor = 2831164;
               this.paddingBottom = 0;
               this.strokeWidth = 1;
               this.fontGridFitType = "pixel";
               this.verticalScrollBarStyleName = "kScrollBar";
               this.horizontalGridLines = false;
               this.useRollOver = true;
               this.verticalGridLines = true;
               this.repeatDelay = 500;
               this.fontStyle = "normal";
               this.dropShadowColor = 0;
               this.focusThickness = 2;
               this.selectionColor = 16766617;
               this.verticalGap = 6;
               this.disabledColor = 11187123;
               this.paddingRight = 0;
               this.focusRoundedCorners = "tl tr bl br";
               this.borderSides = "left top right bottom";
               this.disabledIconColor = 10066329;
               this.modalTransparencyBlur = 3;
               this.color = 3355443;
               this.selectionDuration = 250;
               this.highlightAlphas = [0.3,0];
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kLabel");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fillColor = 16777215;
               this.kerning = false;
               this.iconColor = 1118481;
               this.textRollOverColor = 2831164;
               this.horizontalAlign = "left";
               this.shadowCapColor = 14015965;
               this.backgroundAlpha = 1;
               this.filled = true;
               this.roundedBottomCorners = true;
               this.fontThickness = 0;
               this.focusBlendMode = "normal";
               this.fillColors = [16777215,13421772,16777215,15658734];
               this.horizontalGap = 8;
               this.borderCapColor = 9542041;
               this.buttonColor = 7305079;
               this.indentation = 17;
               this.selectionDisabledColor = 14540253;
               this.closeDuration = 250;
               this.embedFonts = false;
               this.paddingTop = 0;
               this.letterSpacing = 0;
               this.focusAlpha = 0.4;
               this.bevel = true;
               this.fontSize = 9;
               this.shadowColor = 15658734;
               this.borderAlpha = 1;
               this.paddingLeft = 0;
               this.fontWeight = "bold";
               this.indicatorGap = 14;
               this.focusSkin = HaloFocusRect;
               this.dropShadowEnabled = false;
               this.leading = 2;
               this.borderSkin = HaloBorder;
               this.fontSharpness = 0;
               this.modalTransparencyDuration = 100;
               this.borderThickness = 1;
               this.backgroundSize = "auto";
               this.borderStyle = "solid";
               this.borderColor = 12040892;
               this.fontAntiAliasType = "advanced";
               this.errorColor = 16711680;
               this.shadowDistance = 2;
               this.horizontalGridLineColor = 16250871;
               this.stroked = false;
               this.modalTransparencyColor = 14540253;
               this.cornerRadius = 0;
               this.verticalAlign = "top";
               this.textIndent = 0;
               this.fillAlphas = [0.6,0.4,0.75,0.65];
               this.verticalGridLineColor = 14015965;
               this.themeColor = 40447;
               this.version = "2.0.1";
               this.shadowDirection = "center";
               this.modalTransparency = 0.5;
               this.repeatInterval = 35;
               this.openDuration = 250;
               this.textAlign = "left";
               this.fontFamily = "Verdana";
               this.textSelectedColor = 2831164;
               this.paddingBottom = 0;
               this.strokeWidth = 1;
               this.fontGridFitType = "pixel";
               this.horizontalGridLines = false;
               this.useRollOver = true;
               this.verticalGridLines = true;
               this.repeatDelay = 500;
               this.fontStyle = "normal";
               this.dropShadowColor = 0;
               this.focusThickness = 2;
               this.verticalGap = 6;
               this.disabledColor = 11187123;
               this.paddingRight = 0;
               this.focusRoundedCorners = "tl tr bl br";
               this.borderSides = "left top right bottom";
               this.disabledIconColor = 10066329;
               this.modalTransparencyBlur = 3;
               this.color = 3355443;
               this.selectionDuration = 250;
               this.highlightAlphas = [0.3,0];
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kList");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kList");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fillColor = 16777215;
               this.kerning = false;
               this.iconColor = 1118481;
               this.textRollOverColor = 2831164;
               this.horizontalAlign = "left";
               this.shadowCapColor = 14015965;
               this.backgroundAlpha = 1;
               this.filled = true;
               this.roundedBottomCorners = true;
               this.fontThickness = 0;
               this.focusBlendMode = "normal";
               this.fillColors = [16777215,13421772,16777215,15658734];
               this.horizontalGap = 8;
               this.borderCapColor = 9542041;
               this.buttonColor = 7305079;
               this.indentation = 17;
               this.selectionDisabledColor = 14540253;
               this.closeDuration = 250;
               this.embedFonts = false;
               this.paddingTop = 0;
               this.letterSpacing = 0;
               this.rollOverColor = 16772044;
               this.focusAlpha = 0.4;
               this.bevel = true;
               this.fontSize = 9;
               this.shadowColor = 15658734;
               this.borderAlpha = 1;
               this.paddingLeft = 0;
               this.fontWeight = "normal";
               this.indicatorGap = 14;
               this.focusSkin = HaloFocusRect;
               this.dropShadowEnabled = false;
               this.leading = 2;
               this.borderSkin = HaloBorder;
               this.fontSharpness = 0;
               this.modalTransparencyDuration = 100;
               this.borderThickness = 1;
               this.backgroundSize = "auto";
               this.borderStyle = "solid";
               this.borderColor = 10592673;
               this.fontAntiAliasType = "advanced";
               this.errorColor = 16711680;
               this.shadowDistance = 2;
               this.horizontalGridLineColor = 16250871;
               this.stroked = false;
               this.modalTransparencyColor = 14540253;
               this.cornerRadius = 0;
               this.verticalAlign = "top";
               this.textIndent = 0;
               this.fillAlphas = [0.6,0.4,0.75,0.65];
               this.verticalGridLineColor = 14015965;
               this.themeColor = 40447;
               this.version = "2.0.1";
               this.shadowDirection = "center";
               this.modalTransparency = 0.5;
               this.repeatInterval = 35;
               this.openDuration = 250;
               this.textAlign = "left";
               this.fontFamily = "Verdana";
               this.textSelectedColor = 2831164;
               this.paddingBottom = 0;
               this.strokeWidth = 1;
               this.fontGridFitType = "pixel";
               this.verticalScrollBarStyleName = "kScrollBar";
               this.horizontalGridLines = false;
               this.horizontalScrollBarStyleName = "kScrollBar";
               this.useRollOver = true;
               this.verticalGridLines = true;
               this.repeatDelay = 500;
               this.fontStyle = "normal";
               this.dropShadowColor = 0;
               this.focusThickness = 2;
               this.selectionColor = 16766617;
               this.verticalGap = 6;
               this.disabledColor = 11187123;
               this.paddingRight = 0;
               this.focusRoundedCorners = "tl tr bl br";
               this.borderSides = "left top right bottom";
               this.disabledIconColor = 10066329;
               this.modalTransparencyBlur = 3;
               this.color = 3355443;
               this.selectionDuration = 250;
               this.highlightAlphas = [0.3,0];
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kPanel");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kPanel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fillColor = 16777215;
               this.kerning = false;
               this.iconColor = 1118481;
               this.textRollOverColor = 2831164;
               this.horizontalAlign = "left";
               this.shadowCapColor = 14015965;
               this.backgroundAlpha = 1;
               this.filled = true;
               this.roundedBottomCorners = true;
               this.fontThickness = 0;
               this.focusBlendMode = "normal";
               this.fillColors = [16777215,13421772,16777215,15658734];
               this.horizontalGap = 8;
               this.borderCapColor = 9542041;
               this.buttonColor = 7305079;
               this.indentation = 17;
               this.selectionDisabledColor = 14540253;
               this.closeDuration = 250;
               this.embedFonts = false;
               this.paddingTop = 0;
               this.letterSpacing = 0;
               this.focusAlpha = 0.4;
               this.bevel = true;
               this.fontSize = 10;
               this.shadowColor = 15658734;
               this.borderAlpha = 1;
               this.paddingLeft = 0;
               this.titleStyleName = "kPanelTitleStyle";
               this.fontWeight = "normal";
               this.indicatorGap = 14;
               this.focusSkin = HaloFocusRect;
               this.dropShadowEnabled = false;
               this.leading = 2;
               this.borderSkin = BorderSkinWithShadow;
               this.fontSharpness = 0;
               this.modalTransparencyDuration = 100;
               this.borderThickness = 1;
               this.backgroundSize = "auto";
               this.borderStyle = "solid";
               this.borderColor = 12040892;
               this.fontAntiAliasType = "advanced";
               this.errorColor = 16711680;
               this.shadowDistance = 2;
               this.horizontalGridLineColor = 16250871;
               this.stroked = false;
               this.modalTransparencyColor = 14540253;
               this.cornerRadius = 0;
               this.verticalAlign = "top";
               this.textIndent = 0;
               this.fillAlphas = [0.6,0.4,0.75,0.65];
               this.verticalGridLineColor = 14015965;
               this.themeColor = 40447;
               this.version = "2.0.1";
               this.shadowDirection = "center";
               this.modalTransparency = 0.5;
               this.repeatInterval = 35;
               this.openDuration = 250;
               this.textAlign = "left";
               this.fontFamily = "Verdana";
               this.textSelectedColor = 2831164;
               this.paddingBottom = 0;
               this.strokeWidth = 1;
               this.fontGridFitType = "pixel";
               this.horizontalGridLines = false;
               this.useRollOver = true;
               this.verticalGridLines = true;
               this.repeatDelay = 500;
               this.fontStyle = "normal";
               this.dropShadowColor = 0;
               this.focusThickness = 2;
               this.verticalGap = 6;
               this.disabledColor = 11187123;
               this.paddingRight = 0;
               this.focusRoundedCorners = "tl tr bl br";
               this.borderSides = "left top right bottom";
               this.disabledIconColor = 10066329;
               this.modalTransparencyBlur = 3;
               this.color = 734012;
               this.selectionDuration = 250;
               this.highlightAlphas = [0.3,0];
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kRadioButton");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kRadioButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fillColor = 16777215;
               this.kerning = false;
               this.iconColor = 1118481;
               this.textRollOverColor = 2831164;
               this.horizontalAlign = "left";
               this.shadowCapColor = 14015965;
               this.backgroundAlpha = 1;
               this.filled = true;
               this.roundedBottomCorners = true;
               this.fontThickness = 0;
               this.focusBlendMode = "normal";
               this.fillColors = [16777215,13421772,16777215,15658734];
               this.horizontalGap = 2;
               this.borderCapColor = 9542041;
               this.buttonColor = 7305079;
               this.indentation = 17;
               this.selectionDisabledColor = 14540253;
               this.closeDuration = 250;
               this.embedFonts = false;
               this.paddingTop = 0;
               this.letterSpacing = 0;
               this.focusAlpha = 0.4;
               this.bevel = true;
               this.fontSize = 9;
               this.shadowColor = 15658734;
               this.borderAlpha = 1;
               this.paddingLeft = 0;
               this.fontWeight = "normal";
               this.indicatorGap = 14;
               this.focusSkin = FocusSkin;
               this.dropShadowEnabled = false;
               this.leading = 0;
               this.borderSkin = HaloBorder;
               this.fontSharpness = 0;
               this.modalTransparencyDuration = 100;
               this.borderThickness = 1;
               this.backgroundSize = "auto";
               this.borderStyle = "solid";
               this.borderColor = 12040892;
               this.fontAntiAliasType = "advanced";
               this.errorColor = 16711680;
               this.shadowDistance = 2;
               this.horizontalGridLineColor = 16250871;
               this.stroked = false;
               this.modalTransparencyColor = 14540253;
               this.cornerRadius = 0;
               this.verticalAlign = "top";
               this.textIndent = 0;
               this.fillAlphas = [0.6,0.4,0.75,0.65];
               this.verticalGridLineColor = 14015965;
               this.themeColor = 40447;
               this.version = "2.0.1";
               this.shadowDirection = "center";
               this.modalTransparency = 0.5;
               this.repeatInterval = 35;
               this.openDuration = 250;
               this.textAlign = "left";
               this.fontFamily = "Verdana";
               this.textSelectedColor = 2831164;
               this.paddingBottom = 0;
               this.strokeWidth = 1;
               this.fontGridFitType = "pixel";
               this.horizontalGridLines = false;
               this.useRollOver = true;
               this.verticalGridLines = true;
               this.repeatDelay = 500;
               this.fontStyle = "normal";
               this.dropShadowColor = 0;
               this.focusThickness = 2;
               this.verticalGap = 6;
               this.disabledColor = 11187123;
               this.paddingRight = 0;
               this.focusRoundedCorners = "tl tr bl br";
               this.borderSides = "left top right bottom";
               this.disabledIconColor = 10066329;
               this.modalTransparencyBlur = 3;
               this.color = 3355443;
               this.selectionDuration = 250;
               this.highlightAlphas = [0.3,0];
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kText");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kText");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fillColor = 16777215;
               this.kerning = false;
               this.iconColor = 1118481;
               this.textRollOverColor = 2831164;
               this.horizontalAlign = "left";
               this.shadowCapColor = 14015965;
               this.backgroundAlpha = 1;
               this.filled = true;
               this.roundedBottomCorners = true;
               this.fontThickness = 0;
               this.focusBlendMode = "normal";
               this.fillColors = [16777215,13421772,16777215,15658734];
               this.horizontalGap = 8;
               this.borderCapColor = 9542041;
               this.buttonColor = 7305079;
               this.indentation = 17;
               this.selectionDisabledColor = 14540253;
               this.closeDuration = 250;
               this.embedFonts = false;
               this.paddingTop = 0;
               this.letterSpacing = 0;
               this.focusAlpha = 0.4;
               this.bevel = true;
               this.fontSize = 9;
               this.shadowColor = 15658734;
               this.borderAlpha = 1;
               this.paddingLeft = 0;
               this.fontWeight = "normal";
               this.indicatorGap = 14;
               this.focusSkin = HaloFocusRect;
               this.dropShadowEnabled = false;
               this.leading = 0;
               this.borderSkin = HaloBorder;
               this.fontSharpness = 0;
               this.modalTransparencyDuration = 100;
               this.borderThickness = 1;
               this.backgroundSize = "auto";
               this.borderStyle = "solid";
               this.borderColor = 12040892;
               this.fontAntiAliasType = "advanced";
               this.errorColor = 16711680;
               this.shadowDistance = 2;
               this.horizontalGridLineColor = 16250871;
               this.stroked = false;
               this.modalTransparencyColor = 14540253;
               this.cornerRadius = 0;
               this.verticalAlign = "top";
               this.textIndent = 0;
               this.fillAlphas = [0.6,0.4,0.75,0.65];
               this.verticalGridLineColor = 14015965;
               this.themeColor = 40447;
               this.version = "2.0.1";
               this.shadowDirection = "center";
               this.modalTransparency = 0.5;
               this.repeatInterval = 35;
               this.openDuration = 250;
               this.textAlign = "left";
               this.fontFamily = "Verdana";
               this.textSelectedColor = 2831164;
               this.paddingBottom = 0;
               this.strokeWidth = 1;
               this.fontGridFitType = "pixel";
               this.horizontalGridLines = false;
               this.useRollOver = true;
               this.verticalGridLines = true;
               this.repeatDelay = 500;
               this.fontStyle = "normal";
               this.dropShadowColor = 0;
               this.focusThickness = 2;
               this.verticalGap = 6;
               this.disabledColor = 11187123;
               this.paddingRight = 0;
               this.focusRoundedCorners = "tl tr bl br";
               this.borderSides = "left top right bottom";
               this.disabledIconColor = 10066329;
               this.modalTransparencyBlur = 3;
               this.color = 3355443;
               this.selectionDuration = 250;
               this.highlightAlphas = [0.3,0];
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kTextArea");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kTextArea");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fillColor = 16777215;
               this.kerning = false;
               this.iconColor = 1118481;
               this.textRollOverColor = 2831164;
               this.horizontalAlign = "left";
               this.shadowCapColor = 14015965;
               this.backgroundAlpha = 1;
               this.filled = true;
               this.roundedBottomCorners = true;
               this.fontThickness = 0;
               this.focusBlendMode = "normal";
               this.fillColors = [16777215,13421772,16777215,15658734];
               this.horizontalGap = 8;
               this.borderCapColor = 9542041;
               this.buttonColor = 7305079;
               this.indentation = 17;
               this.selectionDisabledColor = 14540253;
               this.closeDuration = 250;
               this.embedFonts = false;
               this.paddingTop = 0;
               this.letterSpacing = 0;
               this.focusAlpha = 0.4;
               this.bevel = true;
               this.fontSize = 9;
               this.shadowColor = 15658734;
               this.borderAlpha = 1;
               this.paddingLeft = 0;
               this.fontWeight = "normal";
               this.indicatorGap = 14;
               this.focusSkin = FocusSkin;
               this.dropShadowEnabled = false;
               this.leading = 0;
               this.borderSkin = HaloBorder;
               this.fontSharpness = 0;
               this.modalTransparencyDuration = 100;
               this.borderThickness = 1;
               this.backgroundSize = "auto";
               this.borderStyle = "solid";
               this.borderColor = 10592673;
               this.fontAntiAliasType = "advanced";
               this.errorColor = 16711680;
               this.shadowDistance = 2;
               this.horizontalGridLineColor = 16250871;
               this.stroked = false;
               this.modalTransparencyColor = 14540253;
               this.cornerRadius = 0;
               this.verticalAlign = "top";
               this.textIndent = 0;
               this.fillAlphas = [0.6,0.4,0.75,0.65];
               this.verticalGridLineColor = 14015965;
               this.themeColor = 40447;
               this.version = "2.0.1";
               this.shadowDirection = "center";
               this.modalTransparency = 0.5;
               this.repeatInterval = 35;
               this.openDuration = 250;
               this.textAlign = "left";
               this.fontFamily = "Verdana";
               this.textSelectedColor = 2831164;
               this.paddingBottom = 0;
               this.strokeWidth = 1;
               this.fontGridFitType = "pixel";
               this.verticalScrollBarStyleName = "kScrollBar";
               this.horizontalGridLines = false;
               this.horizontalScrollBarStyleName = "kScrollBar";
               this.useRollOver = true;
               this.verticalGridLines = true;
               this.repeatDelay = 500;
               this.fontStyle = "normal";
               this.dropShadowColor = 0;
               this.focusThickness = 2;
               this.verticalGap = 6;
               this.disabledColor = 11187123;
               this.paddingRight = 0;
               this.focusRoundedCorners = "tl tr bl br";
               this.borderSides = "left top right bottom";
               this.disabledIconColor = 10066329;
               this.modalTransparencyBlur = 3;
               this.color = 3355443;
               this.selectionDuration = 250;
               this.highlightAlphas = [0.3,0];
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kTextInput");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kTextInput");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fillColor = 16777215;
               this.backgroundColor = 16777215;
               this.kerning = false;
               this.iconColor = 1118481;
               this.textRollOverColor = 2831164;
               this.horizontalAlign = "left";
               this.shadowCapColor = 14015965;
               this.backgroundAlpha = 1;
               this.filled = true;
               this.roundedBottomCorners = true;
               this.fontThickness = 0;
               this.focusBlendMode = "normal";
               this.fillColors = [16777215,13421772,16777215,15658734];
               this.horizontalGap = 8;
               this.borderCapColor = 9542041;
               this.buttonColor = 7305079;
               this.indentation = 17;
               this.selectionDisabledColor = 14540253;
               this.closeDuration = 250;
               this.embedFonts = false;
               this.paddingTop = 0;
               this.letterSpacing = 0;
               this.focusAlpha = 0.4;
               this.bevel = true;
               this.fontSize = 9;
               this.shadowColor = 15658734;
               this.borderAlpha = 1;
               this.paddingLeft = 0;
               this.fontWeight = "normal";
               this.indicatorGap = 14;
               this.focusSkin = FocusSkin;
               this.dropShadowEnabled = false;
               this.leading = 2;
               this.borderSkin = HaloBorder;
               this.fontSharpness = 0;
               this.modalTransparencyDuration = 100;
               this.borderThickness = 1;
               this.backgroundSize = "auto";
               this.borderStyle = "solid";
               this.borderColor = 10592673;
               this.fontAntiAliasType = "advanced";
               this.errorColor = 16711680;
               this.shadowDistance = 2;
               this.horizontalGridLineColor = 16250871;
               this.stroked = false;
               this.modalTransparencyColor = 14540253;
               this.cornerRadius = 0;
               this.verticalAlign = "top";
               this.textIndent = 0;
               this.fillAlphas = [0.6,0.4,0.75,0.65];
               this.verticalGridLineColor = 14015965;
               this.themeColor = 40447;
               this.version = "2.0.1";
               this.shadowDirection = "center";
               this.modalTransparency = 0.5;
               this.repeatInterval = 35;
               this.openDuration = 250;
               this.textAlign = "left";
               this.fontFamily = "Verdana";
               this.textSelectedColor = 2831164;
               this.paddingBottom = 0;
               this.strokeWidth = 1;
               this.fontGridFitType = "pixel";
               this.horizontalGridLines = false;
               this.useRollOver = true;
               this.verticalGridLines = true;
               this.repeatDelay = 500;
               this.fontStyle = "normal";
               this.dropShadowColor = 0;
               this.focusThickness = 2;
               this.verticalGap = 6;
               this.disabledColor = 11187123;
               this.paddingRight = 0;
               this.focusRoundedCorners = "tl tr bl br";
               this.borderSides = "left top right bottom";
               this.disabledIconColor = 10066329;
               this.modalTransparencyBlur = 3;
               this.color = 3355443;
               this.selectionDuration = 250;
               this.highlightAlphas = [0.3,0];
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kTree");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kTree");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fillColor = 16777215;
               this.kerning = false;
               this.folderOpenIcon = _embed_css_KapITComponents_swf_kTree_folderOpenIcon_180147598;
               this.iconColor = 1118481;
               this.textRollOverColor = 2831164;
               this.horizontalAlign = "left";
               this.shadowCapColor = 14015965;
               this.backgroundAlpha = 1;
               this.filled = true;
               this.roundedBottomCorners = true;
               this.disclosureClosedIcon = _embed_css_KapITComponents_swf_kTree_disclosureClosedIcon_746874557;
               this.fontThickness = 0;
               this.focusBlendMode = "normal";
               this.fillColors = [16777215,13421772,16777215,15658734];
               this.horizontalGap = 8;
               this.borderCapColor = 9542041;
               this.buttonColor = 7305079;
               this.indentation = 17;
               this.selectionDisabledColor = 14540253;
               this.closeDuration = 250;
               this.embedFonts = false;
               this.paddingTop = 0;
               this.letterSpacing = 0;
               this.rollOverColor = 16772044;
               this.focusAlpha = 0.4;
               this.bevel = true;
               this.fontSize = 9;
               this.shadowColor = 15658734;
               this.borderAlpha = 1;
               this.paddingLeft = 0;
               this.fontWeight = "normal";
               this.indicatorGap = 14;
               this.focusSkin = HaloFocusRect;
               this.folderClosedIcon = _embed_css_KapITComponents_swf_kTree_folderClosedIcon_706738564;
               this.dropShadowEnabled = false;
               this.leading = 2;
               this.borderSkin = HaloBorder;
               this.fontSharpness = 0;
               this.modalTransparencyDuration = 100;
               this.borderThickness = 1;
               this.backgroundSize = "auto";
               this.borderStyle = "solid";
               this.borderColor = 12040892;
               this.fontAntiAliasType = "advanced";
               this.errorColor = 16711680;
               this.shadowDistance = 2;
               this.horizontalGridLineColor = 16250871;
               this.stroked = false;
               this.modalTransparencyColor = 14540253;
               this.cornerRadius = 0;
               this.verticalAlign = "top";
               this.textIndent = 0;
               this.fillAlphas = [0.6,0.4,0.75,0.65];
               this.verticalGridLineColor = 14015965;
               this.themeColor = 40447;
               this.version = "2.0.1";
               this.shadowDirection = "center";
               this.modalTransparency = 0.5;
               this.disclosureOpenIcon = _embed_css_KapITComponents_swf_kTree_disclosureOpenIcon_1930422001;
               this.repeatInterval = 35;
               this.openDuration = 250;
               this.textAlign = "left";
               this.fontFamily = "Verdana";
               this.defaultLeafIcon = _embed_css_KapITComponents_swf_kTree_defaultLeafIcon_803570285;
               this.textSelectedColor = 2831164;
               this.paddingBottom = 0;
               this.strokeWidth = 1;
               this.fontGridFitType = "pixel";
               this.verticalScrollBarStyleName = "kScrollBar";
               this.horizontalGridLines = false;
               this.horizontalScrollBarStyleName = "kScrollBar";
               this.useRollOver = true;
               this.verticalGridLines = true;
               this.repeatDelay = 500;
               this.fontStyle = "normal";
               this.dropShadowColor = 0;
               this.focusThickness = 2;
               this.selectionColor = 16766617;
               this.verticalGap = 6;
               this.disabledColor = 11187123;
               this.paddingRight = 0;
               this.focusRoundedCorners = "tl tr bl br";
               this.borderSides = "left top right bottom";
               this.disabledIconColor = 10066329;
               this.modalTransparencyBlur = 3;
               this.color = 3355443;
               this.selectionDuration = 250;
               this.highlightAlphas = [0.3,0];
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","defaultStyles");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".defaultStyles");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fillColor = 16777215;
               this.kerning = false;
               this.iconColor = 1118481;
               this.textRollOverColor = 2831164;
               this.horizontalAlign = "left";
               this.shadowCapColor = 14015965;
               this.backgroundAlpha = 1;
               this.filled = true;
               this.roundedBottomCorners = true;
               this.fontThickness = 0;
               this.focusBlendMode = "normal";
               this.fillColors = [16777215,13421772,16777215,15658734];
               this.horizontalGap = 8;
               this.borderCapColor = 9542041;
               this.buttonColor = 7305079;
               this.indentation = 17;
               this.selectionDisabledColor = 14540253;
               this.closeDuration = 250;
               this.embedFonts = false;
               this.paddingTop = 0;
               this.letterSpacing = 0;
               this.focusAlpha = 0.4;
               this.bevel = true;
               this.fontSize = 10;
               this.shadowColor = 15658734;
               this.borderAlpha = 1;
               this.paddingLeft = 0;
               this.fontWeight = "normal";
               this.indicatorGap = 14;
               this.focusSkin = HaloFocusRect;
               this.dropShadowEnabled = false;
               this.leading = 2;
               this.borderSkin = HaloBorder;
               this.fontSharpness = 0;
               this.modalTransparencyDuration = 100;
               this.borderThickness = 1;
               this.backgroundSize = "auto";
               this.borderStyle = "solid";
               this.borderColor = 12040892;
               this.fontAntiAliasType = "advanced";
               this.errorColor = 16711680;
               this.shadowDistance = 2;
               this.horizontalGridLineColor = 16250871;
               this.stroked = false;
               this.modalTransparencyColor = 14540253;
               this.cornerRadius = 0;
               this.verticalAlign = "top";
               this.textIndent = 0;
               this.fillAlphas = [0.6,0.4,0.75,0.65];
               this.verticalGridLineColor = 14015965;
               this.themeColor = 40447;
               this.version = "2.0.1";
               this.shadowDirection = "center";
               this.modalTransparency = 0.5;
               this.repeatInterval = 35;
               this.openDuration = 250;
               this.textAlign = "left";
               this.fontFamily = "Verdana";
               this.textSelectedColor = 2831164;
               this.paddingBottom = 0;
               this.strokeWidth = 1;
               this.fontGridFitType = "pixel";
               this.horizontalGridLines = false;
               this.useRollOver = true;
               this.verticalGridLines = true;
               this.repeatDelay = 500;
               this.fontStyle = "normal";
               this.dropShadowColor = 0;
               this.focusThickness = 2;
               this.verticalGap = 6;
               this.disabledColor = 11187123;
               this.paddingRight = 0;
               this.focusRoundedCorners = "tl tr bl br";
               this.borderSides = "left top right bottom";
               this.disabledIconColor = 10066329;
               this.modalTransparencyBlur = 3;
               this.color = 734012;
               this.selectionDuration = 250;
               this.highlightAlphas = [0.3,0];
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kCheckBox");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kCheckBox");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.focusSkin = FocusSkin;
               this.paddingTop = 0;
               this.leading = 0;
               this.color = 3355443;
               this.fontFamily = "Verdana";
               this.fontSize = 9;
               this.horizontalGap = 2;
               this.paddingLeft = 0;
               this.paddingBottom = 0;
               this.paddingRight = 0;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kColorPicker");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kColorPicker");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderThickness = 0;
               this.highlightAlphas = [0.3,0];
               this.themeColor = 16750848;
               this.swatchPanelStyleName = "colorPickerSwatchPanelStyleName";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","colorPickerSwatchPanelStyleName");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".colorPickerSwatchPanelStyleName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.previewHeight = 22;
               this.swatchGridBackgroundColor = 6710886;
               this.backgroundColor = 15198183;
               this.swatchWidth = 10;
               this.textFieldStyleName = "colorPickerFontStyle";
               this.swatchHighlightSize = 1;
               this.swatchHeight = 10;
               this.previewWidth = 22;
               this.verticalGap = 0;
               this.swatchBorderSize = 0;
               this.columnCount = 20;
               this.swatchGridBorderSize = 0;
               this.textFieldWidth = 72;
               this.swatchHighlightColor = 16777215;
               this.horizontalGap = 0;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","colorPickerFontStyle");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".colorPickerFontStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "normal";
               this.color = 3355443;
               this.textRollOverColor = 10066329;
               this.fontFamily = "Verdana";
               this.fontSize = 9;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kHBox");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kHBox");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.paddingTop = 0;
               this.verticalScrollBarStyleName = "kScrollBar";
               this.horizontalScrollBarStyleName = "kScrollBar";
               this.horizontalGap = 0;
               this.paddingLeft = 0;
               this.paddingBottom = 0;
               this.paddingRight = 0;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kDividedBox");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kDividedBox");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.paddingTop = 0;
               this.verticalScrollBarStyleName = "kScrollBar";
               this.horizontalScrollBarStyleName = "kScrollBar";
               this.verticalDividerCursor = _embed_css_KapITComponents_swf_kDividedBox_verticalCursor_587192139;
               this.verticalGap = 7;
               this.paddingLeft = 0;
               this.paddingRight = 0;
               this.dividerThickness = 1;
               this.dividerColor = 10592673;
               this.dividerSkin = _embed_css_KapITComponents_swf_kDividedBox_dividerSkin_93301549;
               this.horizontalDividerCursor = _embed_css_KapITComponents_swf_kDividedBox_horizontalCursor_1013389719;
               this.dividerAlpha = 0.5;
               this.horizontalGap = 7;
               this.paddingBottom = 0;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kPanelTitleStyle");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kPanelTitleStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.color = 3355443;
               this.fontFamily = "Verdana";
               this.fontSize = 9;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kScrollBar");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kScrollBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.downArrowUpSkin = _embed_css_KapITComponents_swf_kScrollBar_downArrowUpSkin_2141391050;
               this.thumbIcon = _embed_css_KapITComponents_swf_kScrollBar_thumbIcon_253178714;
               this.thumbDownSkin = _embed_css_KapITComponents_swf_kScrollBar_thumbOverSkin_867229266;
               this.thumbOverSkin = _embed_css_KapITComponents_swf_kScrollBar_thumbOverSkin_867229266;
               this.upArrowOverSkin = _embed_css_KapITComponents_swf_kScrollBar_upArrowOverSkin_766245078;
               this.thumbUpSkin = _embed_css_KapITComponents_swf_kScrollBar_thumbUpSkin_1433627803;
               this.trackOverSkin = _embed_css_KapITComponents_swf_kScrollBar_trackOverSkin_1762976781;
               this.upArrowDisabledSkin = _embed_css_KapITComponents_swf_kScrollBar_upArrowDisabledSkin_977525842;
               this.trackDisabledSkin = _embed_css_KapITComponents_swf_kScrollBar_trackDisabledSkin_2027751755;
               this.upArrowUpSkin = _embed_css_KapITComponents_swf_kScrollBar_upArrowUpSkin_552402995;
               this.thumbOffset = 0;
               this.trackDownSkin = _embed_css_KapITComponents_swf_kScrollBar_trackOverSkin_1762976781;
               this.downArrowDownSkin = _embed_css_KapITComponents_swf_kScrollBar_downArrowOverSkin_62075329;
               this.upArrowDownSkin = _embed_css_KapITComponents_swf_kScrollBar_upArrowOverSkin_766245078;
               this.downArrowDisabledSkin = _embed_css_KapITComponents_swf_kScrollBar_downArrowDisabledSkin_356892247;
               this.trackUpSkin = _embed_css_KapITComponents_swf_kScrollBar_trackUpSkin_281116678;
               this.downArrowOverSkin = _embed_css_KapITComponents_swf_kScrollBar_downArrowOverSkin_62075329;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kTabNavigator");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kTabNavigator");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.paddingTop = 0;
               this.backgroundColor = 16250871;
               this.selectedTabTextStyleName = "kSelectedTabTextStyle";
               this.tabStyleName = "kTabStyle";
               this.borderSkin = TabBorderSkinWithBackground;
               this.tabHeight = 18;
               this.paddingLeft = 0;
               this.paddingBottom = 0;
               this.paddingRight = 0;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kTabStyle");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kTabStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overSkin = TabSkin;
               this.downSkin = TabSkin;
               this.selectedUpSkin = TabSkin;
               this.fontSize = 9;
               this.paddingLeft = 3;
               this.paddingRight = 3;
               this.upSkin = TabSkin;
               this.fontWeight = "normal";
               this.selectedDownSkin = TabSkin;
               this.color = 3355443;
               this.fontFamily = "Verdana";
               this.paddingBottom = 0;
               this.selectedOverSkin = TabSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kSelectedTabTextStyle");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kSelectedTabTextStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.paddingTop = 0;
               this.color = 3355443;
               this.fontFamily = "Verdana";
               this.fontSize = 9;
               this.paddingLeft = 0;
               this.paddingBottom = 0;
               this.paddingRight = 0;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kVBox");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kVBox");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.paddingTop = 0;
               this.verticalScrollBarStyleName = "kScrollBar";
               this.horizontalScrollBarStyleName = "kScrollBar";
               this.verticalGap = 0;
               this.paddingLeft = 0;
               this.paddingBottom = 0;
               this.paddingRight = 0;
            };
         }
      }
   }
}

