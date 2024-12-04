package com.bigpoint.zoorama.data.event
{
   import com.adobe.serialization.json.JSON;
   
   public class EventData
   {
      public static const LOCAL_FOR_ALL:String = "all";
      
      public var eventId:int;
      
      public var eventName:String;
      
      public var affectedActions:Object;
      
      public var startDate:int;
      
      public var endDate:int;
      
      public var description:String;
      
      public var affiliateId:int;
      
      public var locale:String;
      
      public function EventData(param1:Object)
      {
         var attributeName:String = null;
         var data:Object = param1;
         super();
         for(attributeName in data)
         {
            try
            {
               this[attributeName] = data[attributeName];
            }
            catch(error:Error)
            {
            }
         }
         if(data.affectedActions)
         {
            this.affectedActions = com.adobe.serialization.json.JSON.decode(data.affectedActions);
         }
      }
   }
}

