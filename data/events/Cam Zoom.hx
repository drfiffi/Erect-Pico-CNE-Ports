function onEvent(_) {
    if (_.event.name == 'Cam Zoom') {
        if (_.event.params[1] == null || _.event.params[2] == null){
            defaultCamZoom = _.event.params[0];
        } else {
            FlxTween.cancelTweensOf(FlxG.camera, ['zoom']);
            FlxTween.tween(FlxG.camera, {zoom: _.event.params[0]}, (Conductor.stepCrochet / 1000) * _.event.params[1], {ease: Reflect.field(FlxEase, _.event.params[2]), onComplete: function(value) {defaultCamZoom = FlxG.camera.zoom;}});
        }
    }
}