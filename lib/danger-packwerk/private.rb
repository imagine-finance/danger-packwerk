# typed: strict

require 'danger-packwerk/private/ownership_information'
require 'constant_resolver'

module DangerPackwerk
  #
  # Anything within the Private module is subject to change.
  #
  module Private
    extend T::Sig

    sig { returns(ConstantResolver) }
    def self.constant_resolver
      @constant_resolver = T.let(@constant_resolver, T.nilable(ConstantResolver))
      @constant_resolver ||= begin
        load_paths = Packwerk::RailsLoadPaths.for(Dir.pwd, environment: 'test')
        ConstantResolver.new(
          root_path: Dir.pwd,
          load_paths: load_paths
        )
      end
    end
  end

  private_constant :Private
end
