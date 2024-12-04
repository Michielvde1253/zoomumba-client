package com.bigpoint.zoorama.view.gui.objects
{
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import flash.display.Sprite;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class createTextFieldItem
   {
      public function createTextFieldItem()
      {
         super();
      }
      
      public static function createNewTextField(param1:Number, param2:Number, param3:Number, param4:Number, param5:Boolean, param6:Boolean, param7:String, param8:String, param9:int, param10:int, param11:Sprite, param12:Boolean, param13:String = "none", param14:String = "normal") : TextField
      {
         var _loc15_:TextField = new TextField();
         _loc15_.x = param1;
         _loc15_.y = param2;
         _loc15_.width = param3 + 1;
         _loc15_.height = param4;
         _loc15_.background = false;
         _loc15_.border = false;
         _loc15_.multiline = param5;
         _loc15_.wordWrap = param6;
         _loc15_.name = param7;
         _loc15_.type = param8;
         _loc15_.textColor = param10;
         _loc15_.selectable = param12;
         if(param13 == "left")
         {
            _loc15_.autoSize = TextFieldAutoSize.LEFT;
         }
         if(param14 == "normal")
         {
            _loc15_.antiAliasType = AntiAliasType.NORMAL;
         }
         else if(param14 == "advanced")
         {
            _loc15_.antiAliasType = AntiAliasType.ADVANCED;
         }
         param11.addChild(_loc15_);
         StyleModule.setTextFieldStyle(_loc15_,param9);
         return _loc15_;
      }
   }
}

