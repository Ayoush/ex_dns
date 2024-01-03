defmodule ExDns.Utils do
  @domain_extensions Application.compile_env(:ex_dns, :domain_extensions, [])
  defmacro generate_repo_names() do
    names = Enum.map(@domain_extensions, &String.to_atom("Elixir.ExDns.Repo.#{String.upcase(&1)}"))
    quote(do: unquote(names))
  end
end
