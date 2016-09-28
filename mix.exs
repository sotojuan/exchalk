defmodule ExChalk.Mixfile do
  use Mix.Project

  def project do
    [
      app: :exchalk,
      version: "1.0.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description,
      package: package,
      deps: deps
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp description do
    """
    Easier terminal styling
    """
  end

  defp deps do
    [
      {:credo, "~> 0.4", only: [:dev, :test]},
      {:earmark, "~> 0.2", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["sotojuan"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/sotojuan/exchalk"}
    ]
  end
end
