package com.bigpoint.zoomumba.model.user.currency
{
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.user.core.vo.UserCommunicationIdsVO;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class CurrencyProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "CurrencyProxy";
      
      private var currencyData:Vector.<Number> = new Vector.<Number>(UserResources.MAX_RESOURCE_ID);
      
      public var assistantsPPCache:int = 0;
      
      private var _responceIdsForUpdate:UserCommunicationIdsVO = new UserCommunicationIdsVO();
      
      public function CurrencyProxy()
      {
         super(NAME,this.currencyData);
      }
      
      public function setCurrency(param1:int, param2:Number) : void
      {
         if(this.currencyData[param1] != param2)
         {
            this.currencyData[param1] = param2;
            switch(param1)
            {
               case UserResources.VIRTUAL_MONEY:
                  sendNotification(DataNote.VIRTUAL_MONEY_UPDATED);
                  break;
               case UserResources.REAL_MONEY:
                  sendNotification(DataNote.REAL_MONEY_UPDATED);
                  break;
               case UserResources.EXPERIENCE:
                  sendNotification(DataNote.EXPERIENCE_UPDATED);
                  break;
               case UserResources.PET_POWNS:
                  sendNotification(DataNote.PET_POWNS_UPDATED);
                  break;
               case UserResources.PEARLS:
                  sendNotification(DataNote.PEARLS_UPDATED);
                  break;
               default:
                  sendNotification(Note.WARNING_REPORT,"Currency id : " + param1 + " is not handled.");
            }
         }
      }
      
      public function increaseCurrency(param1:int, param2:Number) : void
      {
         if(param2 > 0)
         {
            this.currencyData[param1] += param2;
            switch(param1)
            {
               case UserResources.VIRTUAL_MONEY:
                  sendNotification(DataNote.VIRTUAL_MONEY_UPDATED);
                  break;
               case UserResources.REAL_MONEY:
                  sendNotification(DataNote.REAL_MONEY_UPDATED);
                  break;
               case UserResources.EXPERIENCE:
                  sendNotification(DataNote.EXPERIENCE_UPDATED);
                  break;
               case UserResources.PET_POWNS:
                  sendNotification(DataNote.PET_POWNS_UPDATED);
                  break;
               case UserResources.PEARLS:
                  sendNotification(DataNote.PEARLS_UPDATED);
                  break;
               default:
                  sendNotification(Note.WARNING_REPORT,"Currency id : " + param1 + " is not handled.");
            }
         }
         else if(param2 < 0)
         {
            sendNotification(Note.WARNING_REPORT,"increaseCurrency ammount must be possitive number.");
         }
      }
      
      public function reduceCurrency(param1:int, param2:Number) : void
      {
         if(param2 > 0)
         {
            this.currencyData[param1] -= param2;
            switch(param1)
            {
               case UserResources.VIRTUAL_MONEY:
                  sendNotification(DataNote.VIRTUAL_MONEY_UPDATED);
                  break;
               case UserResources.REAL_MONEY:
                  sendNotification(DataNote.REAL_MONEY_UPDATED);
                  break;
               case UserResources.EXPERIENCE:
                  sendNotification(DataNote.EXPERIENCE_UPDATED);
                  break;
               case UserResources.PET_POWNS:
                  sendNotification(DataNote.PET_POWNS_UPDATED);
                  break;
               case UserResources.PEARLS:
                  sendNotification(DataNote.PEARLS_UPDATED);
                  break;
               default:
                  sendNotification(Note.WARNING_REPORT,"Currency id : " + param1 + " is not handled.");
            }
         }
         else if(param2 < 0)
         {
            sendNotification(Note.WARNING_REPORT,"reduceCurrency ammount must be possitive number.");
         }
      }
      
      public function get responceIdsForUpdate() : UserCommunicationIdsVO
      {
         return this._responceIdsForUpdate;
      }
      
      public function getCurrency(param1:int) : Number
      {
         if(param1 == UserResources.OCEAN_VIRTUAL_MONEY)
         {
            param1 = UserResources.VIRTUAL_MONEY;
         }
         return this.currencyData[param1];
      }
      
      public function get virtualMoney() : Number
      {
         return this.currencyData[UserResources.VIRTUAL_MONEY];
      }
      
      public function get realMoney() : Number
      {
         return this.currencyData[UserResources.REAL_MONEY];
      }
      
      public function get experience() : Number
      {
         return this.currencyData[UserResources.EXPERIENCE];
      }
      
      public function get petPowns() : Number
      {
         return this.currencyData[UserResources.PET_POWNS];
      }
      
      public function get pearls() : Number
      {
         return this.currencyData[UserResources.PEARLS];
      }
   }
}

