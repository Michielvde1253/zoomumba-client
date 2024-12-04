package fr.kapit.components
{
   import com.flexspy.imp.ComponentStyles;
   import flash.display.DisplayObject;
   import fr.kapit.assets.EmbeddedAssets;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   public class StyleComponent extends AbstractKapDebugComponent implements IKapDebugComponent
   {
      public static var NAME:String = "StyleComponent";
      
      public static var LABEL:String = "Styles";
      
      private var _157243208stylesGrid:ComponentStyles;
      
      private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
         "type":AbstractKapDebugComponent,
         "events":{"creationComplete":"___StyleComponent_AbstractKapDebugComponent1_creationComplete"},
         "propertiesFactory":function():Object
         {
            return {"childDescriptors":[new UIComponentDescriptor({
               "type":ComponentStyles,
               "id":"stylesGrid",
               "propertiesFactory":function():Object
               {
                  return {
                     "percentWidth":100,
                     "percentHeight":100
                  };
               }
            })]};
         }
      });
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _displayObject:Object;
      
      public function StyleComponent()
      {
         super();
         mx_internal::_document = this;
         this.addEventListener("creationComplete",this.___StyleComponent_AbstractKapDebugComponent1_creationComplete);
      }
      
      public static function get factory() : KapDebugComponentFactory
      {
         return new KapDebugComponentFactory(NAME,LABEL,StyleComponent,EmbeddedAssets.iconStylesOn,EmbeddedAssets.iconStylesOff,EmbeddedAssets.iconStylesOver,_isTargetAcceptable,new KapDebugShortcut(false,false,false,115,NAME));
      }
      
      private static function _isTargetAcceptable(param1:Object) : Boolean
      {
         return param1 is DisplayObject;
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
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      override public function setRoot(param1:Object, param2:String = "", param3:Object = null) : void
      {
         if(param1 is DisplayObject)
         {
            this._displayObject = DisplayObject(param1);
         }
         this.refresh();
      }
      
      override public function registerView(param1:String) : void
      {
         ComponentManager.instance.registerView(StyleComponent,param1);
      }
      
      override public function set target(param1:Object) : void
      {
         super.target = param1;
         if(targetChanged)
         {
            this._displayObject = param1;
            targetChanged = false;
         }
      }
      
      override public function get target() : Object
      {
         return this._displayObject;
      }
      
      private function onCreationComplete() : void
      {
         this.refresh();
      }
      
      private function refresh() : void
      {
         if(Boolean(this._displayObject) && Boolean(this.stylesGrid))
         {
            this.stylesGrid.showComponentStyles(this._displayObject);
         }
      }
      
      public function ___StyleComponent_AbstractKapDebugComponent1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete();
      }
      
      [Bindable(event="propertyChange")]
      public function get stylesGrid() : ComponentStyles
      {
         return this._157243208stylesGrid;
      }
      
      public function set stylesGrid(param1:ComponentStyles) : void
      {
         var _loc2_:Object = this._157243208stylesGrid;
         if(_loc2_ !== param1)
         {
            this._157243208stylesGrid = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stylesGrid",_loc2_,param1));
            }
         }
      }
   }
}

