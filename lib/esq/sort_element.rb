module Esq
  class SortElement
    include Esq::Item

    def self.build_from(value)
      Factory.call value
    end

    property :field,
             required:     true,
             convert_with: ->(value) { value.nil? ? nil : value.to_sym }


    property :direction,
             default:       :asc,
             ignore:        :blank?,
             convert_with:  ->(value) { value.to_s.downcase.to_sym },
             validate_with: ->(record, attr, value) do
               unless value.blank? || [:asc, :desc].include?(value.to_s.downcase.to_sym)
                 record.errors.add(attr, "must be 'asc' or 'desc'")
               end
             end

    def perform_render
      f = final_prop :field
      d = final_prop :direction

      {f => d}
    end

    private
    def final_prop(prop)
      converted_or_default_value_for(prop).to_s.downcase.to_sym
    end

    class Factory
      def self.call(raw)
        return raw if raw.nil? || raw.kind_of?(SortElement)

        treated = catch(:treated) do
          build_from_hash(raw)
          build_from_array(raw)
          build_from_simple_value(raw)
        end

        treated || raw
      end

      def self.build_from_array(raw)
        return unless raw.respond_to?(:first) && raw.respond_to?(:last) && raw.respond_to?(:size)

        f = raw.first
        d = raw.size > 1 ? raw.last : nil
        throw :treated, SortElement.new(field: f, direction: d)
      end

      def self.build_from_hash(raw)
        return unless raw.respond_to?(:key?) && raw.respond_to?(:fetch)

        f = raw.fetch('field') { raw.fetch(:field, nil) }
        d = raw.fetch('direction') { raw.fetch(:direction, nil) }
        throw :treated, SortElement.new(field: f, direction: d)
      end

      def self.build_from_simple_value(raw)
        return unless raw.respond_to?(:to_sym)

        f = raw.to_sym
        throw :treated, SortElement.new(field: f)
      end
    end
  end
end