package com.bigpoint.zoorama.notices.bonus
{
   import com.bigpoint.zoorama.notices.gui.window.WindowNotice;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   
   public class BonusCodeNotice extends WindowNotice
   {
      public var bonusCode:String;
      
      private var titleId:String;
      
      private var textId:String;
      
      public function BonusCodeNotice(param1:String, param2:int, param3:String, param4:String, param5:WindowButtonParams = null)
      {
         super(param1,param2,param5);
         this.titleId = param3;
         this.textId = param4;
         this.bonusCode = this.bonusCode;
      }
   }
}

