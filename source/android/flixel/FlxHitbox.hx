package android.flixel;

import android.flixel.FlxButton;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxDestroyUtil;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.group.FlxSpriteGroup;
import openfl.utils.Assets;

/**
 * A zone with 4 buttons (A hitbox).
 * It's easy to customize the layout.
 *
 * @author: Saw (M.A. Jigsaw)
 */

 /**
 * This is an Edited Version, that was made for indie cross port
 * Edited Version Contains 3 additional hitboxes at the top or at the bottom, check second parametr
 * @author: Sirox
 */
class FlxHitbox extends FlxSpriteGroup
{
	public var buttonLeft:FlxButton = new FlxButton(0, 0);
	public var buttonDown:FlxButton = new FlxButton(0, 0);
	public var buttonUp:FlxButton = new FlxButton(0, 0);
	public var buttonRight:FlxButton = new FlxButton(0, 0);

	public var buttonSpace:FlxButton = new FlxButton(0, 0);
	public var buttonSpaceLeft:FlxButton = new FlxButton(0, 0);
	public var buttonSpaceRight:FlxButton = new FlxButton(0, 0);

	var addNewHitNum:Int = 0;

	/**
	 * Create the zone.
	 */
	public function new(addNewHitNum:Int = 0)
	{
		super();

		this.addNewHitNum = addNewHitNum;

		scrollFactor.set();

		switch (addNewHitNum)
		{
			case 0:
				add(buttonLeft = createHint(0, 0, 'left', 0xFF00FF));
				add(buttonDown = createHint(320, 0, 'down', 0x00FFFF));
				add(buttonUp = createHint(640, 0, 'up', 0x00FF00));
				add(buttonRight = createHint(960, 0, 'right', 0xFF0000));
			case 1 | 4:
				if (FlxG.save.data.mechsInputVariants)
				{
					add(buttonLeft = createHint(0, 0, 'left', 0xFF00FF));
					add(buttonDown = createHint(320, 0, 'down', 0x00FFFF));
					add(buttonUp = createHint(640, 0, 'up', 0x00FF00));
					add(buttonRight = createHint(960, 0, 'right', 0xFF0000));
					if (addNewHitNum == 1)
						add(buttonSpace = createHint(0, 540, 'space', 0xFFFF00));
					else if (addNewHitNum == 4)
						add(buttonSpace = createHint(0, 540, 'space', 0xFF0000));
				}
				else if (!FlxG.save.data.mechsInputVariants)
				{
					if (addNewHitNum == 1)
						add(buttonSpace = createHint(0, 0, 'space', 0xFFFF00));
					else if (addNewHitNum == 4)
						add(buttonSpace = createHint(0, 0, 'space', 0xFF0000));
					add(buttonLeft = createHint(0, 180, 'left', 0xFF00FF));
					add(buttonDown = createHint(320, 180, 'down', 0x00FFFF));
					add(buttonUp = createHint(640, 180, 'up', 0x00FF00));
					add(buttonRight = createHint(960, 180, 'right', 0xFF0000));
				}
			case 2:
				if (FlxG.save.data.mechsInputVariants)
				{
					add(buttonLeft = createHint(0, 0, 'left', 0xFF00FF));
					add(buttonDown = createHint(320, 0, 'down', 0x00FFFF));
					add(buttonUp = createHint(640, 0, 'up', 0x00FF00));
					add(buttonRight = createHint(960, 0, 'right', 0xFF0000));
					add(buttonSpaceLeft = createHint(0, 540, 'space_left', 0xFF0000));
					add(buttonSpaceRight = createHint(640, 540, 'space_right', 0xFFFF00));
				}
				else if (!FlxG.save.data.mechsInputVariants)
				{
					add(buttonSpaceLeft = createHint(0, 0, 'space_left', 0xFF0000));
					add(buttonSpaceRight = createHint(640, 0, 'space_right', 0xFFFF00));
					add(buttonLeft = createHint(0, 180, 'left', 0xFF00FF));
					add(buttonDown = createHint(320, 180, 'down', 0x00FFFF));
					add(buttonUp = createHint(640, 180, 'up', 0x00FF00));
					add(buttonRight = createHint(960, 180, 'right', 0xFF0000));
				}
			case 3:
				if (FlxG.save.data.mechsInputVariants)
				{
					add(buttonLeft = createHint(0, 0, 'left', 0xFF00FF));
					add(buttonDown = createHint(320, 0, 'down', 0x00FFFF));
					add(buttonUp = createHint(640, 0, 'up', 0x00FF00));
					add(buttonRight = createHint(960, 0, 'right', 0xFF0000));
					add(buttonSpaceLeft = createHint(0, 540, 'space_left', 0xFF0000));
					add(buttonSpace = createHint(426, 540, 'space_mid', 0xFFFF00));
					add(buttonSpaceRight = createHint(852, 540, 'space_right', 0xFF0000));
				}
				else if (!FlxG.save.data.mechsInputVariants)
				{
					add(buttonSpaceLeft = createHint(0, 0, 'space_left', 0xFF0000));
					add(buttonSpace = createHint(426, 0, 'space_mid', 0xFFFF00));
					add(buttonSpaceRight = createHint(852, 0, 'space_right', 0xFF0000));
					add(buttonLeft = createHint(0, 180, 'left', 0xFF00FF));
					add(buttonDown = createHint(320, 180, 'down', 0x00FFFF));
					add(buttonUp = createHint(640, 180, 'up', 0x00FF00));
					add(buttonRight = createHint(960, 180, 'right', 0xFF0000));
				}
		}
	}

	/**
	 * Clean up memory.
	 */
	override function destroy()
	{
		super.destroy();

		buttonLeft = null;
		buttonDown = null;
		buttonUp = null;
		buttonRight = null;
		buttonSpace = null;
		buttonSpaceLeft = null;
		buttonSpaceRight = null;
	}

	private function createHint(X:Float, Y:Float, Graphic:String, Color:Int = 0xFFFFFF):FlxButton
	{
		var hintTween:FlxTween = null;
		var hint:FlxButton = new FlxButton(X, Y);

		switch (addNewHitNum)
		{
			case 0:
				hint.loadGraphic(FlxGraphic.fromFrame(FlxAtlasFrames.fromSparrow(Assets.getBitmapData('assets/android/hitbox.png'), Assets.getText('assets/android/hitbox.xml')).getByName(Graphic)));
			case 1 | 4:
				if (FlxG.save.data.mechsInputVariants)
					hint.loadGraphic(FlxGraphic.fromFrame(FlxAtlasFrames.fromSparrow(Assets.getBitmapData('assets/android/hitbox_one.png'), Assets.getText('assets/android/hitbox_one.xml')).getByName(Graphic)));
				else if (!FlxG.save.data.mechsInputVariants)
					hint.loadGraphic(FlxGraphic.fromFrame(FlxAtlasFrames.fromSparrow(Assets.getBitmapData('assets/android/hitbox_one_up.png'), Assets.getText('assets/android/hitbox_one_up.xml')).getByName(Graphic)));
			case 2:
				if (FlxG.save.data.mechsInputVariants)
					hint.loadGraphic(FlxGraphic.fromFrame(FlxAtlasFrames.fromSparrow(Assets.getBitmapData('assets/android/hitbox_two.png'), Assets.getText('assets/android/hitbox_two.xml')).getByName(Graphic)));
				else if (!FlxG.save.data.mechsInputVariants)
					hint.loadGraphic(FlxGraphic.fromFrame(FlxAtlasFrames.fromSparrow(Assets.getBitmapData('assets/android/hitbox_two_up.png'), Assets.getText('assets/android/hitbox_two_up.xml')).getByName(Graphic)));
			case 3:
				if (FlxG.save.data.mechsInputVariants)
					hint.loadGraphic(FlxGraphic.fromFrame(FlxAtlasFrames.fromSparrow(Assets.getBitmapData('assets/android/hitbox_three.png'), Assets.getText('assets/android/hitbox_three.xml')).getByName(Graphic)));
				else if (!FlxG.save.data.mechsInputVariants)
					hint.loadGraphic(FlxGraphic.fromFrame(FlxAtlasFrames.fromSparrow(Assets.getBitmapData('assets/android/hitbox_three_up.png'), Assets.getText('assets/android/hitbox_three_up.xml')).getByName(Graphic)));
		}

		hint.solid = false;
		hint.immovable = true;
		hint.scrollFactor.set();
		hint.color = Color;
		hint.alpha = 0.00001;
		hint.onDown.callback = function()
		{
			if (hintTween != null)
				hintTween.cancel();

			hintTween = FlxTween.tween(hint, {alpha: AndroidControls.getOpacity()}, 0.01, {
				ease: FlxEase.circInOut,
				onComplete: function(twn:FlxTween)
				{
					hintTween = null;
				}
			});
		}
		hint.onUp.callback = function()
		{
			if (hintTween != null)
				hintTween.cancel();

			hintTween = FlxTween.tween(hint, {alpha: 0.00001}, 0.1, {
				ease: FlxEase.circInOut,
				onComplete: function(twn:FlxTween)
				{
					hintTween = null;
				}
			});
		}
		hint.onOver.callback = hint.onDown.callback;
		hint.onOut.callback = hint.onUp.callback;
		#if FLX_DEBUG
		hint.ignoreDrawDebug = true;
		#end
		return hint;
	}
}
