require 'pathname'
require 'zxcvbn/version'
require 'zxcvbn/tester'

module Zxcvbn
  extend self

  # Returns a Zxcvbn::Score for the given password
  #
  # Example:
  #
  #   Zxcvbn.test("password").score #=> 0
  def test(password, user_inputs = [])
    tester = Tester.new
    tester.test(password, user_inputs)
  end

  module Rails
    class Engine < ::Rails::Engine
    end
  end
end
