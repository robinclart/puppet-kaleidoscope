require 'spec_helper'

describe 'kaleidoscope' do
  it do
    should contain_package('Kaleidoscope').with({
      :source   => 'http://d23o3xv0lvihc9.cloudfront.net/KSUpdates/1.1.8_57/Kaleidoscope.zip',
      :provider => 'compressed_app'
    })
  end
end
