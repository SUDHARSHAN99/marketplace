require 'minitest/autorun'
require 'minitest/pride'
require 'marketplace'

class TestMarketplace < Minitest::Test
  def assert_marketplace(marketplace)
    assert_kind_of Marketplace, marketplace
    Marketplace.members.each do |member|
      refute_nil marketplace.send(member)
    end
  end

  def test_returns_all
    refute_empty Marketplace.all
    Marketplace.all.each do |m|
      assert_marketplace m
    end
  end

  def test_finds
    m = Marketplace.find('ATVPDKIKX0DER')
    assert_marketplace m
  end

  def test_raises_key_error
    assert_raises(KeyError) { Marketplace.find('123') }
  end

  def test_enumerates
    refute_empty Marketplace.to_a
  end

  def test_wont_mutate
    assert Marketplace.all?(&:frozen?)
  end
end
