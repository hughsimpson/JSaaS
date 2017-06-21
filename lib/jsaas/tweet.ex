defmodule JSaaS.Tweet do

  @derive [Poison.Encoder]
  defstruct text: nil

  @doc ~S"""
      iex> JSaaS.Tweet.to_single_tweet([%ExTwitter.Model.Tweet{text: "foo"}], &String.reverse/1)
      "{\"text\":\"oof\"}"
  """
  @spec to_single_tweet([%ExTwitter.Model.Tweet{}, ...], (String.t -> String.t)) :: String.t
  def to_single_tweet(tweetsResponse, transformation) when is_list(tweetsResponse) do
    tweetsResponse
    |> Enum.map(&(&1.text))
    |> Enum.filter(&JSaaS.Validator.is_not_uri?/1)
    |> Enum.random
    |> transformation.()
    |> init_from_message
    |> Poison.encode!
  end

  @doc ~S"""
      iex> JSaaS.Tweet.init_from_message("ok!")
      %JSaaS.Tweet{text: "ok!"}
  """
  @spec init_from_message(String.t) :: %JSaaS.Tweet{}
  def init_from_message(tweetMessage) do
    %JSaaS.Tweet{text: tweetMessage}
  end
end
