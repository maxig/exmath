defmodule ExMath do
  @spec id(a) :: a when a: any
  def id(x), do: x

  @spec sign(number) :: -1 | 0 | 1
  def sign(0), do: 0
  def sign(x) when x < 0, do: -1
  def sign(_), do: 1

  @spec sum([number]) :: number
  def sum([]), do: 0
  def sum(xs), do: Enum.reduce(xs, &Kernel.+/2)

  @spec factors(pos_integer) :: [pos_integer]
  def factors(1), do: [1]
  def factors(x), do: factors(x, Math.Primes.sieve(x), [])

  defp factors(x, [prime | _rest], fs) when x < prime, do: Enum.reverse(fs)
  defp factors(x, [prime | rest], fs) when rem(x, prime) == 0 do
    factors div(x, prime), [prime | rest], [prime | fs]
  end
  defp factors(x, [_ | rest], fs), do: factors(x, rest, fs)

  @spec gcd(integer, integer) :: integer
  def gcd(a, 0), do: a
  def gcd(a, b), do: gcd(b, rem(a, b))

  @spec hypot(number, number) :: float
  def hypot(a, b) do
    a = abs(a)
    b = abs(b)
    
    if a < b, do: {a, b} = {b, a}

    if a == 0 do
      0.0
    else
      ba = b/a
      a * :math.sqrt(1 + ba*ba)
    end
  end

  @spec copysign(float, float) :: float
  def copysign(a, b) do
    <<_ :: 1, rest :: bitstring>> = <<a :: float>>
    <<sign :: 1, _ :: bitstring>> = <<b :: float>>

    <<ret :: float>> = <<sign :: 1, rest :: bitstring>>
    ret
  end

  @spec signbit(float) :: boolean
  def signbit(x) do
    case <<x :: float>> do
      <<1 :: 1, _ :: bitstring>> -> true
      _ -> false
    end
  end

  @doc """
  Equality comparison for floating point numbers, based on
  [this blog post](https://randomascii.wordpress.com/2012/02/25/comparing-floating-point-numbers-2012-edition/)
  by Bruce Dawson.
  """
  @spec close_enough?(number, number, number, non_neg_integer) :: boolean
  def close_enough?(a, b, epsilon, max_ulps) do
    a = :erlang.float a
    b = :erlang.float b 

    cond do
      abs(a - b) <= epsilon -> true

      signbit(a) != signbit(b) -> false

      ulp_diff(a, b) <= max_ulps -> true
      
      true -> false
    end
  end

  @spec ulp_diff(float, float) :: integer
  defp ulp_diff(a, b), do: abs(as_int(a) - as_int(b))

  @spec as_int(float) :: non_neg_integer
  defp as_int(x) do
    <<int :: 64>> = <<x :: float>>
    int
  end
end

