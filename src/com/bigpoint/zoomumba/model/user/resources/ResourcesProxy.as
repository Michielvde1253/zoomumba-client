package com.bigpoint.zoomumba.model.user.resources
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.Resources;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.model.user.resources.vo.ResourceVO;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class ResourcesProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "ResourcesProxy";
      
      private var resourceData:Vector.<ResourceVO> = new Vector.<ResourceVO>();
      
      public function ResourcesProxy()
      {
         var _loc1_:int = 0;
         while(_loc1_ < Resources.MAX_RESOURCE_ID)
         {
            this.resourceData.push(new ResourceVO());
            _loc1_++;
         }
         super(NAME,this.resourceData);
      }
      
      public function setResource(param1:int, param2:int) : void
      {
         if(param1 > 0)
         {
            if(this.resourceData[param1].ammount != param2)
            {
               this.resourceData[param1].ammount = param2;
               sendNotification(Note.RESOURCES_UPDATED,param1);
            }
         }
      }
      
      public function setResourceMax(param1:int, param2:int) : void
      {
         if(param1 > 0)
         {
            if(this.resourceData[param1].maxAmmount != param2)
            {
               this.resourceData[param1].maxAmmount = param2;
               sendNotification(Note.RESOURCES_UPDATED,param1);
            }
         }
      }
      
      public function increaseResource(param1:int, param2:int) : void
      {
         if(param2 != 0)
         {
            this.resourceData[param1].ammount += param2;
            if(this.resourceData[param1].ammount > this.getMaxResourse(param1))
            {
               this.resourceData[param1].ammount = this.getMaxResourse(param1);
            }
            sendNotification(Note.RESOURCES_UPDATED,param1);
            sendNotification(SHOP.REFRESH_RESOURCES);
         }
      }
      
      public function reduceResource(param1:int, param2:int) : void
      {
         if(param2 != 0)
         {
            this.resourceData[param1].ammount -= param2;
            sendNotification(Note.RESOURCES_UPDATED,param1);
            sendNotification(SHOP.REFRESH_RESOURCES);
         }
      }
      
      public function getResourseAmmount(param1:int) : int
      {
         return this.resourceData[param1].ammount;
      }
      
      public function getMaxResourse(param1:int) : int
      {
         return this.resourceData[param1].maxAmmount;
      }
      
      public function get water() : int
      {
         return this.resourceData[Resources.WATER].ammount;
      }
      
      public function get grass() : int
      {
         return this.resourceData[Resources.GRASS].ammount;
      }
      
      public function get meat() : int
      {
         return this.resourceData[Resources.MEAT].ammount;
      }
      
      public function get fish() : int
      {
         return this.resourceData[Resources.FISH].ammount;
      }
      
      public function get fruit() : int
      {
         return this.resourceData[Resources.FRUIT].ammount;
      }
      
      public function get grains() : int
      {
         return this.resourceData[Resources.GRAINS].ammount;
      }
      
      public function get medicine() : int
      {
         return this.resourceData[Resources.MEDICINE].ammount;
      }
      
      public function get superfood() : int
      {
         return this.resourceData[Resources.SUPERFOOD].ammount;
      }
      
      public function get supermedicine() : int
      {
         return this.resourceData[Resources.SUPERMEDICINE].ammount;
      }
      
      public function get powerfood() : int
      {
         return this.resourceData[Resources.POWERFOOD].ammount;
      }
      
      public function get elixir() : int
      {
         return this.resourceData[Resources.ELIXIR].ammount;
      }
      
      public function get potion() : int
      {
         return this.resourceData[Resources.POTION].ammount;
      }
      
      public function get craftBooster() : int
      {
         return this.resourceData[Resources.CRAFTING_BOOSTER].ammount;
      }
      
      public function get filter() : int
      {
         return this.resourceData[Resources.FILTER].ammount;
      }
      
      public function get oceanSuperFood() : int
      {
         return this.resourceData[Resources.SUPER_FISH_FOOD].ammount;
      }
      
      public function get oceanPowerFood() : int
      {
         return this.resourceData[Resources.POWER_FISH_FOOD].ammount;
      }
   }
}

