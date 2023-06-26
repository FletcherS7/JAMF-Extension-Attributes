#!/bin/sh

###
#
#            Name:  Bluetooth MAC Address.sh
#     Description:  Returns the MAC Address of connected Bluetooth inerfaces
#      Created By:  Fletcher Salesky
#         Created:  2022-08-05
#   Last Modified:  2022-08-05
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

BluetoothController=$(system_profiler SPBluetoothDataType | grep -w "Bluetooth Controller:")
if [[ -n $BluetoothController ]]; then
     BluetoothMAC="$(/usr/sbin/system_profiler SPBluetoothDataType | grep -A 1 "Bluetooth Controller:" | egrep "Address:" | awk '{print $2}')"
     echo "<result>$BluetoothMAC</result>"
else
     echo "<result>No Bluetooth Controller Found</result>"
fi