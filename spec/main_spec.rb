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
end