package com.flexspy.imp
{
   import mx.core.IFactory;
   
   public class EditorClassFactory implements IFactory
   {
      private var _instance:*;
      
      public function EditorClassFactory()
      {
         super();
      }
      
      public function newInstance() : *
      {
         return _instance;
      }
      
      public function set activeInstance(param1:*) : void
      {
         _instance = param1;
      }
      
      public function get activeInstance() : *
      {
         return _instance;
      }
   }
}

