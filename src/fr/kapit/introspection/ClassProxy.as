package fr.kapit.introspection
{
   import flash.utils.Dictionary;
   import fr.kapit.utils.ClassUtils;
   import mx.collections.ArrayCollection;
   
   public class ClassProxy
   {
      private static var _instance:ClassProxy = new ClassProxy();
      
      private var _classes:Dictionary = new Dictionary();
      
      private var _classesByName:Object = {};
      
      public function ClassProxy()
      {
         super();
         if(!_instance)
         {
            _instance = this;
         }
      }
      
      public static function getInstance() : ClassProxy
      {
         return _instance;
      }
      
      public function get classes() : Dictionary
      {
         return this._classes;
      }
      
      public function get classesByName() : Object
      {
         return this._classesByName;
      }
      
      public function getDescriptor(param1:*) : ClassDescriptor
      {
         var _loc2_:Class = ClassUtils.getObjectClass(param1);
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:ClassDescriptor = this._classes[_loc2_] as ClassDescriptor;
         if(!_loc3_)
         {
            _loc3_ = new ClassDescriptor(param1);
         }
         return _loc3_;
      }
      
      public function hasDescriptor(param1:*) : Boolean
      {
         var _loc2_:Class = ClassUtils.getObjectClass(param1);
         if(!_loc2_)
         {
            return false;
         }
         return this._classes[_loc2_] != undefined && this._classes[_loc2_] != null;
      }
      
      public function hasDescriptorForClassName(param1:String) : Boolean
      {
         return this._classesByName[param1] != undefined && this._classesByName[param1] != null;
      }
      
      public function getDescriptorByName(param1:String) : ClassDescriptor
      {
         var _loc2_:Class = null;
         if(param1 == "*")
         {
            _loc2_ = Object;
         }
         else
         {
            if(param1 == "void")
            {
               return new ClassDescriptor(null);
            }
            _loc2_ = ClassUtils.getClassByName(param1);
         }
         if(_loc2_)
         {
            return this.getDescriptor(_loc2_);
         }
         return this._classesByName[param1] as ClassDescriptor;
      }
      
      public function putDescriptor(param1:ClassDescriptor) : void
      {
         if(param1.type)
         {
            this._classes[param1.type] = param1;
         }
         this._classesByName[param1.name] = param1;
      }
      
      public function get descriptors() : Array
      {
         var _loc2_:* = undefined;
         var _loc1_:Array = [];
         for(_loc2_ in this._classes)
         {
            _loc1_.push(this._classes[_loc2_]);
         }
         _loc1_.sortOn("label");
         return _loc1_;
      }
      
      public function getAllClasses(param1:String = "label") : ArrayCollection
      {
         var _loc3_:ClassDescriptor = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this._classesByName)
         {
            _loc2_.push(_loc3_);
         }
         _loc2_.sortOn(param1);
         return new ArrayCollection(_loc2_);
      }
      
      public function getAllInterfaces(param1:String = "label") : ArrayCollection
      {
         var _loc3_:ClassDescriptor = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this._classesByName)
         {
            if(_loc3_ is InterfaceDescriptor)
            {
               _loc2_.push(_loc3_);
            }
         }
         _loc2_.sortOn(param1);
         return new ArrayCollection(_loc2_);
      }
      
      public function getClassesInPackage(param1:String) : Array
      {
         var _loc3_:ClassDescriptor = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this._classesByName)
         {
            if(param1 == "" || _loc3_.packageName.length > 0 && _loc3_.packageName.indexOf(param1) == 0)
            {
               _loc2_.push(_loc3_);
            }
         }
         _loc2_.sortOn("label");
         return _loc2_;
      }
      
      public function getFullClassPath(param1:Object) : String
      {
         var i:int = 0;
         var parent:ClassDescriptor = null;
         var obj:Object = param1;
         var path:String = new String();
         var desc:ClassDescriptor = this.getDescriptor(obj);
         try
         {
            i = 0;
            while(i < desc.parents.length)
            {
               parent = desc.parents.getItemAt(i) as ClassDescriptor;
               path += parent.label;
               if(i < desc.parents.length - 1)
               {
                  path += ":";
               }
               i++;
            }
         }
         catch(e:Error)
         {
         }
         return path;
      }
      
      public function isClassDerived(param1:Class, param2:Class) : Boolean
      {
         var _loc4_:ClassDescriptor = null;
         var _loc3_:Boolean = false;
         do
         {
            _loc4_ = this.getDescriptor(param1);
            if(_loc4_.parent.type == param2)
            {
               _loc3_ = true;
               break;
            }
         }
         while(_loc4_ = _loc4_.parent, _loc4_.parent);
         
         return _loc3_;
      }
   }
}

