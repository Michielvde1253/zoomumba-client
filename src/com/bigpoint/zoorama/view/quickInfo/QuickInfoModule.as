package com.bigpoint.zoorama.view.quickInfo
{
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.data.LocalizationPath;
   import com.bigpoint.zoorama.notices.view.quickInfo.QuickInfoNotice;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.greensock.TweenLite;
   import com.greensock.easing.Strong;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   
   public class QuickInfoModule extends Sprite
   {
      protected static const STAR_COUNT:int = 4;
      
      private var starsHolder:Sprite;
      
      private var container:Sprite;
      
      public function QuickInfoModule()
      {
         super();
      }
      
      public function showQuickInfo(param1:QuickInfoNotice) : void
      {
         var _loc4_:String = null;
         this.container = new Sprite();
         this.addChild(this.container);
         setChildIndex(this.container,0);
         var _loc2_:Sprite = AssetLibrary.getSprite("quickInfo","QuickIconSPR");
         this.container.addChild(_loc2_);
         this.container.x = param1.position.x;
         this.container.y = param1.position.y;
         this.starsHolder = new Sprite();
         this.container.addChild(this.starsHolder);
         this.starsHolder.x = 10;
         this.starsHolder.y = -10;
         var _loc3_:TextField = _loc2_["amount_txt"] as TextField;
         if(param1.type == QuickInfoNotice.INCREASE_RESOURCE || param1.type == QuickInfoNotice.INCREASE_CURRENCY)
         {
            _loc3_.textColor = 16762172;
            _loc4_ = "+";
         }
         else if(param1.type == QuickInfoNotice.REDUCE_RESOURCE || param1.type == QuickInfoNotice.REDUCE_CURRENCY)
         {
            _loc3_.textColor = 16746300;
            _loc4_ = "-";
         }
         _loc3_.text = _loc4_ + " " + StringHelper.numberFormater(param1.amount,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         _loc3_.antiAliasType = AntiAliasType.ADVANCED;
         if(param1.type == QuickInfoNotice.INCREASE_RESOURCE || param1.type == QuickInfoNotice.REDUCE_RESOURCE)
         {
            (_loc2_["resourceIcon_mc"] as MovieClip).gotoAndStop("rsrc_" + param1.resourceId);
         }
         else if(param1.type == QuickInfoNotice.INCREASE_CURRENCY || param1.type == QuickInfoNotice.REDUCE_CURRENCY)
         {
            (_loc2_["resourceIcon_mc"] as MovieClip).gotoAndStop("currency_" + param1.resourceId);
            if(param1.resourceId == UserResources.EXPERIENCE)
            {
               this.createStars();
            }
         }
         if(this.container.x - this.container.width + 40 < 0)
         {
            this.container.x = this.container.width - 100;
         }
         else if(this.container.x + 40 > MainConfig.STAGE_WIDTH)
         {
            this.container.x = MainConfig.STAGE_WIDTH - 100;
         }
         if(this.container.y < 150)
         {
            this.container.y = 150;
         }
         TweenLite.to(this.container,2,{
            "y":this.container.y - 100,
            "ease":Strong.easeOut,
            "onComplete":this.handleItemVanish,
            "onCompleteParams":[this.container]
         });
      }
      
      private function createStars() : void
      {
         GUITemplates.createStars(this.starsHolder,STAR_COUNT);
      }
      
      private function handleItemVanish(param1:Sprite) : void
      {
         TweenLite.to(param1,1,{
            "scaleX":2,
            "scaleY":2,
            "alpha":0,
            "ease":Strong.easeOut,
            "onComplete":this.handleItemRemove,
            "onCompleteParams":[param1]
         });
      }
      
      private function handleItemRemove(param1:Sprite) : void
      {
         this.removeChild(param1);
      }
   }
}

