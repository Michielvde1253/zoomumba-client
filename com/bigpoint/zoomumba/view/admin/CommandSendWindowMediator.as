package com.bigpoint.zoomumba.view.admin
{
   import com.bigpoint.zoomumba.constants.ADMIN;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.net2.vo.JSONRequestVO;
   import com.bigpoint.zoomumba.view.admin.components.CommandSendWindow;
   import com.bigpoint.zoomumba.view.gui.header.HeaderPanelMediator;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.describeType;
   import mx.collections.ArrayCollection;
   import mx.managers.PopUpManager;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import spark.components.Group;
   import spark.components.TextInput;
   
   public class CommandSendWindowMediator extends Mediator
   {
      public static var NAME:String = "CommandSendWindowMediator";
      
      private var visible:Boolean = false;
      
      private var commandWindow:CommandSendWindow;
      
      private var xml:XML;
      
      private var commandNames:ArrayCollection;
      
      private var netProxy:NetProxy;
      
      private var name:String;
      
      private var originalName:String;
      
      public function CommandSendWindowMediator()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         this.netProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ADMIN.TOGGLE_COMMAND_SEND];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case ADMIN.TOGGLE_COMMAND_SEND:
               this.toggleDebugger();
         }
      }
      
      private function toggleDebugger() : void
      {
         var _loc1_:HeaderPanelMediator = null;
         if(this.visible)
         {
            PopUpManager.removePopUp(this.commandWindow);
            this.visible = false;
         }
         else
         {
            _loc1_ = facade.retrieveMediator(HeaderPanelMediator.NAME) as HeaderPanelMediator;
            this.commandWindow = PopUpManager.createPopUp(_loc1_.getViewComponent() as Group,CommandSendWindow,false) as CommandSendWindow;
            this.visible = true;
            this.populatePopup();
         }
      }
      
      private function populatePopup() : void
      {
         var notifName:String = null;
         this.commandNames = new ArrayCollection();
         this.xml = describeType(NET);
         for each(notifName in this.xml.constant.(@type == "String").@name)
         {
            this.commandNames.addItem(notifName);
         }
         this.commandWindow.commandList.dataProvider = this.commandNames;
         this.commandWindow.commandList.addEventListener("change",this.handleCommandSelect);
         this.commandWindow.updateButton.addEventListener(MouseEvent.CLICK,this.handleUpdateCall);
         this.commandWindow.sendButton.addEventListener(MouseEvent.CLICK,this.handleSendCall);
      }
      
      private function handleSendCall(param1:MouseEvent) : void
      {
         this.name = this.commandWindow.command.text;
         var _loc2_:JSONRequestVO = new JSONRequestVO();
         _loc2_.flush = true;
         _loc2_.postParams = this.name;
         this.netProxy.addRequest(_loc2_);
      }
      
      private function handleUpdateCall(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.commandWindow.paramList.numElements)
         {
            this.name = this.originalName.replace("%" + _loc2_.toString(),TextInput(this.commandWindow.paramList.getElementAt(_loc2_)).text);
            _loc2_++;
         }
         this.commandWindow.command.text = this.name;
      }
      
      private function handleCommandSelect(param1:Event) : void
      {
         var _loc6_:TextInput = null;
         this.name = NET[this.commandNames[this.commandWindow.commandList.selectedIndex]];
         var _loc2_:int = int(this.name.indexOf("*"));
         if(_loc2_ > -1)
         {
            this.name = this.name.replace("*","");
         }
         var _loc3_:int = int(this.name.indexOf("@"));
         if(_loc3_ > -1)
         {
            this.name = this.name.replace("@",this.netProxy.nextRequestId);
         }
         this.originalName = this.name;
         this.commandWindow.paramList.removeAllElements();
         var _loc4_:Array = this.name.split("%");
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length - 1)
         {
            _loc6_ = new TextInput();
            this.commandWindow.paramList.addElement(_loc6_);
            _loc6_.width = 50;
            _loc6_.text = "%" + _loc5_.toString();
            _loc5_++;
         }
         this.commandWindow.command.text = this.name;
      }
   }
}

