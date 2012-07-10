class Module
  def define_method(name, &blk)
    @define_method_blocks ||= {}
    @define_method_blocks[name] = lambda(&blk)
  end
end

class Object
  attr_accessor :define_method_blocks
  alias_method :original_module_method_missing, :method_missing
  def method_missing(method, *args, &block)
    self.class.define_method_blocks ||= {}
    if self.class.define_method_blocks.include?(method)
      return self.class.define_method_blocks[method].call(*args)
    else
      self.class.ancestors.each do |clazz|
        if clazz.define_method_blocks.include?(method)
          return clazz.define_method_blocks[method].call(*args)
        end
      end
      return original_module_method_missing(method, *args)
    end
  end
end