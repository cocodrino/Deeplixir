# Deeplixir

**This is a simple depl translator, you can translate your text to the available depl languages and it can detect the source language, missing features like show alternative translations and multiline support**

## Installation


```elixir
def deps do
  [
    {:deeplixir, "~> 0.1.0"}
  ]
end
```

## Translating text
```elixir

Deeplixir.translate("hola cómo estás",:EN,:ES)

# {:ok, "Hello, how are you?"}

#you don't need set the source language if you type a long phrase

Deeplixir.translate("how old are you?",:ES)

# {:ok, "¿Cuántos años tienes?"}
#

```