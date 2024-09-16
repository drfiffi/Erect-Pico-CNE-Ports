public var lightningStrike:Bool = true;
public var lightningStrikeBeat:Int = 0;
public var lightningOffset:Int = 8;
public var thunderSFXamount:Int = 2;

function create() {
	camZooming = true;
	for(i in 1...thunderSFXamount+1)
	FlxG.sound.load(Paths.sound('thunder_' + Std.string(i)));
	strumLines.members[1].characters[1].alpha = 0;
	strumLines.members[0].characters[1].alpha = 0;
	strumLines.members[2].characters[1].alpha = 0;
}
public function lightningStrikeShit():Void
{
	FlxG.sound.play(Paths.soundRandom('thunder_', 1, thunderSFXamount));

	lightningStrikeBeat = curBeat;
	lightningOffset = FlxG.random.int(8, 24);

	strumLines.members[1].characters[0].playAnim('scared', true, "SING"); // SING so that they dont get indefinitely looped
	strumLines.members[1].characters[1].playAnim('scared', true, "SING"); // SING so that they dont get indefinitely looped

	strumLines.members[2].characters[0].playAnim('scared', true, "SING"); // SING so that they dont get indefinitely looped
	strumLines.members[2].characters[1].playAnim('scared', true, "SING"); // SING so that they dont get indefinitely looped

	strumLines.members[1].characters[1].alpha = 1;
	strumLines.members[0].characters[1].alpha = 1;
	strumLines.members[2].characters[1].alpha = 1;
	stairsLight.alpha = 1;
	bgLight.alpha = 1;

	new FlxTimer().start(0.06, function(_) {
		strumLines.members[1].characters[1].alpha = 0;
		strumLines.members[0].characters[1].alpha = 0;
		strumLines.members[2].characters[1].alpha = 0;
		stairsLight.alpha = 0;
		bgLight.alpha = 0;
	});

	new FlxTimer().start(0.12, function(_) {
		strumLines.members[1].characters[1].alpha = 1;
		strumLines.members[0].characters[1].alpha = 1;
		strumLines.members[2].characters[1].alpha = 1;
		stairsLight.alpha = 1;
		bgLight.alpha = 1;

		FlxTween.tween(strumLines.members[1].characters[1], {alpha: 0}, 1.5);
		FlxTween.tween(strumLines.members[0].characters[1], {alpha: 0}, 1.5);
		FlxTween.tween(strumLines.members[2].characters[1], {alpha: 0}, 1.5);
		FlxTween.tween(stairsLight, {alpha: 0}, 1.5);
		FlxTween.tween(bgLight, {alpha: 0}, 1.5);
	});
}

function beatHit(curBeat) {
	if (lightningStrike && FlxG.random.bool(10) && curBeat > lightningStrikeBeat + lightningOffset)
	{
		lightningStrikeShit();
	}
}