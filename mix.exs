defmodule ExMath.Mixfile do
  use Mix.Project

  def project do
    [app: :exmath,
     version: "0.1.1",
     elixir: "~> 1.0",
     deps: deps(),
     source_url: "https://github.com/maxig/exmath"]
  end

  def application do
    [applications: [:logger, :primes]]
  end

  defp deps do
    [
      {:primes, github: "ewildgoose/elixir-primes"}
    ]
  end
end
