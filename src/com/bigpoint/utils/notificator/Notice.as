package com.bigpoint.utils.notificator
{
   public class Notice
   {
      private var _type:String;
      
      internal var _sourceNotifier:Notifier;
      
      public function Notice(param1:String)
      {
         super();
         this._type = param1;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get sourceNotifier() : Notifier
      {
         return this._sourceNotifier;
      }
   }
}

