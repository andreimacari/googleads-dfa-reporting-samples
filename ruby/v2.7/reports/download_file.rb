#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright:: Copyright 2016, Google Inc. All Rights Reserved.
#
# License:: Licensed under the Apache License, Version 2.0 (the "License");
#           you may not use this file except in compliance with the License.
#           You may obtain a copy of the License at
#
#           http://www.apache.org/licenses/LICENSE-2.0
#
#           Unless required by applicable law or agreed to in writing, software
#           distributed under the License is distributed on an "AS IS" BASIS,
#           WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
#           implied.
#           See the License for the specific language governing permissions and
#           limitations under the License.
#
# This example illustrates how to download a file

require_relative '../dfareporting_utils'
require 'stringio'

def download_file(report_id, file_id)
  # Authenticate and initialize API service.
  service = DfareportingUtils.get_service()

  # Download and display the report contents.
  report_contents = StringIO.new
  result = service.get_file(report_id, file_id, {
    :download_dest => report_contents
  })

  puts report_contents.string
end

if __FILE__ == $0
  # Retrieve command line arguments.
  args = DfareportingUtils.get_arguments(ARGV, :report_id, :file_id)

  download_file(args[:report_id], args[:file_id])
end
