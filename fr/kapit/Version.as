package fr.kapit
{
   public class Version
   {
      public static const BUILD_NUMBER:String = "$Rev: ${env.SVN_REVISION}";
      
      public static const VERSION_NUMBER:String = "1.7.0";
      
      public function Version()
      {
         super();
      }
   }
}

