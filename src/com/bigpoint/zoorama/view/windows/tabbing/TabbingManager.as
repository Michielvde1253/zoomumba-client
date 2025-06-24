package com.bigpoint.zoorama.view.windows.tabbing
{
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.utils.functions.AddBitmapItem;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class TabbingManager
   {
      private var _containerInner:Sprite;
      
      private var _containerOuter:Sprite;
      
      private var isTabbed:int;
      
      private var tabType:String;
      
      private var _tabButtons:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var _tabStatics:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var _tabContents:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var _tabContentsOuter:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var _tabTitles:Vector.<String> = new Vector.<String>();
      
      public function TabbingManager(param1:Sprite, param2:Sprite, param3:int, param4:String, param5:Vector.<String>)
      {
         super();
         this._containerInner = param1;
         this._containerOuter = param2;
         this.isTabbed = param3;
         this.tabType = param4;
         this._tabTitles = param5;
         this.createContentTabs();
      }
      
      public function init() : void
      {
      }
      
      private function createContentTabs() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc8_:Sprite = null;
         var _loc9_:Bitmap = null;
         var _loc10_:Sprite = null;
         var _loc11_:Sprite = null;
         var _loc12_:Sprite = null;
         var _loc13_:Bitmap = null;
         switch(this.tabType)
         {
            case "Mini":
               _loc1_ = 39;
               _loc2_ = 90;
               _loc3_ = 39.5;
               _loc4_ = 4;
               _loc5_ = -2;
               break;
            case "Small":
               _loc1_ = 39;
               _loc2_ = 136;
               _loc3_ = 34;
               _loc4_ = 4;
               _loc5_ = 0;
               break;
            case "Large":
               _loc1_ = 9;
               _loc2_ = 174;
               _loc3_ = 37;
               _loc4_ = 4;
               _loc5_ = 0;
         }
         var _loc6_:int = 0;
         while(_loc6_ < this.isTabbed)
         {
            switch(this.tabType)
            {
               case "Mini":
                  _loc8_ = AddAssetItem.addSpriteToContainer(this._containerInner,AssetConfig.ASSET_TABS_MINI_BUTTON,"components",_loc6_ * _loc2_ + _loc1_,_loc3_);
                  break;
               case "Small":
                  _loc8_ = AddAssetItem.addSpriteToContainer(this._containerInner,AssetConfig.ASSET_TABS_BUTTON,"components",_loc6_ * _loc2_ + _loc1_,_loc3_);
                  break;
               case "Large":
                  _loc8_ = AddAssetItem.addSpriteToContainer(this._containerInner,AssetConfig.ASSET_TABS_BUTTON,"components",_loc6_ * _loc2_ + _loc1_,_loc3_);
                  break;
            }
            _loc8_.name = String(_loc6_);
            _loc8_.addEventListener(MouseEvent.MOUSE_DOWN,this.handleTabClicked);
            this._tabButtons.push(_loc8_);
            _loc9_ = AddBitmapItem.addGradientBitmapToContainer(_loc8_,this._tabTitles[_loc6_],StyleModule.HEADER_16,20,7);
            _loc9_.x = _loc8_.width / 2 - _loc9_.width / 2 - _loc4_;
            _loc6_++;
         }
         AddAssetItem.addSpriteToContainer(this._containerInner,AssetConfig.ASSET_TABS_BAR,"components",0,75);
         var _loc7_:int = 0;
         while(_loc7_ < this.isTabbed)
         {
            switch(this.tabType)
            {
               case "Mini":
                  _loc10_ = AddAssetItem.addSpriteToContainer(this._containerInner,AssetConfig.ASSET_TABS_MINI_STATIC,"components",_loc7_ * _loc2_ + _loc1_,_loc3_);
                  break;
               case "Small":
                  _loc10_ = AddAssetItem.addSpriteToContainer(this._containerInner,AssetConfig.ASSET_TABS_STATIC,"components",_loc7_ * _loc2_ + _loc1_,_loc3_);
                  break;
               case "Large":
                  _loc10_ = AddAssetItem.addSpriteToContainer(this._containerInner,AssetConfig.ASSET_TABS_LARGE_STATIC,"components",_loc7_ * _loc2_ + _loc1_,_loc3_);
            }
            this._containerInner.addChild(_loc10_);
            this._tabStatics.push(_loc10_);
            _loc11_ = new Sprite();
            _loc11_.x = 12;
            _loc11_.y = 70;
            _loc12_ = new Sprite();
            _loc12_.x = 0;
            _loc12_.y = 0;
            if(_loc7_ > 0)
            {
               _loc10_.visible = false;
               _loc11_.visible = false;
               _loc12_.visible = false;
            }
            this._containerInner.addChild(_loc11_);
            this._containerOuter.addChild(_loc12_);
            this._tabContents.push(_loc11_);
            this._tabContentsOuter.push(_loc12_);
            _loc13_ = AddBitmapItem.addNormalBitmapToContainer(_loc10_,this._tabTitles[_loc7_],StyleModule.HEADER_BOLD_16,4004608,20,7);
            _loc13_.x = _loc10_.width / 2 - _loc13_.width / 2 - _loc5_;
            _loc7_++;
         }
      }
      
      private function handleTabClicked(param1:MouseEvent) : void
      {
         this.updateTabView(int(param1.target.name));
      }
      
      public function updateTabView(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._tabStatics.length)
         {
            this._tabStatics[_loc2_].visible = false;
            this._tabContents[_loc2_].visible = false;
            this._tabContentsOuter[_loc2_].visible = false;
            if(param1 == _loc2_)
            {
               this._tabStatics[_loc2_].visible = true;
               this._tabContents[_loc2_].visible = true;
               this._tabContentsOuter[_loc2_].visible = true;
            }
            _loc2_++;
         }
      }
      
      public function get tabcontent() : Vector.<Sprite>
      {
         return this._tabContents;
      }
      
      public function get tabcontentOuter() : Vector.<Sprite>
      {
         return this._tabContentsOuter;
      }
   }
}

