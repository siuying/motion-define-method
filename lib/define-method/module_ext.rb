$define_method_blocks ||= {}

class Module
  def define_method(name, *args, &blk)
    $define_method_blocks[self.to_s] ||= {}
    if block_given?
      $define_method_blocks[self.to_s][name] = lambda(&blk)
    elsif 
      $define_method_blocks[self.to_s][name] = args[0]      
    end
  end
end

class Object
  attr_accessor :define_method_blocks
  alias_method :original_module_method_missing, :method_missing
  def method_missing(method, *args, &block)
    if $define_method_blocks[self.class.to_s] && $define_method_blocks[self.class.to_s].include?(method)
      return $define_method_blocks[self.class.to_s][method].call(*args)

    elsif self.respond_to?(:metaclass) && $define_method_blocks[self.metaclass.to_s] && $define_method_blocks[self.metaclass.to_s].include?(method)
      return $define_method_blocks[self.metaclass.to_s][method].call(*args)

    else
      self.class.ancestors.each do |clazz|
        if $define_method_blocks[clazz.to_s] && $define_method_blocks[clazz.to_s].include?(method)
          return $define_method_blocks[clazz.to_s][method].call(*args)
        end
      end
      return original_module_method_missing(method, *args)

    end
  end
end