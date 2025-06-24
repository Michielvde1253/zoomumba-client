package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.data.LocalizationPath;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.notices.gui.window.ItemWindowActionNotice;
   import com.bigpoint.zoorama.notices.gui.window.WindowNotice;
   import com.bigpoint.zoorama.utils.WindowManager;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.btn.SpriteButtonController;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.SizedSmallWindow;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class ConstructionWindow extends SizedSmallWindow
   {
      private var labelTime:TextField;
      
      private var labelAmount:TextField;
      
      private var buttonBuyDirectly:Sprite;
      
      public var itemCategory:int;
      
      public var itemUniqueId:int;
      
      public var buildTimeStamp:int;
      
      public var buildTime:int;
      
      private var directBuildReal:int;
      
      private var canAfford:Boolean;
      
      public function ConstructionWindow(param1:Notifier, param2:int, param3:int, param4:int, param5:int, param6:int, param7:WindowButtonParams = null)
      {
         var _loc8_:String = "Construction";
         name = OldWindowTypes.CONSTRUCTION.toString();
         modal = true;
         this.itemCategory = param2;
         this.itemUniqueId = param3;
         this.buildTimeStamp = param4;
         this.buildTime = param5;
         this.directBuildReal = param6;
         super(param1,_loc8_,param7);
      }
      
      override public function draw() : void
      {
         halign = Coreponent.ALIGN_H_LEFT;
         valign = Coreponent.ALIGN_V_TOP;
         this.x = 300;
         this.y = 115;
         super.draw();
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         var _loc1_:UserProxy = Facade.getInstance().getProxy(UserProxy);
         this.canAfford = _loc1_.realAmount >= this.directBuildReal;
         var _loc2_:Sprite = loadedContent.getChildByName("labelMC_time") as Sprite;
         if(_loc2_)
         {
            this.labelTime = _loc2_.getChildByName("label") as TextField;
            StyleModule.setTextFieldStyle(this.labelTime,StyleModule.HEADER_12);
            this.updateBuildTime();
         }
         var _loc3_:Sprite = loadedContent.getChildByName("labelMC_amount") as Sprite;
         if(_loc3_)
         {
            this.labelAmount = _loc3_.getChildByName("label") as TextField;
            StyleModule.setTextFieldStyle(this.labelAmount,StyleModule.HEADER_12);
            if(!this.canAfford)
            {
               this.labelAmount.textColor = MainConfig.PRICE_TXT_COLOR_DISABLE;
            }
            this.labelAmount.text = StringHelper.numberFormater(this.directBuildReal,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         }
         var _loc4_:Sprite = AddAssetItem.addSpriteToContainer(this,AssetConfig.COMMONS_SMALL_ST_DARK_BUTTON,"commons",238,264,true);
         new SpriteButtonController(_loc4_,true,this.handleBuyButtonClick,"zoo.window.construction.button.buydirectly",null,true);
         super.assignLoadedContentGUI();
         TimeManager.registerTickFunction(this.updateBuildTime);
      }
      
      private function updateBuildTime() : void
      {
         var _loc1_:int = this.buildTimeStamp - TimeManager.currentTime;
         if(_loc1_ > 0)
         {
            this.labelTime.text = TimeFormat.secondsToTimeString(_loc1_);
         }
         else
         {
            WindowManager.getInstance().hideWindow(this);
            TimeManager.unregisterTickFunction(this.updateBuildTime);
         }
      }
      
      private function handleBuyButtonClick(param1:MouseEvent) : void
      {
         WindowManager.getInstance().hideWindow(this);
         TimeManager.unregisterTickFunction(this.updateBuildTime);
         if(this.canAfford)
         {
            notifier.dispatchNotice(new ItemWindowActionNotice(ItemWindowActionNotice.BUY_INSTANT_BUILD,this.itemCategory,this.itemUniqueId));
         }
         else
         {
            notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.BANK));
         }
      }
      
      override protected function handleCloseWindowClick(param1:MouseEvent) : void
      {
         TimeManager.unregisterTickFunction(this.updateBuildTime);
         super.handleCloseWindowClick(param1);
      }
   }
}

