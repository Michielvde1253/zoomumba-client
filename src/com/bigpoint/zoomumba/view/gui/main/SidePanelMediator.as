package com.bigpoint.zoomumba.view.gui.main
{
   import buttons.tweeningButtons.basicExtension.TweeningButton20;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenLite;
   import com.greensock.easing.Circ;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import spark.components.Group;
   
   public class SidePanelMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "RightSidePanelMediator";
      
      public static const MAXIMIZED_TOP_Y:int = 110;
      
      public static const MINIMIZED_TOP_Y:int = 60;
      
      public static const MAXIMIZED_BOTTOM_Y:int = 40;
      
      public static const MINIMIZED_BOTTOM_Y:int = -5;
      
      private var minimizeTop:TweeningButton20;
      
      private var minimizeBottom:TweeningButton20;
      
      private var topView:Group;
      
      private var buttomView:Group;
      
      private var minimizedTopState:Boolean = false;
      
      private var minimizedBottomState:Boolean = false;
      
      public function SidePanelMediator(param1:Group)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [GUINote.MINIMIZED_MAIN_MENU_UI,GUINote.MAXIMIZED_MAIN_MENU_UI,GUINote.MINIMIZED_HEADER_MENU_UI,Note.SHOW_SETTINGSMENU,Note.HIDE_SETTINGSMENU,GUINote.MAXIMIZED_HEADER_MENU_UI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case GUINote.MINIMIZED_MAIN_MENU_UI:
               this.minimizedBottomState = true;
               break;
            case GUINote.MAXIMIZED_MAIN_MENU_UI:
               this.minimizedBottomState = false;
               break;
            case GUINote.MINIMIZED_HEADER_MENU_UI:
               this.minimizedTopState = true;
               break;
            case GUINote.MAXIMIZED_HEADER_MENU_UI:
               this.minimizedTopState = false;
               break;
            case Note.HIDE_SETTINGSMENU:
               this.showMinimizeBottom(false);
               break;
            case Note.SHOW_SETTINGSMENU:
               this.showMinimizeBottom(true);
               break;
            case GUINote.MAXIMIZED_HEADER_MENU_UI:
               this.minimizedTopState = false;
         }
         this.updateView(true);
      }
      
      private function showMinimizeBottom(param1:Boolean) : void
      {
         this.buttomView.visible = param1;
      }
      
      private function updateView(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.minimizedTopState)
         {
            this.minimizeTop.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_DOWN_ARROW_UP);
            this.minimizeTop.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_DOWN_ARROW_OVER);
            _loc2_ = MINIMIZED_TOP_Y;
         }
         else
         {
            this.minimizeTop.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_UP_ARROW_OVER);
            this.minimizeTop.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_UP_ARROW_UP);
            _loc2_ = MAXIMIZED_TOP_Y;
         }
         if(!this.minimizedBottomState)
         {
            this.minimizeBottom.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_DOWN_ARROW_UP);
            this.minimizeBottom.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_DOWN_ARROW_OVER);
            _loc3_ = MAXIMIZED_BOTTOM_Y;
         }
         else
         {
            this.minimizeBottom.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_UP_ARROW_OVER);
            this.minimizeBottom.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_UP_ARROW_UP);
            _loc3_ = MINIMIZED_BOTTOM_Y;
         }
         if(param1)
         {
            TweenLite.killTweensOf(this.topView);
            TweenLite.to(this.topView,0.8,{
               "top":_loc2_,
               "ease":Circ.easeOut
            });
            TweenLite.killTweensOf(this.buttomView);
            TweenLite.to(this.buttomView,1,{
               "bottom":_loc3_,
               "ease":Circ.easeOut
            });
         }
         else
         {
            this.topView.top = _loc2_;
            this.buttomView.bottom = _loc3_;
         }
      }
      
      override public function onRegister() : void
      {
         this.topView = new Group();
         this.buttomView = new Group();
         this.minimizeTop = new TweeningButton20();
         this.minimizeBottom = new TweeningButton20();
         this.sidePanel.addElement(this.topView);
         this.sidePanel.addElement(this.buttomView);
         this.minimizeTop.hitArea.addEventListener(MouseEvent.CLICK,this.handleMinimizeTopButtonClick);
         this.minimizeTop.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleMinimizeTopMouseOver);
         this.minimizeTop.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         this.minimizeBottom.hitArea.addEventListener(MouseEvent.CLICK,this.handleMinimizeBottomButtonClick);
         this.minimizeBottom.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleMinimizeBottomMouseOver);
         this.minimizeBottom.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         this.sidePanel.percentHeight = 100;
         this.buttomView.left = 33;
         this.topView.left = 33;
         this.buttomView.addElement(this.minimizeBottom);
         this.topView.addElement(this.minimizeTop);
         this.updateView();
      }
      
      private function handleMouseOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      protected function handleMinimizeBottomMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainbutton.hidebottom"),false);
      }
      
      protected function handleMinimizeBottomButtonClick(param1:MouseEvent) : void
      {
         sendNotification(GUINote.MINIMIZE_TOGGLE_MAIN_MENU_UI);
      }
      
      protected function handleMinimizeTopMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainbutton.hidetop"),false);
      }
      
      protected function handleMinimizeTopButtonClick(param1:MouseEvent) : void
      {
         sendNotification(GUINote.MINIMIZE_TOGGLE_HEADER_UI);
      }
      
      private function get sidePanel() : Group
      {
         return this.viewComponent as Group;
      }
   }
}

