defmodule StoneTest do
  use ExUnit.Case
  doctest Stone

  test "Deve dividir entre 3 emails 100 centavos" do
    resultado_reparticao = Stone.reparte_valor([%{valor: 100, quantidade: 1}], ["email1", "email2", "email3"])

    soma_total = resultado_reparticao
    |> Map.values()
    |> Enum.sum()

    assert soma_total  == 100
  end

  test "Deve dividir entre 2 emails 100 centavos" do

    resultado_reparticao = Stone.reparte_valor([%{valor: 100, quantidade: 1}], ["email1", "email2"])

    soma_total = resultado_reparticao
    |> Map.values()
    |> Enum.sum()

    assert soma_total  == 100
  end

  test "Na Deve dividir entre 0 emails 100 centavos" do

    resultado_reparticao = Stone.reparte_valor([%{valor: 100, quantidade: 1}], [])

    soma_total = resultado_reparticao
    |> Map.values()
    |> Enum.sum()

    assert soma_total  == 0
  end

  test "Na Deve dividir entre 3 emails 0 centavos" do

    resultado_reparticao = Stone.reparte_valor([], ["email1", "email2", "email3"])

    soma_total = resultado_reparticao
    |> Map.values()
    |> Enum.sum()

    assert soma_total  == 0
  end

  test "Na Deve dividir entre 0 emails 0 centavos" do

    resultado_reparticao = Stone.reparte_valor([], [])

    soma_total = resultado_reparticao
    |> Map.values()
    |> Enum.sum()

    assert soma_total  == 0
  end

  test "Deve dividir entre 3 emails 10000000 centavos" do
    resultado_reparticao = Stone.reparte_valor([%{valor: 10000000, quantidade: 1}], ["email1", "email2", "email3"])

    soma_total = resultado_reparticao
    |> Map.values()
    |> Enum.sum()

    assert soma_total  == 10000000
  end

  test "Deve dividir entre 100000 emails 100000 centavos" do
    emails = 1..100000 |> Enum.map(fn x -> "email#{x}@email.com" end)

    resultado_reparticao = Stone.reparte_valor([%{valor: 100000, quantidade: 1}], emails)

    soma_total = resultado_reparticao
    |> Map.values()
    |> Enum.sum()

    assert soma_total  == 100000
  end

  test "Deve dividir entre 1412 emails 100000 centavos" do
    emails = 1..1412 |> Enum.map(fn x -> "email#{x}@email.com" end)

    resultado_reparticao = Stone.reparte_valor([%{valor: 100000, quantidade: 1}], emails)

    soma_total = resultado_reparticao
    |> Map.values()
    |> Enum.sum()

    assert soma_total  == 100000
  end

  test "Deve somar produtos e dividir entre 7 emails 10 centavos no total" do
    resultado_reparticao = Stone.reparte_valor([%{valor: 1, quantidade: 10}], gerar_emails(7))

    soma_total = resultado_reparticao
    |> Map.values()
    |> Enum.sum()

    assert soma_total  == 10
  end

  defp gerar_emails(n) do
    1..n |> Enum.map(fn x -> "email#{x}" end)
  end
end
