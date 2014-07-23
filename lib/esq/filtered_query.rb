module Esq
  class FilteredQuery
    include Esq::Item

    property :query, type: 'Esq::Query'
    property :filter, type: 'Esq::Filter'
  end
end
