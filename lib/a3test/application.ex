defmodule A3test.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      A3testWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: A3test.PubSub},
      # Start the Endpoint (http/https)
      A3testWeb.Endpoint
      # Start a worker by calling: A3test.Worker.start_link(arg)
      # {A3test.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: A3test.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    A3testWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
