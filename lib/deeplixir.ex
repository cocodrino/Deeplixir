defmodule Deeplixir do


  def sample(:name, values \\ %{lang: "en"}) do
    IO.puts(values[:lang])
  end



  def translate(text, target_lang, source_lang \\ :auto) do
    with {:ok,text} <- Validator.validate_text(text),
         {:ok,source} <- Validator.validate_source_language(source_lang),
         {:ok,target} <- Validator.validate_target_language(target_lang)
         do
            DeeplApiHelper.make_request(text, target, source)
         else
            {:error,message} -> message
         end

  end


end

