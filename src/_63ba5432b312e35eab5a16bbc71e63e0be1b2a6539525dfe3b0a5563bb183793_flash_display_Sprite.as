package
{
   import flash.display.Sprite;
   import flash.system.Security;
   
   public class _63ba5432b312e35eab5a16bbc71e63e0be1b2a6539525dfe3b0a5563bb183793_flash_display_Sprite extends Sprite
   {
      public function _63ba5432b312e35eab5a16bbc71e63e0be1b2a6539525dfe3b0a5563bb183793_flash_display_Sprite()
      {
         super();
      }
      
      public function allowDomainInRSL(... rest) : void
      {
         Security.allowDomain(rest);
      }
      
      public function allowInsecureDomainInRSL(... rest) : void
      {
         Security.allowInsecureDomain(rest);
      }
   }
}

