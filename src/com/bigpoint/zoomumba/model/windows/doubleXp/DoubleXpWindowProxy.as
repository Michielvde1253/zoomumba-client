package com.bigpoint.zoomumba.model.windows.doubleXp
{
   import com.bigpoint.zoomumba.model.windows.doubleXp.vo.DoubleXpConfigVo;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class DoubleXpWindowProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "DoubleXpWindowProxy";
      
      private var _doubleXpConfigVo:DoubleXpConfigVo = new DoubleXpConfigVo();
      
      public function DoubleXpWindowProxy()
      {
         super(NAME);
         this._doubleXpConfigVo = new DoubleXpConfigVo();
      }
      
      public function haveAllDoubleXp() : Boolean
      {
         if(this._doubleXpConfigVo.displayAnimals.length <= 0)
         {
            return true;
         }
         return false;
      }
      
      public function get doubleXpConfigVo() : DoubleXpConfigVo
      {
         return this._doubleXpConfigVo;
      }
      
      public function set doubleXpConfigVo(param1:DoubleXpConfigVo) : void
      {
         this._doubleXpConfigVo = param1;
      }
   }
}

