package custom.mainInterface.genericUI
{
   import buttons.customButtons.CustomizableCircularButton;
   import com.bigpoint.zoomumba.view.gui.custom.CountDownMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
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
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import org.puremvc.as3.patterns.facade.Facade;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.supportClasses.ItemRenderer;
   
   public class EventTimerItemRenderer extends ItemRenderer
   {
      private var _1377687758button:CustomizableCircularButton;
      
      private var _1352226353countdown:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var countdownName:String = "CountdownMediator_EVENT_";
      
      private var timer:CountDownMediator;
      
      public function EventTimerItemRenderer()
      {
         super();
         this.autoDrawBackground = false;
         this.mxmlContent = [this._EventTimerItemRenderer_HGroup1_c()];
         this.addEventListener("dataChange",this.___EventTimerItemRenderer_ItemRenderer1_dataChange);
         this.addEventListener("remove",this.___EventTimerItemRenderer_ItemRenderer1_remove);
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
      
      protected function onDataChange(param1:FlexEvent) : void
      {
         if(Boolean(data) && !this.timer)
         {
            this.timer = new CountDownMediator(this.countdown,data.eventId,this.countdownName + data.eventId + "_" + getTimer());
            this.button.displayImg.spriteClassDisplay = new WrapedSprite("EventIcons","DefaultIcon");
            toolTip = TextResourceModule.getText("zoo.tooltip.events." + data.eventId);
         }
      }
      
      protected function onRemove(param1:FlexEvent) : void
      {
         Facade.getInstance().removeMediator(this.countdownName);
      }
      
      private function _EventTimerItemRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 10;
         _loc1_.mxmlContent = [this._EventTimerItemRenderer_Group1_c(),this._EventTimerItemRenderer_Group2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _EventTimerItemRenderer_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._EventTimerItemRenderer_CustomizableCircularButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _EventTimerItemRenderer_CustomizableCircularButton1_i() : CustomizableCircularButton
      {
         var _loc1_:CustomizableCircularButton = new CustomizableCircularButton();
         _loc1_.enabled = false;
         _loc1_.backgroundScale = 0.5;
         _loc1_.bitmapDisplayPosX = 25;
         _loc1_.bitmapDisplayPosY = 25;
         _loc1_.id = "button";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.button = _loc1_;
         BindingManager.executeBindings(this,"button",this.button);
         return _loc1_;
      }
      
      private function _EventTimerItemRenderer_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.id = "countdown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.countdown = _loc1_;
         BindingManager.executeBindings(this,"countdown",this.countdown);
         return _loc1_;
      }
      
      public function ___EventTimerItemRenderer_ItemRenderer1_dataChange(param1:FlexEvent) : void
      {
         this.onDataChange(param1);
      }
      
      public function ___EventTimerItemRenderer_ItemRenderer1_remove(param1:FlexEvent) : void
      {
         this.onRemove(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get button() : CustomizableCircularButton
      {
         return this._1377687758button;
      }
      
      public function set button(param1:CustomizableCircularButton) : void
      {
         var _loc2_:Object = this._1377687758button;
         if(_loc2_ !== param1)
         {
            this._1377687758button = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"button",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get countdown() : Group
      {
         return this._1352226353countdown;
      }
      
      public function set countdown(param1:Group) : void
      {
         var _loc2_:Object = this._1352226353countdown;
         if(_loc2_ !== param1)
         {
            this._1352226353countdown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"countdown",_loc2_,param1));
            }
         }
      }
   }
}

