module Quotes

using SearchLight, Quotes.QuotesValidator

import SearchLight: AbstractModel, DbId
import SearchLight.Validation: ModelValidator, ValidationRule
import Base: @kwdef

export Quote

@kwdef mutable struct Quote <: AbstractModel
  id::DbId = DbId()
  type::String = ""
  quote_::String = ""
  name::String = ""
  context::String = ""
  date::String = ""
end

function SearchLight.Validation.validator(::Type{Quote})
  ModelValidator([
    ValidationRule(:quote_, QuotesValidator.not_empty)
    ValidationRule(:date, QuotesValidator.not_empty)
  ])
end

end
