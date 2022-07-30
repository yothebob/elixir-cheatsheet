# run with 
defmodule M do
  def main do
    data_stuff()
    string_stuff()
    math_stuff()
    equals_stuff()
    conditional_stuff()
    switch_stuff()
    tuple_stuff()
    linked_list_stuff()
  end
  
  def data_stuff do
    my_int = 123
    IO.puts "Integer #{is_integer(my_int)}"
    my_float = 3.14
    IO.puts "Float #{is_float(my_float)}"
    IO.puts "Atom #{is_atom(:Pittsburgh)}"
    # shorthand for atom is capitalize 
    IO.puts "Atom #{is_atom(Pittsburgh)}"
  end
  
  def string_stuff do
    my_str = "My sentence"
    IO.puts "Length : #{String.length(my_str)}"
    longer_str = my_str <> " " <> "is longer"
    IO.puts "Equal : #{"Egg" === "egg" }"
    IO.puts "My ? #{String.contains?(my_str, "My")}"
    IO.puts "First : #{String.first(my_str)}"
    IO.puts " Substring : #{String.slice(my_str, 3, 8)}"
    IO.inspect String.split(longer_str, " ")
    IO.puts String.reverse(longer_str)
    IO.puts String.upcase(longer_str)
    IO.puts String.downcase(longer_str)
    IO.puts(String.capitalize(longer_str))
    4 *  10 |> IO.puts 
  end
  
  def equals_stuff do
    IO.puts "4 == 4.0 : #{4 == 4.0}"
    IO.puts "4 === 4.0 : #{4 === 4.0}"
    IO.puts "4 != 4.0 : #{4 != 4.0}"
    IO.puts "4 !== 4.0 : #{4 !== 4.0}"

    IO.puts " 5 > 4 : #{5 > 4}"
    IO.puts " 5 >= 4 : #{5 >= 4}"
    IO.puts " 5 < 4 : #{5 < 4}"
    IO.puts " 5 >= 4 : #{5 <= 4}"

    age = 16
    IO.puts("your age is : #{age}")
    IO.puts "Vote & Drive : #{(age >= 16) and (age >= 18)}"
    IO.puts "Vote or Drive : #{(age >= 16) or (age >= 18)}"
    IO.puts not true
  end

  def tuple_stuff do
    my_stats = {175, 6.25, :Derek}
    IO.puts " Tuple #{is_tuple(my_stats)}"
    # you can append to tuples but once a value is assigned it cannot be changed
    my_stats2 = Tuple.append(my_stats, 42)
    IO.puts "Age #{elem(my_stats2, 3)}"
    IO.puts "Size :  #{tuple_size(my_stats2)}"
    my_stats3 = Tuple.delete_at(my_stats2, 0)
    my_stats4 = Tuple.insert_at(my_stats3, 0, 19)
    many_zeros = Tuple.duplicate(0, 5)
    {weight, height, name} = {175, 6.25, "Derek"}
    
    IO.puts "weight :  #{weight}"
    
  end

  def linked_list_stuff do
    list1 = [1,2,3]
    list2 = [4,5,6]
    list3 = list1 ++ list2

    list4 = list3 -- list1

    IO.puts 6 in list4

    [head|tail] = list3
    IO.puts "Head: #{head}"
    # writes is lie puts but does not put a new line after
    IO.write "Tail : "
    IO.inspect tail
# inspect gives the internal representation of the value, meaning it will not allways give expected results 
    IO.inspect [97,98]
    # here this output the ascii char equiv
    IO.inspect [97,98], char_list: :as_list
    # this fixes that

    # loop through linked list
    Enum.each tail, fn item ->
      IO.puts item
    end

    words = ['random', 'words', 'in', 'a', 'list']
    Enum.each words, fn word ->
      IO.puts word
    end

    display_list(words)

    IO.puts display_list(List.delete(words, "random"))

    
    IO.puts display_list(List.delete_at(words, 1))
    
    IO.puts display_list(List.insert_at(words, 1, "Yeah"))
    
    IO.puts List.first(words) 
    
    IO.puts List.last(words)

    my_stats = [name: "derek", height: 6.25]
  end


  def display_list([word|words]) do
		    IO.puts word
		    display_list(words)
  end
    
  def display_list([]), do: nil

  
  def switch_stuff do
    age = 16
    case 2 do
      1 -> IO.puts " Entered 1"
      2 -> IO.puts " Entered 2"
      _ -> IO.puts " This is another way to do default"
    end

    IO.puts "Ternary : #{if age > 18, do: "can vote", else: "cant vote"}"
  end
  
  def conditional_stuff do
    age = 16
    if age >= 18 do
      IO.puts "Can Vote"
    else
      IO.puts "Can't Vote"
    end

    unless age === 18 do
      IO.puts " you are not 18"
    else
      IO.puts " you are 18"
    end

    cond do
	# triggers the first true one 
      age >= 18 -> IO.puts " you can vote"
      age >= 16 -> IO.puts " you can drive"
      age >= 14 -> IO.puts " you can wait"
      true -> IO.puts " this is the default" 
    end

  end

  def math_stuff do
    IO.puts "5 + 4 = #{5+4}"
    IO.puts "5 - 4 = #{5-4}"
    IO.puts "5 * 4 = #{5*4}"
    IO.puts "5/4 = #{5/4}"
    IO.puts "5 div 4 = #{div(5,4)}"
    IO.puts "5 rem 4 = #{rem(5,4)}"

  end

  def in_out do
    # get input and remove newline
    name = IO.gets("what is your name? ") |> String.trim
    # parenthese are optional
    IO.puts "Hello #{name}"
  end
  
end


