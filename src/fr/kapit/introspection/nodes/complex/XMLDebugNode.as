package fr.kapit.introspection.nodes.complex
{
   import fr.kapit.introspection.nodes.DebugNode;
   import fr.kapit.introspection.nodes.NodeCollection;
   import fr.kapit.introspection.nodes.simple.StringNode;
   
   public class XMLDebugNode extends ObjectNode
   {
      public function XMLDebugNode(param1:Object, param2:String, param3:Object = null)
      {
         super(param1,param2,param3);
      }
      
      override public function get displayValue() : String
      {
         return name;
      }
      
      public function get xmlValue() : String
      {
         var _loc1_:String = null;
         if(target is XML)
         {
            _loc1_ = XML(target).toXMLString();
         }
         else if(target is XMLList)
         {
            _loc1_ = XMLList(target).toXMLString();
         }
         return _loc1_;
      }
      
      override protected function getChildNodes() : NodeCollection
      {
         var _loc2_:NodeCollection = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:DebugNode = null;
         var _loc11_:XML = null;
         var _loc12_:String = null;
         var _loc13_:DebugNode = null;
         var _loc14_:XML = null;
         var _loc1_:Boolean = false;
         var _loc3_:XMLList = XML(target).children();
         var _loc4_:XML = XML(target);
         if(Boolean(_loc4_.hasSimpleContent()) && _loc3_.length() > 0)
         {
            _loc6_ = String(_loc4_.name());
            _loc7_ = _loc3_[0].valueOf();
            name = _loc6_ + " = " + _loc7_;
            _loc1_ = true;
         }
         var _loc5_:XMLList = _loc4_.attributes();
         if(_loc5_.length() > 0)
         {
            if(!_loc2_)
            {
               _loc2_ = new NodeCollection(false,false,false);
            }
            for each(_loc11_ in _loc5_)
            {
               _loc8_ = String(_loc11_.name());
               _loc9_ = String(_loc11_.valueOf());
               _loc10_ = new StringNode(_loc9_,_loc8_);
               _loc2_.addItem(_loc10_);
            }
         }
         if(!_loc1_)
         {
            for each(_loc14_ in _loc3_)
            {
               if(!_loc2_)
               {
                  _loc2_ = new NodeCollection(false,false,false);
               }
               _loc12_ = String(_loc14_.localName());
               _loc13_ = new XMLDebugNode(_loc14_,_loc12_,target);
               _loc2_.addItem(_loc13_);
            }
         }
         return _loc2_;
      }
   }
}

