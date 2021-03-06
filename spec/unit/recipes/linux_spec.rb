#
# Cookbook Name:: nexpose
# Recipe:: linux
#
# Copyright (C) 2013-2014, Rapid7, LLC.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


require_relative '../../spec_helper'

describe 'nexpose::linux' do

  let(:chef_run) do 
    ChefSpec::Runner.new do |node|
      #node.set['nexpose']['installer']['linux']['bin'] = 'fakefile'
    end.converge(described_recipe)
  end

  let(:installer) { '/var/chef/cache/NeXposeSetup-Linux64.bin' }

  it 'downloads the nexpose linux installer with mode 0700' do
    expect(chef_run).to create_remote_file(installer).with(mode: 0700)
  end

end
