package com.bigpoint.zoomumba.controller.startup
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.resources.CvTagsProxy;
   import com.bigpoint.zoorama.Settings;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ParseCvTagsCommand extends SimpleCommand
   {
      private var _cvList:Object;
      
      public function ParseCvTagsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         this._cvList = param1.getBody();
         if(Settings.isLocal)
         {
            this._parseLocalCvTags();
         }
         else
         {
            this._parseServerCvTags();
         }
      }
      
      private function _parseLocalCvTags() : void
      {
         var _loc1_:URLLoader = new URLLoader();
         _loc1_.addEventListener(Event.COMPLETE,this._handleLocalCvTagsParsed);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,this._handleLocalCvTagsError);
         _loc1_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this._handleLocalCvTagsError);
         _loc1_.load(new URLRequest("./temp_cdn.xml"));
      }
      
      private function _handleLocalCvTagsParsed(param1:Event) : void
      {
         var _loc4_:XML = null;
         var _loc2_:XML = new XML(param1.target.data);
         var _loc3_:CvTagsProxy = facade.retrieveProxy(CvTagsProxy.NAME) as CvTagsProxy;
         for each(_loc4_ in _loc2_.file)
         {
            _loc3_.addCvTag(_loc4_.@fullFileName,_loc4_.@hash);
         }
         param1.target.removeEventListener(Event.COMPLETE,this._handleLocalCvTagsParsed);
         param1.target.removeEventListener(IOErrorEvent.IO_ERROR,this._handleLocalCvTagsError);
         param1.target.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this._handleLocalCvTagsError);
         this._parseServerCvTags();
      }
      
      private function _handleLocalCvTagsError(param1:Event) : void
      {
         param1.target.removeEventListener(Event.COMPLETE,this._handleLocalCvTagsParsed);
         param1.target.removeEventListener(IOErrorEvent.IO_ERROR,this._handleLocalCvTagsError);
         param1.target.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this._handleLocalCvTagsError);
         this._parseServerCvTags();
      }
      
      private function _parseServerCvTags() : void
      {
         var _loc2_:String = null;
         var _loc1_:CvTagsProxy = facade.retrieveProxy(CvTagsProxy.NAME) as CvTagsProxy;
         for(_loc2_ in this._cvList)
         {
            if(this._cvList[_loc2_] is String)
            {
               _loc1_.addCvTag(_loc2_,this._cvList[_loc2_]);
            }
         }
         sendNotification(Note.APP_CV_TAGS_LOADED);
      }
   }
}

