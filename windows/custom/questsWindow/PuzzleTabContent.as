package windows.custom.questsWindow
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   import windows.core.InnerGroup;
   
   public class PuzzleTabContent extends Group
   {
      private var _1876820451puzzleContainer:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function PuzzleTabContent()
      {
         super();
         this.mxmlContent = [this._PuzzleTabContent_InnerGroup1_c()];
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
      
      private function _PuzzleTabContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._PuzzleTabContent_SpriteVisualElement1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _PuzzleTabContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 87;
         _loc1_.y = 160;
         _loc1_.initialized(this,"puzzleContainer");
         this.puzzleContainer = _loc1_;
         BindingManager.executeBindings(this,"puzzleContainer",this.puzzleContainer);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get puzzleContainer() : SpriteVisualElement
      {
         return this._1876820451puzzleContainer;
      }
      
      public function set puzzleContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1876820451puzzleContainer;
         if(_loc2_ !== param1)
         {
            this._1876820451puzzleContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"puzzleContainer",_loc2_,param1));
            }
         }
      }
   }
}

