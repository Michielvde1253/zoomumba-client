package com.bigpoint.zoorama.utils.mouseModule
{
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoorama.Settings;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class MouseModule extends Mediator
   {
      private static var _instance:MouseModule;
      
      public static const NAME:String = "MouseModule";
      
      private var layer:Sprite;
      
      private var mousePointers:MovieClip;
      
      private var gamestage:Stage;
      
      private var _mouseType:String = "default";
      
      private var softwareMouseEnabled:Boolean = false;
      
      public function MouseModule()
      {
         super(NAME);
         this.show();
      }
      
      public static function getInstance() : MouseModule
      {
         if(_instance == null)
         {
            _instance = new MouseModule();
         }
         return _instance;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [GUINote.ACTIVATE_SELECT_SUBTOOL,GUINote.ACTIVATE_MOVE_SUBTOOL,GUINote.ACTIVATE_ROTATE_SUBTOOL,GUINote.ACTIVATE_SELL_SUBTOOL,GUINote.ACTIVATE_STORE_SUBTOOL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case GUINote.ACTIVATE_SELECT_SUBTOOL:
               this.show(MouseState.DEFAULT);
               break;
            case GUINote.ACTIVATE_MOVE_SUBTOOL:
               this.show(MouseState.MOVE_ITEM);
               break;
            case GUINote.ACTIVATE_ROTATE_SUBTOOL:
               this.show(MouseState.FLIP_ITEM);
               break;
            case GUINote.ACTIVATE_SELL_SUBTOOL:
               this.show(MouseState.SELL_ITEM);
               break;
            case GUINote.ACTIVATE_STORE_SUBTOOL:
               this.show(MouseState.STORE_ITEM);
         }
      }
      
      public function initialize(param1:Sprite, param2:MovieClip) : void
      {
         if(Boolean(param1) && Boolean(param2))
         {
            this.layer = param1;
            this.layer.mouseEnabled = false;
            this.layer.mouseChildren = false;
            this.mousePointers = param2;
            this.mousePointers.mouseEnabled = false;
            this.mousePointers.mouseChildren = false;
            this.mousePointers.y = -2000;
            this.mousePointers.x = -2000;
            this.layer.addChild(param2);
            param2.visible = false;
            this.show();
            this.gamestage = this.layer.stage;
            this.gamestage.stage.addEventListener(Event.MOUSE_LEAVE,this.handleMouseLeave,false,1000);
         }
      }
      
      private function handleMousePosition(param1:Event) : void
      {
         this.mousePointers.x = this.gamestage.mouseX;
         this.mousePointers.y = this.gamestage.mouseY;
         if(Settings.SCALE_TEST)
         {
            this.mousePointers.x = this.gamestage.mouseX * 1.31466667;
            this.mousePointers.y = this.gamestage.mouseY * 1.31466667;
         }
      }
      
      private function handleMouseLeave(param1:Event) : void
      {
         this.mousePointers.visible = false;
         this.gamestage.addEventListener(MouseEvent.MOUSE_OVER,this.handleMouseGamestageOver);
      }
      
      private function handleMouseGamestageOver(param1:MouseEvent) : void
      {
         if(this.mouseType != MouseState.DEFAULT)
         {
            this.mousePointers.visible = true;
         }
         this.gamestage.removeEventListener(MouseEvent.MOUSE_OVER,this.handleMouseGamestageOver);
      }
      
      public function show(param1:String = "default") : void
      {
         this._mouseType = param1;
         if(this.mousePointers)
         {
            if(param1 == MouseState.DEFAULT)
            {
               if(this.softwareMouseEnabled)
               {
                  this.stopMouseMovements();
               }
            }
            else
            {
               if(!this.softwareMouseEnabled)
               {
                  this.startMouseMovements();
               }
               this.mousePointers.gotoAndStop(param1);
            }
         }
      }
      
      private function startMouseMovements() : void
      {
         this.mousePointers.visible = true;
         this.softwareMouseEnabled = true;
         this.gamestage.addEventListener(Event.ENTER_FRAME,this.handleMousePosition);
      }
      
      private function stopMouseMovements() : void
      {
         this.mousePointers.visible = false;
         this.softwareMouseEnabled = false;
         this.gamestage.removeEventListener(Event.ENTER_FRAME,this.handleMousePosition);
      }
      
      public function get mouseType() : String
      {
         return this._mouseType;
      }
   }
}

