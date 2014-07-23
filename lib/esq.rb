# dependencies
require 'eapi'

# version
require 'esq/version'

# Esq Preparation
module Esq
  extend Eapi
end

# need to go after the Esq preparation (extending Eapi) or definitions will fail
require 'esq/fields'
require 'esq/filter'
require 'esq/filtered_query'
require 'esq/match_query'
require 'esq/query'
require 'esq/sort'
require 'esq/search'

