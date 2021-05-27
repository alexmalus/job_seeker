module JobSeeker
  module BuilderLoader
    extend ActiveSupport::Concern

    class_methods do
      # Convenience factory to simplify calling builders with constructors,
      # since you rarely need to instantiate and hold a variable for Builder, so becomes :
      #
      #    MyBuilder.build(input)
      #
      # Instead of
      #    MyBuilder.new(input).build
      #
      ruby2_keywords def build(*args, &block)
        new(*args).build(&block)
      end
    end
  end
end
