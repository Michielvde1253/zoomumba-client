package com.bigpoint.zoomumba.model.windows.ranking
{
   import com.bigpoint.zoomumba.constants.Note;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class RanknigWindowProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "RanknigWindowProxy";
      
      private var tabId:int = -1;
      
      public function RanknigWindowProxy()
      {
         super(NAME);
      }
      
      public function changeTabId(param1:int) : void
      {
         this.tabId = param1;
         sendNotification(Note.RANKING_TAB_CHANGE,this.tabId);
      }
      
      public function getTabId() : int
      {
         return this.tabId;
      }
   }
}

