require 'spec_helper'

class ExampleTest < ActionDispatch::IntegrationTest

  test "how do i use this" do

      Rails.env.stub(:development? => true)
      load "#{Rails.root}/db/seeds.rb"
      post "/tournaments/1/set_next_round"

  do

end