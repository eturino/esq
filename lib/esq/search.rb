module Esq
  class Search
    include Eapi::Item

    property :query, type: 'Esq::Query'
    property :filter, type: 'Esq::Filter'
    property :sort, type: 'Esq::Sort'
  end
end
