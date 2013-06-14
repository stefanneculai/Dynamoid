# encoding: utf-8
require 'rails/generators/dynamoid_generator'

module Dynamoid
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      desc "Creates a Dynamoid configuration file at config/initializers/dynamoid.rb"

      argument :namespace, type: :string, optional: true, :default => Dynamoid::Config.namespace

      def self.source_root
        @_dynamoid_source_root ||= File.expand_path("../templates", __FILE__)
      end

      def default_namespace
        Rails::Application.subclasses.first.parent.to_s.underscore
      end

      def create_config_file
        template 'dynamoid.rb.tt', File.join('config/initializers', "dynamoid.rb")
      end

    end
  end
end