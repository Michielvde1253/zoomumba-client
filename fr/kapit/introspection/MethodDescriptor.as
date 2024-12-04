package fr.kapit.introspection
{
   import mx.collections.ArrayCollection;
   
   public class MethodDescriptor extends AbstractLanguageElement
   {
      public var returnType:ClassDescriptor;
      
      public var arguments:ArrayCollection = new ArrayCollection();
      
      public var namespaceType:String = "public";
      
      public var isOverride:Boolean = false;
      
      public function MethodDescriptor(param1:Object, param2:Boolean = false)
      {
         super(param1.@name);
         this.returnType = ClassProxy.getInstance().getDescriptorByName(param1.@returnType);
         this.namespaceType = param1.@namespaceType;
         this.isOverride = param1.@isOverride;
         this.buildArguments(param1,param2);
      }
      
      public function get isPublic() : Boolean
      {
         return this.namespaceType.indexOf("public") == 0;
      }
      
      public function get isPrivate() : Boolean
      {
         return this.namespaceType.indexOf("private") == 0;
      }
      
      public function get isProtected() : Boolean
      {
         return this.namespaceType.indexOf("protected") == 0;
      }
      
      public function get isInternal() : Boolean
      {
         return this.namespaceType.indexOf("internal") == 0;
      }
      
      private function buildArguments(param1:Object, param2:Boolean = false) : void
      {
         var _loc5_:XML = null;
         var _loc6_:ArgumentDescriptor = null;
         var _loc4_:int = 0;
         for each(_loc5_ in param1..parameter)
         {
            _loc6_ = new ArgumentDescriptor(_loc5_,param2,_loc4_);
            this.arguments.addItem(_loc6_);
            _loc4_++;
         }
      }
   }
}

