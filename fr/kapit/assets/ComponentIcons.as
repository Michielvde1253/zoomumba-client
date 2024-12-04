package fr.kapit.assets
{
   import fr.kapit.introspection.AccessorDescriptor;
   import fr.kapit.introspection.ClassDescriptor;
   import fr.kapit.introspection.ClassProxy;
   
   public class ComponentIcons
   {
      public static var Accordion:Class = ComponentIcons_Accordion;
      
      public static var Application:Class = ComponentIcons_Application;
      
      public static var ApplicationControlBar:Class = ComponentIcons_ApplicationControlBar;
      
      public static var AreaChart:Class = ComponentIcons_AreaChart;
      
      public static var Array:Class = ComponentIcons_Array;
      
      public static var BarChart:Class = ComponentIcons_BarChart;
      
      public static var Box:Class = ComponentIcons_Box;
      
      public static var BubbleChart:Class = ComponentIcons_BubbleChart;
      
      public static var Button:Class = ComponentIcons_Button;
      
      public static var CandlestickChart:Class = ComponentIcons_CandlestickChart;
      
      public static var Canvas:Class = ComponentIcons_Canvas;
      
      public static var CheckBox:Class = ComponentIcons_CheckBox;
      
      public static var Chrome:Class = ComponentIcons_Chrome;
      
      public static var ColorPicker:Class = ComponentIcons_ColorPicker;
      
      public static var ColumnChart:Class = ComponentIcons_ColumnChart;
      
      public static var ComboBox:Class = ComponentIcons_ComboBox;
      
      public static var ControlBar:Class = ComponentIcons_ControlBar;
      
      public static var DataGrid:Class = ComponentIcons_DataGrid;
      
      public static var DateChooser:Class = ComponentIcons_DateChooser;
      
      public static var DateField:Class = ComponentIcons_DateField;
      
      public static var Default:Class = ComponentIcons_Default;
      
      public static var DisplayObject:Class = ComponentIcons_DisplayObject;
      
      public static var DividedBox:Class = ComponentIcons_DividedBox;
      
      public static var Form:Class = ComponentIcons_Form;
      
      public static var FormHeading:Class = ComponentIcons_FormHeading;
      
      public static var FormItem:Class = ComponentIcons_FormItem;
      
      public static var Graphics:Class = ComponentIcons_Graphics;
      
      public static var Grid:Class = ComponentIcons_Grid;
      
      public static var HBox:Class = ComponentIcons_HBox;
      
      public static var HDividedBox:Class = ComponentIcons_HDividedBox;
      
      public static var HLOCChart:Class = ComponentIcons_HLOCChart;
      
      public static var HRule:Class = ComponentIcons_HRule;
      
      public static var HScrollBar:Class = ComponentIcons_HScrollBar;
      
      public static var HSlider:Class = ComponentIcons_HSlider;
      
      public static var HorizontalList:Class = ComponentIcons_HorizontalList;
      
      public static var Image:Class = ComponentIcons_Image;
      
      public static var Label:Class = ComponentIcons_Label;
      
      public static var Legend:Class = ComponentIcons_Legend;
      
      public static var LineChart:Class = ComponentIcons_LineChart;
      
      public static var LinkBar:Class = ComponentIcons_LinkBar;
      
      public static var LinkButton:Class = ComponentIcons_LinkButton;
      
      public static var List:Class = ComponentIcons_List;
      
      public static var Menu:Class = ComponentIcons_Menu;
      
      public static var MenuBar:Class = ComponentIcons_MenuBar;
      
      public static var NumericStepper:Class = ComponentIcons_NumericStepper;
      
      public static var Panel:Class = ComponentIcons_Panel;
      
      public static var PieChart:Class = ComponentIcons_PieChart;
      
      public static var PlotChart:Class = ComponentIcons_PlotChart;
      
      public static var ProgressBar:Class = ComponentIcons_ProgressBar;
      
      public static var RadioButton:Class = ComponentIcons_RadioButton;
      
      public static var RadioButtonGroup:Class = ComponentIcons_RadioButtonGroup;
      
      public static var RichTextEditor:Class = ComponentIcons_RichTextEditor;
      
      public static var SWFLoader:Class = ComponentIcons_SWFLoader;
      
      public static var Spacer:Class = ComponentIcons_Spacer;
      
      public static var Sprite:Class = ComponentIcons_Sprite;
      
      public static var TabBar:Class = ComponentIcons_TabBar;
      
      public static var TabNavigator:Class = ComponentIcons_TabNavigator;
      
      public static var Text:Class = ComponentIcons_Text;
      
      public static var TextArea:Class = ComponentIcons_TextArea;
      
      public static var TextInput:Class = ComponentIcons_TextInput;
      
      public static var Tile:Class = ComponentIcons_Tile;
      
      public static var TileList:Class = ComponentIcons_TileList;
      
      public static var TitleWindow:Class = ComponentIcons_TitleWindow;
      
      public static var Tree:Class = ComponentIcons_Tree;
      
      public static var VBox:Class = ComponentIcons_VBox;
      
      public static var VDividedBox:Class = ComponentIcons_VDividedBox;
      
      public static var VRule:Class = ComponentIcons_VRule;
      
      public static var VScrollBar:Class = ComponentIcons_VScrollBar;
      
      public static var VSlider:Class = ComponentIcons_VSlider;
      
      public static var VideoDisplay:Class = ComponentIcons_VideoDisplay;
      
      public static var ViewStack:Class = ComponentIcons_ViewStack;
      
      public static var _Boolean:Class = ComponentIcons__Boolean;
      
      public static var _Number:Class = ComponentIcons__Number;
      
      public static var _Object:Class = ComponentIcons__Object;
      
      public static var _String:Class = ComponentIcons__String;
      
      public static var _int:Class = ComponentIcons__int;
      
      public function ComponentIcons()
      {
         super();
      }
      
      public static function getClassIcon(param1:Object, param2:Object = null, param3:String = null) : Class
      {
         var _loc4_:Class = null;
         var _loc5_:ClassDescriptor = null;
         var _loc6_:ClassDescriptor = null;
         var _loc7_:AccessorDescriptor = null;
         if(Boolean(param1) || param1 is int && param1 == 0)
         {
            _loc5_ = ClassProxy.getInstance().getDescriptor(param1);
         }
         else if(Boolean(param2) && Boolean(param3))
         {
            _loc6_ = ClassProxy.getInstance().getDescriptor(param2);
            _loc7_ = _loc6_.getAccessorDescriptor(param3);
            if(_loc7_)
            {
               _loc5_ = _loc7_.type;
            }
         }
         if(!_loc4_)
         {
            if(Boolean(_loc5_) && (_loc5_.type == Boolean || _loc5_.type == String || _loc5_.type == int || _loc5_.type == Number || _loc5_.type == Object))
            {
               _loc4_ = ComponentIcons["_" + _loc5_.label];
            }
            while(_loc4_ == null && _loc5_ != null)
            {
               _loc4_ = ComponentIcons[_loc5_.label];
               if(!_loc4_)
               {
                  _loc5_ = _loc5_.parent;
               }
            }
         }
         if(!_loc4_)
         {
            _loc4_ = ComponentIcons.Default;
         }
         return _loc4_;
      }
   }
}

