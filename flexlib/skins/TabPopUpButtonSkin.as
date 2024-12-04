package flexlib.skins
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.GradientType;
   import mx.containers.TabNavigator;
   import mx.core.EdgeMetrics;
   import mx.core.IFlexDisplayObject;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.skins.halo.HaloColors;
   import mx.skins.halo.PopUpIcon;
   import mx.styles.IStyleClient;
   import mx.styles.StyleManager;
   import mx.utils.ColorUtil;
   
   public class TabPopUpButtonSkin extends UIComponent
   {
      private static var cache:Object = {};
      
      private var _borderMetrics:EdgeMetrics = new EdgeMetrics(1,1,1,1);
      
      public function TabPopUpButtonSkin()
      {
         super();
      }
      
      private static function calcDerivedStyles(param1:uint, param2:uint, param3:uint, param4:uint, param5:uint, param6:uint) : Object
      {
         var _loc8_:Object = null;
         var _loc7_:String = HaloColors.getCacheKey(param1,param2,param3,param4,param5,param6);
         if(!cache[_loc7_])
         {
            _loc8_ = cache[_loc7_] = {};
            HaloColors.addHaloColors(_loc8_,param1,param5,param6);
            _loc8_.borderColorDrk1 = ColorUtil.adjustBrightness2(param2,10);
            _loc8_.falseFillColorBright1 = ColorUtil.adjustBrightness(param3,15);
            _loc8_.falseFillColorBright2 = ColorUtil.adjustBrightness(param4,15);
         }
         return cache[_loc7_];
      }
      
      override public function get measuredWidth() : Number
      {
         return UIComponent.DEFAULT_MEASURED_MIN_WIDTH;
      }
      
      override public function get measuredHeight() : Number
      {
         return UIComponent.DEFAULT_MEASURED_MIN_HEIGHT;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc21_:Class = null;
         var _loc22_:Array = null;
         var _loc23_:Array = null;
         var _loc24_:Array = null;
         var _loc25_:Array = null;
         var _loc26_:Array = null;
         var _loc27_:Array = null;
         var _loc28_:DisplayObjectContainer = null;
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = Number(getStyle("backgroundAlpha"));
         var _loc4_:Number = Number(getStyle("backgroundColor"));
         var _loc5_:uint = uint(getStyle("borderColor"));
         var _loc6_:Number = Number(getStyle("cornerRadius"));
         var _loc7_:Array = getStyle("fillAlphas");
         var _loc8_:Array = getStyle("fillColors");
         StyleManager.getStyleManager(null).getColorNames(_loc8_);
         var _loc9_:Array = getStyle("highlightAlphas");
         var _loc10_:uint = uint(getStyle("themeColor"));
         var _loc11_:Array = [];
         _loc11_[0] = ColorUtil.adjustBrightness2(_loc8_[0],-5);
         _loc11_[1] = ColorUtil.adjustBrightness2(_loc8_[1],-5);
         var _loc12_:Object = calcDerivedStyles(_loc10_,_loc5_,_loc11_[0],_loc11_[1],_loc8_[0],_loc8_[1]);
         var _loc13_:Boolean = parent != null && parent.parent != null && parent.parent.parent != null && parent.parent.parent is TabNavigator && IStyleClient(parent.parent.parent).getStyle("borderStyle") != "none";
         var _loc14_:Number = Math.max(_loc6_ - 2,0);
         var _loc15_:Object = {
            "tl":_loc6_,
            "tr":_loc6_,
            "bl":0,
            "br":0
         };
         var _loc16_:Object = {
            "tl":_loc14_,
            "tr":_loc14_,
            "bl":0,
            "br":0
         };
         var _loc17_:IFlexDisplayObject = IFlexDisplayObject(getChildByName("popUpIcon"));
         if(!_loc17_)
         {
            _loc21_ = Class(getStyle("popUpIcon"));
            _loc17_ = new _loc21_();
            DisplayObject(_loc17_).name = "popUpIcon";
            addChild(DisplayObject(_loc17_));
            DisplayObject(_loc17_).visible = true;
         }
         var _loc18_:Number = Math.max(getStyle("arrowButtonWidth"),_loc17_.width + 3 + 1);
         var _loc19_:Number = param1 - _loc18_;
         var _loc20_:uint = 1118481;
         _loc17_.move(param1 - (_loc18_ + _loc17_.width) / 2,(param2 - _loc17_.height) / 2);
         graphics.clear();
         switch(name)
         {
            case "upSkin":
               _loc22_ = [_loc11_[0],_loc11_[1]];
               _loc23_ = [_loc7_[0],_loc7_[1]];
               drawRoundRect(0,0,param1,param2 - 1,_loc15_,[_loc12_.borderColorDrk1,_loc5_],1,verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":_loc16_
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc16_,_loc22_,_loc23_,verticalGradientMatrix(0,2,param1 - 2,param2 - 6));
               drawRoundRect(1,1,param1 - 2,(param2 - 2) / 2,_loc16_,[16777215,16777215],_loc9_,verticalGradientMatrix(1,1,param1 - 2,(param2 - 2) / 2));
               if(_loc13_)
               {
                  drawRoundRect(0,param2 - 1,param1,1,0,_loc5_,_loc7_[1]);
               }
               drawRoundRect(0,param2 - 2,param1,1,0,0,0.09);
               drawRoundRect(0,param2 - 3,param1,1,0,0,0.03);
               break;
            case "popUpOverSkin":
            case "overSkin":
               if(_loc8_.length > 2)
               {
                  _loc24_ = [_loc8_[2],_loc8_[3]];
               }
               else
               {
                  _loc24_ = [_loc8_[0],_loc8_[1]];
               }
               if(_loc7_.length > 2)
               {
                  _loc25_ = [_loc7_[2],_loc7_[3]];
               }
               else
               {
                  _loc25_ = [_loc7_[0],_loc7_[1]];
               }
               drawRoundRect(0,0,param1,param2 - 1,_loc15_,[_loc10_,_loc12_.themeColDrk2],1,verticalGradientMatrix(0,0,param1,param2 - 6),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":_loc16_
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc16_,[_loc12_.falseFillColorBright1,_loc12_.falseFillColorBright2],_loc25_,verticalGradientMatrix(2,2,param1 - 2,param2 - 2));
               drawRoundRect(1,1,param1 - 2,(param2 - 2) / 2,_loc16_,[16777215,16777215],_loc9_,verticalGradientMatrix(1,1,param1 - 2,(param2 - 2) / 2));
               if(_loc13_)
               {
                  drawRoundRect(0,param2 - 1,param1,1,0,_loc5_,_loc7_[1]);
               }
               drawRoundRect(0,param2 - 2,param1,1,0,0,0.09);
               drawRoundRect(0,param2 - 3,param1,1,0,0,0.03);
               break;
            case "disabledSkin":
               _loc26_ = [_loc8_[0],_loc8_[1]];
               _loc27_ = [Math.max(0,_loc7_[0] - 0.15),Math.max(0,_loc7_[1] - 0.15)];
               drawRoundRect(0,0,param1,param2 - 1,_loc15_,[_loc12_.borderColorDrk1,_loc5_],0.5,verticalGradientMatrix(0,0,param1,param2 - 6));
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc16_,_loc26_,_loc27_,verticalGradientMatrix(0,2,param1 - 2,param2 - 2));
               if(_loc13_)
               {
                  drawRoundRect(0,param2 - 1,param1,1,0,_loc5_,_loc7_[1]);
               }
               drawRoundRect(0,param2 - 2,param1,1,0,0,0.09);
               drawRoundRect(0,param2 - 3,param1,1,0,0,0.03);
               break;
            case "popUpDownSkin":
            case "downSkin":
            case "selectedUpSkin":
            case "selectedDownSkin":
            case "selectedOverSkin":
            case "selectedDisabledSkin":
               if(isNaN(_loc4_))
               {
                  _loc28_ = parent;
                  while(_loc28_)
                  {
                     if(_loc28_ is IStyleClient)
                     {
                        _loc4_ = Number(IStyleClient(_loc28_).getStyle("backgroundColor"));
                     }
                     if(!isNaN(_loc4_))
                     {
                        break;
                     }
                     _loc28_ = _loc28_.parent;
                  }
                  if(isNaN(_loc4_))
                  {
                     _loc4_ = 16777215;
                  }
               }
               drawRoundRect(0,0,param1,param2 - 1,_loc15_,[_loc12_.borderColorDrk1,_loc5_],1,verticalGradientMatrix(0,0,param1,param2 - 2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":_loc16_
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc16_,_loc4_,_loc3_);
               if(_loc13_)
               {
                  drawRoundRect(1,param2 - 1,param1 - 2,1,0,_loc4_,_loc3_);
               }
         }
         if(_loc17_ is PopUpIcon)
         {
            PopUpIcon(_loc17_).mx_internal::arrowColor = _loc20_;
         }
      }
   }
}

