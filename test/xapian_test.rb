require 'test/unit'

class TestRequire < Test::Unit::TestCase
  def test_require
    assert_nothing_raised do
      require 'xapian'
    end
  end
end
