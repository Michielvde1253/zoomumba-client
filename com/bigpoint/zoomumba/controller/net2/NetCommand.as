package com.bigpoint.zoomumba.controller.net2
{
   import com.adobe.serialization.json.JSON;
   import com.bigpoint.zoomumba.constants.ADMIN;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.net2.vo.JSONRequestVO;
   import flash.utils.describeType;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class NetCommand extends SimpleCommand
   {
      public function NetCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var requestIdFlagCheck:int;
         var notificationName:String = null;
         var notifName:String = null;
         var JSONRequest:JSONRequestVO = null;
         var nextRequestId:int = 0;
         var flushFlagCheck:int = 0;
         var i:int = 0;
         var param:String = null;
         var notification:INotification = param1;
         var name:String = notification.getName() as String;
         var body:Array = notification.getBody() as Array;
         var netProxy:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         var xml:XML = describeType(NET);
         for each(notifName in xml.constant.(@type == "String").@name)
         {
            if(name == NET[notifName])
            {
               notificationName = notifName;
            }
         }
         JSONRequest = new JSONRequestVO();
         nextRequestId = netProxy.nextRequestId;
         flushFlagCheck = int(name.indexOf("*"));
         if(flushFlagCheck > -1)
         {
            name = name.replace("*","");
            JSONRequest.flush = true;
         }
         requestIdFlagCheck = int(name.indexOf("@"));
         if(requestIdFlagCheck > -1)
         {
            name = name.replace("@",nextRequestId);
         }
         if(body)
         {
            i = 0;
            while(i < body.length)
            {
               param = com.adobe.serialization.json.JSON.encode(body[i]);
               name = name.replace("%" + i.toString(),param);
               i++;
            }
         }
         name = name.replace("%","");
         sendNotification(ADMIN.LOG_NET_COMMAND,notificationName + "  " + name);
         JSONRequest.postParams = name;
         netProxy.addRequest(JSONRequest);
      }
   }
}

