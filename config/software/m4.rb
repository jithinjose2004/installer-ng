#
# Copyright 2012-2014 Chef Software, Inc.
# Copyright 2015 Scalr, Inc.
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
# limitations under the License.
#

name "m4"
default_version "1.4.17"

source url: "http://ftp.gnu.org/gnu/m4/m4-#{version}.tar.bz2"

version "1.4.17" do
  source md5: "8a1787edcba75ae5cd1dc40d7d8ed03a"
end

relative_path "m4-#{version}"

license path: 'COPYING'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded", env: env

  make "-j #{workers}", env: env
  make "install", env: env
end

