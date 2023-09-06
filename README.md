# Quietly by bencvt

**Quietly** is a simple addon that defines the `/q` console command, intended to be used in macros to temporarily suppress error messages and "I can't cast that yet" error sounds.

Using the `/q` command instead of the longhand saves over 90 characters, giving you much more room to work within WoW's 255-character limit for macros.

As an example, here's a Wrath Classic macro for a troll shadow priest to pop all available off-GCD cooldowns and start channeling a big mind flay in a single keybind:

>`#showtooltip Mind Flay`  
>`/q`  
>`/use Berserking`  
>`/use Inner Focus`  
>`/use 10`  
>`/use 13`  
>`/q`  
>`/use Mind Flay`  

Even if one of the cooldowns isn't up, there won't be red error text or an "I can't cast that yet" voiceover. Hooray!

The first `/q` is equivalent to:

>`/console Sound_EnableErrorSpeech 0`  
>`/run UIErrorsFrame:Clear()`

And the second is equivalent to:

>`/console Sound_EnableErrorSpeech 1`  
>`/run UIErrorsFrame:Clear()`

Note that you don't actually have to include the second `/q` in your macro. It will happen automatically after your macro completes. You only need to explicitly include the second `/q` if you want errors enabled for the final part of your macro.

## Links

 * https://www.curseforge.com/wow/addons/quietly - download and install this addon from CurseForge, or use your addon manager of choice
 * https://github.com/bencvt/Quietly - source repo