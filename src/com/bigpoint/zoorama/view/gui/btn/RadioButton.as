package com.bigpoint.zoorama.view.gui.btn
{
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   
   public class RadioButton extends BasicButton
   {
      public static var groupIds:Dictionary = new Dictionary();
      
      protected var _group:RadioGroup;
      
      protected var _value:String;
      
      protected var ss0:Sprite;
      
      protected var ss1:Sprite;
      
      protected var ss2:Sprite;
      
      public function RadioButton()
      {
         super();
      }
      
      override public function set skin(param1:Sprite) : void
      {
         super.skin = param1;
         this.ss0 = skin.getChildByName("ss0") as Sprite;
         this.ss1 = skin.getChildByName("ss1") as Sprite;
         this.ss2 = skin.getChildByName("ss2") as Sprite;
      }
      
      public function set group(param1:RadioGroup) : void
      {
         this._group = param1;
      }
      
      public function get group() : RadioGroup
      {
         return this._group;
      }
      
      public function set value(param1:String) : void
      {
         this._value = param1;
      }
      
      public function get value() : String
      {
         return this._value;
      }
      
      public function set groupId(param1:String) : void
      {
         if(groupIds[param1] == null)
         {
            groupIds[param1] = new RadioGroup();
         }
         this.group = groupIds[param1] as RadioGroup;
         this.group.id = param1;
         this.group.addRadioButton(this);
      }
      
      public function get groupId() : String
      {
         if(this.group)
         {
            return this.group.id;
         }
         return null;
      }
      
      public function deselect() : void
      {
         if(this.ss0)
         {
            this.ss0.visible = false;
         }
      }
      
      public function select() : void
      {
         if(this.group)
         {
            this.group.deselectAll();
         }
         this.group.select(this);
         this.ss0.visible = true;
      }
      
      override protected function handleMouseClickHit(param1:MouseEvent) : void
      {
         this.select();
      }
   }
}

