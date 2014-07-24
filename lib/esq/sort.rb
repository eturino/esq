module Esq
  class Sort
    include Esq::List

    elements type: 'Esq::SortElement', prepare_with: ->(val) { Esq::SortElement.build_from(val) }
  end
end
