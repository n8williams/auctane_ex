defmodule Auctane.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      name: "Auctane ShipEngine API Client",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs()
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    [
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      groups_for_modules: [
        "ShipEngine Data Application": [
          Auctane.ShipEngineData.Application
        ],
        "ShipEngine Data Authorization": [
          Auctane.ShipEngineData.Auth.FileStorage,
          Auctane.ShipEngineData.Auth.Support
        ],
        "ShipEngine Data Carriers": [
          Auctane.ShipEngineData.Carriers.Contexts.Carriers,
          Auctane.ShipEngineData.Carriers.Schema.Carrier,
          Auctane.ShipEngineData.Carriers.Services.CarrierService
        ],
        "ShipEngine Data Core": [
          Auctane.ShipEngineData.Core.Support.StructSupport
        ],
        "CLI Authorization Interface": [
          Auctane.Ui.Cli.Auth.Login,
          Auctane.Ui.Cli.Auth.Logout
        ],
        "CLI Carriers Interface": [
          Auctane.Ui.Cli.Carriers.Contexts.Carriers
        ]
      ]
    ]
  end
end
