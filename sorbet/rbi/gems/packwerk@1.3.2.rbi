# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `packwerk` gem.
# Please instead update this file by running `bin/tapioca gem packwerk`.

module Packwerk
end

module Packwerk::ApplicationLoadPaths
  class << self
    sig { returns(T::Array[::String]) }
    def extract_application_autoload_paths; end

    sig { params(root: ::String, environment: ::String).returns(T::Array[::String]) }
    def extract_relevant_paths(root, environment); end

    sig do
      params(
        all_paths: T::Array[::String],
        bundle_path: ::Pathname,
        rails_root: ::Pathname
      ).returns(T::Array[::Pathname])
    end
    def filter_relevant_paths(all_paths, bundle_path: T.unsafe(nil), rails_root: T.unsafe(nil)); end

    sig { params(paths: T::Array[::Pathname], rails_root: ::Pathname).returns(T::Array[::String]) }
    def relative_path_strings(paths, rails_root: T.unsafe(nil)); end

    private

    sig { params(paths: T::Array[T.untyped]).void }
    def assert_load_paths_present(paths); end

    sig { params(root: ::String, environment: ::String).void }
    def require_application(root, environment); end
  end
end

class Packwerk::ApplicationValidator
  def initialize(config_file_path:, configuration:, environment:); end

  def check_acyclic_graph; end
  def check_all; end
  def check_application_structure; end
  def check_autoload_path_cache; end
  def check_inflection_file; end
  def check_package_manifest_paths; end
  def check_package_manifest_syntax; end
  def check_package_manifests_for_privacy; end
  def check_root_package_exists; end
  def check_valid_package_dependencies; end

  private

  def assert_constants_can_be_loaded(constants); end
  def build_cycle_strings(cycles); end
  def check_private_constant_location(name, location, config_file_path); end
  def format_yaml_strings(list); end
  def invalid_package_path?(path); end
  def merge_results(results, separator: T.unsafe(nil), errors_headline: T.unsafe(nil)); end
  def package_glob; end
  def package_manifests(glob_pattern = T.unsafe(nil)); end
  def package_manifests_settings_for(setting); end
  def package_set; end
  def private_constant_unresolvable(name, config_file_path); end
  def relative_path(path); end
  def relative_paths(paths); end
end

class Packwerk::ApplicationValidator::Result < ::Struct
  def error_value; end
  def error_value=(_); end
  def ok?; end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

Packwerk::AssociationInspector::CustomAssociations = T.type_alias { T.any(T::Array[::Symbol], T::Set[::Symbol]) }
Packwerk::AssociationInspector::RAILS_ASSOCIATIONS = T.let(T.unsafe(nil), Set)

module Packwerk::Checker
  interface!

  sig { abstract.params(reference: ::Packwerk::Reference).returns(T::Boolean) }
  def invalid_reference?(reference); end

  sig { abstract.returns(::Packwerk::ViolationType) }
  def violation_type; end
end

class Packwerk::Cli
  sig do
    params(
      configuration: T.nilable(::Packwerk::Configuration),
      out: T.any(::IO, ::StringIO),
      err_out: T.any(::IO, ::StringIO),
      environment: ::String,
      style: ::Packwerk::OutputStyle,
      offenses_formatter: T.nilable(::Packwerk::OffensesFormatter)
    ).void
  end
  def initialize(configuration: T.unsafe(nil), out: T.unsafe(nil), err_out: T.unsafe(nil), environment: T.unsafe(nil), style: T.unsafe(nil), offenses_formatter: T.unsafe(nil)); end

  sig { params(args: T::Array[::String]).returns(T::Boolean) }
  def execute_command(args); end

  sig { params(args: T::Array[::String]).returns(T.noreturn) }
  def run(args); end

  private

  def fetch_files_to_process(paths); end
  def generate_configs; end
  def init; end
  def list_validation_errors(result); end
  def output_result(result); end
  def parse_run(paths); end
  def update(paths); end
  def validate(_paths); end
end

class Packwerk::Configuration
  def initialize(configs = T.unsafe(nil), config_path: T.unsafe(nil)); end

  def config_path; end
  def custom_associations; end
  def exclude; end
  def include; end
  def inflections_file; end
  def load_paths; end
  def package_paths; end
  def parallel?; end
  def root_path; end

  class << self
    def from_path(path = T.unsafe(nil)); end

    private

    def from_packwerk_config(path); end
  end
end

Packwerk::Configuration::DEFAULT_CONFIG_PATH = T.let(T.unsafe(nil), String)
Packwerk::Configuration::DEFAULT_EXCLUDE_GLOBS = T.let(T.unsafe(nil), Array)
Packwerk::Configuration::DEFAULT_INCLUDE_GLOBS = T.let(T.unsafe(nil), Array)

class Packwerk::ConstantDiscovery
  def initialize(constant_resolver:, packages:); end

  def context_for(const_name, current_namespace_path: T.unsafe(nil)); end
  def package_from_path(path); end
end

class Packwerk::ConstantDiscovery::ConstantContext < ::Struct
  def location; end
  def location=(_); end
  def name; end
  def name=(_); end
  def package; end
  def package=(_); end
  def public?; end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

class Packwerk::DependencyChecker
  include ::Packwerk::Checker

  sig { override.params(reference: ::Packwerk::Reference).returns(T::Boolean) }
  def invalid_reference?(reference); end

  sig { override.returns(::Packwerk::ViolationType) }
  def violation_type; end
end

class Packwerk::DeprecatedReferences
  sig { params(package: ::Packwerk::Package, filepath: ::String).void }
  def initialize(package, filepath); end

  sig { params(reference: ::Packwerk::Reference, violation_type: ::Packwerk::ViolationType).returns(T::Boolean) }
  def add_entries(reference, violation_type); end

  sig { void }
  def dump; end

  sig { params(reference: ::Packwerk::Reference, violation_type: ::Packwerk::ViolationType).returns(T::Boolean) }
  def listed?(reference, violation_type:); end

  sig { returns(T::Boolean) }
  def stale_violations?; end

  private

  sig { returns(T::Hash[T.untyped, T.untyped]) }
  def deprecated_references; end

  sig { params(filepath: ::String).returns(T::Hash[T.untyped, T.untyped]) }
  def load_yaml(filepath); end

  sig { returns(T::Hash[T.untyped, T.untyped]) }
  def prepare_entries_for_dump; end
end

class Packwerk::FileProcessor
  def initialize(node_processor_factory:, parser_factory: T.unsafe(nil)); end

  def call(file_path); end
end

class Packwerk::FileProcessor::UnknownFileTypeResult < ::Packwerk::Offense
  def initialize(file:); end
end

class Packwerk::FilesForProcessing
  def initialize(paths, configuration); end

  def files; end

  private

  def configured_excluded_files; end
  def configured_included_files; end
  def custom_files; end
  def custom_included_files(path); end
  def files_for_globs(globs); end

  class << self
    def fetch(paths:, configuration:); end
  end
end

module Packwerk::Formatters
end

class Packwerk::Formatters::OffensesFormatter
  include ::Packwerk::OffensesFormatter

  sig { params(style: ::Packwerk::OutputStyle).void }
  def initialize(style: T.unsafe(nil)); end

  sig { override.params(offenses: T::Array[T.nilable(::Packwerk::Offense)]).returns(::String) }
  def show_offenses(offenses); end

  sig { override.params(offense_collection: ::Packwerk::OffenseCollection).returns(::String) }
  def show_stale_violations(offense_collection); end

  private

  sig { params(offenses: T::Array[T.nilable(::Packwerk::Offense)]).returns(::String) }
  def offenses_list(offenses); end

  sig { params(offenses: T::Array[T.nilable(::Packwerk::Offense)]).returns(::String) }
  def offenses_summary(offenses); end
end

class Packwerk::Formatters::ProgressFormatter
  sig { params(out: T.any(::IO, ::StringIO), style: ::Packwerk::OutputStyle).void }
  def initialize(out, style: T.unsafe(nil)); end

  def finished(execution_time); end
  def interrupted; end
  def mark_as_failed; end
  def mark_as_inspected; end
  def started(target_files); end
  def started_validation; end
end

module Packwerk::Generators
end

class Packwerk::Generators::ConfigurationFile
  sig { params(load_paths: T::Array[::String], root: ::String, out: T.any(::IO, ::StringIO)).void }
  def initialize(load_paths:, root:, out: T.unsafe(nil)); end

  sig { returns(T::Boolean) }
  def generate; end

  private

  def render; end
  def set_template_variables; end
  def template; end

  class << self
    def generate(load_paths:, root:, out:); end
  end
end

Packwerk::Generators::ConfigurationFile::CONFIGURATION_TEMPLATE_FILE_PATH = T.let(T.unsafe(nil), String)

class Packwerk::Generators::InflectionsFile
  def initialize(root, out: T.unsafe(nil)); end

  sig { returns(T::Boolean) }
  def generate; end

  class << self
    def generate(root:, out:); end
  end
end

class Packwerk::Generators::RootPackage
  def initialize(root:, out: T.unsafe(nil)); end

  sig { returns(T::Boolean) }
  def generate; end

  class << self
    def generate(root:, out:); end
  end
end

class Packwerk::Graph
  def initialize(*edges); end

  def acyclic?; end
  def cycles; end

  private

  def add_cycle(cycle); end
  def neighbours(node); end
  def nodes; end
  def process; end
  def visit(node, visited_nodes: T.unsafe(nil), path: T.unsafe(nil)); end
end

module Packwerk::Inflections
end

class Packwerk::Inflections::Custom
  def initialize(custom_inflection_file = T.unsafe(nil)); end

  def apply_to(inflections_object); end
  def inflections; end
  def inflections=(_arg0); end
end

Packwerk::Inflections::Custom::SUPPORTED_INFLECTION_METHODS = T.let(T.unsafe(nil), Array)

module Packwerk::Inflections::Default
  class << self
    def apply_to(inflections_object); end
  end
end

class Packwerk::Inflector
  sig { params(custom_inflector: ::Packwerk::Inflections::Custom).void }
  def initialize(custom_inflector:); end

  def inflections(_ = T.unsafe(nil)); end
  def pluralize(word, count = T.unsafe(nil)); end

  class << self
    def default; end

    sig { params(inflections_file: ::String).returns(::Packwerk::Inflector) }
    def from_file(inflections_file); end
  end
end

module Packwerk::Node
  class << self
    def class?(node); end
    def class_or_module_name(class_or_module_node); end
    def constant?(node); end
    def constant_assignment?(node); end
    def constant_name(constant_node); end
    def each_child(node); end
    def enclosing_namespace_path(starting_node, ancestors:); end
    def hash?(node); end
    def literal_value(string_or_symbol_node); end
    def location(node); end
    def method_arguments(method_call_node); end
    def method_call?(node); end
    def method_name(method_call_node); end
    def module_name_from_definition(node); end
    def name_location(node); end
    def parent_class(class_node); end

    def parent_module_name(ancestors:); end

    def string?(node); end
    def symbol?(node); end
    def value_from_hash(hash_node, key); end

    private

    def hash_pair_key(hash_pair_node); end
    def hash_pair_value(hash_pair_node); end
    def hash_pairs(hash_node); end
    def method_call_node(block_node); end
    def module_creation?(node); end
    def name_from_block_definition(node); end
    def name_part_from_definition(node); end
    def receiver(method_call_or_block_node); end
    def type_of(node); end
  end
end

class Packwerk::Node::Location < ::Struct
  def column; end
  def column=(_); end
  def line; end
  def line=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

class Packwerk::Node::TypeError < ::ArgumentError; end

class Packwerk::NodeVisitor
  def initialize(node_processor:); end

  def visit(node, ancestors:, result:); end
end

class Packwerk::Offense
  sig { params(file: ::String, message: ::String, location: T.nilable(::Packwerk::Node::Location)).void }
  def initialize(file:, message:, location: T.unsafe(nil)); end

  def file; end
  def location; end
  def message; end

  sig { params(style: ::Packwerk::OutputStyle).returns(::String) }
  def to_s(style = T.unsafe(nil)); end
end

class Packwerk::OffenseCollection
  sig do
    params(
      root_path: ::String,
      deprecated_references: T::Hash[::Packwerk::Package, ::Packwerk::DeprecatedReferences]
    ).void
  end
  def initialize(root_path, deprecated_references = T.unsafe(nil)); end

  sig { params(offense: ::Packwerk::Offense).void }
  def add_offense(offense); end

  sig { void }
  def dump_deprecated_references_files; end

  sig { returns(T::Array[::Packwerk::Offense]) }
  def errors; end

  sig { params(offense: ::Packwerk::Offense).returns(T::Boolean) }
  def listed?(offense); end

  sig { returns(T::Array[::Packwerk::ReferenceOffense]) }
  def new_violations; end

  sig { returns(T::Array[::Packwerk::Offense]) }
  def outstanding_offenses; end

  sig { returns(T::Boolean) }
  def stale_violations?; end

  private

  sig { params(package: ::Packwerk::Package).returns(::String) }
  def deprecated_references_file_for(package); end

  sig { params(package: ::Packwerk::Package).returns(::Packwerk::DeprecatedReferences) }
  def deprecated_references_for(package); end
end

module Packwerk::OffensesFormatter
  interface!

  sig { abstract.params(offenses: T::Array[T.nilable(::Packwerk::Offense)]).returns(::String) }
  def show_offenses(offenses); end

  sig { abstract.params(offense_collection: ::Packwerk::OffenseCollection).returns(::String) }
  def show_stale_violations(offense_collection); end
end

module Packwerk::OutputStyle
  interface!

  sig { abstract.returns(::String) }
  def error; end

  sig { abstract.returns(::String) }
  def filename; end

  sig { abstract.returns(::String) }
  def reset; end
end

module Packwerk::OutputStyles
end

class Packwerk::OutputStyles::Coloured
  include ::Packwerk::OutputStyle

  sig { override.returns(::String) }
  def error; end

  sig { override.returns(::String) }
  def filename; end

  sig { override.returns(::String) }
  def reset; end
end

class Packwerk::OutputStyles::Plain
  include ::Packwerk::OutputStyle

  sig { override.returns(::String) }
  def error; end

  sig { override.returns(::String) }
  def filename; end

  sig { override.returns(::String) }
  def reset; end
end

class Packwerk::Package
  include ::Comparable

  def initialize(name:, config:); end

  def <=>(other); end
  def dependencies; end
  def dependency?(package); end
  def enforce_dependencies?; end
  def enforce_privacy; end
  def eql?(other); end
  def hash; end
  def name; end
  def package_path?(path); end
  def public_path; end
  def public_path?(path); end
  def root?; end
  def to_s; end
  def user_defined_public_path; end
end

Packwerk::Package::ROOT_PACKAGE_NAME = T.let(T.unsafe(nil), String)

class Packwerk::PackageSet
  include ::Enumerable

  def initialize(packages); end

  def each(&blk); end
  def fetch(name); end
  def package_from_path(file_path); end

  class << self
    def load_all_from(root_path, package_pathspec: T.unsafe(nil)); end
    def package_paths(root_path, package_pathspec); end

    private

    def create_root_package_if_none_in(packages); end
  end
end

Packwerk::PackageSet::PACKAGE_CONFIG_FILENAME = T.let(T.unsafe(nil), String)

class Packwerk::ParseRun
  def initialize(files:, configuration:, progress_formatter: T.unsafe(nil), offenses_formatter: T.unsafe(nil)); end

  def check; end
  def detect_stale_violations; end
  def update_deprecations; end

  private

  def find_offenses(show_errors: T.unsafe(nil)); end
  def serial_find_offenses; end
  def update_progress(failed: T.unsafe(nil)); end
end

class Packwerk::ParsedConstantDefinitions
  def initialize(root_node:); end

  def local_reference?(constant_name, location: T.unsafe(nil), namespace_path: T.unsafe(nil)); end

  private

  def add_definition(constant_name, current_namespace_path, location); end
  def collect_local_definitions_from_root(node, current_namespace_path = T.unsafe(nil)); end

  class << self
    def reference_qualifications(constant_name, namespace_path:); end
  end
end

module Packwerk::Parsers; end

class Packwerk::Parsers::Factory
  include ::Singleton
  extend ::Singleton::SingletonClassMethods

  def erb_parser_class; end
  def erb_parser_class=(klass); end
  def for_path(path); end
end

Packwerk::Parsers::Factory::ERB_REGEX = T.let(T.unsafe(nil), Regexp)
Packwerk::Parsers::Factory::RUBY_REGEX = T.let(T.unsafe(nil), Regexp)

class Packwerk::Parsers::ParseError < ::StandardError
  def initialize(result); end

  def result; end
end

class Packwerk::Parsers::ParseResult < ::Packwerk::Offense; end

class Packwerk::Parsers::Ruby
  def initialize(parser_class: T.unsafe(nil)); end

  def call(io:, file_path: T.unsafe(nil)); end
end

class Packwerk::PrivacyChecker
  include ::Packwerk::Checker

  sig { override.params(reference: ::Packwerk::Reference).returns(T::Boolean) }
  def invalid_reference?(reference); end

  sig { override.returns(::Packwerk::ViolationType) }
  def violation_type; end

  private

  sig { params(privacy_option: T.nilable(T.any(T::Array[::String], T::Boolean))).returns(T::Boolean) }
  def enforcement_disabled?(privacy_option); end

  sig do
    params(
      constant: ::Packwerk::ConstantDiscovery::ConstantContext,
      explicitly_private_constants: T::Array[::String]
    ).returns(T::Boolean)
  end
  def explicitly_private_constant?(constant, explicitly_private_constants:); end
end

class Packwerk::Reference < ::Struct
  def constant; end
  def constant=(_); end
  def relative_path; end
  def relative_path=(_); end
  def source_package; end
  def source_package=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

class Packwerk::ReferenceOffense < ::Packwerk::Offense
  sig do
    params(
      reference: ::Packwerk::Reference,
      violation_type: ::Packwerk::ViolationType,
      location: T.nilable(::Packwerk::Node::Location)
    ).void
  end
  def initialize(reference:, violation_type:, location: T.unsafe(nil)); end

  def reference; end
  def violation_type; end

  private

  def build_message(reference, violation_type); end
end

class Packwerk::Result < ::T::Struct
  prop :message, ::String
  prop :status, T::Boolean

  class << self
    def inherited(s); end
  end
end


Packwerk::RunContext::DEFAULT_CHECKERS = T.let(T.unsafe(nil), Array)
Packwerk::VERSION = T.let(T.unsafe(nil), String)

class Packwerk::ViolationType < ::T::Enum
  enums do
    Privacy = new
    Dependency = new
  end
end