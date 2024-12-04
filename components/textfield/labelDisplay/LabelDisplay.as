package components.textfield.labelDisplay
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import mx.controls.Image;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.supportClasses.SkinnableComponent;
   
   public class LabelDisplay extends SkinnableComponent
   {
      private static var _skinParts:Object = {"_image":true};
      
      private var _496054704canAfford:Boolean = true;
      
      private var _3556653text:String = "";
      
      private var _111972721value:int = 0;
      
      private var _365601008fontSize:uint = 12;
      
      private var _1465947061_scale:Number = 1;
      
      [SkinPart(required="true")]
      public var _image:Image;
      
      private var _source:Object;
      
      private var _type:String = "none";
      
      private var _created:Boolean = false;
      
      private var _cacheObj:Object = null;
      
      private var _2050513221boxWidth:int = -1;
      
      private var _425604818boxHeight:int = -1;
      
      private var _611960542_imgWidth:int = -1;
      
      private var _2071064907_imgHeight:int = -1;
      
      public function LabelDisplay()
      {
         super();
         addEventListener(FlexEvent.CREATION_COMPLETE,this.config);
      }
      
      [Bindable(event="propertyChange")]
      public function get type() : String
      {
         return this._type;
      }
      
      private function set _3575610type(param1:String) : void
      {
         this._type = param1;
         invalidateSkinState();
      }
      
      private function config(param1:FlexEvent) : void
      {
         removeEventListener(FlexEvent.CREATION_COMPLETE,this.config);
         if(this._type != "none")
         {
            this._imgWidth = this.boxWidth == -1 ? int(this._image.width) : this.boxWidth;
            this._imgHeight = this.boxHeight == -1 ? int(this._image.height) : this.boxHeight;
            this._scale = 1;
         }
         this._created = true;
         if(this._cacheObj)
         {
            this.setDisplaySource(this._cacheObj);
            this._cacheObj = null;
         }
      }
      
      override protected function getCurrentSkinState() : String
      {
         return this._type;
      }
      
      public function setDisplaySize(param1:int, param2:int) : void
      {
         this._imgWidth = param1;
         this._imgHeight = param2;
      }
      
      public function setDisplaySource(param1:Object, param2:Number = 1) : void
      {
         this._scale = param2;
         if(this._created)
         {
            this._image.addEventListener("sourceChanged",this.image_sourceChanged);
            this._image.source = param1;
         }
         else
         {
            this._cacheObj = param1;
         }
      }
      
      private function image_sourceChanged(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this._image.source is DisplayObject)
         {
            _loc2_ = (this._image.source as DisplayObject).width * this._scale;
            _loc3_ = (this._image.source as DisplayObject).height * this._scale;
         }
         else
         {
            _loc2_ = int(this._image.measuredWidth);
            _loc3_ = int(this._image.measuredHeight);
         }
         this._imgWidth = this._imgWidth == -1 ? _loc2_ : this._imgWidth;
         this._imgHeight = this._imgHeight == -1 ? _loc3_ : this._imgHeight;
         this._image.x = this._imgWidth / 2;
         this._image.y = this._imgHeight / 2;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
         this._image.removeEventListener("sourceChanged",this.image_sourceChanged);
      }
      
      [Bindable(event="propertyChange")]
      public function get canAfford() : Boolean
      {
         return this._496054704canAfford;
      }
      
      public function set canAfford(param1:Boolean) : void
      {
         var _loc2_:Object = this._496054704canAfford;
         if(_loc2_ !== param1)
         {
            this._496054704canAfford = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"canAfford",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get value() : int
      {
         return this._111972721value;
      }
      
      public function set value(param1:int) : void
      {
         var _loc2_:Object = this._111972721value;
         if(_loc2_ !== param1)
         {
            this._111972721value = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"value",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fontSize() : uint
      {
         return this._365601008fontSize;
      }
      
      public function set fontSize(param1:uint) : void
      {
         var _loc2_:Object = this._365601008fontSize;
         if(_loc2_ !== param1)
         {
            this._365601008fontSize = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fontSize",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _scale() : Number
      {
         return this._1465947061_scale;
      }
      
      public function set _scale(param1:Number) : void
      {
         var _loc2_:Object = this._1465947061_scale;
         if(_loc2_ !== param1)
         {
            this._1465947061_scale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_scale",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get boxWidth() : int
      {
         return this._2050513221boxWidth;
      }
      
      public function set boxWidth(param1:int) : void
      {
         var _loc2_:Object = this._2050513221boxWidth;
         if(_loc2_ !== param1)
         {
            this._2050513221boxWidth = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"boxWidth",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get boxHeight() : int
      {
         return this._425604818boxHeight;
      }
      
      public function set boxHeight(param1:int) : void
      {
         var _loc2_:Object = this._425604818boxHeight;
         if(_loc2_ !== param1)
         {
            this._425604818boxHeight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"boxHeight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _imgWidth() : int
      {
         return this._611960542_imgWidth;
      }
      
      public function set _imgWidth(param1:int) : void
      {
         var _loc2_:Object = this._611960542_imgWidth;
         if(_loc2_ !== param1)
         {
            this._611960542_imgWidth = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_imgWidth",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _imgHeight() : int
      {
         return this._2071064907_imgHeight;
      }
      
      public function set _imgHeight(param1:int) : void
      {
         var _loc2_:Object = this._2071064907_imgHeight;
         if(_loc2_ !== param1)
         {
            this._2071064907_imgHeight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_imgHeight",_loc2_,param1));
            }
         }
      }
      
      public function set type(param1:String) : void
      {
         var _loc2_:Object = this.type;
         if(_loc2_ !== param1)
         {
            this._3575610type = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"type",_loc2_,param1));
            }
         }
      }
   }
}

