package com.bigpoint.zoomumba.view.mainGUI
{
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoorama.data.LocalizationPath;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import custom.mainInterface.ZooMeterPanel;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class ZooMeterMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "ZooMeterMediator";
      
      private var playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      public function ZooMeterMediator(param1:ZooMeterPanel)
      {
         super(NAME,param1);
      }
      
      private function get attraction() : String
      {
         return StringHelper.numberFormater(this.playfieldSettingsProxy.globalPlayfieldsInfo.fieldCurrentAttraction,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
      }
      
      private function get ppPerHour() : String
      {
         return StringHelper.numberFormater(this.playfieldSettingsProxy.getGlobalMoneyPerHour(),TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
      }
      
      private function get tooltip() : String
      {
         return TextResourceModule.getTextReplaced("zoo.tooltip.zoometer.new",Vector.<TextReplace>([new TextReplace("%attraction%",this.attraction),new TextReplace("%moneyMainBuilding%",this.ppPerHour)]));
      }
      
      override public function onRegister() : void
      {
         this.playfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         this.update();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.PLAYFIELD_INFO_SETTINGS_UPDATED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.PLAYFIELD_INFO_SETTINGS_UPDATED:
               this.update();
         }
      }
      
      private function update() : void
      {
         this.content.percentage = this.playfieldSettingsProxy.getGlobalAttractionPercent();
         this.content.firstValue = this.attraction;
         this.content.secondValue = this.ppPerHour;
         this.content.toolTip = this.tooltip;
      }
      
      private function get content() : ZooMeterPanel
      {
         return viewComponent as ZooMeterPanel;
      }
   }
}

