package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.ColorHelper;
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.notices.gui.window.WindowNotice;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.components.scrollbar.ScollingComponent;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.objects.createTextFieldItem;
   import com.bigpoint.zoorama.view.windows.WindowAbstract;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class WindowStorageCapacity extends WindowAbstract
   {
      private var notice:WindowNotice;
      
      private var notifier:Notifier;
      
      private var scrollbar:ScollingComponent;
      
      private var mainText:TextField;
      
      private var mainTitle:TextField;
      
      private var barWater:Sprite;
      
      private var barFood:Sprite;
      
      private var infoMark:Sprite;
      
      public function WindowStorageCapacity(param1:WindowNotice, param2:Notifier)
      {
         super();
         this._isPrimary = true;
         this.notice = param1;
         this.notifier = new Notifier(param2);
      }
      
      override public function startWindow() : void
      {
         super.offsetY = 30;
         super.setWindowPosition();
         this.setInnerContent();
         this.setOuterContent();
      }
      
      override public function setOuterContent() : void
      {
         this.infoMark = AddAssetItem.addSpriteToContainer(super.outer,"InfoSPR",AssetConfig.WINDOW_HEADERS,60,-5);
         this.infoMark["$right"].width = 450;
      }
      
      override public function setInnerContent() : void
      {
         this.mainTitle = createTextFieldItem.createNewTextField(115,15,520,20,true,true,"tf",TextFieldType.DYNAMIC,StyleModule.HEADER_BOLD_20_CENTER,MainConfig.PRICE_TXT_COLOR_ENABLE_BROWN,super.inner,false);
         this.mainText = createTextFieldItem.createNewTextField(170,75,400,100,true,true,"tf",TextFieldType.DYNAMIC,StyleModule.HEADER_BOLD_11,MainConfig.PRICE_TXT_COLOR_ENABLE_BROWN,super.inner,false);
         this.scrollbar = new ScollingComponent(530,85,this.mainText,100,100,4);
         super.inner.addChild(this.scrollbar);
         AssetLibrary.sendAssetToFunction(AssetConfig.ASSET_STORAGE_WINDOW,this.handleAssets);
      }
      
      private function handleAssets(param1:SWFAsset) : void
      {
         this.barWater = param1.getEmbededSprite("Bar");
         this.barWater.x = 330;
         this.barWater.y = 180;
         this.barWater["$type"].gotoAndStop(1);
         var _loc2_:Bitmap = GUITemplates.createMaskedGradientTextfield(TextResourceModule.getText("zoo.storage.capacity.water"),StyleModule.HEADER_BOLD_14);
         _loc2_.x = -_loc2_.width / 2;
         _loc2_.y = 20;
         this.barWater.addChild(_loc2_);
         super.inner.addChild(this.barWater);
         this.barFood = param1.getEmbededSprite("Bar");
         this.barFood.x = 330;
         this.barFood.y = 320;
         this.barFood["$type"].gotoAndStop(2);
         var _loc3_:Bitmap = GUITemplates.createMaskedGradientTextfield(TextResourceModule.getText("zoo.storage.capacity.food"),StyleModule.HEADER_BOLD_14);
         _loc3_.x = -_loc3_.width / 2;
         _loc3_.y = 20;
         this.barFood.addChild(_loc3_);
         super.inner.addChild(this.barFood);
      }
      
      public function updateData() : void
      {
         this.mainTitle.text = TextResourceModule.getText("zoo.storage.capacity.title");
         this.mainText.htmlText = TextResourceModule.getText("zoo.storage.capacity.text");
         GUITemplates.redrawText(this.mainTitle,this.mainText);
         this.scrollbar.updateScroller();
         this.updateInfoForId(this.barWater["$storage1"],MainConstants.STORAGE_WATERBARREL);
         this.updateInfoForId(this.barWater["$storage2"],MainConstants.STORAGE_WATERTTANK);
         this.updateInfoForId(this.barWater["$storage3"],MainConstants.STORAGE_CISTERN);
         this.updateInfoForId(this.barFood["$storage1"],MainConstants.STORAGE_FOODCRATES);
         this.updateInfoForId(this.barFood["$storage2"],MainConstants.STORAGE_STOREHOUSE);
         this.updateInfoForId(this.barFood["$storage3"],MainConstants.STORAGE_CELLAR);
         this.updateBarForId(this.barWater,1);
         this.updateBarForId(this.barFood,2);
      }
      
      private function updateBarForId(param1:Sprite, param2:int) : void
      {
         var _loc3_:Number = ConfigurationModule.getInstance().resourcesCap;
         var _loc4_:Number = Math.min(TempGetterProxy.getMaxResourceCount(param2),_loc3_);
         var _loc5_:int = int(_loc4_ / _loc3_ * 100);
         param1["$bar"].gotoAndStop(_loc5_ + 10);
         param1["$currentContainer"]["$text"]["$textField"]["text"] = _loc4_.toString();
      }
      
      private function updateInfoForId(param1:MovieClip, param2:int) : void
      {
         var _loc3_:PlayFieldProxy = Facade.getInstance().retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc4_:int = _loc3_.getItemCount(Categories.STORAGE,-1,false,param2);
         param1["$container"].gotoAndStop(param2 - 2000);
         if(_loc4_ <= 0)
         {
            ColorHelper.applyColor(param1["$container"],ColorHelper.GRAYSCALE_LIGHT);
         }
         else
         {
            ColorHelper.removeColor(param1["$container"]);
         }
         param1["$textContainer"]["$text"]["$textField"]["text"] = _loc4_.toString();
      }
   }
}

