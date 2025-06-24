package com.bigpoint.zoomumba.model.app.resources
{
   import com.adobe.crypto.MD5;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.resources.decoder.CSSResource;
   import com.bigpoint.zoomumba.model.app.resources.decoder.ImageAsset;
   import com.bigpoint.zoomumba.model.app.resources.decoder.Resource;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.app.resources.decoder.XMLResource;
   import com.bigpoint.zoomumba.model.app.resources.events.ResourceCachedEvent;
   import com.bigpoint.zoomumba.model.app.resources.events.ResourceEvent;
   import com.bigpoint.zoomumba.model.app.resources.vo.BulkLoadVO;
   import com.bigpoint.zoomumba.model.app.resources.vo.CacheVO;
   import com.bigpoint.zoomumba.model.app.resources.vo.CvTagVO;
   import com.bigpoint.zoomumba.model.app.resources.vo.SendResourceToFunctionVO;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.greensock.events.LoaderEvent;
   import com.greensock.loading.BinaryDataLoader;
   import com.greensock.loading.LoaderMax;
   import com.greensock.loading.data.LoaderMaxVars;
   import flash.display.DisplayObjectContainer;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class ResourceLoaderProxy extends Proxy
   {
      public static const NAME:String = "ResourceLoaderProxy";
      
      public static const MIN_CONNECTIONS:uint = 1;
      
      public static const DEFAULT_CONNECTIONS:uint = 5;
      
      public static const MAX_CONNECTIONS:uint = 10;
      
      public static const MB_PER_SECOND:uint = 1;
      
      public static const DEFAULT_STORE_INTERVAL:uint = 2;
      
      public static var STORE_INTERVAL:uint = DEFAULT_STORE_INTERVAL;
      
      private static const MAIN_LOADER_NAME:String = "ZOOMUMBA_MAIN_LOADER";
      
      private var _localResources:LocalResourcesManager;
      
      private var _bulkList:Dictionary;
      
      private var _singleList:Dictionary;
      
      private var _resourcesLoading:Dictionary;
      
      private var _resourcesLoaded:Dictionary;
      
      private var _resourcesToStore:Vector.<CacheVO>;
      
      private var _mainQueue:LoaderMax;
      
      private var _cvTagsProxy:CvTagsProxy;
      
      private var _hasResourceToStore:Boolean = false;
      
      private var _storeIntervalCounter:uint = 0;
      
      public function ResourceLoaderProxy()
      {
         super(NAME);
         this._resourcesLoaded = new Dictionary();
         this._resourcesLoading = new Dictionary();
         this._resourcesToStore = new Vector.<CacheVO>();
         this._bulkList = new Dictionary();
         this._singleList = new Dictionary();
         this._mainQueue = new LoaderMax(this._mainLoaderConfig());
         this._localResources = new LocalResourcesManager("ZOOMUMBA_LOCAL_CACHE",true);
         this._localResources.addEventListener(ResourceCachedEvent.CACHE_STATUS_CHANGED,this._handleCacheStatusChanged);
         TimeManager.registerTickFunction(this._silentStoreLoadedResources);
      }
      
      override public function onRegister() : void
      {
         this._cvTagsProxy = facade.retrieveProxy(CvTagsProxy.NAME) as CvTagsProxy;
      }
      
      public function get hasUserAnsweredPermissionForLocalCache() : Boolean
      {
         return this._localResources.hasUserAnswered;
      }
      
      public function get hasUserPermissionForLocalCache() : Boolean
      {
         return this._localResources.hasUserPermission;
      }
      
      public function set hasUserPermissionForLocalCache(param1:Boolean) : void
      {
         this._localResources.hasUserPermission = param1;
      }
      
      public function get localStoragedEnabled() : Boolean
      {
         return this._localResources.enabled;
      }
      
      public function set localStoragedEnabled(param1:Boolean) : void
      {
         this._localResources.enabled = param1;
      }
      
      public function isResourceLoaded(param1:String) : Boolean
      {
         return this._resourcesLoaded[param1] != null;
      }
      
      public function isResourceLoading(param1:String) : Boolean
      {
         return this._resourcesLoading[param1];
      }
      
      public function isResourceLoadedOrLoading(param1:String) : Boolean
      {
         return Boolean(this._resourcesLoading[param1]) || Boolean(this._resourcesLoaded[param1]);
      }
      
      public function clearStoredResources() : void
      {
         this._localResources.clearCache();
      }
      
      public function getResource(param1:String) : Resource
      {
         return this._resourcesLoaded[param1];
      }
      
      public function singleLoad(param1:String, param2:Function, param3:DisplayObjectContainer = null) : void
      {
         var _loc4_:SendResourceToFunctionVO = this._singleList[param1] as SendResourceToFunctionVO;
         if(_loc4_)
         {
            _loc4_.addCallback(param2,param3);
         }
         else
         {
            this._singleList[param1] = new SendResourceToFunctionVO(param1,param2,param3);
         }
         if(this.isResourceLoaded(param1))
         {
            this._sendResourceToFunction(param1);
         }
         else
         {
            this._loadResource(this._mainQueue,param1);
         }
      }
      
      public function getBulklistVo(param1:String) : BulkLoadVO
      {
         return this._bulkList[param1];
      }
      
      public function bulkLoad(param1:String, param2:Vector.<String>, param3:Function = null, param4:Function = null) : void
      {
         var _loc8_:String = null;
         var _loc5_:Dictionary = new Dictionary();
         var _loc6_:LoaderMax = new LoaderMax(this._bulkLoaderConfig(param1));
         var _loc7_:int = 0;
         this._bulkList[param1] = new BulkLoadVO(param1,_loc6_,param2,_loc5_,param3,param4);
         for each(_loc8_ in param2)
         {
            if(this.isResourceLoaded(_loc8_))
            {
               _loc5_[_loc8_] = this.getResource(_loc8_);
               _loc7_++;
            }
            else
            {
               this._loadResource(_loc6_,_loc8_);
            }
         }
         if(_loc7_ == param2.length)
         {
            this._finishBulkLoader(param1);
            return;
         }
         if(_loc6_.numChildren > 0)
         {
            _loc6_.load();
         }
      }
      
      public function destroyResource(param1:String) : void
      {
         var _loc2_:Resource = this.getResource(param1);
         if(_loc2_)
         {
            _loc2_.dispose();
            delete this._resourcesLoaded[param1];
         }
      }
      
      private function _loadResource(param1:LoaderMax, param2:String) : void
      {
         var _loc3_:CacheVO = null;
         var _loc4_:CvTagVO = null;
         if(this.isResourceLoading(param2))
         {
            return;
         }
         this._resourcesLoading[param2] = true;
         if(this._localResources.hasResourceCached(param2))
         {
            _loc3_ = this._localResources.getResource(param2);
            _loc4_ = this._cvTagsProxy.getCvTag(param2);
            if((_loc4_) && _loc4_.hash != "" && _loc3_.hash == _loc4_.hash)
            {
               this._loadResourceFromLocalStorage(param2);
            }
            else
            {
               this._loadResourceFromServer(param1,param2);
            }
         }
         else
         {
            this._loadResourceFromServer(param1,param2);
         }
      }
      
      private function _handleResourceLoaded(param1:LoaderEvent) : void
      {
         var _loc2_:BinaryDataLoader = param1.target as BinaryDataLoader;
         var _loc3_:ByteArray = _loc2_.content as ByteArray;
         var _loc4_:CvTagVO = this._cvTagsProxy.getCvTag(_loc2_.name);
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:CacheVO = new CacheVO(_loc4_.path,_loc4_.hash,_loc3_);
         this._resourcesToStore.push(_loc5_);
         this._hasResourceToStore = true;
         this._createResource(_loc5_);
      }
      
      private function _storeBulkResource(param1:Resource) : void
      {
         var _loc2_:BulkLoadVO = null;
         var _loc3_:String = null;
         for each(_loc2_ in this._bulkList)
         {
            for each(_loc3_ in _loc2_.idsList)
            {
               if(_loc3_ == param1.id)
               {
                  _loc2_.resources[param1.id] = param1;
                  if(_loc2_.callbackItem != null)
                  {
                     _loc2_.callbackItem(param1);
                  }
                  if(_loc2_.numResourcesDecoded == _loc2_.numResources)
                  {
                     this._finishBulkLoader(_loc2_.id);
                     break;
                  }
               }
            }
         }
      }
      
      private function _finishBulkLoader(param1:String) : void
      {
         var _loc2_:BulkLoadVO = this._bulkList[param1] as BulkLoadVO;
         if(_loc2_.callbackComplete != null)
         {
            _loc2_.callbackComplete(_loc2_.resources);
         }
         delete this._bulkList[param1];
      }
      
      private function _sendResourceToFunction(param1:String) : void
      {
         var _loc2_:Function = null;
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:Resource = null;
         var _loc5_:SendResourceToFunctionVO = this._singleList[param1] as SendResourceToFunctionVO;
         if(_loc5_)
         {
            _loc4_ = this.getResource(param1);
            while(_loc5_.callbacks.length)
            {
               _loc2_ = _loc5_.callbacks.shift();
               _loc3_ = _loc5_.targets.shift();
               if(_loc3_)
               {
                  _loc2_(_loc4_,_loc3_);
               }
               else
               {
                  _loc2_(_loc4_);
               }
            }
            _loc5_.dispose();
            _loc5_ = null;
            delete this._singleList[param1];
         }
      }
      
      private function _handleFail(param1:LoaderEvent) : void
      {
         sendNotification(Note.ERROR_REPORT,"ResourceLoaderProxy._handleFail ==> " + param1.toString());
      }
      
      private function _loadResourceFromLocalStorage(param1:String) : void
      {
         var _loc2_:CacheVO = this._localResources.getResource(param1);
         var _loc3_:CvTagVO = this._cvTagsProxy.getCvTag(param1);
         if(_loc2_)
         {
            this._createResource(_loc2_);
         }
         else
         {
            this._loadResourceFromServer(this._mainQueue,param1);
         }
      }
      
      private function _loadResourceFromServer(param1:LoaderMax, param2:String) : void
      {
         param1.append(new BinaryDataLoader(this._cvTagsProxy.getFileURL(param2),{
            "name":param2,
            "allowMalformedURL":true
         }));
      }
      
      private function _createResource(param1:CacheVO) : void
      {
         var _loc2_:Resource = null;
         switch(param1.type)
         {
            case Resource.CSS:
               _loc2_ = new CSSResource(param1.id,param1.data);
               break;
            case Resource.SWF:
               _loc2_ = new SWFAsset(param1.id,param1.data);
               break;
            case Resource.JPG:
            case Resource.PNG:
               _loc2_ = new ImageAsset(param1.id,param1.data);
               break;
            case Resource.XmL:
               _loc2_ = new XMLResource(param1.id,param1.data);
               break;
            default:
               _loc2_ = new Resource(param1.id,param1.data);
         }
         _loc2_.addEventListener(ResourceEvent.DECODED,this._handleResourceDecoded);
         _loc2_.addEventListener(ResourceEvent.ERROR,this._handleResourceDecodeError);
         _loc2_.decode();
      }
      
      private function _handleResourceDecoded(param1:ResourceEvent) : void
      {
         var _loc2_:Resource = param1.target as Resource;
         _loc2_.removeEventListener(ResourceEvent.DECODED,this._handleResourceDecoded);
         _loc2_.removeEventListener(ResourceEvent.ERROR,this._handleResourceDecodeError);
         this._resourcesLoaded[_loc2_.id] = _loc2_;
         if(_loc2_ is XMLResource)
         {
            TextResourceModule.parseTextXML((_loc2_ as XMLResource).getXML());
         }
         this._storeBulkResource(_loc2_);
         this._sendResourceToFunction(_loc2_.id);
         delete this._resourcesLoading[_loc2_.id];
      }
      
      private function _handleResourceDecodeError(param1:ResourceEvent) : void
      {
         param1.target.removeEventListener(ResourceEvent.DECODED,this._handleResourceDecoded);
         param1.target.removeEventListener(ResourceEvent.ERROR,this._handleResourceDecodeError);
         if(this._localResources.hasResourceCached(param1.target.id))
         {
            this._loadResourceFromServer(this._mainQueue,param1.target.id);
         }
         else
         {
            sendNotification(Note.ERROR_REPORT,"ResourceLoaderProxy._handleResourceDecodeError()");
         }
      }
      
      private function _handleCacheStatusChanged(param1:ResourceCachedEvent) : void
      {
         if(param1.enabled)
         {
            TimeManager.registerTickFunction(this._silentStoreLoadedResources);
         }
      }
      
      private function _silentStoreLoadedResources() : void
      {
         var _loc1_:CacheVO = null;
         var _loc2_:uint = 0;
         if(this.hasUserPermissionForLocalCache && this._hasResourceToStore && ++this._storeIntervalCounter == STORE_INTERVAL)
         {
            _loc1_ = this._resourcesToStore.shift();
            _loc2_ = _loc1_.data.length / (1024 * 1024);
            STORE_INTERVAL = _loc2_ / MB_PER_SECOND + DEFAULT_STORE_INTERVAL;
            this._storeIntervalCounter = 0;
            this._hasResourceToStore = this._resourcesToStore.length > 0;
            this._storeResource(_loc1_.id,_loc1_);
         }
      }
      
      private function _mainLoaderConfig() : LoaderMaxVars
      {
         var _loc1_:LoaderMaxVars = new LoaderMaxVars();
         _loc1_.autoLoad(true);
         _loc1_.skipFailed(true);
         _loc1_.auditSize(false);
         _loc1_.maxConnections(MIN_CONNECTIONS);
         _loc1_.name(MAIN_LOADER_NAME);
         _loc1_.onChildComplete(this._handleResourceLoaded);
         _loc1_.onChildFail(this._handleFail);
         _loc1_.onError(this._handleFail);
         return _loc1_;
      }
      
      private function _bulkLoaderConfig(param1:String) : LoaderMaxVars
      {
         var _loc2_:LoaderMaxVars = new LoaderMaxVars();
         _loc2_.maxConnections(MIN_CONNECTIONS);
         _loc2_.name(param1);
         _loc2_.skipFailed(true);
         _loc2_.auditSize(false);
         _loc2_.autoLoad(false);
         _loc2_.onChildComplete(this._handleResourceLoaded);
         _loc2_.onChildFail(this._handleFail);
         _loc2_.onError(this._handleFail);
         return _loc2_;
      }
      
      private function _storeResource(param1:String, param2:CacheVO) : void
      {
         var _loc3_:* = MD5.hashBytes(param2.data).substr(0,30) + "00";
         if(param2.hash == _loc3_)
         {
            this._localResources.storeResource(param1,param2);
         }
      }
   }
}

