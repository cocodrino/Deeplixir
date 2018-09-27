defmodule DeeplixirTest do
  use ExUnit.Case
  doctest Deeplixir

  test "translate/3 with bad target language must fail" do
    assert Deeplixir.translate("hola", :RUS, :ES) == "target language : RUS is not valid, available languages are DE,EN,ES,FR,IT,NL,PL,auto"
  end

  test "translate/3 with bad source language must fail" do
    assert Deeplixir.translate("iwsa", :ES, :KRIPTON) == "source language: KRIPTON is not valid, available languages are DE,EN,ES,FR,IT,NL,PL,auto"
  end


end
