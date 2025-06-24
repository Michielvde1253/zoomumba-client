package
{
   import flash.net.getClassByAlias;
   import flash.net.registerClassAlias;
   import flash.system.*;
   import flash.utils.*;
   import mx.accessibility.AdvancedDataGridAccImpl;
   import mx.accessibility.AlertAccImpl;
   import mx.accessibility.ButtonAccImpl;
   import mx.accessibility.CheckBoxAccImpl;
   import mx.accessibility.ColorPickerAccImpl;
   import mx.accessibility.ComboBaseAccImpl;
   import mx.accessibility.ComboBoxAccImpl;
   import mx.accessibility.DataGridAccImpl;
   import mx.accessibility.LabelAccImpl;
   import mx.accessibility.ListAccImpl;
   import mx.accessibility.ListBaseAccImpl;
   import mx.accessibility.MenuAccImpl;
   import mx.accessibility.MenuBarAccImpl;
   import mx.accessibility.PanelAccImpl;
   import mx.accessibility.TabBarAccImpl;
   import mx.accessibility.TitleWindowAccImpl;
   import mx.accessibility.TreeAccImpl;
   import mx.accessibility.UIComponentAccProps;
   import mx.collections.ArrayCollection;
   import mx.collections.ArrayList;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.effects.EffectManager;
   import mx.graphics.ImageSnapshot;
   import mx.managers.systemClasses.ChildManager;
   import mx.messaging.config.ConfigMap;
   import mx.messaging.messages.AcknowledgeMessage;
   import mx.messaging.messages.AcknowledgeMessageExt;
   import mx.messaging.messages.AsyncMessage;
   import mx.messaging.messages.AsyncMessageExt;
   import mx.messaging.messages.CommandMessage;
   import mx.messaging.messages.CommandMessageExt;
   import mx.messaging.messages.ErrorMessage;
   import mx.messaging.messages.MessagePerformanceInfo;
   import mx.styles.IStyleManager2;
   import mx.styles.StyleManagerImpl;
   import mx.utils.ObjectProxy;
   import spark.accessibility.ButtonBaseAccImpl;
   import spark.accessibility.ComboBoxAccImpl;
   import spark.accessibility.DropDownListBaseAccImpl;
   import spark.accessibility.ListAccImpl;
   import spark.accessibility.ListBaseAccImpl;
   import spark.accessibility.NumericStepperAccImpl;
   import spark.accessibility.PanelAccImpl;
   import spark.accessibility.RadioButtonAccImpl;
   import spark.accessibility.RichEditableTextAccImpl;
   import spark.accessibility.SliderBaseAccImpl;
   import spark.accessibility.SpinnerAccImpl;
   import spark.accessibility.TextBaseAccImpl;
   import spark.accessibility.TitleWindowAccImpl;
   import spark.accessibility.ToggleButtonAccImpl;
   
   public class _Zoomumba_FlexInit
   {
      public function _Zoomumba_FlexInit()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var styleNames:Array;
         var i:int;
         var styleManager:IStyleManager2 = null;
         var fbs:IFlexModuleFactory = param1;
         new ChildManager(fbs);
         styleManager = new StyleManagerImpl(fbs);
         EffectManager.mx_internal::registerEffectTrigger("addedEffect","added");
         EffectManager.mx_internal::registerEffectTrigger("completeEffect","complete");
         EffectManager.mx_internal::registerEffectTrigger("creationCompleteEffect","creationComplete");
         EffectManager.mx_internal::registerEffectTrigger("focusInEffect","focusIn");
         EffectManager.mx_internal::registerEffectTrigger("focusOutEffect","focusOut");
         EffectManager.mx_internal::registerEffectTrigger("hideEffect","hide");
         EffectManager.mx_internal::registerEffectTrigger("itemsChangeEffect","itemsChange");
         EffectManager.mx_internal::registerEffectTrigger("mouseDownEffect","mouseDown");
         EffectManager.mx_internal::registerEffectTrigger("mouseUpEffect","mouseUp");
         EffectManager.mx_internal::registerEffectTrigger("moveEffect","move");
         EffectManager.mx_internal::registerEffectTrigger("removedEffect","removed");
         EffectManager.mx_internal::registerEffectTrigger("resizeEffect","resize");
         EffectManager.mx_internal::registerEffectTrigger("resizeEndEffect","resizeEnd");
         EffectManager.mx_internal::registerEffectTrigger("resizeStartEffect","resizeStart");
         EffectManager.mx_internal::registerEffectTrigger("rollOutEffect","rollOut");
         EffectManager.mx_internal::registerEffectTrigger("rollOverEffect","rollOver");
         EffectManager.mx_internal::registerEffectTrigger("showEffect","show");
         if(Capabilities.hasAccessibility)
         {
            mx.accessibility.ComboBoxAccImpl.enableAccessibility();
            mx.accessibility.PanelAccImpl.enableAccessibility();
            TabBarAccImpl.enableAccessibility();
            SpinnerAccImpl.enableAccessibility();
            NumericStepperAccImpl.enableAccessibility();
            RadioButtonAccImpl.enableAccessibility();
            spark.accessibility.ComboBoxAccImpl.enableAccessibility();
            mx.accessibility.ListAccImpl.enableAccessibility();
            AlertAccImpl.enableAccessibility();
            LabelAccImpl.enableAccessibility();
            TextBaseAccImpl.enableAccessibility();
            ButtonAccImpl.enableAccessibility();
            ColorPickerAccImpl.enableAccessibility();
            SliderBaseAccImpl.enableAccessibility();
            AdvancedDataGridAccImpl.enableAccessibility();
            mx.accessibility.ListBaseAccImpl.enableAccessibility();
            mx.accessibility.TitleWindowAccImpl.enableAccessibility();
            TreeAccImpl.enableAccessibility();
            ButtonBaseAccImpl.enableAccessibility();
            ToggleButtonAccImpl.enableAccessibility();
            spark.accessibility.ListBaseAccImpl.enableAccessibility();
            RichEditableTextAccImpl.enableAccessibility();
            MenuAccImpl.enableAccessibility();
            spark.accessibility.TitleWindowAccImpl.enableAccessibility();
            spark.accessibility.PanelAccImpl.enableAccessibility();
            spark.accessibility.ListAccImpl.enableAccessibility();
            DataGridAccImpl.enableAccessibility();
            CheckBoxAccImpl.enableAccessibility();
            MenuBarAccImpl.enableAccessibility();
            DropDownListBaseAccImpl.enableAccessibility();
            ComboBaseAccImpl.enableAccessibility();
            UIComponentAccProps.enableAccessibility();
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ArrayCollection") == null)
            {
               registerClassAlias("flex.messaging.io.ArrayCollection",ArrayCollection);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ArrayCollection",ArrayCollection);
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ArrayList") == null)
            {
               registerClassAlias("flex.messaging.io.ArrayList",ArrayList);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ArrayList",ArrayList);
         }
         try
         {
            if(getClassByAlias("flex.graphics.ImageSnapshot") == null)
            {
               registerClassAlias("flex.graphics.ImageSnapshot",ImageSnapshot);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.graphics.ImageSnapshot",ImageSnapshot);
         }
         try
         {
            if(getClassByAlias("flex.messaging.config.ConfigMap") == null)
            {
               registerClassAlias("flex.messaging.config.ConfigMap",ConfigMap);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.config.ConfigMap",ConfigMap);
         }
         try
         {
            if(getClassByAlias("flex.messaging.messages.AcknowledgeMessage") == null)
            {
               registerClassAlias("flex.messaging.messages.AcknowledgeMessage",AcknowledgeMessage);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.messages.AcknowledgeMessage",AcknowledgeMessage);
         }
         try
         {
            if(getClassByAlias("DSK") == null)
            {
               registerClassAlias("DSK",AcknowledgeMessageExt);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("DSK",AcknowledgeMessageExt);
         }
         try
         {
            if(getClassByAlias("flex.messaging.messages.AsyncMessage") == null)
            {
               registerClassAlias("flex.messaging.messages.AsyncMessage",AsyncMessage);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.messages.AsyncMessage",AsyncMessage);
         }
         try
         {
            if(getClassByAlias("DSA") == null)
            {
               registerClassAlias("DSA",AsyncMessageExt);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("DSA",AsyncMessageExt);
         }
         try
         {
            if(getClassByAlias("flex.messaging.messages.CommandMessage") == null)
            {
               registerClassAlias("flex.messaging.messages.CommandMessage",CommandMessage);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.messages.CommandMessage",CommandMessage);
         }
         try
         {
            if(getClassByAlias("DSC") == null)
            {
               registerClassAlias("DSC",CommandMessageExt);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("DSC",CommandMessageExt);
         }
         try
         {
            if(getClassByAlias("flex.messaging.messages.ErrorMessage") == null)
            {
               registerClassAlias("flex.messaging.messages.ErrorMessage",ErrorMessage);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.messages.ErrorMessage",ErrorMessage);
         }
         try
         {
            if(getClassByAlias("flex.messaging.messages.MessagePerformanceInfo") == null)
            {
               registerClassAlias("flex.messaging.messages.MessagePerformanceInfo",MessagePerformanceInfo);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.messages.MessagePerformanceInfo",MessagePerformanceInfo);
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ObjectProxy") == null)
            {
               registerClassAlias("flex.messaging.io.ObjectProxy",ObjectProxy);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ObjectProxy",ObjectProxy);
         }
         styleNames = ["sortFontSize","lineHeight","unfocusedTextSelectionColor","highlightColor","kerning","iconColor","textRollOverColor","digitCase","shadowCapColor","inactiveTextSelectionColor","textDecoration","justificationRule","dominantBaseline","dividerColor","fontThickness","depthColors","trackingRight","blockProgression","leadingModel","selectionDisabledColor","textAlignLast","textAlpha","letterSpacing","chromeColor","rollOverColor","fontSize","shadowColor","baselineShift","focusedTextSelectionColor","strokeColor","paragraphEndIndent","indicatorGap","fontWeight","breakOpportunity","leading","renderingMode","symbolColor","sortFontStyle","barColor","fontSharpness","modalTransparencyDuration","paragraphStartIndent","justificationStyle","footerColors","contentBackgroundColor","paragraphSpaceAfter","contentBackgroundAlpha","textRotation","fontAntiAliasType","cffHinting","direction","errorColor","horizontalGridLineColor","locale","digitWidth","backgroundDisabledColor","modalTransparencyColor"
         ,"ligatureLevel","firstBaselineOffset","textIndent","verticalGridLineColor","themeColor","fontLookup","tabStops","modalTransparency","paragraphSpaceBefore","headerColors","textAlign","fontFamily","sortFontWeight","textSelectedColor","strokeWidth","lineThrough","labelWidth","whiteSpaceCollapse","fontGridFitType","alignmentBaseline","separatorColor","trackingLeft","fontStyle","proposedColor","dropShadowColor","accentColor","selectionColor","disabledColor","dropdownBorderColor","disabledIconColor","modalTransparencyBlur","textJustify","focusColor","color","alternatingItemColors","typographicCase","sortFontFamily"];
         i = 0;
         while(i < styleNames.length)
         {
            styleManager.registerInheritingStyle(styleNames[i]);
            i++;
         }
      }
   }
}

import mx.core.TextFieldFactory;

TextFieldFactory;

