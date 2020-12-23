# customization and personalization

$profile | Format-List -Force

# Create a new profile file
New-Item -Type file -Force $profile

Notepad $profile

# Change the PS Prompt
# function Prompt
# {
#   "PS [$env:COMPUTERNAME] >"
# }

# Tab Completion mod
Get-Content Function:\TabExpansion2

# User Input
# PSConsoleHostReadLine

# Command Resolution

# Properties of $executionContext.SessionState.InvokeCommand where you can assign a script bloack
# 1. PreCommandLookupAction
# 2. PostCommandLookupAction
# 3. CommandNotFoundAction 

# Each script block takes two arguments: CommandName and CommandLookupEventArgs

$executionContext.SessionState.InvokeCommand.CommandNotFoundAction = {
param($CommandName, $CommandLookupEventArgs)
    (...)
}