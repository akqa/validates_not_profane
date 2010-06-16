require 'active_model'
require 'profanalyzer'

module ActiveModel
  module Validations
    class ProfanityValidator < ActiveModel::EachValidator
      DEFAULT_TOLERANCE = 2

      def validate_each(record, attribute, value)
        if options.has_key?(:tolerance)
          Profanalyzer.tolerance = options[:tolerance]
        else
          Profanalyzer.tolerance = DEFAULT_TOLERANCE
        end

        if options[:all]
          Profanalyzer.check_all    = true
        elsif options[:sexual] && options[:racist]
          Profanalyzer.check_all    = false
          Profanalyzer.check_sexual = true
          Profanalyzer.check_racist = true
        elsif options[:sexual]
          Profanalyzer.check_all    = false
          Profanalyzer.check_sexual = true
          Profanalyzer.check_racist = false
        elsif options[:racist]
          Profanalyzer.check_all    = false
          Profanalyzer.check_sexual = false
          Profanalyzer.check_racist = true
        else
          Profanalyzer.check_all    = true
        end

        if Profanalyzer.profane?(value)
          record.errors.add(attribute, :profane, options)
        end
      end
    end

    module HelperMethods
      # Validates whether the value of the specified attributes contain
      # profanity
      #
      #   class Comment < ActiveRecord::Base
      #     validates_not_profane :body
      #   end
      #
      # Configuration options:
      # * <tt>:message</tt> - A custom error message (default is: "must not contain any vulgar words").
      # * <tt>:tolerance</tt> - Tolerance for Profanalyzer
      # * <tt>:sexual</tt> - Whether to check for sexual words
      # * <tt>:racist</tt> - Whether to check for racial slurs
      # * <tt>:all</tt> - Whether to check all bad words
      def validates_not_profane(*attr_names)
        validates_with ProfanityValidator, _merge_attributes(attr_names)
      end
    end

  end
end

