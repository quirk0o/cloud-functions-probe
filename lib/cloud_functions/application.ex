defmodule CloudFunctions.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  import Supervisor.Spec

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: CloudFunctions.Worker.start_link(arg)
      # {CloudFunctions.Worker, arg},
      worker(CloudFunctions.Scheduler, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CloudFunctions.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
