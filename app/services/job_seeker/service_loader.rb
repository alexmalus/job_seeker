module JobSeeker
  module ServiceLoader
    extend ActiveSupport::Concern

    class_methods do

      # Convenience factory to simplify calling services with constructors,
      # since you rarely need to instantiate and hold a variable for Service, so becomes :
      #
      #    MyService.run(object)
      #
      # Instead of
      #    MyService.new(object).run
      #
      ruby2_keywords def run(*args, &block)
        new(*args).run(&block)
      end
    end
  end
end
