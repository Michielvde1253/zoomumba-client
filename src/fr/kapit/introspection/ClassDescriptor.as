package fr.kapit.introspection
{
   import flash.utils.describeType;
   import flash.utils.getQualifiedClassName;
   import fr.kapit.assets.ComponentIcons;
   import fr.kapit.utils.ClassUtils;
   import mx.collections.ArrayCollection;
   
   public class ClassDescriptor extends PackageItem implements ITypedElement
   {
      public var isDynamic:Boolean;
      
      public var isFinal:Boolean;
      
      public var isStatic:Boolean;
      
      public var packageName:String;
      
      private var _label:String;
      
      public var superName:String = "";
      
      protected var _type:Class;
      
      private var _target:*;
      
      private var _parent:ClassDescriptor;
      
      private var _loadDeeply:Boolean;
      
      private var _accessorsMap:Object = {};
      
      private var _children:ArrayCollection = new ArrayCollection();
      
      private var _accessors:ArrayCollection = new ArrayCollection();
      
      private var _methods:ArrayCollection = new ArrayCollection();
      
      private var _constants:ArrayCollection = new ArrayCollection();
      
      private var _interfaces:ArrayCollection = new ArrayCollection();
      
      private var _namespaces:ArrayCollection = new ArrayCollection();
      
      private var _isLoaded:Boolean;
      
      private var _allVariables:ArrayCollection;
      
      public function ClassDescriptor(param1:*, param2:Boolean = true)
      {
         super(param1 != null ? getQualifiedClassName(param1) : "null");
         if(ClassProxy.getInstance().hasDescriptor(param1))
         {
            return;
         }
         if(param1 != null)
         {
            if(param1 is Class)
            {
               this._type = param1 as Class;
            }
            else
            {
               this._type = ClassUtils.getObjectClass(param1);
            }
            this._target = param1;
            this._loadDeeply = param2;
            this.buildDescriptor(param1);
         }
      }
      
      public static function buildDescriptorFromClassExplorerXML(param1:XML) : ClassDescriptor
      {
         var _loc2_:ClassDescriptor = new ClassDescriptor(null,false);
         _loc2_._isLoaded = true;
         var _loc3_:String = param1.@name;
         _loc2_._name = _loc3_;
         _loc2_._type = ClassUtils.getClassByName(_loc3_);
         ClassProxy.getInstance().putDescriptor(_loc2_);
         _loc2_._setPackage();
         _loc2_.superName = param1.@superName;
         var _loc4_:XMLList = param1..implementsInterface;
         _loc2_.createInterfaces(_loc4_,true);
         var _loc5_:XMLList = param1..accessor;
         _loc2_.createAccessors(_loc5_,true);
         var _loc6_:XMLList = param1..method;
         _loc2_.createMethods(_loc6_,true);
         var _loc7_:XMLList = param1..variable;
         _loc2_.createVariables(_loc7_,true);
         var _loc8_:XMLList = param1..constant;
         _loc2_.createConstants(_loc8_,true);
         return _loc2_;
      }
      
      public static function buildClassHierarchy(param1:Object) : void
      {
         var _loc2_:ClassDescriptor = null;
         var _loc3_:ClassDescriptor = null;
         for each(_loc2_ in param1)
         {
            if(!_loc2_.parent)
            {
               _loc3_ = ClassProxy.getInstance().getDescriptorByName(_loc2_.superName);
               if(_loc3_)
               {
                  _loc2_._setParent(_loc3_);
               }
            }
         }
      }
      
      override public function get label() : String
      {
         return this._label;
      }
      
      public function get type() : Class
      {
         return this._type;
      }
      
      public function get icon() : Class
      {
         return ComponentIcons.getClassIcon(this._type);
      }
      
      public function get numChildren() : int
      {
         return !!this._children ? int(this._children.length) : 0;
      }
      
      public function get qualifiedClassName() : String
      {
         return getQualifiedClassName(this.type).replace(":",".");
      }
      
      public function get parents() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         var _loc2_:ClassDescriptor = this._parent;
         while(_loc2_)
         {
            _loc1_.addItem(_loc2_);
            _loc2_ = _loc2_._parent;
         }
         return _loc1_;
      }
      
      public function get parent() : ClassDescriptor
      {
         return this._parent;
      }
      
      public function set parent(param1:ClassDescriptor) : void
      {
         if(!this._parent)
         {
            this._parent = param1;
            this._parent._children.addItem(this);
         }
      }
      
      public function get children() : ArrayCollection
      {
         if(!this._isLoaded)
         {
            this.load();
         }
         return this._children;
      }
      
      public function set children(param1:ArrayCollection) : void
      {
         this._children = param1;
      }
      
      public function get accessors() : ArrayCollection
      {
         if(!this._isLoaded)
         {
            this.load();
         }
         return this._accessors;
      }
      
      public function set accessors(param1:ArrayCollection) : void
      {
         this._accessors = param1;
      }
      
      public function get methods() : ArrayCollection
      {
         if(!this._isLoaded)
         {
            this.load();
         }
         return this._methods;
      }
      
      public function set methods(param1:ArrayCollection) : void
      {
         this._methods = param1;
      }
      
      public function get constants() : ArrayCollection
      {
         if(!this._isLoaded)
         {
            this.load();
         }
         return this._constants;
      }
      
      public function set constants(param1:ArrayCollection) : void
      {
         this._constants = param1;
      }
      
      public function get interfaces() : ArrayCollection
      {
         if(!this._isLoaded)
         {
            this.load();
         }
         return this._interfaces;
      }
      
      public function set interfaces(param1:ArrayCollection) : void
      {
         this._interfaces = param1;
      }
      
      public function get namespaces() : ArrayCollection
      {
         if(!this._isLoaded)
         {
            this.load();
         }
         return this._namespaces;
      }
      
      public function set namespaces(param1:ArrayCollection) : void
      {
         this._namespaces = param1;
      }
      
      public function getAccessorDescriptor(param1:String) : AccessorDescriptor
      {
         var _loc2_:AccessorDescriptor = null;
         for each(_loc2_ in this.allVariables)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get allVariables() : ArrayCollection
      {
         var _loc1_:ClassDescriptor = null;
         var _loc2_:AccessorDescriptor = null;
         var _loc3_:Boolean = false;
         var _loc4_:AccessorDescriptor = null;
         if(!this._allVariables)
         {
            this._allVariables = new ArrayCollection();
            _loc1_ = this;
            while(_loc1_.parent)
            {
               for each(_loc2_ in _loc1_._accessors)
               {
                  _loc3_ = false;
                  for each(_loc4_ in this._allVariables)
                  {
                     if(_loc4_.name == _loc2_.name)
                     {
                        _loc3_ = true;
                        break;
                     }
                  }
                  if(!_loc3_)
                  {
                     this._allVariables.addItem(_loc2_);
                  }
               }
               _loc1_ = _loc1_.parent;
            }
         }
         return this._allVariables;
      }
      
      public function isCompatibleClass(param1:Class) : Boolean
      {
         if(param1 == this.type)
         {
            return true;
         }
         var _loc2_:ClassDescriptor = ClassProxy.getInstance().getDescriptor(param1);
         var _loc3_:ClassDescriptor = this.parent;
         while(_loc3_ != null)
         {
            if(_loc3_ == _loc2_)
            {
               return true;
            }
            _loc3_ = _loc3_.parent;
         }
         return false;
      }
      
      private function load() : void
      {
         this.buildDescriptor(this._target);
      }
      
      private function buildDescriptor(param1:*) : void
      {
         this._isLoaded = true;
         ClassProxy.getInstance().putDescriptor(this);
         var _loc2_:XML = describeType(this.type);
         name = _loc2_.@name;
         this._label = ClassUtils.getShortClassName(this._type);
         this._setPackage();
         var _loc3_:XMLList = _loc2_..factory..extendsClass;
         var _loc4_:XMLList = _loc2_..accessor;
         var _loc5_:XMLList = _loc2_..factory..implementsInterface;
         var _loc6_:XMLList = _loc2_..factory..method;
         var _loc7_:XMLList = _loc2_..variable;
         var _loc8_:XMLList = _loc2_..constant;
         this.createParentClass(_loc3_);
         this.createAccessors(_loc4_);
         this.createInterfaces(_loc5_);
         this.createMethods(_loc6_);
         this.createVariables(_loc7_);
         this.createConstants(_loc8_);
      }
      
      private function createParentClass(param1:XMLList) : void
      {
         var _loc2_:XML = null;
         var _loc3_:ClassDescriptor = null;
         if(param1.length())
         {
            _loc2_ = param1[0];
            this.superName = _loc2_.@type;
            _loc3_ = ClassProxy.getInstance().getDescriptorByName(this.superName);
            if(_loc3_)
            {
               this.parent = _loc3_;
            }
         }
      }
      
      private function createAccessors(param1:XMLList, param2:Boolean = false) : void
      {
         var _loc3_:XML = null;
         var _loc4_:String = null;
         var _loc5_:AccessorDescriptor = null;
         var _loc6_:String = null;
         for each(_loc3_ in param1)
         {
            if(!param2)
            {
               _loc4_ = _loc3_.@declaredBy;
            }
            else
            {
               _loc4_ = _name;
            }
            if(_loc4_ == _name)
            {
               if(param2)
               {
                  _loc6_ = _loc3_.@name;
                  if(this._accessorsMap[_loc6_] != null)
                  {
                     continue;
                  }
               }
               _loc5_ = new AccessorDescriptor(_loc3_,true,this);
               this.accessors.addItem(_loc5_);
               if(param2)
               {
                  this._accessorsMap[_loc6_] = _loc5_;
               }
            }
         }
         this.accessors.source.sortOn("label");
      }
      
      private function createConstants(param1:XMLList, param2:Boolean = false) : void
      {
         var _loc3_:XML = null;
         var _loc4_:String = null;
         var _loc5_:AccessorDescriptor = null;
         for each(_loc3_ in param1)
         {
            if(!param2)
            {
               _loc4_ = _loc3_.@declaredBy;
            }
            _loc5_ = new ConstantDescriptor(_loc3_,param2,this);
            this.constants.addItem(_loc5_);
         }
         this._constants.source.sortOn("label");
      }
      
      private function createVariables(param1:XMLList, param2:Boolean = false) : void
      {
         var _loc3_:XML = null;
         var _loc4_:AccessorDescriptor = null;
         for each(_loc3_ in param1)
         {
            _loc4_ = new AccessorDescriptor(_loc3_,param2,this);
            this.accessors.addItem(_loc4_);
         }
         this._accessors.source.sortOn("label");
      }
      
      private function createInterfaces(param1:XMLList, param2:Boolean = false) : void
      {
         var _loc3_:XML = null;
         var _loc4_:InterfaceDescriptor = null;
         for each(_loc3_ in param1)
         {
            _loc4_ = new InterfaceDescriptor(_loc3_.@type,param2);
            this._interfaces.addItem(_loc4_);
         }
         this._interfaces.source.sortOn("label");
      }
      
      private function createMethods(param1:XMLList, param2:Boolean = false) : void
      {
         var _loc3_:XML = null;
         var _loc4_:String = null;
         var _loc5_:MethodDescriptor = null;
         for each(_loc3_ in param1)
         {
            if(!param2)
            {
               _loc4_ = _loc3_.@declaredBy;
            }
            else
            {
               _loc4_ = _name;
            }
            if(_loc4_ == _name)
            {
               _loc5_ = new MethodDescriptor(_loc3_,param2);
               this._methods.addItem(_loc5_);
            }
         }
         this._methods.source.sortOn("label");
      }
      
      private function _setPackage() : void
      {
         var _loc1_:int = int(_name.indexOf("::"));
         if(_loc1_ >= 0)
         {
            this.packageName = _name.substr(0,_loc1_);
            this._label = _name.substr(_loc1_ + 2);
         }
         else
         {
            this.packageName = "/";
            this._label = _name;
         }
         var _loc2_:AS3Package = AS3Package.addPackage(this.packageName);
         _loc2_.addChildItem(this);
      }
      
      private function _setParent(param1:ClassDescriptor) : void
      {
         if(!this._parent)
         {
            this._parent = param1;
            this._parent._addChild(this);
         }
      }
      
      private function _addChild(param1:ClassDescriptor) : void
      {
         if(this._children.source.indexOf(param1) == -1)
         {
            this._children.addItem(param1);
         }
      }
   }
}

