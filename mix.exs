defmodule LoggerTelegramBackend.Mixfile do
  use Mix.Project

  def project do
    [
      app: :logger_telegram_backend,
      version: "1.1.1",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "LoggerTelegramBackend",
      description: "A Logger backend for Telegram",
      docs: [main: "readme", extras: ["README.md"]]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.18", only: :dev, runtime: false},
      {:exvcr, "~> 0.10", only: :test},
      {:machine_gun, "~> 0.1.5"}
    ]
  end
end
