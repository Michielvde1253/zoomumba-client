package com.bigpoint.zoorama.view.actionMenu
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.model.shop.ShopProxy;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import com.bigpoint.zoorama.notices.view.actionMenu.ActionMenuNotice;
   import com.bigpoint.zoorama.notices.view.actionMenu.CageSlotMenuNotice;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.UIComponent;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class ActionMenuManager extends Mediator
   {
      public static const NAME:String = "ActionMenuManager";
      
      private var notifier:Notifier;
      
      private var gameContainer:UIComponent;
      
      private var actionMenus:Vector.<AbstractActionMenu>;
      
      private var currentMenuId:int = -1;
      
      private var menuHolder:Sprite = new Sprite();
      
      public function ActionMenuManager(param1:Notifier, param2:UIComponent)
      {
         super(NAME);
         this.menuHolder = this.menuHolder;
         this.notifier = new Notifier(param1);
         this.actionMenus = new Vector.<AbstractActionMenu>(ActionMenuTypes.MENU_TYPE_COUNT);
         this.actionMenus[ActionMenuTypes.MENU_TYPE_CAGE] = new CageActionMenu(this.notifier);
         this.actionMenus[ActionMenuTypes.MENU_TYPE_BUILD] = new BuildingActionMenu(this.notifier);
         this.actionMenus[ActionMenuTypes.MENU_TYPE_CLEAN] = new CleanActionMenu(this.notifier);
         this.actionMenus[ActionMenuTypes.MENU_TYPE_ASSISTANCES] = new AssistanceActionMenu(this.notifier);
         this.actionMenus[ActionMenuTypes.MENU_TYPE_CAGESLOTS] = new CageSlotsPopup();
         this.actionMenus[ActionMenuTypes.MENU_TYPE_COMMUNITY] = new SocialActionMenu(this.notifier);
         this.actionMenus[ActionMenuTypes.MENU_TYPE_STORE] = new StoreActionMenu(this.notifier);
         this.actionMenus[ActionMenuTypes.MENU_TYPE_GATE] = new GateActionMenu(this.notifier);
         this.actionMenus[ActionMenuTypes.MENU_TYPE_GATE_FORGOTTEN] = new ForgottenGateActionMenu(this.notifier);
         param2.addChild(this.menuHolder);
         this.gameContainer = param2;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [GUINote.ASSISTANTS_MENU_BUTTON_CLICKED,GUINote.COMMUNITY_MENU_BUTTON_CLICKED,Note.UPDATE_GATE_MENU];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:ActionMenuNotice = null;
         var _loc3_:ActionMenuNotice = null;
         switch(param1.getName())
         {
            case GUINote.ASSISTANTS_MENU_BUTTON_CLICKED:
               _loc2_ = new ActionMenuNotice(ActionMenuNotice.TOGGLE_ACTION_MENU,ActionMenuTypes.MENU_TYPE_ASSISTANCES,null);
               if(_loc2_.actionMenuId == this.currentMenuId)
               {
                  this.closeMenu();
               }
               else
               {
                  this.openMenu(_loc2_);
               }
               break;
            case GUINote.COMMUNITY_MENU_BUTTON_CLICKED:
               _loc3_ = new ActionMenuNotice(ActionMenuNotice.TOGGLE_ACTION_MENU,ActionMenuTypes.MENU_TYPE_COMMUNITY,null);
               if(_loc3_.actionMenuId == this.currentMenuId)
               {
                  this.closeMenu();
               }
               else
               {
                  this.openMenu(_loc3_);
               }
               break;
            case Note.UPDATE_GATE_MENU:
               this.updateMainGateMenu();
         }
      }
      
      private function positionMenu(param1:Point) : void
      {
         var _loc2_:AbstractActionMenu = this.actionMenus[this.currentMenuId];
         if(Settings.SCALE_TEST)
         {
            if(param1)
            {
               if(this.currentMenuId == 3 || this.currentMenuId == 5)
               {
                  _loc2_.x = param1.x * 0.76;
               }
               else
               {
                  _loc2_.x = param1.x;
               }
               _loc2_.y = param1.y * 0.7;
            }
            else
            {
               if(this.currentMenuId == 3 || this.currentMenuId == 5)
               {
                  _loc2_.x = this.gameContainer.stage.mouseX * 0.76;
               }
               else
               {
                  _loc2_.x = this.gameContainer.stage.mouseX;
               }
               _loc2_.y = this.gameContainer.stage.mouseY * 0.7;
            }
         }
         else if(param1)
         {
            _loc2_.x = param1.x;
            _loc2_.y = param1.y;
         }
         else
         {
            _loc2_.x = this.gameContainer.stage.mouseX;
            _loc2_.y = this.gameContainer.stage.mouseY;
         }
         var _loc3_:Rectangle = _loc2_.getBounds(this.gameContainer.stage);
         if(_loc3_.x - 75 < 0)
         {
            if(_loc2_.mustMoveIfNotFitsLeft)
            {
               _loc2_.x += _loc2_.moveRightBy;
            }
            else
            {
               _loc2_.x -= _loc3_.x - 75;
            }
         }
         if(_loc3_.x + _loc3_.width > MainConfig.STAGE_WIDTH - 20)
         {
            if(_loc2_.mustMoveIfNotFitsRight)
            {
               _loc2_.x -= _loc2_.moveLeftBy;
            }
            else
            {
               _loc2_.x -= _loc3_.x + _loc3_.width - (MainConfig.STAGE_WIDTH - 20);
            }
         }
         if(_loc3_.y - 50 < 0)
         {
            _loc2_.y -= _loc3_.y - 50;
         }
         if(_loc3_.y + _loc3_.height > MainConfig.STAGE_HEIGHT - 80)
         {
            _loc2_.y -= _loc3_.y + _loc3_.height - (MainConfig.STAGE_HEIGHT - 80);
         }
      }
      
      public function handleNotice(param1:ActionMenuNotice) : void
      {
         switch(param1.type)
         {
            case ActionMenuNotice.TOGGLE_ACTION_MENU:
               if(param1.actionMenuId == this.currentMenuId)
               {
                  this.closeMenu();
               }
               else
               {
                  this.openMenu(param1);
               }
               break;
            case ActionMenuNotice.OPEN_ACTION_MENU:
               if(param1.replace)
               {
                  this.openMenu(param1);
               }
               else if(this.currentMenuId == ActionMenuTypes.MENU_TYPE_UNDEFINED)
               {
                  this.openMenu(param1);
               }
               break;
            case ActionMenuNotice.CLOSE_ACTION_MENU:
               this.closeMenu(param1);
         }
      }
      
      public function updateMainGateMenu() : void
      {
         (this.actionMenus[ActionMenuTypes.MENU_TYPE_GATE] as GateActionMenu).updateGateActionMenu();
      }
      
      public function updateGateMenu() : void
      {
         if(this.currentMenuId == ActionMenuTypes.MENU_TYPE_GATE)
         {
            (this.actionMenus[ActionMenuTypes.MENU_TYPE_GATE] as GateActionMenu).updateGateActionMenu();
         }
         if(this.currentMenuId == ActionMenuTypes.MENU_TYPE_GATE_FORGOTTEN)
         {
            (this.actionMenus[ActionMenuTypes.MENU_TYPE_GATE_FORGOTTEN] as ForgottenGateActionMenu).updateGateActionMenu();
         }
      }
      
      private function openMenu(param1:ActionMenuNotice) : void
      {
         var _loc2_:CageSlotsPopup = null;
         var _loc3_:CageSlotMenuNotice = null;
         if(Settings.TUTORIAL_ACTIVE)
         {
            if(TutorialInjectionManager.getInstance().showCageMenu <= 0)
            {
               return;
            }
            if(!(param1.actionMenuId == ActionMenuTypes.MENU_TYPE_CAGE || param1.actionMenuId == ActionMenuTypes.MENU_TYPE_CLEAN || param1.actionMenuId == ActionMenuTypes.MENU_TYPE_GATE || param1.actionMenuId == ActionMenuTypes.MENU_TYPE_GATE_FORGOTTEN))
            {
               return;
            }
         }
         this.closeMenu();
         this.currentMenuId = param1.actionMenuId;
         this.actionMenus[this.currentMenuId].setTargetItem(param1.targetItem);
         this.menuHolder.addChild(this.actionMenus[this.currentMenuId]);
         if(param1.actionMenuId == ActionMenuTypes.MENU_TYPE_CAGESLOTS)
         {
            _loc2_ = this.actionMenus[this.currentMenuId] as CageSlotsPopup;
            _loc3_ = param1 as CageSlotMenuNotice;
            _loc2_.setDragItem(_loc3_.dragItem);
         }
         this.positionMenu(param1.menuPosition);
      }
      
      public function closeMenu(param1:ActionMenuNotice = null) : void
      {
         if(!param1 || param1.actionMenuId == -1 || param1.actionMenuId == this.currentMenuId)
         {
            if(this.currentMenuId != ActionMenuTypes.MENU_TYPE_UNDEFINED)
            {
               this.actionMenus[this.currentMenuId].close();
               this.menuHolder.removeChild(this.actionMenus[this.currentMenuId]);
               this.currentMenuId = ActionMenuTypes.MENU_TYPE_UNDEFINED;
            }
         }
      }
      
      public function updateActionMenuIcons(param1:int) : void
      {
         var _loc2_:AssistanceActionMenu = this.actionMenus[ActionMenuTypes.MENU_TYPE_ASSISTANCES] as AssistanceActionMenu;
         var _loc3_:CageActionMenu = this.actionMenus[ActionMenuTypes.MENU_TYPE_CAGE] as CageActionMenu;
         var _loc4_:GateActionMenu = this.actionMenus[ActionMenuTypes.MENU_TYPE_GATE] as GateActionMenu;
         if(param1 == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
         {
            _loc2_.setOceanWorldIcon();
            _loc3_.setOceanWorldIcons();
            _loc4_.hideNonOceanGateMenuIcons();
            (facade.retrieveProxy(ShopProxy.NAME) as ShopProxy).isOceanActive = true;
         }
         else
         {
            _loc2_.setForestZooButtons();
            _loc3_.setForrestZooIcons();
            _loc4_.showNonOceanGateMenuIcons();
            (facade.retrieveProxy(ShopProxy.NAME) as ShopProxy).isOceanActive = false;
         }
      }
   }
}

