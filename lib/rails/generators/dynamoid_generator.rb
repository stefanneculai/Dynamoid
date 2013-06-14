# encoding: utf-8
require "rails/generators/named_base"
require "rails/generators/active_model"

module Dynamoid
  module Generators
    class Base < ::Rails::Generators::NamedBase

      def self.source_root
        @_dynamoid_source_root ||=
          File.expand_path("../#{base_name}/#{generator_name}/templates", __FILE__)
      end
    end

    class ActiveModel < ::Rails::Generators::ActiveModel
      def self.all(klass)
        "#{klass}.all"
      end

      def self.find(klass, params=nil)
        "#{klass}.find(#{params})"
      end

      def self.build(klass, params=nil)
        if params
          "#{klass}.new(#{params})"
        else
          "#{klass}.new"
        end
      end

      def save
        "#{name}.save"
      end

      def update_attributes(params=nil)
        "#{name}.update_attributes(#{params})"
      end

      def errors
        "#{name}.errors"
      end

      def delete
        "#{name}.delete"
      end

      def destroy
        "#{name}.destroy"
      end
    end
  end
end

module Rails
  module Generators
    class GeneratedAttribute
    end
  end
end