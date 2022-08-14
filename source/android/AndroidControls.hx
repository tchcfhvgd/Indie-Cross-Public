package android;

import android.flixel.FlxHitbox;
import android.flixel.FlxVirtualPad;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.util.FlxDestroyUtil;
import android.flixel.FlxHitbox.Modes;

class AndroidControls extends FlxSpriteGroup
{
	public var hitbox:FlxHitbox;

	public function new(mechsType:Modes = DEFAULT)
	{
		super();

	        hitbox = new FlxHitbox(mechsType);
		add(hitbox);
	}

	override public function destroy():Void
	{
		super.destroy();

		if (hitbox != null)
		{
			hitbox = FlxDestroyUtil.destroy(hitbox);
			hitbox = null;
		}
	}

	public static function setOpacity(opacity:Float = 0.6):Void
	{
		FlxG.save.data.androidControlsOpacity = opacity;
		FlxG.save.flush();
	}

	public static function getOpacity():Float
	{
		if (FlxG.save.data.androidControlsOpacity == null)
		{
			FlxG.save.data.androidControlsOpacity = 0.6;
			FlxG.save.flush();
		}

		return FlxG.save.data.androidControlsOpacity;
	}
}
