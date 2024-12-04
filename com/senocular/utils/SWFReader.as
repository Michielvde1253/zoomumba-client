package com.senocular.utils
{
   import flash.display.ActionScriptVersion;
   import flash.geom.*;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class SWFReader
   {
      public var compressed:Boolean;
      
      public var version:uint;
      
      public var fileSize:uint;
      
      private var _dimensions:Rectangle = new Rectangle();
      
      private var _tagCallbackBytesIncludesHeader:Boolean = false;
      
      public var frameRate:uint;
      
      public var totalFrames:uint;
      
      public var asVersion:uint;
      
      public var usesNetwork:Boolean;
      
      public var backgroundColor:uint;
      
      public var protectedFromImport:Boolean;
      
      public var debuggerEnabled:Boolean;
      
      public var metadata:XML;
      
      public var recursionLimit:uint;
      
      public var scriptTimeoutLimit:uint;
      
      public var hardwareAcceleration:uint;
      
      public var tagCallback:Function;
      
      public var parsed:Boolean;
      
      public var errorText:String = "";
      
      private var bytes:ByteArray;
      
      private var currentByte:int;
      
      private var bitPosition:int;
      
      private var currentTag:uint;
      
      private var bgColorFound:Boolean;
      
      private const GET_DATA_SIZE:int = 5;
      
      private const TWIPS_TO_PIXELS:Number = 0.05;
      
      private const TAG_HEADER_ID_BITS:int = 6;
      
      private const TAG_HEADER_MAX_SHORT:int = 63;
      
      private const SWF_C:uint = 67;
      
      private const SWF_F:uint = 70;
      
      private const SWF_W:uint = 87;
      
      private const SWF_S:uint = 83;
      
      private const TAG_ID_EOF:uint = 0;
      
      private const TAG_ID_BG_COLOR:uint = 9;
      
      private const TAG_ID_PROTECTED:uint = 24;
      
      private const TAG_ID_DEBUGGER1:uint = 58;
      
      private const TAG_ID_DEBUGGER2:uint = 64;
      
      private const TAG_ID_SCRIPT_LIMITS:uint = 65;
      
      private const TAG_ID_FILE_ATTS:uint = 69;
      
      private const TAG_ID_META:uint = 77;
      
      private const TAG_ID_SHAPE_1:uint = 2;
      
      private const TAG_ID_SHAPE_2:uint = 22;
      
      private const TAG_ID_SHAPE_3:uint = 32;
      
      private const TAG_ID_SHAPE_4:uint = 83;
      
      public function SWFReader(param1:ByteArray = null)
      {
         super();
         this.parse(param1);
      }
      
      public function get dimensions() : Rectangle
      {
         return this._dimensions;
      }
      
      public function get width() : uint
      {
         return uint(this._dimensions.width);
      }
      
      public function get height() : uint
      {
         return uint(this._dimensions.height);
      }
      
      public function get tagCallbackBytesIncludesHeader() : Boolean
      {
         return this._tagCallbackBytesIncludesHeader;
      }
      
      public function set tagCallbackBytesIncludesHeader(param1:Boolean) : void
      {
         this._tagCallbackBytesIncludesHeader = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         if(this.parsed)
         {
            _loc1_ = this.compressed ? "compressed" : "uncompressed";
            _loc2_ = this.totalFrames > 1 ? "frames" : "frame";
            return "[SWF" + this.version + " AS" + this.asVersion + ".0: " + this.totalFrames + " " + _loc2_ + " @ " + this.frameRate + " fps " + this._dimensions.width + "x" + this._dimensions.height + " " + _loc1_ + "]";
         }
         return Object.prototype.toString.call(this);
      }
      
      public function parse(param1:ByteArray) : void
      {
         var swfFC:uint = 0;
         var swfW:uint = 0;
         var swfS:uint = 0;
         var temp:ByteArray = null;
         var swfBytes:ByteArray = param1;
         this.parseDefaults();
         if(swfBytes == null)
         {
            this.parseError("Error: Cannot parse a null value.");
            return;
         }
         this.parsed = true;
         try
         {
            this.bytes = swfBytes;
            this.bytes.endian = Endian.LITTLE_ENDIAN;
            this.bytes.position = 0;
            swfFC = this.bytes.readUnsignedByte();
            swfW = this.bytes.readUnsignedByte();
            swfS = this.bytes.readUnsignedByte();
            if(swfFC != this.SWF_F && swfFC != this.SWF_C || swfW != this.SWF_W || swfS != this.SWF_S)
            {
               this.parseError("Error: Invalid SWF header.");
               return;
            }
            this.compressed = Boolean(swfFC == this.SWF_C);
            this.version = this.bytes.readUnsignedByte();
            this.fileSize = this.bytes.readUnsignedInt();
            if(this.compressed)
            {
               temp = new ByteArray();
               this.bytes.readBytes(temp);
               this.bytes = temp;
               this.bytes.endian = Endian.LITTLE_ENDIAN;
               this.bytes.position = 0;
               temp = null;
               this.bytes.uncompress();
            }
            this._dimensions = this.readRect();
            ++this.bytes.position;
            this.frameRate = this.bytes.readUnsignedByte();
            this.totalFrames = this.bytes.readUnsignedShort();
         }
         catch(error:Error)
         {
            parseError(error.message);
            return;
         }
         try
         {
            while(this.readTag())
            {
            }
         }
         catch(error:Error)
         {
            parseError(error.message);
            return;
         }
         this.bytes = null;
      }
      
      private function parseDefaults() : void
      {
         this.compressed = false;
         this.version = 1;
         this.fileSize = 0;
         this._dimensions = new Rectangle();
         this.frameRate = 12;
         this.totalFrames = 1;
         this.metadata = null;
         this.asVersion = ActionScriptVersion.ACTIONSCRIPT2;
         this.usesNetwork = false;
         this.backgroundColor = 16777215;
         this.protectedFromImport = false;
         this.debuggerEnabled = true;
         this.scriptTimeoutLimit = 256;
         this.recursionLimit = 15;
         this.hardwareAcceleration = 0;
         this.errorText = "";
         this.bgColorFound = false;
      }
      
      private function parseError(param1:String = "Unkown error.") : void
      {
         this.compressed = false;
         this.version = 0;
         this.fileSize = 0;
         this._dimensions = new Rectangle();
         this.frameRate = 0;
         this.totalFrames = 0;
         this.metadata = null;
         this.asVersion = 0;
         this.usesNetwork = false;
         this.backgroundColor = 0;
         this.protectedFromImport = false;
         this.debuggerEnabled = false;
         this.scriptTimeoutLimit = 0;
         this.recursionLimit = 0;
         this.hardwareAcceleration = 0;
         this.parsed = false;
         this.bytes = null;
         this.errorText = param1;
      }
      
      private function paddedHex(param1:uint, param2:int = 6) : String
      {
         var _loc3_:String = param1.toString(16);
         while(_loc3_.length < param2)
         {
            _loc3_ = "0" + _loc3_;
         }
         return "0x" + _loc3_;
      }
      
      private function readString() : String
      {
         var i:uint = this.bytes.position;
         try
         {
            while(this.bytes[i] != 0)
            {
               i++;
            }
         }
         catch(error:Error)
         {
            return "";
         }
         return this.bytes.readUTFBytes(i - this.bytes.position);
      }
      
      private function readRect() : Rectangle
      {
         this.nextBitByte();
         var _loc1_:Rectangle = new Rectangle();
         var _loc2_:uint = this.readBits(this.GET_DATA_SIZE);
         _loc1_.left = this.readBits(_loc2_,true) * this.TWIPS_TO_PIXELS;
         _loc1_.right = this.readBits(_loc2_,true) * this.TWIPS_TO_PIXELS;
         _loc1_.top = this.readBits(_loc2_,true) * this.TWIPS_TO_PIXELS;
         _loc1_.bottom = this.readBits(_loc2_,true) * this.TWIPS_TO_PIXELS;
         return _loc1_;
      }
      
      private function readMatrix() : Matrix
      {
         var _loc1_:uint = 0;
         this.nextBitByte();
         var _loc2_:Matrix = new Matrix();
         if(this.readBits(1))
         {
            _loc1_ = this.readBits(this.GET_DATA_SIZE);
            _loc2_.a = this.readBits(_loc1_,true);
            _loc2_.d = this.readBits(_loc1_,true);
         }
         if(this.readBits(1))
         {
            _loc1_ = this.readBits(this.GET_DATA_SIZE);
            _loc2_.b = this.readBits(_loc1_,true);
            _loc2_.c = this.readBits(_loc1_,true);
         }
         _loc1_ = this.readBits(this.GET_DATA_SIZE);
         _loc2_.tx = this.readBits(_loc1_,true) * this.TWIPS_TO_PIXELS;
         _loc2_.ty = this.readBits(_loc1_,true) * this.TWIPS_TO_PIXELS;
         return _loc2_;
      }
      
      private function readBits(param1:uint, param2:Boolean = false) : Number
      {
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:Number = 0;
         var _loc4_:uint = uint(8 - this.bitPosition);
         if(param1 <= _loc4_)
         {
            _loc5_ = uint((1 << param1) - 1);
            _loc3_ = this.currentByte >> _loc4_ - param1 & _loc5_;
            if(param1 == _loc4_)
            {
               this.nextBitByte();
            }
            else
            {
               this.bitPosition += param1;
            }
         }
         else
         {
            _loc5_ = uint((1 << _loc4_) - 1);
            _loc6_ = uint(this.currentByte & _loc5_);
            _loc7_ = uint(param1 - _loc4_);
            this.nextBitByte();
            _loc3_ = _loc6_ << _loc7_ | this.readBits(_loc7_);
         }
         if(param2 && _loc3_ >> param1 - 1 == 1)
         {
            _loc4_ = uint(32 - param1);
            _loc5_ = uint((1 << _loc4_) - 1);
            return int(_loc5_ << param1 | _loc3_);
         }
         return uint(_loc3_);
      }
      
      private function nextBitByte() : void
      {
         this.currentByte = this.bytes.readByte();
         this.bitPosition = 0;
      }
      
      private function readTag() : Boolean
      {
         var _loc1_:uint = this.bytes.position;
         var _loc2_:int = int(this.bytes.readUnsignedShort());
         this.currentTag = _loc2_ >> this.TAG_HEADER_ID_BITS;
         var _loc3_:uint = uint(_loc2_ & this.TAG_HEADER_MAX_SHORT);
         if(_loc3_ == this.TAG_HEADER_MAX_SHORT)
         {
            _loc3_ = this.bytes.readUnsignedInt();
         }
         var _loc4_:uint = this.bytes.position + _loc3_;
         var _loc5_:Boolean = this.readTagData(_loc3_,_loc1_,_loc4_);
         if(!_loc5_)
         {
            return false;
         }
         this.bytes.position = _loc4_;
         return true;
      }
      
      private function readTagData(param1:uint, param2:uint, param3:uint) : Boolean
      {
         var tagBytes:ByteArray = null;
         var tagLength:uint = param1;
         var start:uint = param2;
         var end:uint = param3;
         if(this.tagCallback != null)
         {
            tagBytes = new ByteArray();
            if(this._tagCallbackBytesIncludesHeader)
            {
               tagBytes.writeBytes(this.bytes,start,end - start);
            }
            else if(tagLength)
            {
               tagBytes.writeBytes(this.bytes,this.bytes.position,tagLength);
            }
            tagBytes.position = 0;
            this.tagCallback(this.currentTag,tagBytes);
         }
         switch(this.currentTag)
         {
            case this.TAG_ID_FILE_ATTS:
               this.nextBitByte();
               this.readBits(1);
               this.hardwareAcceleration = this.readBits(2);
               this.readBits(1);
               this.asVersion = Boolean(this.readBits(1)) && this.version >= 9 ? ActionScriptVersion.ACTIONSCRIPT3 : ActionScriptVersion.ACTIONSCRIPT2;
               this.readBits(2);
               this.usesNetwork = Boolean(this.readBits(1) == 1);
               break;
            case this.TAG_ID_META:
               try
               {
                  this.metadata = new XML(this.readString());
               }
               catch(error:Error)
               {
               }
               break;
            case this.TAG_ID_BG_COLOR:
               if(!this.bgColorFound)
               {
                  this.bgColorFound = true;
                  this.backgroundColor = this.readRGB();
               }
               break;
            case this.TAG_ID_PROTECTED:
               this.protectedFromImport = Boolean(this.bytes.readUnsignedByte() != 0);
               break;
            case this.TAG_ID_DEBUGGER1:
               if(this.version == 5)
               {
                  this.debuggerEnabled = true;
               }
               break;
            case this.TAG_ID_DEBUGGER2:
               if(this.version > 5)
               {
                  this.debuggerEnabled = true;
               }
               break;
            case this.TAG_ID_SCRIPT_LIMITS:
               this.recursionLimit = this.bytes.readUnsignedShort();
               this.scriptTimeoutLimit = this.bytes.readUnsignedShort();
               break;
            case this.TAG_ID_EOF:
               return false;
         }
         return true;
      }
      
      private function readRGB() : uint
      {
         return this.bytes.readUnsignedByte() << 16 | this.bytes.readUnsignedByte() << 8 | this.bytes.readUnsignedByte();
      }
      
      private function readARGB() : uint
      {
         return this.bytes.readUnsignedByte() << 24 | this.bytes.readUnsignedByte() << 16 | this.bytes.readUnsignedByte() << 8 | this.bytes.readUnsignedByte();
      }
      
      private function readRGBA() : uint
      {
         var _loc1_:uint = this.bytes.readUnsignedByte();
         var _loc2_:uint = this.bytes.readUnsignedByte();
         var _loc3_:uint = this.bytes.readUnsignedByte();
         var _loc4_:uint = this.bytes.readUnsignedByte();
         return _loc4_ << 24 | _loc1_ << 16 | _loc2_ << 8 | _loc3_;
      }
   }
}

