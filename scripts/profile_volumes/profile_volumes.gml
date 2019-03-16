/// @description profile_volumes()
/// @function profile_volumes

audio_group_set_gain(audiogroup_game, global.setting_sfx * 0.1, 0)
audio_sound_gain(musicMainMenu, global.setting_music * 0.09, 0)
audio_sound_gain(musicStage1, global.setting_music * 0.1, 0)
audio_sound_gain(musicStage2, global.setting_music * 0.1, 0)
audio_sound_gain(musicStage3, global.setting_music * 0.1, 0)
audio_sound_gain(musicStage4, global.setting_music * 0.1, 0)
audio_sound_gain(musicStage5, global.setting_music * 0.1, 0)
audio_sound_gain(musicStage6, global.setting_music * 0.1, 0)
audio_sound_gain(musicBoss, global.setting_music * 0.1, 0)
audio_sound_gain(soundShotPlayer, global.setting_sfx * 0.1, 0)
audio_sound_gain(soundShotEnemy, global.setting_sfx * 0.1, 0)

return true