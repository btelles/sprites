require 'sprites/sprites'

module Sprites

  # This class provides top level access to the Sprites application.
  # So far, three methods are available:
  # 1. define (_define_)
  # 2. sprite (_sprite_)
  #
  # Author:: Sam Woodard
  #
  # :title:Application

  class Application
    attr_reader :sprites

    # The +new+ class method initializes the class.
    # === Example
    #  sprites = Sprites.new
    def initialize(configuration = ::Sprites.configuration)
      @sprites = Sprites.new(configuration)
    end

    # The +define+ method provides access to the dsl
    # === Example
    # Sprites.application.define do
    #   ...
    # end
    def define(&blk)
      instance_eval(&blk)
    end


    # The +sprite+ method adds sprites to the application
    #
    # === Example
    # Sprites.application.define do
    #   sprite :foo
    # end
    #
    # options:
    # => :orientation - sprite orientation
    #       default:  :vertical
    # => :path - path to sprite relative to config.sprites_path
    #       default:  public/images/sprites/{name}.png
    # => :stylesheet_path - path to stylesheet
    #       default:  public/stylesheets/sprites/{name}.css
    # => :url - path to use in background attribute in stylesheet
    #       default:  /images/sprites/{name}.png
    # => :auto_define - whether or not to auto-define the sprite based on directory contents
    #       default: true
    # => :class_prefix - a css string to prepend to all css classes define or autogenerated
    #       examples: '.icon', '.contacts '
    #       default: ''
    #
    def sprite(name, options = {}, &blk)
      sprites.add(name, options, &blk)
    end
  end
end
