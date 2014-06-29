module Esq
  class FilteredQuery
    include Eapi::Common

    property :query, type: 'Esq::Query'
    property :filter, type: 'Esq::Filter'
  end
end
