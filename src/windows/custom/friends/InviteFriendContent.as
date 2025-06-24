package windows.custom.friends
{
   import buttons.simpleButton.OKButtonSkin;
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import components.textfield.textInput.StandardTextInput;
   import components.textfield.textInput.StandardTextInputWoodSkin;
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.controls.Image;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.List;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderLineSkin;
   
   use namespace mx_internal;
   
   public class InviteFriendContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1724546052description:StandardText;
      
      private var _1595649866descriptionMultipleFound:StandardText;
      
      private var _1221270899header:WindowHeader;
      
      private var _1087517396levelGradient:GradientText;
      
      private var _994077504multipleChoiceState:Group;
      
      private var _1641788370okButton:Button;
      
      private var _876869253preloaderImage:Image;
      
      private var _1890724510searchUsername:Group;
      
      private var _1296905215succesState:Group;
      
      private var _1867169789success:StandardText;
      
      private var _1392894870userIdGradient:GradientText;
      
      private var _266718455userList:List;
      
      private var _265713450username:StandardTextInput;
      
      private var _210284070usernameGradient:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_LoaderProgress_1407024497:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function InviteFriendContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_LoaderProgress_1407024497 = InviteFriendContent__embed_mxml__general_Decorations_swf_LoaderProgress_1407024497;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._InviteFriendContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_friends_InviteFriendContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return InviteFriendContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._InviteFriendContent_InnerGroup1_c(),this._InviteFriendContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         InviteFriendContent._watcherSetupUtil = param1;
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
      
      private function _InviteFriendContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._InviteFriendContent_Group2_i(),this._InviteFriendContent_Group3_i(),this._InviteFriendContent_Group4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InviteFriendContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._InviteFriendContent_StandardText1_i(),this._InviteFriendContent_StandardTextInput1_i(),this._InviteFriendContent_Button1_i(),this._InviteFriendContent_Image1_i()];
         _loc1_.id = "searchUsername";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.searchUsername = _loc1_;
         BindingManager.executeBindings(this,"searchUsername",this.searchUsername);
         return _loc1_;
      }
      
      private function _InviteFriendContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.x = 69;
         _loc1_.y = 118;
         _loc1_.width = 324;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "description";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.description = _loc1_;
         BindingManager.executeBindings(this,"description",this.description);
         return _loc1_;
      }
      
      private function _InviteFriendContent_StandardTextInput1_i() : StandardTextInput
      {
         var _loc1_:StandardTextInput = new StandardTextInput();
         _loc1_.x = 140;
         _loc1_.y = 223;
         _loc1_.width = 170;
         _loc1_.promptColor = 9590288;
         _loc1_.setStyle("skinClass",StandardTextInputWoodSkin);
         _loc1_.id = "username";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.username = _loc1_;
         BindingManager.executeBindings(this,"username",this.username);
         return _loc1_;
      }
      
      private function _InviteFriendContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 330;
         _loc1_.y = 216;
         _loc1_.scaleX = 0.5;
         _loc1_.scaleY = 0.5;
         _loc1_.setStyle("skinClass",OKButtonSkin);
         _loc1_.addEventListener("click",this.__okButton_click);
         _loc1_.id = "okButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.okButton = _loc1_;
         BindingManager.executeBindings(this,"okButton",this.okButton);
         return _loc1_;
      }
      
      public function __okButton_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("searchIdByName"));
      }
      
      private function _InviteFriendContent_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.visible = false;
         _loc1_.x = 330;
         _loc1_.y = 216;
         _loc1_.scaleX = 0.5;
         _loc1_.scaleY = 0.5;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_LoaderProgress_1407024497;
         _loc1_.id = "preloaderImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.preloaderImage = _loc1_;
         BindingManager.executeBindings(this,"preloaderImage",this.preloaderImage);
         return _loc1_;
      }
      
      private function _InviteFriendContent_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._InviteFriendContent_StandardText2_i()];
         _loc1_.id = "succesState";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.succesState = _loc1_;
         BindingManager.executeBindings(this,"succesState",this.succesState);
         return _loc1_;
      }
      
      private function _InviteFriendContent_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.x = 69;
         _loc1_.y = 150;
         _loc1_.width = 324;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "success";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.success = _loc1_;
         BindingManager.executeBindings(this,"success",this.success);
         return _loc1_;
      }
      
      private function _InviteFriendContent_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._InviteFriendContent_StandardText3_i(),this._InviteFriendContent_HGroup1_c(),this._InviteFriendContent_List1_i()];
         _loc1_.id = "multipleChoiceState";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.multipleChoiceState = _loc1_;
         BindingManager.executeBindings(this,"multipleChoiceState",this.multipleChoiceState);
         return _loc1_;
      }
      
      private function _InviteFriendContent_StandardText3_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.x = 69;
         _loc1_.y = 118;
         _loc1_.width = 324;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "descriptionMultipleFound";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.descriptionMultipleFound = _loc1_;
         BindingManager.executeBindings(this,"descriptionMultipleFound",this.descriptionMultipleFound);
         return _loc1_;
      }
      
      private function _InviteFriendContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.x = 70;
         _loc1_.y = 170;
         _loc1_.mxmlContent = [this._InviteFriendContent_GradientText1_i(),this._InviteFriendContent_GradientText2_i(),this._InviteFriendContent_GradientText3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InviteFriendContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.text = "username";
         _loc1_.width = 140;
         _loc1_.textAlign = "center";
         _loc1_.id = "usernameGradient";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.usernameGradient = _loc1_;
         BindingManager.executeBindings(this,"usernameGradient",this.usernameGradient);
         return _loc1_;
      }
      
      private function _InviteFriendContent_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.text = "level";
         _loc1_.width = 45;
         _loc1_.textAlign = "center";
         _loc1_.id = "levelGradient";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.levelGradient = _loc1_;
         BindingManager.executeBindings(this,"levelGradient",this.levelGradient);
         return _loc1_;
      }
      
      private function _InviteFriendContent_GradientText3_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.text = "user id";
         _loc1_.width = 80;
         _loc1_.textAlign = "center";
         _loc1_.id = "userIdGradient";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userIdGradient = _loc1_;
         BindingManager.executeBindings(this,"userIdGradient",this.userIdGradient);
         return _loc1_;
      }
      
      private function _InviteFriendContent_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.width = 330;
         _loc1_.height = 100;
         _loc1_.x = 70;
         _loc1_.y = 200;
         _loc1_.itemRenderer = this._InviteFriendContent_ClassFactory1_c();
         _loc1_.setStyle("contentBackgroundAlpha",0);
         _loc1_.setStyle("borderAlpha",0);
         _loc1_.id = "userList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userList = _loc1_;
         BindingManager.executeBindings(this,"userList",this.userList);
         return _loc1_;
      }
      
      private function _InviteFriendContent_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = InviteFriendContentInnerClass0;
         _loc1_.properties = {"outerDocument":this};
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InviteFriendContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._InviteFriendContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InviteFriendContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 14;
         _loc1_.setStyle("skinClass",WindowHeaderLineSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _InviteFriendContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_20;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get description() : StandardText
      {
         return this._1724546052description;
      }
      
      public function set description(param1:StandardText) : void
      {
         var _loc2_:Object = this._1724546052description;
         if(_loc2_ !== param1)
         {
            this._1724546052description = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"description",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get descriptionMultipleFound() : StandardText
      {
         return this._1595649866descriptionMultipleFound;
      }
      
      public function set descriptionMultipleFound(param1:StandardText) : void
      {
         var _loc2_:Object = this._1595649866descriptionMultipleFound;
         if(_loc2_ !== param1)
         {
            this._1595649866descriptionMultipleFound = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"descriptionMultipleFound",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get header() : WindowHeader
      {
         return this._1221270899header;
      }
      
      public function set header(param1:WindowHeader) : void
      {
         var _loc2_:Object = this._1221270899header;
         if(_loc2_ !== param1)
         {
            this._1221270899header = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"header",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get levelGradient() : GradientText
      {
         return this._1087517396levelGradient;
      }
      
      public function set levelGradient(param1:GradientText) : void
      {
         var _loc2_:Object = this._1087517396levelGradient;
         if(_loc2_ !== param1)
         {
            this._1087517396levelGradient = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"levelGradient",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get multipleChoiceState() : Group
      {
         return this._994077504multipleChoiceState;
      }
      
      public function set multipleChoiceState(param1:Group) : void
      {
         var _loc2_:Object = this._994077504multipleChoiceState;
         if(_loc2_ !== param1)
         {
            this._994077504multipleChoiceState = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"multipleChoiceState",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get okButton() : Button
      {
         return this._1641788370okButton;
      }
      
      public function set okButton(param1:Button) : void
      {
         var _loc2_:Object = this._1641788370okButton;
         if(_loc2_ !== param1)
         {
            this._1641788370okButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"okButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get preloaderImage() : Image
      {
         return this._876869253preloaderImage;
      }
      
      public function set preloaderImage(param1:Image) : void
      {
         var _loc2_:Object = this._876869253preloaderImage;
         if(_loc2_ !== param1)
         {
            this._876869253preloaderImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"preloaderImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get searchUsername() : Group
      {
         return this._1890724510searchUsername;
      }
      
      public function set searchUsername(param1:Group) : void
      {
         var _loc2_:Object = this._1890724510searchUsername;
         if(_loc2_ !== param1)
         {
            this._1890724510searchUsername = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"searchUsername",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get succesState() : Group
      {
         return this._1296905215succesState;
      }
      
      public function set succesState(param1:Group) : void
      {
         var _loc2_:Object = this._1296905215succesState;
         if(_loc2_ !== param1)
         {
            this._1296905215succesState = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"succesState",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get success() : StandardText
      {
         return this._1867169789success;
      }
      
      public function set success(param1:StandardText) : void
      {
         var _loc2_:Object = this._1867169789success;
         if(_loc2_ !== param1)
         {
            this._1867169789success = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"success",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userIdGradient() : GradientText
      {
         return this._1392894870userIdGradient;
      }
      
      public function set userIdGradient(param1:GradientText) : void
      {
         var _loc2_:Object = this._1392894870userIdGradient;
         if(_loc2_ !== param1)
         {
            this._1392894870userIdGradient = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userIdGradient",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userList() : List
      {
         return this._266718455userList;
      }
      
      public function set userList(param1:List) : void
      {
         var _loc2_:Object = this._266718455userList;
         if(_loc2_ !== param1)
         {
            this._266718455userList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get username() : StandardTextInput
      {
         return this._265713450username;
      }
      
      public function set username(param1:StandardTextInput) : void
      {
         var _loc2_:Object = this._265713450username;
         if(_loc2_ !== param1)
         {
            this._265713450username = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"username",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get usernameGradient() : GradientText
      {
         return this._210284070usernameGradient;
      }
      
      public function set usernameGradient(param1:GradientText) : void
      {
         var _loc2_:Object = this._210284070usernameGradient;
         if(_loc2_ !== param1)
         {
            this._210284070usernameGradient = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"usernameGradient",_loc2_,param1));
            }
         }
      }
   }
}

