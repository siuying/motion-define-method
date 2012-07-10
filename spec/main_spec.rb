describe "define-method" do
  describe "#define_method(symbol, &block)" do
    class Hello
      [:foo, :bar].each do |name|
        define_method(name) do |*args|
          "#{name} world"
        end
      end
    end

    class World < Hello
    end

    it "should implement simple define_method" do
      Hello.new.foo.should == "foo world"
    end

    it "should allow define_method of superclass work on subclasses" do
      World.new.bar.should == "bar world"
    end
  end

  describe "#define_method(symbol, method)" do
    class Foo
      define_method(:wilma) do |*args|
        "#{name} world"
      end
    end

    class Bar < Foo
      define_method(:barney, Proc.new{|a| "foo world" })
    end

    it "should implement define_method using another method" do
      Bar.new.barney.should == "foo world"
    end
  end
end