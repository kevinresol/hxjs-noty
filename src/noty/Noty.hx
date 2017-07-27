package noty;

import haxe.Constraints;
import haxe.extern.EitherType;

#if noty_global
@:native('Noty')
#else
@:require('noty')
#end
extern class Noty {
	@:overload(function(queueName:String):Void {})
	static function closeAll():Void;
	
	@:overload(function(v:Int, queueName:String):Void {})
	static function setMaxVisible(v:Int, ?queueName:String):Void;
	
	static function button(text:String, className:String, callback:Void->Void, ?attributes:{}):NotyButton;
	
	function new(options:Options);
	
	function show():Noty;
	
	function close():Noty;
	
	@:overload(function(v:String, overwrite:Bool):Noty {})
	function setText(v:String):Void;
	
	@:overload(function(v:String, overwrite:Bool):Noty {})
	function setType(v:String):Void;
	
	@:overload(function(v:String, overwrite:Bool):Noty {})
	function setTheme(v:String):Noty;
	
	function setTimeout(v:Timeout):Noty;
	
	function stop():Noty;
	
	function resume():Noty;
	
	function on(event:String, callback:Function):Noty;
}

typedef Timeout = EitherType<Bool, Int>;

typedef Options = {
	?type:Type,
	?layout:Layout,
	?theme:String,
	?text:String,
	?timeout:Timeout,
	?progressBar:Bool,
	?closeWith:Array<String>,
	?animation: {
		?open:EitherType<String, Function>,
		?close:EitherType<String, Function>,
	},
	?id:EitherType<Bool, String>,
	?force:Bool,
	?killer:EitherType<Bool, String>,
	?queue:String,
	?container:EitherType<Bool, String>,
	?buttons:Array<NotyButton>,
	?sounds: {
		?sources:Array<String>,
		?volume:Int,
		?conditions:Array<String>,
	},
	?docTitle: {
		?conditions:Array<String>,
	},
	?titleCount: {
		?conditions:Array<String>,
	},
	?modal:Bool,
	?callbacks: {
		?beforeShow:Void->Void,
		?onShow:Void->Void,
		?afterShow:Void->Void,
		?onClose:Void->Void,
		?afterClose:Void->Void,
		?onHover:Void->Void,
		?onTemplate:Void->Void,
	},
}

@:enum
abstract Layout(String) {
	var Top = 'top';
	var TopLeft = 'topLeft';
	var TopCenter = 'topCenter';
	var TopRight = 'topRight';
	var Center = 'center';
	var CenterLeft = 'centerLeft';
	var CenterRight = 'centerRight';
	var Bottom = 'bottom';
	var BottomLeft = 'bottomLeft';
	var BottomCenter = 'bottomCenter';
	var BottomRight = 'bottomRight';
}

@:enum
abstract Type(String) {
	var Alert = 'alert';
	var Success = 'success';
	var Error = 'error';
	var Warning = 'warning';
	var Info = 'info';
}

extern class NotyButton {
	
}