package com.bigpoint.zoomumba.controller.net
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.ResponseName;
   import com.bigpoint.zoomumba.model.app.core.LoadingProcessProxy;
   import com.bigpoint.zoomumba.model.parser.ParserProxy;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ConfigurationParserCommand extends SimpleCommand
   {
      public function ConfigurationParserCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Vector.<String> = null;
         var _loc4_:String = null;
         var _loc5_:LoadingProcessProxy = null;
         if(param1.getBody()[ResponseName.GAME_CONFIGURATION])
         {
            _loc2_ = param1.getBody()[ResponseName.GAME_CONFIGURATION];
            _loc3_ = new Vector.<String>();
            for(_loc4_ in _loc2_)
            {
               if(_loc2_[_loc4_] as Object != null)
               {
                  _loc3_.push(_loc4_);
               }
            }
            (facade.retrieveProxy(ParserProxy.NAME) as ParserProxy).startParseConfigurationData(_loc2_,_loc3_);
         }
         else
         {
            facade.removeCommand(Note.CONFIGURATION_RESPONSE_RECEIVED);
            _loc5_ = facade.retrieveProxy(LoadingProcessProxy.NAME) as LoadingProcessProxy;
            facade.registerMediator(ConfigurationModule.getInstance());
            _loc5_.setGameConfigLoaded();
         }
      }
   }
}

