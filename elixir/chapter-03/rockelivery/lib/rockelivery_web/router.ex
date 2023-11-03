defmodule RockeliveryWeb.Router do
  use RockeliveryWeb, :router

  alias RockeliveryWeb.Plugs.UUIDChecker

  pipeline :api do
    plug :accepts, ["json"]
    plug UUIDChecker
  end

  scope "/api", RockeliveryWeb do
    pipe_through :api

    get "/", WelcomeController, :index

    resources "/users", UsersController, except: [:new, :edit]
  end

  if Application.compile_env(:rockelivery, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: RockeliveryWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
