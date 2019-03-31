#!/bin/bash
if [[ "$1" = "switchDarkMode" ]]; then
osascript <<EOD
    tell application "System Events"
        tell appearance preferences
            set dark mode to not dark mode
        end tell
    end tell
EOD
fi

if [[ "$1" = "switchHideDesktop" ]]; then
osascript <<EOD
    try
        set CurSet to do shell script "defaults read com.apple.finder CreateDesktop"
        on error
        set CurSet to "1"
    end try
    if CurSet is "1" then
        set NewSet to false
    else
        set NewSet to true
    end if
    do shell script "defaults write com.apple.finder CreateDesktop -bool " & NewSet
    tell application "Finder"
        quit
        try
            activate
        end try
    end tell
EOD
fi

echo "⇋"
echo "---"
echo "Hide/Show Desktop Icons| bash='$0' param1=switchHideDesktop terminal=false"
echo "Switch Light/Dark Mode| bash='$0' param1=switchDarkMode terminal=false";
