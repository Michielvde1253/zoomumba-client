package com.bigpoint.zoomumba.view.windows.events.community
{
   import com.bigpoint.utils.DisplayObjectHelper;
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   
   public class CommunityEventProgress extends Group
   {
      private var _982810516movieClipHolder:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _view:MovieClip;
      
      private var _progress:Number = 0;
      
      public function CommunityEventProgress()
      {
         super();
         this.mouseEnabledWhereTransparent = false;
         this.mxmlContent = [this._CommunityEventProgress_SpriteVisualElement1_i()];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this._view)
         {
            this._view.progressMask.height = this._view.height * (1 - this._progress);
            DisplayObjectHelper.addChild(this.movieClipHolder,this._view);
         }
      }
      
      public function get view() : MovieClip
      {
         return this._view;
      }
      
      public function set view(param1:MovieClip) : void
      {
         this._view = param1;
         this.invalidateProperties();
      }
      
      public function get progress() : Number
      {
         return this._progress;
      }
      
      public function set progress(param1:Number) : void
      {
         this._progress = Math.max(0,param1);
         this._progress = Math.min(1,param1);
         this.invalidateProperties();
      }
      
      private function _CommunityEventProgress_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"movieClipHolder");
         this.movieClipHolder = _loc1_;
         BindingManager.executeBindings(this,"movieClipHolder",this.movieClipHolder);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get movieClipHolder() : SpriteVisualElement
      {
         return this._982810516movieClipHolder;
      }
      
      public function set movieClipHolder(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._982810516movieClipHolder;
         if(_loc2_ !== param1)
         {
            this._982810516movieClipHolder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieClipHolder",_loc2_,param1));
            }
         }
      }
   }
}

