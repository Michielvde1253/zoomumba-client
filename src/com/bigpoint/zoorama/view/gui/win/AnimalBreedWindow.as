package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.notices.gui.window.AnimalBreedSuccessWindowNotice;
   import com.bigpoint.zoorama.notices.gui.window.ItemWindowActionNotice;
   import com.bigpoint.zoorama.notices.gui.window.WindowNotice;
   import com.bigpoint.zoorama.utils.WindowManager;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import com.bigpoint.zoorama.view.gui.btn.SpriteButtonController;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.SizedSmallWindow;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class AnimalBreedWindow extends SizedSmallWindow
   {
      private var buttonStartBreed:Sprite;
      
      private var buttonBuyDirectly:Sprite;
      
      private var labelTime:TextField;
      
      private var labelAmount:TextField;
      
      private var labelNormalBreedCostMoneyCost:Sprite;
      
      private var labelNormalBreedCost:TextField;
      
      private var goldMoneySymbol:Sprite;
      
      private var silverMoneySymbol:Sprite;
      
      public var itemCategory:int;
      
      public var itemUniqueId:int;
      
      public var breedTimeStamp:int;
      
      public var breedTime:int;
      
      private var directBreedReal:int;
      
      private var canDirectBreed:Boolean;
      
      private var canAfford:Boolean = false;
      
      private var breedCostReal:int;
      
      private var breedCostVirtual:int;
      
      private var breedExperience:int;
      
      private var cage:Cage;
      
      private var cagePosition:Point;
      
      public function AnimalBreedWindow(param1:Notifier, param2:int, param3:int, param4:int, param5:int, param6:int, param7:Boolean, param8:int, param9:int, param10:int, param11:Cage, param12:Point, param13:WindowButtonParams = null)
      {
         var _loc14_:String = null;
         _loc14_ = "Animalbreed";
         name = "AnimalbreedWindow";
         modal = true;
         this.itemCategory = param2;
         this.itemUniqueId = param3;
         this.breedTimeStamp = param4;
         this.breedTime = param5;
         this.directBreedReal = param6;
         this.canDirectBreed = param7;
         this.breedCostReal = param8;
         this.breedCostVirtual = param9;
         this.breedExperience = param10;
         this.cage = param11;
         this.cagePosition = param12;
         super(param1,_loc14_,param13);
      }
      
      override public function draw() : void
      {
         halign = Coreponent.ALIGN_H_LEFT;
         valign = Coreponent.ALIGN_V_TOP;
         this.x = 270;
         this.y = 115;
         super.draw();
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         var _loc6_:TextField = null;
         var _loc7_:TextField = null;
         var _loc8_:int = 0;
         var _loc1_:UserProxy = Facade.getInstance().getProxy(UserProxy);
         var _loc2_:Sprite = loadedContent.getChildByName("labelMC_breedInfo") as Sprite;
         if(_loc2_)
         {
            _loc6_ = _loc2_.getChildByName("label") as TextField;
            StyleModule.setTextFieldStyle(_loc6_,StyleModule.HEADER_12);
            _loc6_.text = TextResourceModule.getText("zoo.window.animalbreed.breedtitle");
         }
         var _loc3_:Sprite = loadedContent.getChildByName("labelMC_time") as Sprite;
         if(_loc3_)
         {
            this.labelTime = _loc3_.getChildByName("label") as TextField;
            StyleModule.setTextFieldStyle(this.labelTime,StyleModule.HEADER_12);
         }
         var _loc4_:Sprite = loadedContent.getChildByName("labelMC_instantBaby") as Sprite;
         if(_loc4_)
         {
            _loc7_ = _loc4_.getChildByName("label") as TextField;
            StyleModule.setTextFieldStyle(_loc7_,StyleModule.HEADER_12);
            _loc7_.text = TextResourceModule.getText("zoo.window.animalbreed.babytitle");
         }
         var _loc5_:Sprite = loadedContent.getChildByName("labelMC_amount") as Sprite;
         if(_loc5_)
         {
            this.labelAmount = _loc5_.getChildByName("label") as TextField;
            StyleModule.setTextFieldStyle(this.labelAmount,StyleModule.HEADER_12);
            this.labelAmount.text = this.directBreedReal.toString();
            if(!this.canDirectBreed)
            {
               this.labelAmount.textColor = MainConfig.PRICE_TXT_COLOR_DISABLE;
            }
         }
         this.labelNormalBreedCostMoneyCost = loadedContent.getChildByName("labelMC_cost") as Sprite;
         if(this.labelNormalBreedCostMoneyCost)
         {
            this.labelNormalBreedCost = this.labelNormalBreedCostMoneyCost.getChildByName("label") as TextField;
            _loc8_ = int(this.labelNormalBreedCost.textColor);
            StyleModule.setTextFieldStyle(this.labelNormalBreedCost,StyleModule.HEADER_12);
            this.canAfford = false;
            if(this.breedCostVirtual > 0)
            {
               this.labelNormalBreedCost.text = this.breedCostVirtual.toString();
               if(this.breedCostVirtual <= _loc1_.virtualAmount)
               {
                  this.canAfford = true;
               }
            }
            if(this.canAfford)
            {
               this.labelNormalBreedCost.textColor = _loc8_;
            }
            else
            {
               this.labelNormalBreedCost.textColor = MainConfig.PRICE_TXT_COLOR_DISABLE;
            }
         }
         this.goldMoneySymbol = loadedContent.getChildByName("goldMoneySymbol") as Sprite;
         if(this.goldMoneySymbol)
         {
            if(this.breedCostReal > 0)
            {
               this.goldMoneySymbol.visible = true;
            }
            else
            {
               this.goldMoneySymbol.visible = false;
            }
         }
         this.silverMoneySymbol = loadedContent.getChildByName("silverMoneySymbol") as Sprite;
         if(this.silverMoneySymbol)
         {
            if(this.breedCostVirtual > 0)
            {
               this.silverMoneySymbol.visible = true;
            }
            else
            {
               this.silverMoneySymbol.visible = false;
            }
         }
         this.buttonStartBreed = AddAssetItem.addSpriteToContainer(loadedContent,AssetConfig.COMMONS_SMALL_ST_DARK_BUTTON,"commons",234,163,true);
         new SpriteButtonController(this.buttonStartBreed,true,this.handleStartBreedButtonClick,"zoo.window.animalbreed.button.breedstart",null,true);
         this.buttonBuyDirectly = AddAssetItem.addSpriteToContainer(loadedContent,AssetConfig.COMMONS_SMALL_ST_DARK_BUTTON,"commons",234,274,true);
         new SpriteButtonController(this.buttonBuyDirectly,true,this.handleBuyButtonClick,"zoo.window.animalbreed.button.buydirectly",null,true);
         if(Settings.TUTORIAL_ACTIVE)
         {
            this.buttonStartBreed.visible = false;
         }
         else
         {
            this.buttonStartBreed.visible = true;
         }
         super.assignLoadedContentGUI();
         this.updateBreedTime();
         TimeManager.registerTickFunction(this.updateBreedTime);
      }
      
      private function updateBreedTime() : void
      {
         var _loc1_:int = 0;
         if(this.breedTimeStamp > 0)
         {
            if(this.breedTimeStamp > TimeManager.currentTime)
            {
               this.buttonStartBreed.mouseEnabled = false;
               this.buttonStartBreed.mouseChildren = false;
               this.buttonStartBreed.alpha = 0.5;
               _loc1_ = this.breedTimeStamp - TimeManager.currentTime;
               this.labelTime.text = TimeFormat.secondsToTimeString(_loc1_);
            }
            else
            {
               TimeManager.unregisterTickFunction(this.updateBreedTime);
               WindowManager.getInstance().hideWindow(this);
            }
         }
         else
         {
            this.buttonStartBreed.mouseEnabled = true;
            this.buttonStartBreed.mouseChildren = true;
            this.buttonStartBreed.alpha = 1;
            this.labelTime.text = TimeFormat.secondsToTimeString(this.breedTime);
         }
      }
      
      private function handleBuyButtonClick(param1:Event) : void
      {
         WindowManager.getInstance().hideWindow(this);
         TimeManager.unregisterTickFunction(this.updateBreedTime);
         if(this.canDirectBreed)
         {
            notifier.dispatchNotice(new ItemWindowActionNotice(ItemWindowActionNotice.BUY_INSTANT_BREED,this.itemCategory,this.itemUniqueId));
            notifier.dispatchNotice(new AnimalBreedSuccessWindowNotice(WindowNotice.OPEN_WINDOW,this.cage));
            if(Settings.TUTORIAL_ACTIVE)
            {
               TutorialInjectionManager.getInstance().instantBreed(this.cage.itemId);
            }
         }
         else
         {
            notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.BANK));
         }
      }
      
      private function handleStartBreedButtonClick(param1:Event) : void
      {
         if(this.canAfford)
         {
            notifier.dispatchNotice(new ItemWindowActionNotice(ItemWindowActionNotice.START_BREED,this.itemCategory,this.itemUniqueId));
            this.breedTimeStamp = TimeManager.currentTime + this.breedTime;
            this.updateBreedTime();
         }
         else
         {
            notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.BANK));
         }
         TempGetterProxy.sendNotification(Note.CHECK_CAGE_MENU_AUTOCLOSE,this.itemUniqueId);
      }
      
      override protected function handleCloseWindowClick(param1:MouseEvent) : void
      {
         TimeManager.unregisterTickFunction(this.updateBreedTime);
         super.handleCloseWindowClick(param1);
      }
   }
}

