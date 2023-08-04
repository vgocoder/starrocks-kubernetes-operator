#
# Copyright 2021-present, StarRocks Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
#  limitations under the License.
#

#! /bin/bash

# this script will create a values.yaml file for the parent chart

# set the home path
HOME_PATH=$(
  cd "$(dirname "$0")"
  cd ..
  pwd
)

# create values.yaml for the parent chart
cat <<EOF >$HOME_PATH/helm-charts/charts/kube-starrocks/values.yaml
# This file is generated by scripts/create-parent-chart-values.sh.
# It just contains the values of the child charts.
# You can modify it manually if you want to change the values of the child charts.
# The values of the child charts are as follows:

operator:
`awk '{printf("  %s\n", $0);}' $HOME_PATH/helm-charts/charts/kube-starrocks/charts/operator/values.yaml`

starrocks:
`awk '{printf("  %s\n", $0);}' $HOME_PATH/helm-charts/charts/kube-starrocks/charts/starrocks/values.yaml`
EOF
