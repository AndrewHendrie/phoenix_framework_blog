defmodule PhoenixBlog.Router do
  use PhoenixBlog.Web, :router
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", PhoenixBlog do
    pipe_through :browser # Use the default browser stack
    resources "/posts", PostController do
      post "/comment", PostController, :add_comment
    end
    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    resources "/users", UserController
  end

end
