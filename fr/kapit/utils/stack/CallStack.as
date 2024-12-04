package fr.kapit.utils.stack
{
   public class CallStack
   {
      protected static const COMPONENTS:Array = ["num","package","class","namespace","function","file","line"];
      
      protected static const PARSER:RegExp = /^\s+at (?:([^\/]+)::)?(?:([^\/]+)\/)?(?:(.+)::)?(.+)\(\)(?:\[(.+):(\d+)\])?$/gm;
      
      protected var _calls:XML;
      
      public function CallStack(param1:int = 0, param2:Error = null)
      {
         var i:int = 0;
         var startDepth:int = param1;
         var error:Error = param2;
         this._calls = <stack/>;
         super();
         i = 0;
         if(!error)
         {
            error = new Error();
            startDepth++;
         }
         error.getStackTrace().replace(PARSER,function(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String, param8:int, param9:String):String
         {
            if(++i > startDepth)
            {
               parseCall(i,param2,param3,param4,param5,param6,param7);
            }
            return param1;
         });
      }
      
      public static function stackTrace(param1:int = 0, param2:int = 0) : void
      {
      }
      
      public function get calls() : XML
      {
         return this._calls.copy();
      }
      
      public function get classes() : Array
      {
         return this.getComponent(COMPONENTS[1]);
      }
      
      public function get files() : Array
      {
         return this.getComponent(COMPONENTS[4]);
      }
      
      public function get functions() : Array
      {
         return this.getComponent(COMPONENTS[3]);
      }
      
      public function getCalls(param1:int = 0, param2:int = 0) : XMLList
      {
         var depth:int;
         var startDepth:int = param1;
         var count:int = param2;
         if(startDepth < 0)
         {
            count = startDepth;
            startDepth = 0;
         }
         depth = int(this.calls.call.length());
         return this.calls.call.(childIndex() >= startDepth && (!count || childIndex() < count + (count > 0 ? startDepth : depth)));
      }
      
      public function getComponent(param1:String, param2:int = 0, param3:int = 0) : Array
      {
         return XMLList(this.getCalls(param2,param3)[param1]).toXMLString().split("\n");
      }
      
      public function get lines() : Array
      {
         return this.getComponent(COMPONENTS[5]);
      }
      
      public function get namespaces() : Array
      {
         return this.getComponent(COMPONENTS[2]);
      }
      
      public function get packages() : Array
      {
         return this.getComponent(COMPONENTS[0]);
      }
      
      protected function parseCall(... rest) : void
      {
         var _loc2_:XML = <call/>;
         var _loc3_:int = 0;
         while(_loc3_ < rest.length)
         {
            if(rest[_loc3_])
            {
               _loc2_[COMPONENTS[_loc3_]] = rest[_loc3_];
            }
            _loc3_++;
         }
         this._calls.appendChild(_loc2_);
      }
   }
}

