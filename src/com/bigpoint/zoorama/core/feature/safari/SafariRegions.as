package com.bigpoint.zoorama.core.feature.safari
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.core.feature.safari.data.SafariRegionData;
   import com.bigpoint.zoorama.core.feature.safari.notices.SafariRegionNotice;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class SafariRegions extends Sprite
   {
      public static const REGION_ID_AFRICA_SMALL:int = 1;
      
      public static const REGION_ID_AFRICA_MEDIUM:int = 2;
      
      public static const REGION_ID_AFRICA_LAGRE:int = 3;
      
      public static const REGION_ID_ASIA_SMALL:int = 4;
      
      public static const REGION_ID_ASIA_MEDIUM:int = 5;
      
      public static const REGION_ID_ASIA_LAGRE:int = 6;
      
      public static const REGION_ID_NORTH_AMERICA_SMALL:int = 7;
      
      public static const REGION_ID_NORTH_AMERICA_MEDIUM:int = 8;
      
      public static const REGION_ID_NORTH_AMERICA_LAGRE:int = 9;
      
      public static const REGION_BACKGNOUDN_PICS:Vector.<String> = Vector.<String>(["","africa_back","africa_back","africa_back","asia_back","asia_back","asia_back","northamerica_back","northamerica_back","northamerica_back"]);
      
      private var notifier:Notifier;
      
      private var regions:Sprite;
      
      private var regionData:Vector.<SafariRegionData>;
      
      public function SafariRegions(param1:Notifier, param2:Sprite)
      {
         var _loc4_:int = 0;
         this.regionData = new Vector.<SafariRegionData>();
         super();
         this.regions = param2;
         this.addChild(param2);
         this.notifier = new Notifier(param1);
         var _loc3_:int = 0;
         while(_loc3_ < param2.numChildren)
         {
            _loc4_ = int(param2.getChildAt(_loc3_).name.split("_")[1]);
            while(this.regionData.length <= _loc4_)
            {
               this.regionData.push(null);
            }
            (param2.getChildAt(_loc3_) as Sprite).mouseEnabled = false;
            (param2.getChildAt(_loc3_) as Sprite).mouseChildren = true;
            this.regionData[_loc4_] = new SafariRegionData();
            this.regionData[_loc4_].land = param2.getChildAt(_loc3_)["land"] as SimpleButton;
            this.regionData[_loc4_].land.addEventListener(MouseEvent.CLICK,this.handleRegionClick);
            this.regionData[_loc4_].land.addEventListener(MouseEvent.MOUSE_DOWN,this.handleRegionMouseDown);
            this.regionData[_loc4_].land.addEventListener(MouseEvent.MOUSE_OVER,this.handleRegionMouseOver);
            this.regionData[_loc4_].land.addEventListener(MouseEvent.MOUSE_OUT,this.handleRegionMouseOut);
            this.regionData[_loc4_].lock = param2.getChildAt(_loc3_)["lock"] as Sprite;
            this.regionData[_loc4_].lock.mouseChildren = false;
            this.regionData[_loc4_].lock.mouseEnabled = false;
            _loc3_++;
         }
      }
      
      private function handleRegionMouseOut(param1:MouseEvent) : void
      {
         var _loc2_:int = int((param1.target as SimpleButton).parent.name.split("_")[1]);
         if(this.regionData[_loc2_].available)
         {
            TweenLite.to(param1.target,0.3,{"colorMatrixFilter":{
               "contrast":1,
               "brightness":1,
               "saturation":1,
               "remove":true
            }});
         }
         TooltipNewManager.removeToolTip();
      }
      
      private function handleRegionMouseOver(param1:MouseEvent) : void
      {
         var _loc2_:String = "";
         var _loc3_:int = int((param1.target as SimpleButton).parent.name.split("_")[1]);
         if(this.regionData[_loc3_].available)
         {
            TweenLite.to(param1.target,0.5,{"colorMatrixFilter":{
               "contrast":1.3,
               "brightness":1.2,
               "saturation":1.4
            }});
            switch(_loc3_)
            {
               case REGION_ID_AFRICA_SMALL:
               case REGION_ID_ASIA_SMALL:
               case REGION_ID_NORTH_AMERICA_SMALL:
                  _loc2_ = TextResourceModule.getText("zoo.safari.tooltip.regionSmall");
                  break;
               case REGION_ID_AFRICA_MEDIUM:
               case REGION_ID_ASIA_MEDIUM:
               case REGION_ID_NORTH_AMERICA_MEDIUM:
                  _loc2_ = TextResourceModule.getText("zoo.safari.tooltip.regionMedium");
                  break;
               case REGION_ID_AFRICA_LAGRE:
               case REGION_ID_ASIA_LAGRE:
               case REGION_ID_NORTH_AMERICA_LAGRE:
                  _loc2_ = TextResourceModule.getText("zoo.safari.tooltip.regionLarge");
            }
         }
         else
         {
            _loc2_ = TextResourceModule.getTextReplaced("zoo.safari.tooltip.regeonLevelRequared",Vector.<TextReplace>([new TextReplace("%regionLevel%",String(this.regionData[_loc3_].levelRequared))]));
         }
         TooltipNewManager.setToolTip(param1.target as DisplayObject,_loc2_,true,-1,-1,true);
      }
      
      private function handleRegionClick(param1:MouseEvent) : void
      {
         var _loc2_:int = int((param1.target as SimpleButton).parent.name.split("_")[1]);
         if(this.regionData[_loc2_].available)
         {
            this.notifier.dispatchNotice(new SafariRegionNotice(SafariRegionNotice.ACTIVETE_REGION,_loc2_));
         }
      }
      
      private function handleRegionMouseDown(param1:MouseEvent) : void
      {
         this.notifier.dispatchNotice(new SafariRegionNotice(SafariRegionNotice.MOUSE_DOWN_REGION));
      }
      
      public function disableRegionsById(param1:int) : void
      {
         this.regionData[param1].available = false;
         this.regionData[param1].lock.visible = true;
         this.regionData[param1].land.useHandCursor = false;
         TweenLite.to(this.regionData[param1].land,1,{"colorMatrixFilter":{"saturation":0.3}});
      }
      
      public function enableRegionsById(param1:int) : void
      {
         this.regionData[param1].available = true;
         this.regionData[param1].lock.visible = false;
         this.regionData[param1].land.useHandCursor = true;
         TweenLite.to(this.regionData[param1].land,1,{"colorMatrixFilter":{
            "saturation":1,
            "remove":true
         }});
      }
      
      public function storeRegionLevelRequared(param1:int, param2:int) : void
      {
         this.regionData[param1].levelRequared = param2;
      }
   }
}

