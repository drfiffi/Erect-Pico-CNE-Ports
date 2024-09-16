import openfl.display.BlendMode;

var adjustColorBF = new CustomShader('adjustColor');
var adjustColorDad = new CustomShader('adjustColor');
var adjustColorGF = new CustomShader('adjustColor');

function create(){
    boyfriend.shader = adjustColorBF;
    dad.shader = adjustColorDad;
    gf.shader = adjustColorGF;

    adjustColorBF.brightness = -23;
    adjustColorBF.hue = 12;
    adjustColorBF.contrast = 7;
	adjustColorBF.saturation = 0;

    adjustColorDad.brightness = -33;
    adjustColorDad.hue = -32;
    adjustColorDad.contrast = -23;
    adjustColorDad.saturation = 0;

    adjustColorGF.brightness = -30;
    adjustColorGF.hue = -9;
    adjustColorGF.contrast = -4;
	adjustColorGF.saturation = 0;

    brightLightSmall.blend = 0;
    lightOrange.blend = 0;
    lightGreen.blend = 0;
    lightRed.blend = 0;
    lightAbove.blend = 0;
}