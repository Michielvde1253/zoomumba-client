package com.bigpoint.zoorama.view.windows.interfaces
{
   import com.bigpoint.zoorama.view.windows.tabbing.TabbingManager;
   import flash.display.Sprite;
   
   public interface IWindow
   {
      function startWindow() : void;
      
      function setModal() : void;
      
      function setHeader() : void;
      
      function setOuterContent() : void;
      
      function setInnerContent() : void;
      
      function setBelowContent() : void;
      
      function loadSWFAssets() : void;
      
      function skin(param1:String) : void;
      
      function addCloseButton() : void;
      
      function setModalVisibility(param1:String) : void;
      
      function get w() : int;
      
      function get h() : int;
      
      function get offsetX() : int;
      
      function get offsetY() : int;
      
      function set offsetX(param1:int) : void;
      
      function set offsetY(param1:int) : void;
      
      function get container() : Sprite;
      
      function get inner() : Sprite;
      
      function get outer() : Sprite;
      
      function get header() : Sprite;
      
      function set headerFileName(param1:String) : void;
      
      function get headerFileName() : String;
      
      function get tabsManager() : TabbingManager;
      
      function get modalLayer() : Sprite;
      
      function get isPrimary() : Boolean;
      
      function get isOpen() : Boolean;
      
      function preClose() : void;
      
      function preOpen() : void;
      
      function dispose() : void;
   }
}

