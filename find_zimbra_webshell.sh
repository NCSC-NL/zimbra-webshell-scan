#!/bin/bash

set -e

# Search for the settings.js file
version_line=$(grep -oP 'this\.registerSetting\("CLIENT_VERSION",.*?defaultValue:"\K[0-9]+\.[0-9]+\.[0-9]+' /opt/zimbra/jetty_base/webapps/zimbra/js/zimbraMail/share/model/ZmSettings.js)

if [[ -z "$version_line" ]]; then
    echo "Version string not found in settings.js"
    exit 1
fi

# Extract the version number
version_number=$(echo "$version_line" | grep -oP '^[0-9]+')

echo "Extracted version number: $version_number"

# Webshell scan per version number and path
# Version 9 - /zimbra/public/
if [[ $version_number -eq 9 ]]; then
    echo "Running Zimbra webshell scan for version 9."
    find /opt/zimbra/jetty_base/webapps/zimbra/public -type f | grep -v -Ff <(cat << EOF
/opt/zimbra/jetty_base/webapps/zimbra/public/5xx.html
/opt/zimbra/jetty_base/webapps/zimbra/public/Boot.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/Offline.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/PasswordRecovery.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/Resources.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/TwoFactorSetup.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/addressVerification.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/blank.html
/opt/zimbra/jetty_base/webapps/zimbra/public/blankHistory.html
/opt/zimbra/jetty_base/webapps/zimbra/public/empty.html
/opt/zimbra/jetty_base/webapps/zimbra/public/error.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/extuserprov.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/insecureResponse.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/launch.html
/opt/zimbra/jetty_base/webapps/zimbra/public/launchNewWindow.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/launchZCS.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/404.html
/opt/zimbra/jetty_base/webapps/zimbra/public/flash
/opt/zimbra/jetty_base/webapps/zimbra/public/loadImgData.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/login.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/modern.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/pre-cache.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/secureRequest.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/setResourceBundle.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/com_zimbra_smime.jarx
/opt/zimbra/jetty_base/webapps/zimbra/public/proto
/opt/zimbra/jetty_base/webapps/zimbra/public/sounds
/opt/zimbra/jetty_base/webapps/zimbra/public/tmp
/opt/zimbra/jetty_base/webapps/zimbra/public/flash/player_mp3_maxi.swf
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Alert.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Boot.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Briefcase.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/BriefcaseCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Calendar.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/CalendarAppt.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/CalendarCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Clipboard.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Contacts.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/ContactsCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Crypt.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Debug.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Docs.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/DocsPreview.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Extras.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/ImportExport.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/JQuery.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Leaks.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Mail.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/MailCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/NewWindow_1.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/NewWindow_2.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/PasswordRecovery.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Portal.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Preferences.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/PreferencesCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Share.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Startup1_1.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Startup1_2.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Startup2.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Tasks.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/TasksCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/TinyMCE.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/TwoFactor.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/UnitTest.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Voicemail.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/XForms.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Zimbra.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Zimlet.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/ZimletApp.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Ajax.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/proto/index.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/sounds/im
/opt/zimbra/jetty_base/webapps/zimbra/public/tmp/jive.png
/opt/zimbra/jetty_base/webapps/zimbra/public/tmp/msn.png
/opt/zimbra/jetty_base/webapps/zimbra/public/tmp/yahoo.png
/opt/zimbra/jetty_base/webapps/zimbra/public/tmp/aol.png
/opt/zimbra/jetty_base/webapps/zimbra/public/sounds/im/notify.wav
/opt/zimbra/jetty_base/webapps/zimbra/public/sounds/im/alert.wav
EOF
)

#Version 9 - /zimbraAdmin/public/
find /opt/zimbra/jetty_base/webapps/zimbraAdmin/public -type f | grep -v -Ff <(cat << EOF
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/5xx.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/Boot.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/Offline.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/Resources.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/admin.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/blank.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/blankHistory.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/empty.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/launch.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/loadImgData.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/noscript.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/pre-cache.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/404.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Ajax.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Boot.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Chartjs.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Clipboard.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Debug.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/JQuery.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/XForms.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Zimbra.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Admin.jsp
EOF
)

#Version 9 - /spool/public/
find /opt/zimbra/data/postfix/spool/public -type f | grep -v -Ff <(cat << EOF
/opt/zimbra/data/postfix/spool/public/pickup
/opt/zimbra/data/postfix/spool/public/cleanup
/opt/zimbra/data/postfix/spool/public/qmgr
/opt/zimbra/data/postfix/spool/public/flush
/opt/zimbra/data/postfix/spool/public/showq
EOF
)

#End of version 9 check
fi


if [[ $version_number -eq 8 ]]; then
    echo "Running Zimbra webshell scan for version 8."

#Version 8 - /zimbra/public/
find /opt/zimbra/jetty_base/webapps/zimbra/public -type f | grep -v -Ff <(cat << EOF
/opt/zimbra/jetty_base/webapps/zimbra/public/flash
/opt/zimbra/jetty_base/webapps/zimbra/public/flash/player_mp3_maxi.swf
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Ajax.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Alert.ja
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Boot.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Briefcase.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/BriefcaseCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Calendar.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/CalendarAppt.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/CalendarCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Clipboard.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Contacts.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/ContactsCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Crypt.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Debug.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Docs.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/DocsPreview.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Extras.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/ImportExport.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/JQuery.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Leaks.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Mail.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/MailCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/NewWindow_1.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/NewWindow_2.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/PasswordRecovery.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Portal.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Preferences.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/PreferencesCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Share.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Startup1_1.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Startup1_2.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Startup2.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Tasks.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/TasksCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/TinyMCE.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/TwoFactor.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/UnitTest.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Voicemail.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/XForms.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Zimbra.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Zimlet.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/ZimletApp.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/proto
/opt/zimbra/jetty_base/webapps/zimbra/public/proto/index.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/sounds
/opt/zimbra/jetty_base/webapps/zimbra/public/sounds/im
/opt/zimbra/jetty_base/webapps/zimbra/public/sounds/im/alert.wav
/opt/zimbra/jetty_base/webapps/zimbra/public/sounds/im/notify.wav
/opt/zimbra/jetty_base/webapps/zimbra/public/tmp
/opt/zimbra/jetty_base/webapps/zimbra/public/tmp/aol.png
/opt/zimbra/jetty_base/webapps/zimbra/public/tmp/jive.png
/opt/zimbra/jetty_base/webapps/zimbra/public/tmp/msn.png
/opt/zimbra/jetty_base/webapps/zimbra/public/tmp/yahoo.png
/opt/zimbra/jetty_base/webapps/zimbra/public/loginTouch.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/404.html
/opt/zimbra/jetty_base/webapps/zimbra/public/5xx.html
/opt/zimbra/jetty_base/webapps/zimbra/public/Boot.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/Offline.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/PasswordRecovery.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/Resources.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/TwoFactorSetup.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/addressVerification.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/blank.html
/opt/zimbra/jetty_base/webapps/zimbra/public/blankHistory.html
/opt/zimbra/jetty_base/webapps/zimbra/public/empty.html
/opt/zimbra/jetty_base/webapps/zimbra/public/error.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/extuserprov.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/insecureResponse.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/launch.html
/opt/zimbra/jetty_base/webapps/zimbra/public/launchNewWindow.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/launchZCS.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/loadImgData.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/login.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/noscript.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/pre-cache.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/search.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/secureRequest.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/setResourceBundle.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/zimbrax.jsp
EOF
)

#Version 8 - /zimbraAdmin/public/
find /opt/zimbra/jetty_base/webapps/zimbraAdmin/public -type f | grep -v -Ff <(cat << EOF
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/404.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/5xx.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/admin.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/blankHistory.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/blank.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/Boot.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/empty.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Admin.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Ajax.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Boot.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Chartjs.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Clipboard.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Debug.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/JQuery.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/XForms.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Zimbra.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/launch.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/loadImgData.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/noscript.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/Offline.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/pre-cache.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/Resources.jsp
EOF
)

#End of version 8 check
fi

if [[ $version_number -eq 10 ]]; then
    echo "Running Zimbra webshell scan for version 10."

#Version 10 - /zimbra/public/
find /opt/zimbra/jetty_base/webapps/zimbra/public -type f | grep -v -Ff <(cat << EOF
/opt/zimbra/jetty_base/webapps/zimbra/public/flash
/opt/zimbra/jetty_base/webapps/zimbra/public/flash/player_mp3_maxi.swf
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Ajax.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Alert.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Boot.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Briefcase.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/BriefcaseCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Calendar.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/CalendarAppt.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/CalendarCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Clipboard.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Contacts.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/ContactsCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Crypt.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Debug.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Docs.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/DocsPreview.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Extras.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/ImportExport.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/JQuery.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Leaks.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Mail.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/MailCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/NewWindow_1.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/NewWindow_2.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/PasswordRecovery.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Portal.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Preferences.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/PreferencesCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Share.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Startup1_1.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Startup1_2.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Startup2.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Tasks.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/TasksCore.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/TinyMCE.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/TwoFactor.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/UnitTest.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Voicemail.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/XForms.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Zimbra.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/Zimlet.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/jsp/ZimletApp.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/proto
/opt/zimbra/jetty_base/webapps/zimbra/public/proto/index.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/sounds
/opt/zimbra/jetty_base/webapps/zimbra/public/sounds/im
/opt/zimbra/jetty_base/webapps/zimbra/public/sounds/im/alert.wav
/opt/zimbra/jetty_base/webapps/zimbra/public/sounds/im/notify.wav
/opt/zimbra/jetty_base/webapps/zimbra/public/tmp
/opt/zimbra/jetty_base/webapps/zimbra/public/tmp/aol.png
/opt/zimbra/jetty_base/webapps/zimbra/public/tmp/jive.png
/opt/zimbra/jetty_base/webapps/zimbra/public/tmp/msn.png
/opt/zimbra/jetty_base/webapps/zimbra/public/tmp/yahoo.png
/opt/zimbra/jetty_base/webapps/zimbra/public/404.html
/opt/zimbra/jetty_base/webapps/zimbra/public/5xx.html
/opt/zimbra/jetty_base/webapps/zimbra/public/Boot.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/Offline.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/PasswordRecovery.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/Resources.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/TwoFactorSetup.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/addressVerification.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/blank.html
/opt/zimbra/jetty_base/webapps/zimbra/public/blankHistory.html
/opt/zimbra/jetty_base/webapps/zimbra/public/empty.html
/opt/zimbra/jetty_base/webapps/zimbra/public/error.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/extuserprov.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/insecureResponse.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/launch.html
/opt/zimbra/jetty_base/webapps/zimbra/public/launchNewWindow.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/launchZCS.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/loadImgData.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/login.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/modern.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/pre-cache.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/secureRequest.jsp
/opt/zimbra/jetty_base/webapps/zimbra/public/setResourceBundle.jsp
EOF
)

#Version 10 - /zimbraAdmin/public/
find /opt/zimbra/jetty_base/webapps/zimbra/public -type f | grep -v -Ff <(cat << EOF
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Admin.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Ajax.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Boot.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Chartjs.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Clipboard.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Debug.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/JQuery.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/XForms.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/jsp/Zimbra.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/404.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/5xx.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/Boot.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/Offline.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/Resources.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/admin.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/blank.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/blankHistory.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/empty.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/launch.html
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/loadImgData.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/noscript.jsp
/opt/zimbra/jetty_base/webapps/zimbraAdmin/public/pre-cache.jsp
EOF
)

#End of version 10 check
fi