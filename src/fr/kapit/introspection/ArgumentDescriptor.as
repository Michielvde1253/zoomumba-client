package fr.kapit.introspection
{
   public class ArgumentDescriptor extends AbstractLanguageElement
   {
      public var isOptional:Boolean;
      
      public var typeName:String;
      
      private var _argType:ClassDescriptor;
      
      public function ArgumentDescriptor(param1:Object, param2:Boolean = false, param3:int = -1)
      {
         super(param2 ? "arg_" + param1.@index : "arg" + String(param3));
         this.typeName = param1.@type;
         if(!param2)
         {
            this._argType = ClassProxy.getInstance().getDescriptorByName(this.typeName);
         }
      }
      
      public function get argType() : ClassDescriptor
      {
         if(this._argType)
         {
            return this._argType;
         }
         this._argType = ClassProxy.getInstance().getDescriptorByName(this.typeName);
         return this._argType;
      }
   }
}

