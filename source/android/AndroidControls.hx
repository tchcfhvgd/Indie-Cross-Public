package android;

import android.flixel.FlxHitbox;
import android.flixel.FlxVirtualPad;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.util.FlxDestroyUtil;

class AndroidControls extends FlxSpriteGroup
{
	public var hitbox:FlxHitbox;

	public function new(mechsType:Int = 0)
	{
		super();

		switch (mechsType)
		{
			case 4:
				hitbox = new FlxHitbox(4);
				add(hitbox);
			case 3:
				hitbox = new FlxHitbox(3);
				add(hitbox);
			case 2:
				hitbox = new FlxHitbox(2);
				add(hitbox);
			case 1:
				hitbox = new FlxHitbox(1);
				add(hitbox);
			default:
				hitbox = new FlxHitbox(0);
				add(hitbox);
		}
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
