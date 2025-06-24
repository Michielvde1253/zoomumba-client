package fr.kapit.introspection
{
   import mx.collections.ArrayCollection;
   
   public class AS3Package extends PackageItem
   {
      public static var rootPackage:AS3Package;
      
      private static var _initialized:Boolean;
      
      public static var allPackages:Object = {};
      
      private var _children:ArrayCollection;
      
      private var _classCount:int;
      
      private var _classes:ArrayCollection;
      
      private var _classesDirty:Boolean = true;
      
      private var _filterClasses:Array = ["mx.core::BitmapAsset","mx.core::SpriteAsset"];
      
      private var _label:String;
      
      public function AS3Package(param1:String)
      {
         super(param1);
         if(!_initialized)
         {
            _initialized = true;
            rootPackage = new AS3Package("/");
            rootPackage.name = "/";
            allPackages["/"] = rootPackage;
         }
         var _loc2_:int = int(param1.lastIndexOf("."));
         if(_loc2_ >= 0)
         {
            this._label = param1.substr(_loc2_ + 1);
         }
         else
         {
            this._label = param1;
         }
      }
      
      public static function addPackage(param1:String) : AS3Package
      {
         var _loc7_:String = null;
         var _loc8_:AS3Package = null;
         var _loc9_:AS3Package = null;
         var _loc2_:Object = allPackages;
         var _loc3_:Array = param1.split(".");
         var _loc4_:* = "";
         var _loc5_:String = "/";
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc7_ = _loc3_[_loc6_];
            if(_loc6_ > 0)
            {
               _loc4_ += ".";
            }
            _loc4_ += _loc7_;
            if(allPackages[_loc4_] == null)
            {
               _loc9_ = new AS3Package(_loc4_);
               if(_loc6_ == 0)
               {
                  rootPackage.addChildItem(_loc9_);
               }
               allPackages[_loc4_] = _loc9_;
            }
            else
            {
               _loc9_ = allPackages[_loc4_] as AS3Package;
            }
            _loc8_ = allPackages[_loc5_] as AS3Package;
            _loc5_ = _loc4_;
            _loc8_.addChildItem(_loc9_);
            _loc6_++;
         }
         return _loc9_;
      }
      
      public static function getPackage(param1:String) : AS3Package
      {
         return allPackages[param1] as AS3Package;
      }
      
      public static function getPackages() : Array
      {
         var _loc2_:String = null;
         var _loc1_:Array = [];
         for(_loc2_ in allPackages)
         {
            _loc1_.push(_loc2_);
         }
         _loc1_.sort();
         return _loc1_;
      }
      
      public static function sortPackages(param1:Boolean) : void
      {
         if(rootPackage)
         {
            _sortPackages(rootPackage,param1);
         }
      }
      
      private static function _compareNodes(param1:PackageItem, param2:PackageItem, param3:Array = null) : int
      {
         if(param1 is AS3Package && param2 is AS3Package || !(param1 is AS3Package) && !(param2 is AS3Package))
         {
            return param1.label.toUpperCase().localeCompare(param2.label.toUpperCase());
         }
         if(param1 is AS3Package)
         {
            return -1;
         }
         return 1;
      }
      
      private static function _sortPackages(param1:AS3Package, param2:Boolean) : void
      {
         var _loc3_:PackageItem = null;
         for each(_loc3_ in param1._children)
         {
            if(_loc3_ is AS3Package)
            {
               _sortPackages(_loc3_ as AS3Package,param2);
            }
         }
         if(param2)
         {
            param1._children.source.sortOn("labelForSorting");
         }
      }
      
      public function addChildItem(param1:PackageItem) : void
      {
         if(this == param1)
         {
            return;
         }
         if(!this._children)
         {
            this._children = new ArrayCollection();
            this._children.filterFunction = this._filterFunction;
         }
         if(this._children.source.indexOf(param1) == -1)
         {
            this._children.addItem(param1);
         }
         param1.parentPackage = this;
         this._classesDirty = true;
      }
      
      public function addClassFilter(param1:String) : void
      {
      }
      
      public function get children() : ArrayCollection
      {
         return this._children;
      }
      
      public function get classCount() : int
      {
         this.getAllClasses();
         return this._classCount;
      }
      
      public function getAllClasses() : ArrayCollection
      {
         var _loc1_:Array = null;
         if(!this._classes)
         {
            this._classes = new ArrayCollection();
         }
         if(this._classesDirty)
         {
            _loc1_ = this._getAllClasses(this);
            _loc1_.sortOn("label");
            this._classes.source = _loc1_;
            this._classesDirty = false;
            this._classCount = this._classes.length;
         }
         return this._classes;
      }
      
      override public function get label() : String
      {
         return this._label;
      }
      
      public function toXMLString() : String
      {
         var _loc1_:String = "";
         return this._toXML(this,0,_loc1_);
      }
      
      private function _filterFunction(param1:Object) : Boolean
      {
         var _loc2_:ClassDescriptor = null;
         if(param1 is ClassDescriptor)
         {
            _loc2_ = param1 as ClassDescriptor;
            if(this._filterClasses.indexOf(_loc2_.superName) != -1)
            {
               return false;
            }
            return true;
         }
         return true;
      }
      
      private function _getAllClasses(param1:AS3Package, param2:Array = null) : Array
      {
         var _loc3_:PackageItem = null;
         if(!param2)
         {
            param2 = [];
         }
         for each(_loc3_ in param1._children)
         {
            if(_loc3_ is ClassDescriptor)
            {
               param2.push(_loc3_);
            }
            else if(_loc3_ is AS3Package)
            {
               this._getAllClasses(_loc3_ as AS3Package,param2);
            }
         }
         return param2;
      }
      
      private function _toXML(param1:AS3Package, param2:int, param3:String) : String
      {
         var _loc6_:PackageItem = null;
         var _loc7_:ClassDescriptor = null;
         var _loc4_:* = "";
         var _loc5_:int = 0;
         while(_loc5_ < param2)
         {
            _loc4_ += "\t";
            _loc5_++;
         }
         param3 += _loc4_ + "<node type=\'package\' name=\'" + param1.name + "\'>\n";
         for each(_loc6_ in param1._children)
         {
            if(_loc6_ is AS3Package)
            {
               param3 = this._toXML(_loc6_ as AS3Package,param2 + 1,param3);
            }
            else if(_loc6_ is ClassDescriptor)
            {
               param3 += _loc4_ + "\t";
               _loc7_ = _loc6_ as ClassDescriptor;
               param3 += "<node type=\'class\' name=\'" + _loc6_.name + "\' label=\'" + _loc6_.label + "\' childrenCount=\'" + _loc7_.children.length + "\' size=\'" + (_loc7_.accessors.length + _loc7_.methods.length) + "\'/>\n";
            }
         }
         return param3 + (_loc4_ + "</node>\n");
      }
   }
}

