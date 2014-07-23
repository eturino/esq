module Esq
  class Search
    include Esq::Item

    property :query, type: 'Esq::Query'
    property :filter, type: 'Esq::Filter'
    property :sort, type: 'Esq::Sort', init_class: 'Esq::Sort'
    property :fields, type: 'Esq::Fields', init_class: 'Esq::Fields'
  end
end
