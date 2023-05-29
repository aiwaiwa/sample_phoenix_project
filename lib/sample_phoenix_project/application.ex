defmodule SamplePhoenixProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SamplePhoenixProjectWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SamplePhoenixProject.PubSub},
      # Start Finch
      {Finch, name: SamplePhoenixProject.Finch},
      # Start the Endpoint (http/https)
      SamplePhoenixProjectWeb.Endpoint
      # Start a worker by calling: SamplePhoenixProject.Worker.start_link(arg)
      # {SamplePhoenixProject.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SamplePhoenixProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SamplePhoenixProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
