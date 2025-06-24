package com.bigpoint.zoorama.sound
{
   import com.bigpoint.zoorama.utils.Delegate;
   import com.bigpoint.zoorama.utils.FileHashmap;
   import com.greensock.TweenLite;
   import com.greensock.easing.Sine;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundLoaderContext;
   import flash.media.SoundTransform;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   
   public class SoundManager
   {
      private static var _instance:SoundManager;
      
      public static const BACKGROUND_MODE_NORMAL:int = 0;
      
      public static const BACKGROUND_MODE_SAFARI:int = 1;
      
      public static const BACKGROUND_MODE_CITY:int = 2;
      
      public static const BACKGROUND_MODE_MAP:int = 3;
      
      private const SOUNDS_PATH:String = "assets/sounds/";
      
      private var soundEffectsEnabled:Boolean = false;
      
      private var backgroundSoundEnabled:Boolean = false;
      
      private var soundsCache:Dictionary = new Dictionary();
      
      private var currentPlayedSounds:Dictionary = new Dictionary();
      
      public var backgroundSoundFilenames:Array = ["02_EVA_background"];
      
      public var backgroundSoundFilenames_safary:Array = ["SRL_EJ_05_MRO_namibia_loop-1"];
      
      public var backgroundSoundFilenames_city:Array = ["city_loop_01"];
      
      public var backgroundSoundFilenames_map:Array = ["Besucher_wenige"];
      
      private var soundMode:int = 0;
      
      private var backgroundSoundFilenameIndex:int = 0;
      
      private var backgroundSoundVolume:Number;
      
      private var currentBackgroundSound:Sound;
      
      private var currentBackgroundSoundTransform:SoundTransform;
      
      private var currentBackgroundChannel:SoundChannel;
      
      public var fadeBackgroundSound:Boolean = true;
      
      public var backgroundFadeInTime:Number = 10;
      
      public var backgroundFadeOutTime:Number = 0.6;
      
      public var backgroundMaxVolume:Number = 0.2;
      
      public var musicTheme:String = "";
      
      public function SoundManager()
      {
         super();
         this.initialize();
      }
      
      public static function getInstance() : SoundManager
      {
         if(_instance == null)
         {
            _instance = new SoundManager();
         }
         return _instance;
      }
      
      public function initialize() : void
      {
         this.currentBackgroundSoundTransform = new SoundTransform();
      }
      
      public function stopChannel(param1:SoundChannel) : void
      {
         var channel:SoundChannel = param1;
         try
         {
            channel.stop();
         }
         catch(error:Error)
         {
         }
      }
      
      public function stopChannelByName(param1:String) : void
      {
         var sc:SoundChannel = null;
         var sndName:String = param1;
         try
         {
            sc = this.getSoundChannelById(sndName);
            if(sc)
            {
               sc.stop();
               delete this.currentPlayedSounds[sndName];
            }
         }
         catch(error:Error)
         {
         }
      }
      
      public function playSoundEffect(param1:String, param2:Number = 1, param3:int = 0) : SoundChannel
      {
         var currentSoundChannel:SoundChannel = null;
         var sndTransform:SoundTransform = null;
         var ch:SoundChannel = null;
         var snd:Sound = null;
         var channel:SoundChannel = null;
         var fileName:String = null;
         var request:URLRequest = null;
         var context:SoundLoaderContext = null;
         var sound:Sound = null;
         var channelLoaded:SoundChannel = null;
         var soundName:String = param1;
         var vol:Number = param2;
         var loop:int = param3;
         soundName = soundName.replace(".mp3","");
         if(this.soundEffectsEnabled)
         {
            try
            {
               if(soundName)
               {
                  if(this.currentPlayedSounds[soundName])
                  {
                     ch = this.currentPlayedSounds[soundName] as SoundChannel;
                     ch.stop();
                  }
                  sndTransform = new SoundTransform(vol);
                  if(this.soundsCache[soundName])
                  {
                     snd = this.soundsCache[soundName] as Sound;
                     channel = snd.play(0,loop,sndTransform);
                     currentSoundChannel = channel;
                     channel.soundTransform.volume = vol;
                     channel.addEventListener(Event.SOUND_COMPLETE,Delegate.create(this.handleSoundEffectComplete,soundName));
                     this.currentPlayedSounds[soundName] = channel;
                  }
                  else
                  {
                     fileName = this.SOUNDS_PATH + soundName + ".mp3";
                     fileName = FileHashmap.getFilenameWithHashFromCDNHost(fileName);
                     request = new URLRequest(fileName);
                     context = new SoundLoaderContext(2000,true);
                     sound = new Sound();
                     sound.addEventListener(IOErrorEvent.IO_ERROR,this.handleSoundEffectError);
                     sound.load(request,context);
                     channelLoaded = sound.play(0,loop,sndTransform);
                     channelLoaded.soundTransform.volume = vol;
                     currentSoundChannel = channelLoaded;
                     channelLoaded.addEventListener(Event.SOUND_COMPLETE,Delegate.create(this.handleSoundEffectComplete,soundName));
                     this.soundsCache[soundName] = sound;
                     this.currentPlayedSounds[soundName] = channelLoaded;
                  }
               }
            }
            catch(error:Error)
            {
            }
         }
         return currentSoundChannel;
      }
      
      public function getSoundChannelById(param1:String) : SoundChannel
      {
         return this.currentPlayedSounds[param1];
      }
      
      private function handleSoundEffectComplete(param1:Event, param2:String) : void
      {
         var _loc3_:SoundChannel = this.currentPlayedSounds[param2] as SoundChannel;
         _loc3_.stop();
         delete this.currentPlayedSounds[param2];
      }
      
      private function handleSoundEffectError(param1:IOErrorEvent) : void
      {
      }
      
      public function playBackgroundSound(param1:Number = 0.5) : void
      {
         var soundName:String;
         var fileName:String = null;
         var request:URLRequest = null;
         var context:SoundLoaderContext = null;
         var vol:Number = param1;
         this.backgroundSoundVolume = vol;
         soundName = this.getCurrentSoundFilename();
         soundName = soundName.replace(".mp3","");
         if(this.backgroundSoundEnabled)
         {
            try
            {
               if(soundName)
               {
                  if(this.currentBackgroundChannel)
                  {
                     this.currentBackgroundChannel.stop();
                  }
                  fileName = this.SOUNDS_PATH + soundName + ".mp3";
                  fileName = FileHashmap.getFilenameWithHashFromCDNHost(fileName);
                  request = new URLRequest(fileName);
                  context = new SoundLoaderContext(2000,true);
                  this.currentBackgroundSoundTransform.volume = this.backgroundMaxVolume;
                  this.currentBackgroundSound = new Sound();
                  this.currentBackgroundSound.addEventListener(IOErrorEvent.IO_ERROR,this.handleBackgroundSoundError);
                  this.currentBackgroundSound.load(request,context);
                  this.currentBackgroundChannel = this.currentBackgroundSound.play(0,0,this.currentBackgroundSoundTransform);
                  this.currentBackgroundChannel.soundTransform.volume = this.backgroundSoundVolume;
                  this.currentBackgroundChannel.addEventListener(Event.SOUND_COMPLETE,Delegate.create(this.handleBackgroundSoundComplete));
               }
            }
            catch(error:Error)
            {
            }
         }
      }
      
      public function playAndFadeBackgroundSoundIn() : void
      {
         this.playBackgroundSound(0.001);
         TweenLite.to(this.currentBackgroundChannel,this.backgroundFadeInTime,{
            "volume":this.backgroundMaxVolume,
            "ease":Sine.easeIn
         });
      }
      
      private function getCurrentSoundFilename() : String
      {
         var _loc1_:* = null;
         this.musicTheme = this.musicTheme.replace(".mp3","").replace("_music","");
         switch(this.soundMode)
         {
            case BACKGROUND_MODE_NORMAL:
               if(this.musicTheme == "")
               {
                  _loc1_ = this.backgroundSoundFilenames[this.backgroundSoundFilenameIndex];
                  if(this.backgroundSoundFilenameIndex < this.backgroundSoundFilenames.length - 1)
                  {
                     ++this.backgroundSoundFilenameIndex;
                  }
               }
               else
               {
                  _loc1_ = this.musicTheme + "_music";
               }
               break;
            case BACKGROUND_MODE_SAFARI:
               _loc1_ = this.backgroundSoundFilenames_safary[this.backgroundSoundFilenameIndex];
               if(this.backgroundSoundFilenameIndex < this.backgroundSoundFilenames_safary.length - 1)
               {
                  ++this.backgroundSoundFilenameIndex;
               }
               break;
            case BACKGROUND_MODE_CITY:
               _loc1_ = this.backgroundSoundFilenames_city[this.backgroundSoundFilenameIndex];
               if(this.backgroundSoundFilenameIndex < this.backgroundSoundFilenames_city.length - 1)
               {
                  ++this.backgroundSoundFilenameIndex;
               }
               break;
            case BACKGROUND_MODE_MAP:
               _loc1_ = this.backgroundSoundFilenames_map[this.backgroundSoundFilenameIndex];
               if(this.backgroundSoundFilenameIndex < this.backgroundSoundFilenames_map.length - 1)
               {
                  ++this.backgroundSoundFilenameIndex;
               }
         }
         return _loc1_;
      }
      
      public function changeBackGroundMode(param1:int) : void
      {
         if(this.soundMode != param1)
         {
            this.soundMode = param1;
            this.backgroundSoundFilenameIndex = 0;
            this.playBackgroundSound();
         }
      }
      
      protected function handleBackgroundSoundComplete(param1:Event) : void
      {
         this.playBackgroundSound();
      }
      
      private function handleBackgroundSoundError(param1:IOErrorEvent) : void
      {
      }
      
      public function enableSoundEffects() : void
      {
         this.soundEffectsEnabled = true;
      }
      
      public function disableSoundEffects() : void
      {
         this.soundEffectsEnabled = false;
      }
      
      public function enableBackgroundSound() : void
      {
         if(this.hasSound())
         {
            return;
         }
         this.backgroundSoundEnabled = true;
         if(this.fadeBackgroundSound)
         {
            this.playAndFadeBackgroundSoundIn();
         }
         else
         {
            this.playBackgroundSound();
         }
      }
      
      public function disableBackgroundSound() : void
      {
         if(this.currentBackgroundChannel)
         {
            if(this.fadeBackgroundSound)
            {
               TweenLite.to(this.currentBackgroundChannel,this.backgroundFadeOutTime,{
                  "volume":0,
                  "onComplete":this.handleBackgroundSoundFadeOutComplete
               });
            }
            else
            {
               this.stopBackgroundSoundImmediatley();
            }
         }
      }
      
      private function stopBackgroundSoundImmediatley() : void
      {
         this.currentBackgroundChannel.stop();
         this.backgroundSoundEnabled = false;
      }
      
      private function handleBackgroundSoundFadeOutComplete() : void
      {
         this.stopBackgroundSoundImmediatley();
      }
      
      public function hasSound() : Boolean
      {
         return this.soundEffectsEnabled && this.backgroundSoundEnabled;
      }
      
      public function hasBackgroundSound() : Boolean
      {
         return this.backgroundSoundEnabled;
      }
      
      public function hasSoundEffects() : Boolean
      {
         return this.soundEffectsEnabled;
      }
      
      public function setMusicTheme(param1:String) : void
      {
         this.musicTheme = param1;
      }
   }
}

