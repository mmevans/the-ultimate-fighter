require_relative "../config/environment"
require "tty-prompt"

prompt = TTY::Prompt.new


# puts "hello world"
# puts "Hey, it's Barrette!"
# puts "hello world"
# puts "Hey, it's Michael!"
location = 0
while location == 0
  prompt.say("Hello! Welcome to The Ultimate Fighter!")
  location = 1
end


while location == 1
    input1 = prompt.select("Choose your destiny?", ["Sign Up", "Login"])
    if input1 == "Sign Up"
        location = 2
    else 
        puts "Awesome"
    end
end 


while location == 2
    cuss_word_array = ["shit", "asshole", "fuck", "dick", "damn"]
    emoji1 = prompt.decorate("👻 ")
    input2 = prompt.ask("Make a username. It will be your name inside the game.")
    ### add username to db
    location = 3
end

while location == 3
    input3 = prompt.mask("Make a password", mask: emoji1)
    cuss_word_array.each do |word|
    end
           
end

while location == 4
    input4 = prompt.select("Choose your gender", ["Male", "Female"])
    location = 5

end

while location == 5
    input5 = prompt.select("Choose your trainer.", ["Doc Louis", "Mickey Goldmill", "Red", "Lance"])
    puts input4
    puts input5
end


# input4 = prompt.select("Choose your gender?", ["Male", "Female"])
#     if input3 == "Female"
#         puts "Will you go out with me?"
#     else 
#         puts "Cool"
#     end
# end