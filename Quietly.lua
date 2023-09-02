local PREFIX = "|cff33ff99"..(...).."|r:"
local LOCALE = GetLocale()
local C_TimerAfter, GetSpellInfo, SetCVar, SlashCmdList, UIErrorsFrame, print = C_Timer.After, GetSpellInfo, SetCVar, SlashCmdList, UIErrorsFrame, print
local needTimer = true
local cmd0, cmd1, cmdNext

cmd0 = function()
  SetCVar("Sound_EnableErrorSpeech", 0)
  UIErrorsFrame:Clear()
  cmdNext = cmd1
end

cmd1 = function()
  SetCVar("Sound_EnableErrorSpeech", 1)
  UIErrorsFrame:Clear()
  cmdNext = cmd0
end

cmdNext = cmd0

local function printHelp()
  if LOCALE == "esES" or LOCALE == "esMX" then
    print(PREFIX, "Utilice /q en macros para eliminar temporalmente (o para restaurar, si se utiliza dos veces) mensajes de error. Por ejemplo:")
  else
    print(PREFIX, "Use /q in macros to temporarily suppress (or unsuppress, if used twice) error messages. For example:")
  end
  print("|cff999999#showtooltip "..GetSpellInfo(58381).."|r") -- Mind Flay
  print("|cff999999/q|r")
  print("|cff999999/use "..GetSpellInfo(26297).."|r") -- Berserking
  print("|cff999999/use "..GetSpellInfo(14751).."|r") -- Inner Focus
  print("|cff999999/use 10|r")
  print("|cff999999/use 13|r")
  print("|cff999999/q|r")
  print("|cff999999/use "..GetSpellInfo(58381).."|r") -- Mind Flay
end

local function timerDone()
  needTimer = true
  if cmdNext ~= cmd0 then
    -- /q was called an odd number of times (probably just once) in the last
    -- frame. Let me fix that for you.
    cmd1()
  end
end

SLASH_Q1 = "/q"
SlashCmdList["Q"] = function(args)
  if args and args ~= "" then
    printHelp()
    return
  end
  cmdNext()
  if needTimer then
    needTimer = false
    -- Duration of 0 means timerDone will get called in the same frame,
    -- but after the macro is done.
    C_TimerAfter(0, timerDone)
  end
end
