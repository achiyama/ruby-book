require 'minitest/autorun'
require_relative '../lib/bank'
require_relative '../lib/team'


class DeepFreezableTest < Minitest::Test
  def test_deep_freeze_to_array
    # 配列の値は正しいか？
    assert_equal ['Japan', 'US', 'India'], Team::COUNTRIES
    # 配列自体がfreezeされているか？
    assert Team::COUNTRIES.frozen?
    # 配列の要素がすべてfreezeされているか？
    assert Team::COUNTRIES.all? { |country| country.frozen? }
  end

  def test_deep_freeze_to_hash
    # ハッシュの値は正しいか？
    assert_equal(
      { 'japan' => 'yen', 'US' => 'dollar', 'India' => 'rupee' }, 
      Bank::CURRENCIES
    )
    # ハッシュ自身がfreezeされているか？
    assert Bank::CURRENCIES.frozen?
    # ハッシュの要素(キーと値)がすべてfreezeされているか？
    assert Bank::CURRENCIES.all? { |key, value| key.frozen? && value.frozen? }
  end
end