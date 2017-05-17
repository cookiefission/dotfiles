begin
  require 'rubygems' unless defined? Gem
  require 'interactive_editor'

  require 'hirb'
  Hirb.enable

  require 'awesome_print'
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
