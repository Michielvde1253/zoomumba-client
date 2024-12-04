package fr.kapit.utils.capture
{
   import flash.display.DisplayObject;
   import fr.kapit.utils.ClassUtils;
   import fr.kapit.utils.KapDebugConstants;
   import mx.controls.ToolTip;
   
   public class ToolTipCaptured extends ToolTip
   {
      private var _idx:int;
      
      private var _name:String;
      
      private var _shortVarName:String;
      
      private var _type:String;
      
      public function ToolTipCaptured(param1:String)
      {
         var _loc2_:uint = 0;
         super();
         this.visible = false;
         switch(param1)
         {
            case KapDebugConstants.TYPE_OBJ_OVER:
               _loc2_ = KapDebugConstants.COLOR_OBJ_OVER;
               break;
            case KapDebugConstants.TYPE_OBJ_MULTIPLE:
               _loc2_ = KapDebugConstants.COLOR_OBJ_MULTIPLE;
               break;
            case KapDebugConstants.TYPE_OBJ_PREVIEW:
               _loc2_ = KapDebugConstants.COLOR_OBJ_PREVIEW;
               break;
            case KapDebugConstants.TYPE_OBJ_SELECTED:
               _loc2_ = KapDebugConstants.COLOR_OBJ_SELECTED;
         }
         this.setStyle("backgroundColor",_loc2_);
         this.height = 20;
         this.setStyle("paddingLeft",2);
         this.setStyle("paddingRight",2);
         this.setStyle("paddingTop",2);
         this.setStyle("paddingBottom",2);
         this.setStyle("fontSize",8);
      }
      
      public function set objectText(param1:DisplayObject) : void
      {
         var size:String = null;
         var d:DisplayObject = param1;
         if(!d)
         {
            return;
         }
         try
         {
            this._type = d.toString();
            this._name = ClassUtils.getShortClassName(d);
            this._idx = this._type.lastIndexOf(".");
            this._shortVarName = this._idx < 0 ? this._type : this._type.substr(this._idx + 1);
            size = String(d.x) + "," + String(d.y) + "," + String(d.width) + "," + String(d.height);
            this.text = this._name + " : " + this._shortVarName + " (" + size + ")";
         }
         catch(e:Error)
         {
         }
      }
   }
}

