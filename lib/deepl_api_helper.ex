defmodule DeeplApiHelper do
  @deepl_hostname "https://www2.deepl.com"
  @deepl_endpoint "/jsonrpc"

  def build_json_body(text,target,source,beginning) do
    Poison.encode!(
      %{
        jsonrpc: "2.0",
        method: "LMT_handle_jobs",
        id: 1,
        params: %{
          jobs: [%{
              kind: "default",
              raw_en_sentence: text,
              de_sentence_beginning: beginning
            }],
          lang: %{
            user_preferred_langs: ["EN"],
            source_lang_user_selected: source,
            target_lang: target
          },
          priority: -1
        },
      }
    )
  end


  def make_request(text,target,source,beginning \\ 1) do
    builded_body = build_json_body(text,target,source,beginning)
    with {:ok,response} <- HTTPoison.post(@deepl_hostname <> @deepl_endpoint,builded_body,
                          [{"Content-Type", "application/json"}, {"Cache-Control","no-cache"}]),
         %{body: body, status_code: 200} <- response
    do
       body
        |>Poison.decode!()
        |> get_in(["result","translations"])
        |> Enum.at(0)|>Map.get("beams")
        |>Enum.sort(&(&1["score"]>&2["score"]))
        |>Enum.at(0)
        |>Map.get("postprocessed_sentence")
        |>(&Regex.run(~r/\d+. (.+)/,&1)).()|>Enum.at(1)
    else
      error -> "error #{error}"
    end

    #, {"Content-Length", byte_size(body)}
  end
end
