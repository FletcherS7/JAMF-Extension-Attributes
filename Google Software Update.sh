#!/bin/sh

###
#
#            Name:  Google Software Update.sh
#     Description:  Returns the installed version of Google Software Update
#      Created By:  Fletcher Salesky
#         Created:  2022-06-12
#   Last Modified:  2022-06-12
#         Version:  1.0
#
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


GoogleSoftwareUpdate=`defaults read /Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/GoogleSoftwareUpdateAgent.app/Contents/Info CFBundleVersion`

if [[ $GoogleSoftwareUpdate != '' ]]; then
  echo "<result>$GoogleSoftwareUpdate</result>" 
else
  echo "<result>Not Installed</result>"
fi