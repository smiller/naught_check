module Naught

  module InstanceMethods 
    # Tests if a value if nil, blank, or zero
    #
    #   nil.naught? => true
    #   "".naught? => true
    #   "    ".naught? => true
    #   [].naught? => true
    #   {}.naught? => true
    #   0.naught? => true
    #   0.00.naught? => true
    def naught?
      if self == nil
        true
      elsif self.kind_of? Array
        self.size == 0
      elsif self.kind_of? Hash
        self.keys.size == 0
      elsif self.kind_of? Numeric
        self.zero?
      elsif self.kind_of? String
        self == "" || (/^\s*$/.match(self) != nil)
      else
        false
      end
    end
    
    # aliases .naught?
    def nought?; naught?; end

    # aliases .naught?
    def nowt?; naught?; end


    # inverts naught?
    def aught?; !naught?; end
    
    # aliases .aught?
    def ought?; aught?; end

    # aliases .aught?
    def owt?; aught?; end

  end

  def self.included(base) 
    base.class_eval do 
      include InstanceMethods 
    end 
  end

end