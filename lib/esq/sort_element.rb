module Esq
  class SortElement
    include Esq::Item

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
  end
end