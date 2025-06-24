package fr.kapit.controls
{
   import mx.core.EdgeMetrics;
   import mx.core.IBorder;
   import mx.core.IFlexAsset;
   import mx.core.IFlexDisplayObject;
   import mx.utils.NameUtil;
   
   public class kButton__embed_mxml__1177244932 extends kButton_skin implements IBorder, IFlexAsset, IFlexDisplayObject
   {
      public function kButton__embed_mxml__1177244932()
      {
         super();
         try
         {
            name = NameUtil.createUniqueName(this);
         }
         catch(e:Error)
         {
         }
      }
      
      public function get borderMetrics() : EdgeMetrics
      {
         if(scale9Grid == null)
         {
            return EdgeMetrics.EMPTY;
         }
         return new EdgeMetrics(scale9Grid.left,scale9Grid.top,Math.ceil(measuredWidth - scale9Grid.right),Math.ceil(measuredHeight - scale9Grid.bottom));
      }
      
      override public function toString() : String
      {
         return NameUtil.displayObjectToString(this);
      }
   }
}

