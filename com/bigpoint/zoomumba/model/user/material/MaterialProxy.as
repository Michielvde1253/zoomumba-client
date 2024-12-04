package com.bigpoint.zoomumba.model.user.material
{
   import com.bigpoint.zoomumba.constants.Materials;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.Resources;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.model.user.material.vo.MaterialVO;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class MaterialProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "MaterialProxy";
      
      private var _materialData:Vector.<MaterialVO> = new Vector.<MaterialVO>();
      
      private var _ressourceProxy:ResourcesProxy;
      
      public function MaterialProxy()
      {
         var _loc1_:MaterialVO = new MaterialVO();
         var _loc2_:int = 0;
         while(_loc2_ < Materials.MAX_MATERIALS_ID)
         {
            _loc1_ = new MaterialVO();
            _loc1_.id = _loc2_;
            this._materialData.push(_loc1_);
            _loc2_++;
         }
         super(NAME,this._materialData);
      }
      
      public function getMaterialById(param1:int) : MaterialVO
      {
         return this._materialData[param1];
      }
      
      public function setMaterial(param1:int, param2:int) : void
      {
         if(this._materialData[param1].ammount != param2)
         {
            this._materialData[param1].ammount = param2;
            sendNotification(Note.MATERIALS_UPDATED,param1);
         }
      }
      
      public function setMaterialMax(param1:int, param2:int) : void
      {
         if(this._materialData[param1].maxAmmount != param2)
         {
            this._materialData[param1].maxAmmount = param2;
            sendNotification(Note.MATERIALS_UPDATED,param1);
         }
      }
      
      public function increaseMaterial(param1:int, param2:int) : void
      {
         if(param2 != 0)
         {
            this._materialData[param1].ammount += param2;
            sendNotification(Note.MATERIALS_UPDATED,param1);
            sendNotification(SHOP.REFRESH_MATERIAL);
         }
      }
      
      public function reduceMaterial(param1:int, param2:int) : void
      {
         if(param2 != 0)
         {
            this._materialData[param1].ammount -= param2;
            sendNotification(Note.MATERIALS_UPDATED,param1);
            sendNotification(SHOP.REFRESH_MATERIAL);
         }
      }
      
      public function get ressourceProxy() : ResourcesProxy
      {
         if(this._ressourceProxy == null)
         {
            this._ressourceProxy = facade.getProxy(ResourcesProxy) as ResourcesProxy;
         }
         return this._ressourceProxy;
      }
      
      public function getMaterialAmount(param1:int) : int
      {
         return this._materialData[param1].ammount;
      }
      
      public function getMaxMaterial(param1:int) : int
      {
         return this._materialData[param1].maxAmmount;
      }
      
      public function get trashAmmount() : int
      {
         return this.ressourceProxy.getResourseAmmount(Resources.TRASH);
      }
      
      public function get materialData() : Vector.<MaterialVO>
      {
         return this._materialData;
      }
   }
}

