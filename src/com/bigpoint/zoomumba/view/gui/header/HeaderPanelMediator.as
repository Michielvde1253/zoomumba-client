package com.bigpoint.zoomumba.view.gui.header
{
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.zoomumba.constants.ADMIN;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.features.recycling.RecyclingProxy;
   import com.bigpoint.zoomumba.model.gameConfig.MainConfigProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.admin.CageIdDebugMediator;
   import com.bigpoint.zoomumba.view.admin.CommandSendWindowMediator;
   import com.bigpoint.zoomumba.view.admin.NetDebuggerWindowMediator;
   import com.bigpoint.zoomumba.view.admin.components.CageId;
   import com.bigpoint.zoomumba.view.app.ApplicationMediator;
   import com.bigpoint.zoomumba.view.mainGUI.ZooMeterMediator;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.data.LocalizationPath;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenLite;
   import com.greensock.easing.*;
   import custom.mainInterface.ExperiencePanel;
   import custom.mainInterface.MoneyPanel;
   import custom.mainInterface.UsernamePanel;
   import custom.mainInterface.ZooMeterPanel;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.system.System;
   import mx.controls.Button;
   import mx.core.Application;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import spark.components.Group;
   
   public class HeaderPanelMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "HeaderPanelMediator";
      
      private var userProxy:UserProxy;
      
      private var currencyProxy:CurrencyProxy;
      
      private var recyclingProxy:RecyclingProxy;
      
      private var collectableProxy:CollectablesProxy;
      
      private var mainConfigProxy:MainConfigProxy;
      
      private var playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      private var normalCurrencies:MoneyPanel;
      
      private var specialCurrencies:MoneyPanel;
      
      private var experiencePanel:ExperiencePanel;
      
      private var usernamePanel:UsernamePanel;
      
      private var zooMeterMediator:ZooMeterMediator;
      
      private var zooMeterView:Group;
      
      private var adamLayer:Group;
      
      private var minimized:Boolean = false;
      
      public function HeaderPanelMediator(param1:Group)
      {
         super(NAME,param1);
         this.content.mouseChildren = true;
         this.content.mouseEnabled = false;
      }
      
      override public function onRegister() : void
      {
         this.mainConfigProxy = facade.retrieveProxy(MainConfigProxy.NAME) as MainConfigProxy;
         this.userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         this.currencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         this.collectableProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         this.recyclingProxy = facade.retrieveProxy(RecyclingProxy.NAME) as RecyclingProxy;
         this.playfieldSettingsProxy = facade.retrieveProxy(PlayfieldSettingsProxy.NAME) as PlayfieldSettingsProxy;
         this.normalCurrencies = new MoneyPanel();
         this.normalCurrencies.top = 7;
         this.normalCurrencies.addEventListener(MouseEvent.CLICK,this.handleVirtualMoneyClick);
         this.normalCurrencies.toolTip = TextResourceModule.getText("zoo.tooltip.hud.money");
         this.content.addElement(this.normalCurrencies);
         this.specialCurrencies = new MoneyPanel();
         if(!this.isOcean)
         {
            this.specialCurrencies.currentState = "special";
            this.specialCurrencies.toolTip = TextResourceModule.getText("zoo.tooltip.hud.specialCurrency");
         }
         else
         {
            this.specialCurrencies.currentState = "ocean";
            this.specialCurrencies.toolTip = TextResourceModule.getText("zoo.tooltip.hud.specialOceanCurrency");
         }
         this.specialCurrencies.left = 155;
         this.specialCurrencies.top = 7;
         this.specialCurrencies.addEventListener(MouseEvent.CLICK,this.handleRealMoneyClick);
         this.content.addElement(this.specialCurrencies);
         this.zooMeterMediator = new ZooMeterMediator(new ZooMeterPanel());
         this.zooMeterView = this.zooMeterMediator.getViewComponent() as Group;
         this.zooMeterView.right = 170;
         this.zooMeterView.top = 7;
         this.content.addElement(this.zooMeterView);
         facade.registerMediator(this.zooMeterMediator);
         this.experiencePanel = new ExperiencePanel();
         this.experiencePanel.right = -17;
         this.content.addElement(this.experiencePanel);
         this.usernamePanel = new UsernamePanel();
         this.usernamePanel.horizontalCenter = 0;
         this.usernamePanel.buttonMode = true;
         this.usernamePanel.toolTip = TextResourceModule.getText("zoo.tooltip.mainpanel.userdata");
         this.usernamePanel.addEventListener(MouseEvent.CLICK,this.handleCopyUsernameToClipboard);
         this.content.addElement(this.usernamePanel);
         this.updateHudValue();
         var _loc1_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         if(_loc1_.enable_alcon)
         {
            this.admin();
         }
      }
      
      private function get isOcean() : Boolean
      {
         return this.playfieldSettingsProxy.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO && !this.playfieldSettingsProxy.managmentCenterActive;
      }
      
      override public function onRemove() : void
      {
         this.normalCurrencies.removeEventListener(MouseEvent.CLICK,this.handleVirtualMoneyClick);
         this.specialCurrencies.removeEventListener(MouseEvent.CLICK,this.handleRealMoneyClick);
         this.usernamePanel.removeEventListener(MouseEvent.CLICK,this.handleCopyUsernameToClipboard);
      }
      
      private function handleCopyUsernameToClipboard(param1:MouseEvent) : void
      {
         System.setClipboard(this.usernamePanel.dataText);
      }
      
      private function updateUserPanel() : void
      {
         this.usernamePanel.userPanelData = TextResourceModule.getText("zoo.user.name") + ": " + this.userProxy.userName + "       " + TextResourceModule.getText("zoo.user.id") + ": " + String(this.userProxy.userId);
      }
      
      private function handleVirtualMoneyMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainbutton.petpenny"),false);
      }
      
      private function handleRealMoneyMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainbutton.zoodollar"),false);
      }
      
      private function handleExperiencePanelMouseOver(param1:MouseEvent) : void
      {
         var _loc2_:String = TextResourceModule.getText("zoo.tooltip.mainpanel.level");
         var _loc3_:String = "";
         var _loc4_:int = this.currencyProxy.experience;
         var _loc5_:int = ConfigurationModule.getInstance().getNextHighestXPLevel(_loc4_);
         var _loc6_:int = _loc5_ - _loc4_;
         if(_loc6_ < 0)
         {
            _loc6_ = 0;
         }
         var _loc7_:String = StringHelper.numberFormater(_loc6_,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         if(int(_loc7_) > 0 || _loc5_ != -1)
         {
            _loc3_ = _loc2_.split("%xp").join(_loc7_);
         }
         TooltipNewManager.setToolTip(param1.target as DisplayObject,_loc3_,false);
      }
      
      private function handleMouseOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      private function handleVirtualMoneyClick(param1:MouseEvent) : void
      {
         sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
      }
      
      private function handleRealMoneyClick(param1:MouseEvent) : void
      {
         if(this.isOcean)
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.SPECIAL_CURRENCIES_OCEAN_WORLD_WINDOW));
         }
         else
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.SPECIAL_CURRENCIES_WINDOW));
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.APP_RESIZED,Note.USER_DATA_UPDATED,DataNote.REAL_MONEY_UPDATED,DataNote.VIRTUAL_MONEY_UPDATED,DataNote.USER_LEVEL,DataNote.EXPERIENCE_UPDATED,DataNote.USER_NAME,DataNote.USER_ID,DataNote.PET_POWNS_UPDATED,DataNote.PEARLS_UPDATED,GUINote.MINIMIZE_TOGGLE_HEADER_UI,Note.RESOURCES_UPDATED,DataNote.COLLECTABLE_UPDATED,SHOP.REFRESH_ASSISTANTS,Note.MOVE_TO_MANAGMENT_CENTER];
      }
      
      private function updateHudValue() : void
      {
         this.normalCurrencies.firstValue = StringHelper.numberFormater(this.currencyProxy.realMoney,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         this.normalCurrencies.secondValue = StringHelper.numberFormater(this.currencyProxy.virtualMoney,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         if(this.isOcean)
         {
            this.specialCurrencies.firstValue = StringHelper.numberFormater(this.currencyProxy.pearls,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         }
         else
         {
            this.specialCurrencies.firstValue = StringHelper.numberFormater(this.currencyProxy.petPowns,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         }
         this.specialCurrencies.secondValue = StringHelper.numberFormater(this.recyclingProxy.trashAmount,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         this.setUserExperience();
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Application = null;
         switch(param1.getName())
         {
            case Note.APP_RESIZED:
               _loc2_ = param1.getBody() as Application;
               this.content.width = _loc2_.width;
               this.content.height = _loc2_.height;
               this.handleAppResize();
               break;
            case DataNote.REAL_MONEY_UPDATED:
            case DataNote.VIRTUAL_MONEY_UPDATED:
            case DataNote.PET_POWNS_UPDATED:
            case DataNote.PEARLS_UPDATED:
            case DataNote.COLLECTABLE_UPDATED:
            case Note.RESOURCES_UPDATED:
            case Note.USER_DATA_UPDATED:
               this.updateHudValue();
               break;
            case DataNote.USER_LEVEL:
               this.experiencePanel.level = this.userProxy.userLevel.toString();
               break;
            case DataNote.EXPERIENCE_UPDATED:
               this.setUserExperience();
               break;
            case DataNote.USER_NAME:
               this.updateUserPanel();
               break;
            case DataNote.USER_ID:
               this.updateUserPanel();
               break;
            case GUINote.MINIMIZE_TOGGLE_HEADER_UI:
               this.toggleMinimizedState();
               break;
            case SHOP.REFRESH_ASSISTANTS:
               this.switchPlayField(this.playfieldSettingsProxy.activePlayfieldType);
               break;
            case Note.MOVE_TO_MANAGMENT_CENTER:
               this.setManagmentCenterIcons();
         }
      }
      
      private function toggleMinimizedState() : void
      {
         TweenLite.killTweensOf(this.content);
         if(!this.minimized)
         {
            TweenLite.to(this.content,1,{"top":-200});
            this.minimized = true;
            sendNotification(GUINote.MINIMIZED_HEADER_MENU_UI);
         }
         else
         {
            TweenLite.to(this.content,1,{"top":0});
            this.minimized = false;
            sendNotification(GUINote.MAXIMIZED_HEADER_MENU_UI);
         }
      }
      
      private function switchPlayField(param1:int = 0) : void
      {
         if(this.isOcean)
         {
            this.specialCurrencies.currentState = "ocean";
            this.specialCurrencies.firstValue = StringHelper.numberFormater(this.currencyProxy.pearls,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
            this.specialCurrencies.toolTip = TextResourceModule.getText("zoo.tooltip.hud.specialOceanCurrency");
         }
         else
         {
            this.specialCurrencies.currentState = "special";
            this.specialCurrencies.firstValue = StringHelper.numberFormater(this.currencyProxy.petPowns,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
            this.specialCurrencies.toolTip = TextResourceModule.getText("zoo.tooltip.hud.specialCurrency");
         }
      }
      
      private function setManagmentCenterIcons() : void
      {
         this.specialCurrencies.currentState = "special";
         this.specialCurrencies.firstValue = StringHelper.numberFormater(this.currencyProxy.petPowns,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         this.specialCurrencies.toolTip = TextResourceModule.getText("zoo.tooltip.hud.specialCurrency");
         this.normalCurrencies.firstValue = StringHelper.numberFormater(this.currencyProxy.realMoney,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         this.normalCurrencies.secondValue = StringHelper.numberFormater(this.currencyProxy.virtualMoney,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         this.setUserExperience();
      }
      
      private function handleAppResize() : void
      {
         var _loc1_:ApplicationMediator = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         if(_loc1_.STAGE_WIDTH != MainConfig.STAGE_DEFALT_WIDTH || _loc1_.STAGE_HEIGHT != MainConfig.STAGE_DEFALT_HEIGHT)
         {
            this.usernamePanel.showBackground();
         }
         else
         {
            this.usernamePanel.hideBackground();
         }
         if(_loc1_.STAGE_WIDTH < MainConfig.STAGE_DEFALT_WIDTH)
         {
            this.usernamePanel.horizontalCenter = 0;
            this.normalCurrencies.top = 20;
            this.specialCurrencies.top = 20;
            this.zooMeterView.top = 20;
            this.experiencePanel.top = 16;
         }
         else
         {
            this.usernamePanel.horizontalCenter = 0;
            this.normalCurrencies.top = 7;
            this.specialCurrencies.top = 7;
            this.zooMeterView.top = 7;
            this.experiencePanel.top = 0;
         }
         if(this.adamLayer)
         {
            this.adamLayer.width = _loc1_.STAGE_WIDTH;
            this.adamLayer.height = _loc1_.STAGE_HEIGHT;
         }
      }
      
      public function addAdamLayer(param1:Group) : void
      {
         this.adamLayer = param1;
         this.content.addElement(this.adamLayer);
         this.adamLayer.width = this.content.width;
         this.adamLayer.height = this.content.height;
      }
      
      private function checktutorialLVLup() : void
      {
         var _loc1_:Number = this.mainConfigProxy.getExperience(this.userProxy.userLevel);
         var _loc2_:int = _loc1_ - this.currencyProxy.experience;
         if(_loc2_ < 0)
         {
            this.userProxy.userLevel += 1;
            this.experiencePanel.level = this.userProxy.userLevel.toString();
            this.checktutorialLVLup();
         }
      }
      
      private function setUserExperience() : void
      {
         if((facade.getProxy(AppConfigProxy) as AppConfigProxy).tutorial_active)
         {
            this.checktutorialLVLup();
         }
         var _loc1_:Number = this.mainConfigProxy.getExperience(this.userProxy.userLevel - 1);
         var _loc2_:Number = this.mainConfigProxy.getExperience(this.userProxy.userLevel);
         var _loc3_:String = StringHelper.numberFormater(this.currencyProxy.experience,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         var _loc4_:String = StringHelper.numberFormater(_loc2_,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         var _loc5_:int = _loc2_ - this.currencyProxy.experience;
         if(_loc5_ < 0)
         {
            _loc5_ = 0;
         }
         var _loc6_:String = StringHelper.numberFormater(_loc5_,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         this.experiencePanel.xp = _loc6_;
         this.experiencePanel.percent = (this.currencyProxy.experience - _loc1_) / (_loc2_ - _loc1_);
         this.experiencePanel.toolTip = TextResourceModule.getTextReplaced("zoo.tooltip.hud.xp",Vector.<TextReplace>([new TextReplace("%nextXp%",_loc4_),new TextReplace("%xp%",_loc6_),new TextReplace("%currentxp%",_loc3_)]));
      }
      
      private function get content() : Group
      {
         return this.getViewComponent() as Group;
      }
      
      private function admin() : void
      {
         var flushButton:Button;
         var sendCommand:Button;
         var clearLocalStorageButton:Button;
         var cageId:CageId;
         var openWindowButton:Button = new Button();
         this.content.addElement(openWindowButton);
         openWindowButton.label = "single";
         openWindowButton.x = 580;
         openWindowButton.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
         });
         openWindowButton = new Button();
         this.content.addElement(openWindowButton);
         openWindowButton.label = "multi";
         openWindowButton.x = 650;
         openWindowButton.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
         });
         flushButton = new Button();
         this.content.addElement(flushButton);
         flushButton.label = "net debugger";
         flushButton.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            sendNotification(ADMIN.TOGGLE_NET_DEBUGGER);
         });
         sendCommand = new Button();
         this.content.addElement(sendCommand);
         sendCommand.label = "commands";
         sendCommand.x = 150;
         sendCommand.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            sendNotification(ADMIN.TOGGLE_COMMAND_SEND);
         });
         clearLocalStorageButton = new Button();
         clearLocalStorageButton.x = 400;
         clearLocalStorageButton.label = "Clear local storage cache";
         clearLocalStorageButton.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            sendNotification(Note.CLEAR_LOCAL_STORAGE);
         });
         this.content.addElement(clearLocalStorageButton);
         cageId = new CageId();
         this.content.addElement(cageId);
         cageId.x = 250;
         facade.registerMediator(new NetDebuggerWindowMediator());
         facade.registerMediator(new CommandSendWindowMediator());
         facade.registerMediator(new CageIdDebugMediator(cageId));
      }
   }
}

