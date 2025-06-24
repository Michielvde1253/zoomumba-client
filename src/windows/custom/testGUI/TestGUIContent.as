package windows.custom.testGUI
{
   import com.bigpoint.zoomumba.view.gui.custom.CountDownMediator;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import windows.core.InnerGroup;
   
   public class TestGUIContent extends Group
   {
      private var _3571pc:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function TestGUIContent()
      {
         super();
         this.width = 400;
         this.height = 300;
         this.mxmlContent = [this._TestGUIContent_InnerGroup1_c()];
         this.addEventListener("creationComplete",this.___TestGUIContent_Group1_creationComplete);
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
      
      protected function group1_creationCompleteHandler(param1:FlexEvent) : void
      {
         new (CountDownMediator(this.pc))();
      }
      
      private function _TestGUIContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._TestGUIContent_Group2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _TestGUIContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 100;
         _loc1_.y = 100;
         _loc1_.id = "pc";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pc = _loc1_;
         BindingManager.executeBindings(this,"pc",this.pc);
         return _loc1_;
      }
      
      public function ___TestGUIContent_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.group1_creationCompleteHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get pc() : Group
      {
         return this._3571pc;
      }
      
      public function set pc(param1:Group) : void
      {
         var _loc2_:Object = this._3571pc;
         if(_loc2_ !== param1)
         {
            this._3571pc = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pc",_loc2_,param1));
            }
         }
      }
   }
}

