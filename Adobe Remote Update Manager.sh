#!/bin/sh

###
#
#            Name:  Adobe Remote Update Manager.sh
#     Description:  Returns the installed version of Adobe Remote Update Manager (RUM)
#      Created By:  Fletcher Salesky
#         Created:  2022-05-10
#   Last Modified:  2022-05-18
#         Version:  1.2
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


ARUM=$(/usr/local/bin/RemoteUpdateManager -h | grep -i -E "RemoteUpdateManager version is*" | tr -d [:upper:][:lower:][:space:]:)
if [[ $ARUM != '' ]]; then
  echo "<result>${ARUM}</result>" 
else
  echo "<result>Not Installed</result>"
fi
