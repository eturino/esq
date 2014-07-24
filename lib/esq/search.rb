module Esq
  class Search
    include Esq::Item

    property :query, type: 'Esq::Query', ignore: :blank?
    property :filter, type: 'Esq::Filter', ignore: :blank?
    property :sort, type: 'Esq::Sort', init_class: 'Esq::Sort', ignore: :blank?
    property :fields, type: 'Esq::Fields', init_class: 'Esq::Fields', ignore: :blank?
  end
end
