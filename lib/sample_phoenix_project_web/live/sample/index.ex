defmodule SamplePhoenixProjectWeb.Sample.Struct do
  defstruct name_version: "", github_relative_path: ""

  defimpl Phoenix.HTML.Safe do
    def to_iodata(t) do
      Phoenix.HTML.Engine.html_escape(t.name_version <> "|" <> t.github_relative_path)
    end
  end
end

defmodule SamplePhoenixProjectWeb.Sample.Index do
  use SamplePhoenixProjectWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    _s = %SamplePhoenixProjectWeb.Sample.Struct{}
    {:ok, socket, layout: false}
  end
end
