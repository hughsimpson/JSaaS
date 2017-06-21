defmodule JSaaS.Validator do
  @doc """
      iex> JSaaS.Validator.is_not_uri?("0098765432asdfghj")
      true

      iex> JSaaS.Validator.is_not_uri?("www.example.com")
      true

      iex> JSaaS.Validator.is_not_uri?("another«hmm://?x.y")
      true

      iex> JSaaS.Validator.is_not_uri?("http://foo.bar")
      false

      iex> JSaaS.Validator.is_not_uri?("another.hmm://?x.y")
      false

      iex> JSaaS.Validator.is_not_uri?("git://lol.ok")
      false

      iex> JSaaS.Validator.is_not_uri?("https://min.to/right?q=param")
      false
  """
  @spec is_not_uri?(String.t) :: boolean
  def is_not_uri?(text) do
    uri = URI.parse(text)
    uri.scheme == nil || false
  end
end
