package fr.kapit.introspection.nodes.simple
{
   public class StringNode extends SimpleNode
   {
      public function StringNode(param1:Object, param2:String, param3:Object = null)
      {
         super(param1,param2,param3);
      }
      
      override public function get label() : String
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc1_:String = labelPrefix;
         if(displayValue is String)
         {
            _loc2_ = displayValue as String;
            _loc3_ = int(_loc2_.indexOf("\n"));
            if(_loc3_ >= 0)
            {
               _loc2_ = _loc2_.substring(0,_loc3_) + "...";
            }
            return (!!_loc1_ ? _loc1_ + " = " : "") + _loc2_;
         }
         return !!_loc1_ ? _loc1_ : "";
      }
   }
}

