module Zxcvbn
  require "execjs"

  class Tester
    DATA_PATH = Pathname(File.expand_path('../../../vendor/assets/javascripts/zxcvbn.js', __FILE__))

    def initialize
      src = File.open(DATA_PATH, 'r').read
      @context = ExecJS.compile(src)
    end

    def test(password, user_inputs = [])
      result = @context.eval("zxcvbn(#{password.to_json}, #{user_inputs.to_json})")
      OpenStruct.new(result)
    end
  end
end
