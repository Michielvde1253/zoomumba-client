package mx.collections
{
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class GroupingField
   {
      mx_internal static const VERSION:String = "4.0.0.14159";
      
      private var _caseInsensitive:Boolean;
      
      private var _compareFunction:Function;
      
      private var _descending:Boolean;
      
      private var _name:String;
      
      private var _numeric:Boolean;
      
      public var groupingFunction:Function;
      
      public var groupingObjectFunction:Function;
      
      public var summaries:Array;
      
      public function GroupingField(param1:String = null, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false)
      {
         super();
         this._name = param1;
         this._caseInsensitive = param2;
         this._descending = param3;
         this._numeric = param4;
      }
      
      public function get caseInsensitive() : Boolean
      {
         return this._caseInsensitive;
      }
      
      public function set caseInsensitive(param1:Boolean) : void
      {
         if(param1 != this._caseInsensitive)
         {
            this._caseInsensitive = param1;
         }
      }
      
      public function get compareFunction() : Function
      {
         return this._compareFunction;
      }
      
      public function set compareFunction(param1:Function) : void
      {
         this._compareFunction = param1;
      }
      
      public function get descending() : Boolean
      {
         return this._descending;
      }
      
      public function set descending(param1:Boolean) : void
      {
         if(this._descending != param1)
         {
            this._descending = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get numeric() : Boolean
      {
         return this._numeric;
      }
      
      public function set numeric(param1:Boolean) : void
      {
         if(this._numeric != param1)
         {
            this._numeric = param1;
         }
      }
   }
}

