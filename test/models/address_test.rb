require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  def setup
    @user    = users(:michael)
    @address = addresses(:address1)
  end

  test "should be valid" do
    assert @address.valid?
  end

  test "user id should be present" do
    @address.user_id = nil
    assert_not @address.valid?
  end

  test "street1 should be present" do
    @address.street1  = "   "
    assert_not @address.valid?
  end

  test "street1 should be less than 50 characters" do
    @address.street1 = "a" * 51
    assert_not @address.valid?
  end

  test "address2 should be less than 50 characters" do
    @address.street2 = "a" * 51
    assert_not @address.valid?
  end

  test "city should be present" do
    @address.city  = "   "
    assert_not @address.valid?
  end

  test "city should be less than 20 characters" do
    @address.city = "a" * 21
    assert_not @address.valid?
  end

  test "state should be present" do
    @address.state  = "   "
    assert_not @address.valid?
  end

  test "state should be less than 3 characters" do
    @address.state = "a" * 3
    assert_not @address.valid?
  end

  test "zip validation should accept valid zip" do
    valid_zips = %w[ 12345 12345-1234 ]
    valid_zips.each do |valid_zip|
      @address.zip = valid_zip
      assert @address.valid?, "#{valid_zip.inspect} should be valid"
    end
  end
  
  test "zip validation should reject invalid zip" do
    invalid_zips = %w[ 1234 12345- 12345-123 ]
    invalid_zips.each do |invalid_zip|
      @address.zip = invalid_zip
      assert_not @address.valid?, "#{invalid_zip.inspect} should be invalid"
    end
  end


end
