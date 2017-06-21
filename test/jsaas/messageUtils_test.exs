defmodule JSaaS.Doctests do
  use ExUnit.Case, async: true
  doctest JSaaS.MessageUtils
  doctest JSaaS.Router
  doctest JSaaS.Tweet
  doctest JSaaS.Validator
end

