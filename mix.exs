defmodule ExMath.Mixfile do
  use Mix.Project

  def project do
    [app: :exmath,
     version: "0.1.0",
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
