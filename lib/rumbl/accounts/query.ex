defmodule Rumbl.Accounts.Query do
  defmacro __using__(options) do
    repo = Keyword.get(options, :repo, Rumbl.Repo)
    schema = Keyword.get(options, :schema, nil)

    quote do
      def list(opts \\ []) do
        {:ok, list!(opts)}
      end

      def list!(opts \\ []) do
        opts
        |> query!()
        |> unquote(repo).all()
      end

      def get(id, opts \\ []) do
        {:ok, get!(id, opts)}
      end

      def get!(id, opts \\ []) do
        unquote(schema)
        |> unquote(repo).get(id)
      end

      def count(opts \\ []) do
        count!(opts)
      end

      def count!(opts \\ []) do
        unquote(schema)
        |> unquote(repo).aggregate(:count)
      end

      def query!(opts \\ []) do
        unquote(schema)
      end
    end
  end
end
