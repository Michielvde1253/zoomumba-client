package fr.kapit.introspection
{
   import flash.utils.getQualifiedClassName;
   
   public class AccessorDescriptor extends AbstractLanguageElement
   {
      public var typeFullName:String;
      
      protected var _type:ClassDescriptor;
      
      public var declaredBy:ClassDescriptor;
      
      public var isDynamic:Boolean = false;
      
      public var isReadOnly:Boolean = false;
      
      public var namespaceType:String = "public";
      
      public var isOverride:Boolean = false;
      
      public var isBindable:Boolean = false;
      
      public function AccessorDescriptor(param1:Object = null, param2:Boolean = false, param3:ClassDescriptor = null)
      {
         var _loc4_:String = null;
         var _loc5_:XMLList = null;
         var _loc6_:XML = null;
         var _loc7_:String = null;
         super(!!param1 ? param1.@name : null);
         if(param1)
         {
            this.typeFullName = param1.@type;
            if(!param2)
            {
               this._type = ClassProxy.getInstance().getDescriptorByName(this.typeFullName);
               if(this is ConstantDescriptor)
               {
                  this.declaredBy = param3;
               }
               else
               {
                  this.declaredBy = ClassProxy.getInstance().getDescriptorByName(param1.@declaredBy);
               }
            }
            else
            {
               this.declaredBy = param3;
               this.namespaceType = param1.@namespaceType;
               this.isOverride = param1.@isOverride;
            }
            _loc4_ = param1.@access;
            this.isReadOnly = _loc4_ == "readonly";
            _loc5_ = XML(param1)..metadata;
            for each(_loc6_ in _loc5_.children())
            {
               _loc7_ = _loc6_.@value;
               if(_loc7_ == "propertyChange")
               {
                  this.isBindable = true;
               }
            }
         }
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
      
      public function loadFromObject(param1:String, param2:*) : void
      {
         this._name = param1;
         this._type = ClassProxy.getInstance().getDescriptorByName(getQualifiedClassName(param2));
      }
      
      public function get type() : ClassDescriptor
      {
         if(!this._type)
         {
            this._type = ClassProxy.getInstance().getDescriptorByName(this.typeFullName);
         }
         return this._type;
      }
      
      public function set type(param1:ClassDescriptor) : void
      {
         this._type = param1;
      }
      
      public function get typeName() : String
      {
         var _loc1_:int = 0;
         if(this.type)
         {
            return this.type.label;
         }
         if(this.typeFullName)
         {
            _loc1_ = int(this.typeFullName.indexOf("::"));
            if(_loc1_ >= 0)
            {
               return this.typeFullName.substring(_loc1_ + 2);
            }
         }
         return "";
      }
      
      override public function get label() : String
      {
         var _loc1_:int = int(_name.indexOf("::"));
         return _loc1_ >= 0 ? _name.substr(_loc1_ + 2) : _name;
      }
      
      public function get declaredByName() : String
      {
         return !!this.declaredBy ? this.declaredBy.label : "";
      }
   }
}

