require "helper"

class TestNaughtCheck < Test::Unit::TestCase
  
  context "nil case" do
    should "be empty" do
      assert_equal true, nil.naught?
      assert_equal true, nil.nought?
      assert_equal true, nil.nowt?
      assert_equal true, nil.vacant?
    end
  end
  
  context "string case" do
    should "zero_length be empty" do
      assert_equal true, "".naught?
      assert_equal true, "".nought?
      assert_equal true, "".nowt?
      assert_equal true, "".vacant?
    end
    
    should "white_space be empty" do
      assert_equal true, "    ".naught?
      assert_equal true, "    ".nought?
      assert_equal true, "    ".nowt?
      assert_equal true, "    ".vacant?
    end
    
    should "not_empty not be empty" do
      assert_equal false, "gilgamesh".naught?
      assert_equal false, "gilgamesh".nought?
      assert_equal false, "gilgamesh".nowt?
      assert_equal false, "gilgamesh".vacant?
    end
  end
  
  context "array case" do
    should "zero_length_array be empty" do 
      assert_equal true, [].naught?
    end
    
    should "not_empty_array not be empty" do
      assert_equal false, [1, 2, 3].naught?
    end
  end

  context "hash case" do
    should "hash_with_no_keys be empty" do 
      assert_equal true, {}.naught?
    end
    
    should "hash_with_keys not be empty" do
      assert_equal false, {:key => :value}.naught?
    end
  end
  
  context "integer case" do 
    should "0 be empty" do
      assert_equal true, 0.naught?
    end
    
    should "1 not be empty" do
      assert_equal false, 1.naught?
    end
  end

  context "float case" do 
    should "0.00 be empty" do
      assert_equal true, 0.00.naught?
    end
    
    should "0.01 not be empty" do
      assert_equal false, 0.01.naught?
    end
  end

  context "unknown object case" do
    should "not be empty" do
      assert_equal false, Class.new.naught?
    end
  end
end