defmodule MetaElixir do
  defmodule MyMacros do

    defmacro my_if(condition, do: code) do
      quote do
        (unquote(condition) && unquote(code)) || nil
      end
    end

    defmacro my_if_else(condition, do: true_code, else: false_code) do
      quote do
        case not (unquote(condition) in [false, nil]) do
          true -> unquote(true_code)
          false -> unquote(false_code)
        end
      end
    end

    defmacro my_unless(condition, do: code) do
      quote do
        MyMacros.my_if(!unquote(condition), do: unquote(code))
      end
    end
  end
end
