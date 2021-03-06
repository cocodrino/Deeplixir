defmodule Deeplixir do
  @moduledoc """
  Main module, provide the translate function
  """

@doc """
Return a string with the translation

ex

iex> Deeplixir.translate("how old are you?",:ES)
"¿Cuántos años tienes?"
"""
  def translate(text, target_lang, source_lang \\ :auto) do
    with {:ok,text} <- Validator.validate_text(text),
         {:ok,source} <- Validator.validate_source_language(source_lang),
         {:ok,target} <- Validator.validate_target_language(target_lang)
         do
            if String.length(text)>0 do
              DeeplApiHelper.make_request(text, target, source)
            else
              {:ok,""}
            end
         else
            {:error,message} -> message
         end

  end


end

