package com.bigpoint.zoorama.view.windows
{
   import com.bigpoint.zoorama.core.feature.safari.windows.SafariMinigameWindow;
   import com.bigpoint.zoorama.core.feature.safari.windows.SafariShopWindow;
   import com.bigpoint.zoorama.core.feature.tutorials.windows.WindowTutorial;
   import com.bigpoint.zoorama.core.feature.zooAdvisor.windows.WindowZooAdvisor;
   import com.bigpoint.zoorama.view.bank.BankWindow;
   import com.bigpoint.zoorama.view.gui.win.WindowForgottenZooUnlock;
   import com.bigpoint.zoorama.view.gui.win.WindowItemWentToInventory;
   import com.bigpoint.zoorama.view.gui.win.WindowStorageCapacity;
   import com.bigpoint.zoorama.view.gui.win.WindowStorageUnlock;
   import com.bigpoint.zoorama.view.gui.win.WindowVisitorWishes;
   import com.bigpoint.zoorama.view.gui.win.WindowWelcomeBack;
   
   public class WindowReferences
   {
      public static const WINDOW_ZOOMETER_CLASS:Class = WindowZooAdvisor;
      
      public static const WINDOW_TUTORIAL_CLASS:Class = WindowTutorial;
      
      public static const WINDOW_WELCOMEBACK_CLASS:Class = WindowWelcomeBack;
      
      public static const WINDOW_STORAGE_UNLOCK_CLASS:Class = WindowStorageUnlock;
      
      public static const WINDOW_FORGOTTEN_ZOO_UNLOCK_CLASS:Class = WindowForgottenZooUnlock;
      
      public static const WINDOW_SEND_ITEM_TO_INVENTORY:Class = WindowItemWentToInventory;
      
      public static const WINDOW_STORAGE_CAPACITY_CLASS:Class = WindowStorageCapacity;
      
      public static const WINDOW_VISITOR_WISHES_CLASS:Class = WindowVisitorWishes;
      
      public static const WINDOW_SAFARI_SHOP_CLASS:Class = SafariShopWindow;
      
      public static const WINDOW_SAFARI_MINIGAME_CLASS:Class = SafariMinigameWindow;
      
      public static const WINDOW_BANK_CLASS:Class = BankWindow;
      
      public function WindowReferences()
      {
         super();
      }
   }
}

