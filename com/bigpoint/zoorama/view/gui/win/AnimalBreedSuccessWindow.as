package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.app.gameEvents.UserResourcesProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.ActionType;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.data.LocalizationPath;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.notices.gui.window.AnimalBreedSuccessWindowNotice;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import com.bigpoint.zoorama.view.gui.win.generics.MessageWindow;
   import flash.display.Sprite;
   import flash.text.TextField;
   
   public class AnimalBreedSuccessWindow extends MessageWindow
   {
      private var notice:AnimalBreedSuccessWindowNotice;
      
      public function AnimalBreedSuccessWindow(param1:Notifier, param2:String, param3:String, param4:AnimalBreedSuccessWindowNotice, param5:WindowButtonParams = null)
      {
         this.notice = param4;
         super(param1,param2,param3,param5);
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         contentURL = "AnimalbreedSuccess";
         name = OldWindowTypes.ANIMALBREED_SUCCESS.toString();
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         var _loc4_:UserResourcesProxy = null;
         var _loc5_:int = 0;
         var _loc1_:TextField = loadedContent.getChildByName("TF_EXPERIENCE") as TextField;
         var _loc2_:Sprite = loadedContent.getChildByName("xpSymbol") as Sprite;
         GUITemplates.createStars(_loc2_,4,40,30,13,13);
         var _loc3_:Cage = this.notice.cage;
         if(_loc3_)
         {
            _loc4_ = TempGetterProxy.getuserResourceProxy();
            _loc5_ = _loc4_.getItemCalculatedXP(_loc3_,ActionType.BREED);
            _loc1_.text = StringHelper.numberFormater(_loc5_,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         }
         super.assignLoadedContentGUI();
      }
   }
}

