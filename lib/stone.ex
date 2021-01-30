defmodule Stone do
  @moduledoc """
  Documentation for `Stone`.
  """

  def hello do
    IO.puts("ss")
    :world
  end

  @type produto :: %{
    valor: non_neg_integer(),
    quantidade: non_neg_integer()
  }

  @type email :: String.t()

  @spec reparte_valor([produto], [email]) :: %{String.t => non_neg_integer()}
  @doc """
  Reparte valor entre emails.

  O primeiro email sempre vai receber o valor a mais para ajustar o valor

  ## Examples

      iex> Stone.reparte_valor([%{valor: 100, quantidade: 1}], ["email1", "email2", "email3"])
      %{"email1" => 34, "email2" => 33, "email3" => 33}

  """
  def reparte_valor(itens, emails) when is_list(itens) and is_list(emails) and length(emails) > 0  do
    valor_total =
      itens
      |> Enum.map(fn item -> item.valor * item.quantidade end)
      |> Enum.sum()

    quantidade_email = Enum.count(emails)

    valor_por_email = Integer.floor_div(valor_total, quantidade_email)

    emails_valor = Enum.reduce(emails, %{}, fn x, acc -> Map.put(acc, x, valor_por_email) end)

    # Verifica se a Divisao entre as partes ocorreu de forma igualitária
    centavos_restantes = rem(valor_total, quantidade_email)

    if centavos_restantes == 0 do
      emails_valor
    else

      emails_valor
      |> Map.to_list()
      |> distribuicao(centavos_restantes)
      |> Enum.into(%{})
    end
  end

  def reparte_valor(_, emails) when is_list(emails) do
    Enum.reduce(emails, %{}, fn x, acc -> Map.put(acc, x, 0) end)
  end

  def reparte_valor(_, _) do
    %{}
  end

  @spec distribuicao([{String.t(), non_neg_integer()}], non_neg_integer) :: [{String.t(), non_neg_integer()}]
  def distribuicao(list, quantidade) when quantidade <= 0 do
    list
  end

  def distribuicao([head | tail], quantidade) do
    valor_atual = elem(head, 1)

    valor_balanceado = head
    |> put_elem(1, valor_atual + 1)

    [valor_balanceado | distribuicao(tail, quantidade - 1)]
  end
end
