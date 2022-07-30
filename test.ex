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
    dict_stuff()
    pattern_match_stuff()
    lambda_stuff()
    recursive_stuff()
    loop_stuff()
    enumerable_stuff()
    list_comprehension_stuff()
    exeption_stuff()
    concurrency_stuff()
  end

  def concurrency_stuff do
    ask_first = IO.gets "Do you want to run concurrent loops?y/n\n"
    if String.downcase(ask_first) == "y" do
    spawn(fn() -> loop(50,1) end)
    spawn(fn() -> loop(100,50) end)
    else
      IO.puts "your missing out!"
    end
    name = IO.gets "whats your name? \n"
    language = IO.gets "What language do you speak?\n"

    send(self(), {:english,String.capitalize(name)})

    receive do
      {:german, name} -> IO.puts "Guten tag #{name}"
      {:english, name} -> IO.puts "Hello #{name}"
      {:french, name} -> IO.puts "Bonjour #{name}"
      {:python, name} -> IO.puts "W0w #{name}, y0ur @ 4@ck3r!"

    after
      500 -> IO.puts "Times up"
    
    end
    
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

  def dict_stuff do
    capitals = %{"Alabama" => "Montgomery",
		 "Alaska" => "Juneau",
		 "Arizona" => 'Phoenix'}
    # the atom way
    capitals2 = %{alabama: "Montgomery",
		 alaska: "Juneau",
		 arizona: 'Phoenix'}
    IO.puts "capital of Alaska is #{capitals["Alaska"] }"
    IO.puts "capital of Arizona is #{capitals2.arizona}"
    capitals3 = Dict.put_new(capitals, "Arkansas", "little Rock")
    IO.puts "capital of Arizona is #{capitals3["Arkansas"]}"
  end
  

  def pattern_match_stuff do
    [length, width] = [20,30]
    IO.puts "width: #{width}"
    # _ is how you ignore an value
    [_,[_,a]] = [20,[30,40]]
     IO.puts "get Num: #{a}"
  end

     def lambda_stuff do
       get_sum = fn (x,y) -> x + y end
       IO.puts "5 + 5 = #{get_sum.(5,5)}"

       get_less = &(&1 - &2)
       IO.puts "6 - 5 = #{get_less.(6,5)}"

       add_sum = fn
       {x, y} -> IO.puts "#{x} + #{y} = #{x+y}"
       {x, y, z} -> IO.puts "#{x} + #{y} + #{z} = #{x+y+z}"
       end
       add_sum.({1,2})
       add_sum.({1,2,5})

       IO.puts do_it()
  end

     def do_it(x \\ 1, y \\ 1 ) do
       # \\ is how to do default value for args
       x + y 
     end

     def recursive_stuff do
       IO.puts "Factorial of 4 : #{factorial(4)}"
     end
     
     def factorial(num) do
       if num <= 1 do
	 1
       else
	 result = num * factorial(num - 1)
	 result # this is how you return 
       end
     end
     
     def loop_stuff do

       IO.puts "Sum : #{sum([1,2,3])}"

       loop(5,1)
       
     end
     
     def loop(0,_), do: nil
     
     def loop(max, min) do
       if max < min do
	 loop(0,0)
       else
	 IO.puts "Num : #{max}"
	 loop(max - 1, min)
       end
     end
     
     def sum([]), do: 0
       
     def sum([h|t]), do: h + sum(t)


     def enumerable_stuff do
       IO.puts "Even List : #{Enum.all?([1,2,3], fn(n) -> rem(n, 2) == 0 end)}"
       IO.puts "Even List : #{Enum.any?([1,2,3], fn(n) -> rem(n, 2) == 0 end)}"
       Enum.each([1,2,3], fn(n) -> IO.puts n end)
       double_list = Enum.map([1,2,3], fn(n) -> n*2 end)
       sum_values = Enum.reduce([1,2,3], fn(n, sum) -> n + sum end)
       IO.puts "sum : #{sum_values}"
       IO.inspect Enum.uniq([1,2,2])
     end

     def list_comprehension_stuff do
       testing_list = [1,2,3,4]
       dbl_list = for n <- testing_list, do: n * 2
       IO.puts "Doubled List"
       IO.inspect dbl_list

       even_values = for n <- testing_list, rem(n,2) == 0, do: n
       IO.inspect even_values
       two_list = for n <- testing_list, rem(n,2) == 0,n == 2, do: n
       IO.inspect two_list
     end

     def exeption_stuff do
       err = try do
	       5 / 0

	     rescue
	     ArithmeticError -> "cant divide by zero"
	     end
       IO.puts err
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


