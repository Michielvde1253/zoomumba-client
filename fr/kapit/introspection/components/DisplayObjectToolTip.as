package fr.kapit.introspection.components
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import fr.kapit.introspection.ClassProxy;
   import fr.kapit.introspection.nodes.DisplayNode;
   import mx.containers.Canvas;
   import mx.containers.VBox;
   import mx.controls.Label;
   import mx.controls.Text;
   import mx.core.IToolTip;
   import mx.events.FlexEvent;
   import mx.graphics.ImageSnapshot;
   
   public class DisplayObjectToolTip extends Canvas implements IToolTip
   {
      private static var _size:int = 200;
      
      public var displayNode:DisplayNode;
      
      public var margin:int = 10;
      
      private var bmp:Bitmap;
      
      private var box:VBox;
      
      private var labelField:Label;
      
      public function DisplayObjectToolTip(param1:DisplayNode)
      {
         super();
         this.displayNode = param1;
         this.setStyle("borderStyle","solid");
         this.setStyle("borderColor",0);
         this.setStyle("borderThickness",0);
         this.setStyle("backgroundColor",14606046);
         this.setStyle("alpha",0.8);
         this.setStyle("verticalScrollPolicy","off");
         this.setStyle("horizontalScrollPolicy","off");
         this.clipContent = false;
         this.setStyle("cornerRadius",3);
         this.percentHeight = 100;
         this.percentWidth = 100;
         addEventListener(FlexEvent.CREATION_COMPLETE,this.onCreationComplete);
      }
      
      public function dispose() : void
      {
         if(this.bmp)
         {
            this.bmp.bitmapData.dispose();
         }
      }
      
      public function get size() : int
      {
         return _size;
      }
      
      public function set size(param1:int) : void
      {
         _size = Math.max(50,param1);
         if(_size > this.bmp.bitmapData.width && _size > this.bmp.bitmapData.height)
         {
            _size = Math.max(this.bmp.bitmapData.width,this.bmp.bitmapData.height);
         }
         this.setSize();
         this.setLabelPosition();
      }
      
      public function get text() : String
      {
         return this.displayNode.name + ":" + ClassProxy.getInstance().getFullClassPath(this.displayNode.displayObject);
      }
      
      public function set text(param1:String) : void
      {
      }
      
      override protected function createChildren() : void
      {
         this.labelField = new Text();
         this.labelField.text = this.text;
         this.labelField.setStyle("backgroundColor",16777215);
         this.box = new VBox();
         this.box.setStyle("backgroundColor",4473924);
         this.labelField.setStyle("color",16777215);
         this.box.addChild(this.labelField);
         var _loc1_:Bitmap = this.createBitmap();
         if(_loc1_)
         {
            this.rawChildren.addChild(_loc1_);
            _loc1_.filters = this.getFilter();
            _loc1_.x = 5;
            _loc1_.y = 5;
            this.setLabelPosition();
         }
         addEventListener(FlexEvent.UPDATE_COMPLETE,this.onUpdateComplete);
         addChild(this.box);
      }
      
      private function createBitmap() : Bitmap
      {
         var bmpData:BitmapData = null;
         try
         {
            bmpData = ImageSnapshot.captureBitmapData(this.displayNode.displayObject,null,null,null,null,true);
            this.bmp = new Bitmap(bmpData);
            this.setSize();
            return this.bmp;
         }
         catch(e:Error)
         {
         }
         return null;
      }
      
      private function getFilter() : Array
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.blurX = 5;
         _loc1_.blurY = 5;
         _loc1_.alpha = 1;
         _loc1_.quality = BitmapFilterQuality.HIGH;
         _loc1_.strength = 1;
         _loc1_.color = 3355443;
         return [_loc1_];
      }
      
      private function onCreationComplete(param1:Event) : void
      {
      }
      
      private function onUpdateComplete(param1:Event) : void
      {
         removeEventListener(FlexEvent.UPDATE_COMPLETE,this.onUpdateComplete);
         this.height = Math.max(!!this.bmp ? this.bmp.bitmapData.height * this.bmp.scaleY + this.margin : 0,this.labelField.height);
         this.width = !!this.bmp ? this.bmp.bitmapData.width * this.bmp.scaleY + this.margin : 0;
      }
      
      private function setLabelPosition() : void
      {
         this.box.y = this.bmp.bitmapData.height * this.bmp.scaleY + this.margin * 1.5;
      }
      
      private function setSize() : void
      {
         var _loc1_:Number = 1;
         var _loc2_:Number = 1;
         if(this.bmp.bitmapData.width > _size)
         {
            _loc1_ = _size / this.bmp.bitmapData.width;
         }
         if(this.bmp.bitmapData.height > _size)
         {
            _loc2_ = _size / this.bmp.bitmapData.height;
         }
         var _loc3_:Number = Math.min(_loc1_,_loc2_);
         this.bmp.scaleX = _loc3_;
         this.bmp.scaleY = _loc3_;
         var _loc4_:int = Math.min(_size,this.bmp.bitmapData.width * _loc3_);
         var _loc5_:int = Math.min(_size,this.bmp.bitmapData.height * _loc3_);
         this.width = _loc4_ + this.margin;
         this.height = _loc5_ + this.margin;
      }
   }
}

