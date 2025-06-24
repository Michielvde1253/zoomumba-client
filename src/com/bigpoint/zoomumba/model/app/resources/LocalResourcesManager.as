package com.bigpoint.zoomumba.model.app.resources
{
   import com.bigpoint.zoomumba.model.app.resources.events.ResourceCachedEvent;
   import com.bigpoint.zoomumba.model.app.resources.vo.CacheVO;
   import flash.events.AsyncErrorEvent;
   import flash.events.EventDispatcher;
   import flash.events.NetStatusEvent;
   import flash.net.SharedObject;
   
   public class LocalResourcesManager extends EventDispatcher
   {
      private var SO_SUFIX:String = "";
      
      private const SO_PATH:String = "/";
      
      private const SO_SIZE:uint = 12582912;
      
      private var _cachedResourcesID:Vector.<String>;
      
      private var _storageEnabled:Boolean = true;
      
      private var _hasUserPermission:Boolean;
      
      private var _hasUserAnswered:Boolean;
      
      private var _configSO:SharedObject;
      
      public function LocalResourcesManager(param1:String, param2:Boolean = true)
      {
         var cachedResources:Vector.<Object> = null;
         var so:SharedObject = null;
         var id:String = param1;
         var enableStorage:Boolean = param2;
         super(this);
         this.SO_SUFIX = id + "_";
         this._cachedResourcesID = new Vector.<String>();
         this._storageEnabled = enableStorage;
         try
         {
            if(this._storageEnabled)
            {
               this._configSO = SharedObject.getLocal(this.SO_SUFIX + "CONFIG",this.SO_PATH);
               this._configSO.addEventListener(AsyncErrorEvent.ASYNC_ERROR,this.handleAsyncError);
               this._configSO.addEventListener(NetStatusEvent.NET_STATUS,this.handleNetStatusEvent);
               this._hasUserAnswered = this._configSO.data.hasUserAnswered;
               this._hasUserPermission = this._configSO.data.hasUserPermission;
               cachedResources = this._configSO.data.cachedResourcesID;
               if(cachedResources != null)
               {
                  for each(id in cachedResources)
                  {
                     so = SharedObject.getLocal(this.SO_SUFIX + id,this.SO_PATH);
                     if(so.data.cacheVO)
                     {
                        this._cachedResourcesID.push(id);
                     }
                  }
               }
            }
         }
         catch(e:Error)
         {
            _storageEnabled = false;
         }
      }
      
      public function hasResourceCached(param1:String) : Boolean
      {
         var _loc2_:String = null;
         if(this._storageEnabled && this._hasUserPermission)
         {
            for each(_loc2_ in this._cachedResourcesID)
            {
               if(_loc2_ == param1)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function getResource(param1:String) : CacheVO
      {
         var so:SharedObject = null;
         var obj:Object = null;
         var id:String = param1;
         if(this.hasResourceCached(id))
         {
            try
            {
               so = this._getSO(id);
               obj = so.data.cacheVO;
               if(obj)
               {
                  return new CacheVO(obj.path,obj.hash,obj.data);
               }
            }
            catch(e:Error)
            {
            }
         }
         return null;
      }
      
      public function storeResource(param1:String, param2:CacheVO) : void
      {
         var so:SharedObject = null;
         var id:String = param1;
         var cacheVO:CacheVO = param2;
         if(this._storageEnabled && this._hasUserPermission)
         {
            try
            {
               so = this._getSO(id);
               so.data.cacheVO = cacheVO;
               if(!this.hasResourceCached(id))
               {
                  this._cachedResourcesID.push(id);
               }
               this._flushSO(so,true);
               this._saveConfigSO();
            }
            catch(e:Error)
            {
            }
         }
      }
      
      public function clearCache() : void
      {
         this._clearResources();
         this._hasUserAnswered = false;
         this._hasUserPermission = false;
         this._configSO.clear();
      }
      
      public function get enabled() : Boolean
      {
         return this._storageEnabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._storageEnabled = param1;
      }
      
      public function get hasUserAnswered() : Boolean
      {
         return this._hasUserAnswered;
      }
      
      public function get hasUserPermission() : Boolean
      {
         return this._hasUserPermission;
      }
      
      public function set hasUserPermission(param1:Boolean) : void
      {
         this._hasUserAnswered = true;
         this._hasUserPermission = param1;
         this._saveConfigSO(param1);
         if(!param1)
         {
            this._clearResources();
         }
         dispatchEvent(new ResourceCachedEvent(ResourceCachedEvent.CACHE_STATUS_CHANGED,param1));
      }
      
      public function updateLocalResourcesStoredList() : void
      {
         this._saveConfigSO();
      }
      
      private function _checkFlashPlyerVersion() : Boolean
      {
         return true;
      }
      
      private function _clearResources() : void
      {
         var so:SharedObject = null;
         var id:String = null;
         for each(id in this._cachedResourcesID)
         {
            try
            {
               so = this._getSO(id);
               so.clear();
            }
            catch(e:Error)
            {
            }
         }
         this._cachedResourcesID.length = 0;
         this._cachedResourcesID = new Vector.<String>();
      }
      
      private function _getSO(param1:String) : SharedObject
      {
         return SharedObject.getLocal(this.SO_SUFIX + param1,this.SO_PATH);
      }
      
      private function _flushSO(param1:SharedObject, param2:Boolean = false) : String
      {
         return param1.flush(param2 ? int(this.SO_SIZE) : 0);
      }
      
      private function _saveConfigSO(param1:Boolean = false) : String
      {
         this._configSO.data.hasUserAnswered = this._hasUserAnswered;
         this._configSO.data.hasUserPermission = this._hasUserPermission;
         this._configSO.data.cachedResourcesID = this._cachedResourcesID;
         return "";
      }
      
      private function handleNetStatusEvent(param1:NetStatusEvent) : void
      {
         switch(param1.info.code)
         {
            case "SharedObject.Flush.Failed":
               this.hasUserPermission = false;
         }
      }
      
      private function handleAsyncError(param1:AsyncErrorEvent) : void
      {
      }
   }
}

