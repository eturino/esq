module Esq
  class FilteredQuery
    include Eapi::Item

    property :query, type: 'Esq::Query'
    property :filter, type: 'Esq::Filter'
  end
end
