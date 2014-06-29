module Esq
  class MatchQuery
    include Eapi::Common

    property :field
    property :query
    property :operator
    property :minimum_should_match
    property :analyzer
    property :fuzziness
    property :zero_terms_query
    property :cutoff_frequency
  end
end
