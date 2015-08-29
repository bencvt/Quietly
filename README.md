# Quietly by bencvt

**Quietly** is a simple addon that defines the `/q` console command, intended to be used in macros to temporarily suppress error messages and "I can't cast that yet" error sounds.

Using the `/q` command instead of the longhand saves over 90 characters, giving you much more room to work within WoW's 255-character limit for macros.

As an example, this is the macro I use on my Troll Balance Druid to pop all available off-GCD cooldowns and apply Moonfire/Sunfire in a single keybind:

>`#showtooltip Celestial Alignment`  
>`/q`  
>`/use 13`  
>`/use Berserking`  
>`/use Nature's Vigil`  
>`/use Celestial Alignment`  
>`/q`  
>`/use [@mouseover,harm,nodead][]Moonfire`

Even if one of the cooldowns isn't up, there won't be red error text or an "I can't cast that yet" voiceover. Hooray!

The first `/q` is equivalent to:

>`/console Sound_EnableErrorSpeech 0`  
>`/run UIErrorsFrame:Clear()`

And the second is equivalent to:

>`/console Sound_EnableErrorSpeech 1`  
>`/run UIErrorsFrame:Clear()`

Note that you don't actually have to include the second `/q` in your macro. It will happen automatically after your macro completes. You only need to explicitly include the second `/q` if you want errors enabled for the final part of your macro.

## Links

For players:

 * Download and install this addon from http://www.curse.com/addons/wow/quietly

For developers:

 * Main project site: http://wow.curseforge.com/addons/quietly/
 * GitHub mirror: https://github.com/bencvt/Quietly
