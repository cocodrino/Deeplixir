defmodule ValidatorTest do
  use ExUnit.Case


  test "validate_text/1 when not receive text must return a touple with :error" do
    assert Validator.validate_text(2) == {:error, "not a valid text to translate"}
  end

  test "validate_text/1 when  receive text must return a touple with :ok and the text" do
    assert Validator.validate_text("hi") == {:ok,"hi"}
  end


end
