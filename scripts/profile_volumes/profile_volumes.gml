/// @description profile_volumes()
/// @function profile_volumes

audio_group_set_gain(audiogroup_game, global.setting_sfx / 10, 0)
audio_sound_gain(musicMainMenu,  global.setting_music / 10, 0)
audio_sound_gain(musicStage1,  global.setting_music / 10, 0)
audio_sound_gain(musicStage2,  global.setting_music / 10, 0)
audio_sound_gain(musicStageFrame,  global.setting_music / 10, 0)
audio_sound_gain(musicStage5,  global.setting_music / 10, 0)
audio_sound_gain(musicLastStage,  global.setting_music / 10, 0)

return true