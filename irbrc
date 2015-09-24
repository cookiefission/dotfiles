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
