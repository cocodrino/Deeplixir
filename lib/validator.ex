defmodule Validator do
  @valid_langs %{EN: "English",
                 DE: "German",
                 FR: "French",
                 ES: "Spanish",
                 IT: "Italian",
                 NL: "Dutch",
                 PL: "Polish",
                 auto: "Auto"}


  def validate_text(text) when is_bitstring(text), do: {:ok,text}
  def validate_text(_text), do: {:error, "not a valid text to translate"}


  def validate_source_language(source) do
    if Map.get(@valid_langs,source) !== nil,do: {:ok,source}, else: {:error, "source language: #{source} is not valid, available languages are #{Map.keys(@valid_langs)|> Enum.join(",")}"}
  end

  def validate_target_language(target) do
    if Map.get(@valid_langs,target) !== nil, do: {:ok,target}, else: {:error,"target language : #{target} is not valid, available languages are #{Map.keys(@valid_langs)|> Enum.join(",")}"}
  end

end
