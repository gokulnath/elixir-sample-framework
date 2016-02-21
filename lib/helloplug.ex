defmodule Router do
  defmacro __using__(_opts) do
    quote do
      def init(options) do
        options
      end
      def call(conn, _opts) do
        route(conn.method, conn.path_info, conn)
      end
    end
  end  
end

defmodule Helloplug do
  def init(default_opts) do
    IO.puts "Starting up Helloplug..."
    default_opts
  end

  def call(conn, _opts) do
    route(conn.method, conn.path_info, conn)
  end

  def route("GET", ["users", user_id], conn) do
    # for /users/>user_id>j
    conn |> Plug.Conn.send_resp(200, "You requested user #{user_id}")
  end

  def route(_method, _path, conn) do
    conn |> Plug.Conn.send_resp(404, "Nothing here!")
  end    
end