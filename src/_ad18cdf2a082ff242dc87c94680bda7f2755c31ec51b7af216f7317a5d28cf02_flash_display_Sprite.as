package
{
   import flash.display.Sprite;
   import flash.system.Security;
   
   public class _ad18cdf2a082ff242dc87c94680bda7f2755c31ec51b7af216f7317a5d28cf02_flash_display_Sprite extends Sprite
   {
      public function _ad18cdf2a082ff242dc87c94680bda7f2755c31ec51b7af216f7317a5d28cf02_flash_display_Sprite()
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

