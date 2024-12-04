package com.bigpoint.zoomumba.model.windows.nowInShop
{
   import com.bigpoint.zoomumba.model.windows.nowInShop.vo.NowInShopConfigVo;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class NowInShopWindowProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "NowInShopWindowProxy";
      
      private var _nowInShopConfigVo:NowInShopConfigVo = new NowInShopConfigVo();
      
      public function NowInShopWindowProxy()
      {
         super(NAME);
         this._nowInShopConfigVo = new NowInShopConfigVo();
      }
      
      public function haveAllDisplayAnimals() : Boolean
      {
         if(this._nowInShopConfigVo.displayAnimals.length <= 0)
         {
            return true;
         }
         return false;
      }
      
      public function get nowInShopConfigVo() : NowInShopConfigVo
      {
         return this._nowInShopConfigVo;
      }
      
      public function set nowInShopConfigVo(param1:NowInShopConfigVo) : void
      {
         this._nowInShopConfigVo = param1;
      }
   }
}

