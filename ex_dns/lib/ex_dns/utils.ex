defmodule ExDns.Utils do
  @domain_extensions Application.compile_env(:ex_dns, :domain_extensions, [])
  defmacro generate_repo_names() do
    names = generate_repo_name()
    quote(do: unquote(names))
  end

  defmacro configure_repos() do
    repo_name = generate_repo_name()
    configs = Enum.map(repo_name, &configure_repo/1)

    quote do
      unquote(configs)
    end
  end

  defp generate_repo_name() do
    Enum.map(@domain_extensions, &String.to_atom("Elixir.ExDns.Repo.#{String.upcase(&1)}"))
  end

  defp configure_repo(repo) do
    quote do
      Application.put_env(:ex_dns, unquote(repo),
        database: "ex_dns_repo",
        username: System.get_env("username"),
        password: System.get_env("password"),
        hostname: System.get_env("host"),
        pool_size: 10
      )
    end
  end
end
