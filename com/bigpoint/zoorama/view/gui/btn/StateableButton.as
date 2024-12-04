package com.bigpoint.zoorama.view.gui.btn
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.mainmenu.MainMenuButton;
   import com.bigpoint.zoorama.view.gui.tooltip.Tooltip;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   
   public class StateableButton extends Coreponent
   {
      protected var buttonStates:Dictionary;
      
      public var currentButton:MainMenuButton;
      
      public var currentState:String;
      
      public var defaultState:String;
      
      public var _toolText:String;
      
      private var _tooltip:Tooltip;
      
      protected var _soundNames:Array = [];
      
      public function StateableButton(param1:Notifier)
      {
         super();
         this.buttonStates = new Dictionary();
      }
      
      override public function set skin(param1:Sprite) : void
      {
         if(_skin)
         {
            removeChild(_skin);
         }
         _skin = param1;
         hit = _skin["hit"];
         addChild(_skin);
      }
      
      public function set states(param1:Array) : void
      {
         var _loc3_:Object = null;
         var _loc4_:String = null;
         var _loc5_:Sprite = null;
         var _loc6_:MainMenuButton = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_];
            if(_loc3_)
            {
               _loc4_ = _loc3_.skin;
               _loc5_ = skin[_loc4_];
               _loc6_ = new MainMenuButton(null);
               _loc6_.id = _loc4_;
               _loc6_.skin = _loc5_;
               _loc6_.addEventListener(MouseEvent.CLICK,this.handleButtonClick);
               _loc6_.addEventListener(MouseEvent.MOUSE_OVER,this.handleButtonMouseOver);
               _loc6_.addEventListener(MouseEvent.MOUSE_OUT,this.handleButtonMouseOut);
               _loc6_.buttonMode = true;
               _loc6_.useHandCursor = true;
               addChild(_loc6_);
               this.buttonStates[_loc4_] = _loc6_;
            }
            _loc2_++;
         }
         this.showState(this.defaultState);
      }
      
      private function handleButtonClick(param1:MouseEvent) : void
      {
         var _loc2_:String = this.randomSound;
         if(_loc2_)
         {
            SoundManager.getInstance().playSoundEffect(_loc2_);
         }
         var _loc3_:MainMenuButton = param1.currentTarget as MainMenuButton;
         if(_loc3_)
         {
            this.currentButton = _loc3_;
            this.currentState = this.currentButton.id as String;
         }
      }
      
      private function handleButtonMouseOver(param1:MouseEvent) : void
      {
         if(this._toolText)
         {
            TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText(this._toolText));
         }
         if(!this._tooltip)
         {
         }
      }
      
      private function handleButtonMouseOut(param1:MouseEvent) : void
      {
         if(this._toolText)
         {
            TooltipNewManager.removeToolTip();
         }
         if(!this._tooltip)
         {
         }
      }
      
      public function showState(param1:String) : void
      {
         this.hideAllButtonStates();
         var _loc2_:BasicButton = this.buttonStates[param1] as BasicButton;
         if(_loc2_)
         {
            _loc2_.visible = true;
         }
      }
      
      protected function hideAllButtonStates() : void
      {
         var _loc1_:String = null;
         var _loc2_:Sprite = null;
         for(_loc1_ in this.buttonStates)
         {
            _loc2_ = this.buttonStates[_loc1_] as BasicButton;
            _loc2_.visible = false;
         }
      }
      
      public function set tooltip(param1:Tooltip) : void
      {
         this._tooltip = param1;
         this._tooltip.target = this;
      }
      
      public function set sound(param1:String) : void
      {
         this._soundNames = [param1];
      }
      
      protected function get randomSound() : String
      {
         var _loc1_:Number = Math.random() * (this._soundNames.length - 1);
         var _loc2_:int = Math.round(_loc1_);
         var _loc3_:String = this._soundNames[_loc2_];
         if(_loc3_)
         {
            return _loc3_;
         }
         return null;
      }
      
      public function addSound(param1:String) : void
      {
         this._soundNames.push(param1);
      }
      
      public function set sounds(param1:Array) : void
      {
         this._soundNames = param1;
      }
      
      public function get sounds() : Array
      {
         return this._soundNames;
      }
      
      public function set toolTextData(param1:String) : void
      {
         this._toolText = param1;
      }
   }
}

