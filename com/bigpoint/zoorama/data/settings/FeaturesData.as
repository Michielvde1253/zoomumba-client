package com.bigpoint.zoorama.data.settings
{
   public class FeaturesData
   {
      public var safari:Boolean;
      
      public var news:Boolean;
      
      public var flexGUI:Boolean;
      
      public var buddyList:Boolean;
      
      public var storage:Boolean;
      
      public var serverSideStacking:Boolean;
      
      public var cashFieldItemsAsBitmap:Boolean;
      
      public var cinema:Boolean;
      
      public function FeaturesData()
      {
         super();
      }
      
      public function toString() : String
      {
         return "FeaturesData:{" + " safari:" + this.safari + " cinema:" + this.cinema + " news:" + this.news + " flexGUI:" + this.flexGUI + " buddyList:" + this.buddyList + " storage:" + this.storage + " serverSideStacking:" + this.serverSideStacking + "}";
      }
   }
}

