package com.bigpoint.zoomumba.view.playfield.xmas
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.events.xmas.XMas2012Proxy;
   import com.bigpoint.zoomumba.view.playfield.BuildingMediator;
   import com.bigpoint.zoorama.utils.mouseModule.MouseModule;
   import com.bigpoint.zoorama.utils.mouseModule.MouseState;
   import com.bigpoint.zoorama.view.field.items.XmasTree;
   import flash.events.Event;
   import org.puremvc.as3.interfaces.INotification;
   
   public class XmasTreeBuildingMediator extends BuildingMediator
   {
      public static const NAME:String = "XmasTreeBuildingMediator";
      
      private var xmasProxy:XMas2012Proxy;
      
      public function XmasTreeBuildingMediator(param1:int, param2:int, param3:XmasTree)
      {
         super(NAME,param1,param2,param3);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.GAME_COUNTER_UPDATED,Note.XMAS2012_DATA_PARSED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.XMAS2012_DATA_PARSED:
            case Note.GAME_COUNTER_UPDATED:
               if(this.xmasProxy)
               {
                  this.tree.loadNewAsset(this.xmasProxy.getCurrentXMasStep());
               }
         }
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this.xmasProxy = facade.retrieveProxy(XMas2012Proxy.NAME) as XMas2012Proxy;
      }
      
      override protected function handleClick(param1:Event) : void
      {
         if(MouseModule.getInstance().mouseType == MouseState.DEFAULT)
         {
         }
      }
      
      private function get tree() : XmasTree
      {
         return viewComponent as XmasTree;
      }
   }
}

