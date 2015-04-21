defmodule ExMath.Mixfile do
  use Mix.Project

  def project do
    [app: :exnum,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:primes, github: "ewildgoose/elixir-primes"}
    ]
  end
end
