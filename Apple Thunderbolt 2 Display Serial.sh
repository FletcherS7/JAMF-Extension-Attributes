#!/bin/sh

###
#
#            Name:  Apple Thunderbolt 2 Display Serial.sh
#     Description:  Returns the serial number of any connected Apple Thunderbolt 2 displays.
#      Created By:  Fletcher Salesky
#         Created:  2015-12-10
#   Last Modified:  2022-07-12
#         Version:  1.3
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

displayType=$(system_profiler SPDisplaysDataType | grep -w "Thunderbolt Display:")
if [[ -n $displayType ]]; then
     serial="$(/usr/sbin/system_profiler SPDisplaysDataType | egrep "Display Serial Number:" | awk '{print $4}')"
     echo "<result>$serial</result>"
else
     echo "<result>No Apple Thunderbolt Display Connected</result>"
fi