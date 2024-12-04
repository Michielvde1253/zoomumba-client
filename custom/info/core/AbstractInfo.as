package custom.info.core
{
   import custom.info.groups.InfoDisplayGroupPreview;
   import custom.info.groups.InfoDisplayGroupRight;
   import flash.display.DisplayObject;
   import mx.controls.Image;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   
   public class AbstractInfo extends Group
   {
      private var _110371416title:String = "";
      
      private var _3556653text:String = "";
      
      public var preload:Image;
      
      public var container:SpriteVisualElement;
      
      public var groupRight:InfoDisplayGroupRight;
      
      public var groupPreview:InfoDisplayGroupPreview;
      
      public function AbstractInfo()
      {
         super();
      }
      
      public function cleanContent() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.container.numChildren)
         {
            _loc1_ = this.container.getChildAt(_loc2_);
            this.container.removeChild(_loc1_);
            _loc2_++;
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
      
      [Bindable(event="propertyChange")]
      public function get text() : String
      {
         return this._3556653text;
      }
      
      public function set text(param1:String) : void
      {
         var _loc2_:Object = this._3556653text;
         if(_loc2_ !== param1)
         {
            this._3556653text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text",_loc2_,param1));
            }
         }
      }
   }
}

