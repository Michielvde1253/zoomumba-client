package custom.card.core
{
   import custom.card.component.CardActionButton;
   import custom.card.component.CardBackground;
   import custom.card.component.CardBottom;
   import custom.card.component.CardBuyButton;
   import custom.card.component.CardDecoBack;
   import custom.card.component.CardDecoLocked;
   import custom.card.component.CardDecoPossible;
   import custom.card.component.CardDecoReady;
   import custom.card.component.CardNail;
   import custom.card.component.CardRight;
   import custom.card.component.CardTop;
   import flash.display.DisplayObject;
   import mx.controls.Image;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.supportClasses.SkinnableComponent;
   import spark.core.SpriteVisualElement;
   
   public class AbstractCard extends SkinnableComponent
   {
      private static var _skinParts:Object = {
         "bottomGroup":true,
         "nail":true,
         "buyGroup":true,
         "lock":true,
         "ready":true,
         "rightGroup":true,
         "content":true,
         "topGroup":true,
         "container":true,
         "background":true,
         "preload":false,
         "decoBackContent":true,
         "actionGroup":true,
         "canCraft":true
      };
      
      private var _110371416title:String = "";
      
      public var config:Function = null;
      
      [SkinPart(required="true")]
      public var container:SpriteVisualElement;
      
      [SkinPart(required="true")]
      public var background:CardBackground;
      
      [SkinPart(required="true")]
      public var nail:CardNail;
      
      [SkinPart(required="true")]
      public var topGroup:CardTop;
      
      [SkinPart(required="true")]
      public var bottomGroup:CardBottom;
      
      [SkinPart(required="true")]
      public var rightGroup:CardRight;
      
      [SkinPart(required="true")]
      public var buyGroup:CardBuyButton;
      
      [SkinPart(required="true")]
      public var actionGroup:CardActionButton;
      
      [SkinPart(required="true")]
      public var content:Group;
      
      [SkinPart(required="true")]
      public var lock:CardDecoLocked;
      
      [SkinPart(required="true")]
      public var canCraft:CardDecoPossible;
      
      [SkinPart(required="true")]
      public var ready:CardDecoReady;
      
      [SkinPart(required="true")]
      public var decoBackContent:CardDecoBack;
      
      [SkinPart(required="false")]
      public var preload:Image;
      
      public function AbstractCard()
      {
         super();
      }
      
      public function cleanContent() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:int = 0;
         if(this.container)
         {
            _loc2_ = 0;
            while(_loc2_ < this.container.numChildren)
            {
               _loc1_ = this.container.getChildAt(_loc2_);
               this.container.removeChild(_loc1_);
               _loc2_++;
            }
         }
         if(this.preload)
         {
            this.preload.visible = true;
         }
      }
      
      public function addContent(param1:DisplayObject) : void
      {
         if(param1 != null)
         {
            this.cleanContent();
            this.container.addChild(param1);
         }
         if(this.preload)
         {
            this.preload.visible = false;
         }
      }
      
      override protected function attachSkin() : void
      {
         super.attachSkin();
         if(this.config != null)
         {
            this.config(this);
         }
         this._init();
         this.init();
      }
      
      protected function init() : void
      {
         throw new Error("AbstractCard is a abstract class... so, create a sub class and extendes it\'s functionalities. So, override creationComplete");
      }
      
      private function _init() : void
      {
      }
      
      public function destroy() : void
      {
      }
      
      [Bindable(event="propertyChange")]
      public function get title() : String
      {
         return this._110371416title;
      }
      
      public function set title(param1:String) : void
      {
         var _loc2_:Object = this._110371416title;
         if(_loc2_ !== param1)
         {
            this._110371416title = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"title",_loc2_,param1));
            }
         }
      }
   }
}

