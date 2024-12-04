package custom.mainInterface
{
   import buttons.tweeningButtons.BasicTweeningButton;
   import custom.mainInterface.events.ButtonClusterEvent;
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
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   
   public class ButtonCluster extends Group
   {
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var buttonList:Vector.<ButtonClusterObject>;
      
      public function ButtonCluster()
      {
         super();
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
      
      public function addButton(param1:int, param2:BasicTweeningButton, param3:Point) : void
      {
         if(!this.buttonList)
         {
            this.buttonList = new Vector.<ButtonClusterObject>();
         }
         var _loc4_:ButtonClusterObject = new ButtonClusterObject(param2);
         _loc4_.button_id = param1;
         this.buttonList.push(_loc4_);
         _loc4_.x = param3.x;
         _loc4_.y = param3.y;
         _loc4_.addEventListener(MouseEvent.CLICK,this.handleClusterButtonClick);
         this.addElement(_loc4_);
      }
      
      private function handleClusterButtonClick(param1:MouseEvent) : void
      {
         var _loc2_:ButtonClusterEvent = new ButtonClusterEvent(ButtonClusterEvent.CLUSTER_BUTTON_CLICK,ButtonClusterObject(param1.currentTarget).button_id);
         dispatchEvent(_loc2_);
      }
      
      public function destroyCluster() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.buttonList.length)
         {
            this.buttonList[_loc1_] = null;
            _loc1_++;
         }
      }
      
      public function show() : void
      {
         this.visible = true;
      }
      
      public function hide() : void
      {
         this.visible = false;
      }
      
      public function toggleVisibility() : void
      {
         if(this.visible)
         {
            this.visible = false;
         }
         else
         {
            this.visible = true;
         }
      }
   }
}

