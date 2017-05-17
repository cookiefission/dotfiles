begin
  require 'rubygems' unless defined? Gem
  require 'interactive_editor'
  require 'hirb'
  require 'fancy_irb'
  require 'awesome_print'

  FancyIrb.start :colorize => {
    :rocket_prompt => [:blue],
    :result_prompt => [:blue],
    :input_prompt  => nil,
    :irb_errors    => [:red],
    :stderr        => [:red, :bright],
    :stdout        => [:white],
    :input         => nil,
    :output        => true,
  }

  Hirb.enable
  AwesomePrint.irb!
rescue LoadError
  # Noop
end

class Object

  def tputs
    tap { |obj| puts obj }
  end

  def tputc
    tap { |obj| puts obj.class }
  end

end

class Array
  unless respond_to?(:wrap)
    def self.wrap(object)
      if object.nil?
        []
      elsif object.respond_to?(:to_ary)
        object.to_ary || [object]
      else
        [object]
      end
    end
  end
end
