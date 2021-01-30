# Stone

Auhor: Marcus Goldschmidt Oliveira

## Como usar

Para executar pelo REPL utilize o seguinte comando

```sh
iex -S mix
```

Em seguida poderá usar `Stone.reparte_valor/2`

```elixir
Stone.reparte_valor([%{valor: 100, quantidade: 1}], ["email1", "email2", "email3"])
# %{"email1" => 34, "email2" => 33, "email3" => 33}
```

## Como testar

Estando na pasta raiz do projeto execute

```sh
mix test
```