package com.bigpoint.zoomumba.view.windows.demo
{
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import windows.custom.demo.DemoContent;
   import windows.custom.demo.DemoWindow;
   
   public class DemoWindowMediator extends WindowMediator
   {
      public static const NAME:String = "DemoWindowMediator";
      
      public function DemoWindowMediator(param1:DemoWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         var _loc3_:CurrencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         this.content.username.text = _loc2_.userName;
         this.content.currencyAmount = _loc3_.realMoney;
         this.content.header.text = "Hello Zoomumbas";
      }
      
      private function get content() : DemoContent
      {
         return this.window.getContent() as DemoContent;
      }
      
      private function get window() : DemoWindow
      {
         return this.viewComponent as DemoWindow;
      }
      
      override public function dispose() : void
      {
      }
   }
}

