require "helper"

class TestNaughtCheck < Test::Unit::TestCase
  
  context "nil case" do
    should "be naught" do
      assert_equal true, nil.naught?
      assert_equal true, nil.nought?
      assert_equal true, nil.nowt?
      assert_equal false, nil.aught?
      assert_equal false, nil.ought?
      assert_equal false, nil.owt?
      
    end
  end
  
  context "string case" do
    should "zero_length be naught" do
      assert_equal true, "".naught?
      assert_equal true, "".nought?
      assert_equal true, "".nowt?
      assert_equal false, "".aught?
      assert_equal false, "".ought?
      assert_equal false, "".owt?
    end
    
    should "white_space be naught" do
      assert_equal true, "    ".naught?
      assert_equal true, "    ".nought?
      assert_equal true, "    ".nowt?
      assert_equal false, "    ".aught?
      assert_equal false, "    ".ought?
      assert_equal false, "    ".owt?
    end
    
    should "not_empty not be naught" do
      assert_equal false, "gilgamesh".naught?
      assert_equal false, "gilgamesh".nought?
      assert_equal false, "gilgamesh".nowt?
      assert_equal true, "gilgamesh".aught?
      assert_equal true, "gilgamesh".ought?
      assert_equal true, "gilgamesh".owt?
    end
  end
  
  context "array case" do
    should "zero_length_array be naught" do 
      assert_equal true, [].naught?
      assert_equal false, [].aught?
    end
    
    should "not_empty_array not be naught" do
      assert_equal false, [1, 2, 3].naught?
      assert_equal true, [1, 2, 3].aught?
    end
  end

  context "hash case" do
    should "hash_with_no_keys be naught" do 
      assert_equal true, {}.naught?
      assert_equal false, {}.aught?
    end
    
    should "hash_with_keys not be naught" do
      assert_equal false, {:key => :value}.naught?
      assert_equal true, {:key => :value}.aught?
    end
  end
  
  context "integer case" do 
    should "0 be naught" do
      assert_equal true, 0.naught?
      assert_equal false, 0.aught?
    end
    
    should "1 not be naught" do
      assert_equal false, 1.naught?
      assert_equal true, 1.aught?
    end
  end

  context "float case" do 
    should "0.00 be naught" do
      assert_equal true, 0.00.naught?
      assert_equal false, 0.00.aught?
    end
    
    should "0.01 not be naught" do
      assert_equal false, 0.01.naught?
      assert_equal true, 0.01.aught?
    end
  end

  context "unknown object case" do
    should "not be naught" do
      assert_equal false, Class.new.naught?
      assert_equal true, Class.new.aught?
    end
  end
end