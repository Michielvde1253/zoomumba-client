package com.bigpoint.zoomumba.model.windows.cageUpgrade
{
   import com.bigpoint.zoomumba.model.app.cageUpgrades.vo.GraphicVO;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoorama.view.field.items.Cage;
   
   public class CageUpgradeInitParams
   {
      public var eventId:int = -1;
      
      public var headerIcon:ItemVO = new ItemVO();
      
      public var upgradeInfo:String;
      
      public var cageItem:Cage;
      
      public var eventResource:ItemVO = new ItemVO();
      
      public var extraGraphics:Vector.<GraphicVO> = new Vector.<GraphicVO>();
      
      public var upgadeResource:ItemPackVO = new ItemPackVO();
      
      public var priceResources:Vector.<ItemPackVO> = new Vector.<ItemPackVO>();
      
      public var bonusResource:ItemPackVO = new ItemPackVO();
      
      public var canBuy:Boolean;
      
      public var buyNote:String;
      
      public var bonusFrom:String;
      
      public var bonusTo:String;
      
      public function CageUpgradeInitParams()
      {
         super();
      }
   }
}

