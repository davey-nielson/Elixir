defmodule Todos do
  def create_stuff do
    # old code without using pipelines
    # user_input = IO.gets("How many things do you want in the stuff? ")
    # {num, _space} = Integer.parse(user_input)
    # IO.puts(num)
    # same code using pipeline operator |>
    {num_tasks, _empty_space} = IO.gets("How many things do you want in the stuff? ") |> Integer.parse()

    for _userint <- 1..num_tasks do
      IO.gets("Enter string to store to list: ") |> String.trim()
      # task = IO.gets("Enter string to store to list: ") same as above
      # String.trim(task)
    end
  end

  def temp do
    ["Driver", "Iron", "Putter"]
  end

  def complete_todo(temp_list, task) do
    if contains?(temp_list, task) do
      #execute this block of code
      List.delete(temp_list, task)
    else
      #otherwise execute this block of code
      :not_found_error
    end
  end

  def add_new_task(temp_list, task) do
    List.insert_at(temp_list, -1, task)
  end

  def contains?(temp_list, club_name) do
    Enum.member?(temp_list, club_name) # returns true or false depending on what is passed into club
  end

  def random_task(temp_list) do
    [task] = Enum.take_random(temp_list, 1)
    task
  end

  def search_list(temp_list, word) do
    for i <- temp_list, String.contains?(i, word) do
      i
    end
  end

  def write_todo(temp_list, filename) do
    # when invoking erlang code
    # converting list (Or whatever gets passed to the function) to binary
    binary = :erlang.term_to_binary(temp_list)
    File.write(filename, binary)
  end

  def read_todo(filename) do
    case File.read!(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exist"
    end
    # {_status, binary} = File.read(filename)
    # :erlang.binary_to_term(binary)
  end

end
