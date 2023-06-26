#!/bin/sh

###
#
#               Name:  Default Mail.sh
#        Description:  Returns default Mail client of currently logged-in user.
#                      Reformats mail agent string to full name when one of a
#                      list of common mail clients.
#            Created:  2016-06-06
#      Last Modified:  2023-05-02
#            Version:  1.4
#               Note:  Modified by Fletcher to detect default email client
# Source GitHub Link:  https://github.com/palantir/jamf-pro-scripts/blob/main/extension-attributes/Default%20Browser.sh
#
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
###



########## variable-ing ##########



loggedInUser=$(/usr/bin/stat -f%Su "/dev/console")
loggedInUserHome=$(/usr/bin/dscl . -read "/Users/${loggedInUser}" NFSHomeDirectory | /usr/bin/awk '{print $NF}')
defaultMail=$(/usr/bin/defaults read "${loggedInUserHome}/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist" LSHandlers | /usr/bin/grep -B1 mailto | /usr/bin/awk -F\" '/LSHandlerRoleAll/ {print $2}' 2>"/dev/null")



########## main process ##########



# Convert default mail identifier to readable string (for some known mail strings).
if [ -z "$defaultMail" ]; then
  mailResult="Undefined"
elif [ "$defaultMail" = "com.apple.safari" ]; then
  mailResult="Safari"
elif [ "$defaultMail" = "com.apple.safaritechnologypreview" ]; then
  mailResult="Safari Technology Preview"
elif [ "$defaultMail" = "com.google.chrome" ]; then
  mailResult="Chrome"
elif [ "$defaultMail" = "org.mozilla.firefox" ]; then
  mailResult="Firefox"
elif [ "$defaultMail" = "org.mozilla.aurora" ]; then
  mailResult="Firefox Developer Edition"
elif [ "$defaultMail" = "org.mozilla.nightly" ]; then
  mailResult="Firefox Nightly"
elif [ "$defaultMail" = "com.microsoft.outlook" ]; then
  mailResult="Microsoft Outlook"
elif [ "$defaultMail" = "com.apple.mail" ]; then
  mailResult="Apple Mail"
elif [ "$defaultMail" = "com.frontapp.front" ]; then
  mailResult="Front App"
else
  mailResult="$defaultMail"
fi


# Report result.
echo "<result>$mailResult</result>"



exit 0