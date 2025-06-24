package com.bigpoint.zoomumba.controller.startup
{
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.controller.features.cheat.AntiCheatProxy;
   import com.bigpoint.zoomumba.controller.game.GameProxy;
   import com.bigpoint.zoomumba.model.advBreed.GenusConfigProxy;
   import com.bigpoint.zoomumba.model.app.cageUpgrades.CageUpgradeProxy;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.UserResourcesProxy;
   import com.bigpoint.zoomumba.model.app.resources.CvTagsProxy;
   import com.bigpoint.zoomumba.model.app.resources.PreloadResourcesProxy;
   import com.bigpoint.zoomumba.model.app.resources.ResourceLoaderProxy;
   import com.bigpoint.zoomumba.model.app.settings.AIDProxy;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.app.settings.AppSettingsProxy;
   import com.bigpoint.zoomumba.model.app.settings.vo.FlashParamObjectVO;
   import com.bigpoint.zoomumba.model.core.cookies.AppCookieProxy;
   import com.bigpoint.zoomumba.model.events.babyEvent.BabyEventProxy;
   import com.bigpoint.zoomumba.model.events.xmas.XmasProxy;
   import com.bigpoint.zoomumba.model.features.achievements.AchievementProxy;
   import com.bigpoint.zoomumba.model.features.adamPenguin.AdamProxy;
   import com.bigpoint.zoomumba.model.features.avatar.AvatarGeneratorProxy;
   import com.bigpoint.zoomumba.model.features.avatar.AvatarProxy;
   import com.bigpoint.zoomumba.model.features.babyCaravan.BabyCaravanProxy;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.features.counter.CounterValuesProxy;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingChooseProxy;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingProxy;
   import com.bigpoint.zoomumba.model.features.fortuneWheel.FortuneWheelProxy;
   import com.bigpoint.zoomumba.model.features.gifts.GiftsProxy;
   import com.bigpoint.zoomumba.model.features.itemDrops.ItemDropProxy;
   import com.bigpoint.zoomumba.model.features.powerup.PowerupProxy;
   import com.bigpoint.zoomumba.model.features.ranknig.RanknigProxy;
   import com.bigpoint.zoomumba.model.features.safari.SafariProxy;
   import com.bigpoint.zoomumba.model.features.valenties.ValentinesProxy;
   import com.bigpoint.zoomumba.model.gameConfig.PremiumPackConfigProxy;
   import com.bigpoint.zoomumba.model.gui.particles.ParticlesProxy;
   import com.bigpoint.zoomumba.model.instantDrag.InstantDragProxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.managmentCenter.ManagmentCenterProxy;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.news.NewsProxy;
   import com.bigpoint.zoomumba.model.parser.ParserProxy;
   import com.bigpoint.zoomumba.model.payment.PaymentUrlProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.shop.ShopProxy;
   import com.bigpoint.zoomumba.model.user.assistances.AssistancesProxy;
   import com.bigpoint.zoomumba.model.user.contactList.FriendsProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.events.UserEventProxy;
   import com.bigpoint.zoomumba.model.user.material.MaterialProxy;
   import com.bigpoint.zoomumba.model.user.messageSystem.UserMessagesProxy;
   import com.bigpoint.zoomumba.model.user.quests.QuestsProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.model.user.snapShot.SnapShotProxy;
   import com.bigpoint.zoomumba.model.visitorWishes.VisitorWishesProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowSystemProxy;
   import com.bigpoint.zoomumba.model.windows.ranking.RanknigWindowProxy;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoomumba.view.app.ApplicationMediator;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import mx.core.Application;
   import org.puremvc.as3.interfaces.ICommand;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class StartupCommand extends SimpleCommand implements ICommand
   {
      public function StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new AntiCheatProxy());
         facade.registerProxy(new GameProxy());
         facade.registerProxy(new PaymentUrlProxy());
         facade.registerProxy(new AppProxy());
         facade.registerProxy(new CurrencyProxy());
         facade.registerProxy(new QuestsProxy());
         facade.registerProxy(new AppConfigProxy());
         facade.registerProxy(new PremiumPackConfigProxy());
         facade.registerProxy(new NetProxy());
         facade.registerProxy(new PlayfieldSettingsProxy());
         facade.registerProxy(new PlayFieldProxy());
         facade.registerProxy(new UserProxy());
         facade.registerProxy(new CvTagsProxy());
         facade.registerProxy(new ResourceLoaderProxy());
         facade.registerProxy(new PreloadResourcesProxy());
         facade.registerProxy(new AIDProxy());
         facade.registerProxy(new CounterValuesProxy());
         facade.registerProxy(new ValentinesProxy());
         facade.registerProxy(new FriendsProxy());
         facade.registerProxy(new CageUpgradeProxy());
         facade.registerProxy(new SafariProxy());
         facade.registerProxy(new BabyEventProxy());
         facade.registerProxy(new GlobalEventProxy());
         facade.registerProxy(new UserMessagesProxy());
         facade.registerProxy(new BabyCaravanProxy());
         facade.registerProxy(new XmasProxy());
         facade.registerProxy(new AppCookieProxy());
         facade.registerProxy(new ShopProxy());
         facade.registerProxy(new InventoryProxy());
         facade.registerProxy(new ManagmentCenterProxy());
         facade.registerProxy(new AvatarGeneratorProxy());
         facade.registerProxy(new AvatarProxy());
         facade.registerProxy(new AppSettingsProxy());
         facade.registerProxy(new NetHelperProxy());
         facade.registerProxy(new AdamProxy());
         facade.registerProxy(new ResourcesProxy());
         facade.registerProxy(new MaterialProxy());
         facade.registerProxy(new SnapShotProxy());
         facade.registerProxy(new AssistancesProxy());
         facade.registerProxy(new FortuneWheelProxy());
         facade.registerProxy(new ItemDropProxy());
         facade.registerProxy(new GiftsProxy());
         facade.registerProxy(new TempGetterProxy());
         facade.registerProxy(new WindowSystemProxy());
         facade.registerProxy(new VisitorWishesProxy());
         facade.registerProxy(new CollectablesProxy());
         facade.registerProxy(new ParticlesProxy());
         facade.registerProxy(new PowerupProxy());
         facade.registerProxy(new UserEventProxy());
         facade.registerProxy(new UserResourcesProxy());
         facade.registerProxy(new RanknigProxy());
         facade.registerProxy(new RanknigWindowProxy());
         facade.registerProxy(new AchievementProxy());
         facade.registerProxy(new NewsProxy());
         facade.registerProxy(new GenusConfigProxy());
         facade.registerProxy(new InstantDragProxy());
         facade.registerProxy(new ParserProxy());
         facade.registerProxy(new CraftingChooseProxy());
         facade.registerProxy(new CraftingProxy());
         facade.registerProxy(new Settings());
         facade.registerProxy(new MainConfig());
         var _loc2_:Application = param1.getBody() as Application;
         facade.registerMediator(new ApplicationMediator(_loc2_));
         var _loc3_:FlashParamObjectVO = new FlashParamObjectVO();
         _loc3_.loaderParams = _loc2_.stage.loaderInfo.parameters;
         _loc3_.loaderUrl = _loc2_.stage.loaderInfo.url;
         sendNotification(Note.INIT_SETTING_COMMAND,_loc3_);
         sendNotification(Note.PRELOAD,_loc3_);
         var _loc4_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         if(_loc4_.tutorial_active)
         {
            sendNotification(Note.CHANGE_APP_MODE,AppMode.TUTORIAL);
         }
         else
         {
            sendNotification(Note.CHANGE_APP_MODE,AppMode.NORMAL);
         }
      }
   }
}

