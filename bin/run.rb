require_relative "../config/environment"
require "tty-prompt"
require 'pry'

prompt = TTY::Prompt.new


# puts "hello world"
# puts "Hey, it's Barrette!"
# puts "hello world"
# puts "Hey, it's Michael!"
location = 0
emoji1 = prompt.decorate("👻 ")
current_user = nil
while location == 0
  prompt.say("Hello! Welcome to The Ultimate Fighter!")
  location = 1
end


while location == 1
    input1 = prompt.select("Choose your destiny?", ["Sign Up", "Login"])
    if input1 == "Sign Up"
        location = 2
    else 
        location = 7
    end
end 


while location == 2
    array_of_usernames_signup = []
    emoji1 = prompt.decorate("👻 ")
    User.all.select do |user|
       array_of_usernames_signup.push(user.username)
    end
    input2 = prompt.ask("Make a username. It will be your name inside the game.")
    if array_of_usernames_signup.include?(input2) == false
        #current_user = user
        #start
        
        #finish
        location = 3
    else
        prompt.say("Sorry, that username is already taken. Please try another!")
    end


    ### add username to db
end

while location == 3
    sex_filter = LanguageFilter::Filter.new matchlist: :profanity, replacement: :stars
    hate_filter = LanguageFilter::Filter.new matchlist: :hate, replacement: :stars
    #maybe add more later
    input3 = prompt.mask("Make a password", mask: emoji1)

    if sex_filter.match?(input3) || hate_filter.match?(input3)
        prompt.say("Please input another password.")
    else
        location = 4
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
    location = 6
end

while location == 6
    new_user = User.create({
            :username => input2,
            :trainer_name => input5,
            :energy => 100,
            :money => 0,
            :flex => 1,
            :str => 1,
            :end => 1,
            :fights_won => 0,
            :weeks_trained => 0,
            :injured => false,
            :password => input3,
            :gender => input4
        })
    location = 7
end

while location == 7
    array_of_usernames_login = []
    input6 = prompt.ask("What is your username?")
    User.all.select do |user|
        array_of_usernames_login.push(user.username)
     end
    if array_of_usernames_login.include?(input6) == false
        prompt.say("Sorry that username doesn't exist.")
        location = 1
    else 
        location = 8
    end
end


while location == 8
    input7 = nil
    User.all.each do |user|
       user.username == input6
       input7 = user.password
     end
     input8 = prompt.mask("Make a password", mask: emoji1)
     if input7 == input8
        location = 9
     else
        prompt.say("Sorry, you've entered the wrong password")
     end
end


while location == 9
    current_user = input6
    puts "Current user is #{input6}."
    input9 = prompt.select("Choose your trainer.", ["Stats", "Fight", "Train", "Help"])
    if input9 == "Stats"
        location = 10
    elsif input9 == "Fight"
        location = 11
    elsif input9 == "Train"
        location = 12
    elsif input9 == "Help"
        location = 13
    end
end

while location == 10
    prompt.say("MONEY: #{current_user.money}")
    prompt.say("ENERGY: #{current_user.energy}")
    prompt.say("STRENGTH: #{current_user.strength}")
    prompt.say("FLEXIBILITY: #{current_user.flexibility}")
    prompt.say("ENDURANCE: #{current_user.endurance}")
    prompt.say("TRAINER: #{current_user.trainer}")
    prompt.say("WEEKS TRAINED #{current_user.weekstrained}")
    prompt.say("FIGHTS WON #{current_user.fights_won}")
    prompt.say("INJURED #{current_user.injured}")
    prompt.say("GENDER #{current_user.gender}")
    input10 = prompt.select("Ready to go back?", ["Back"])
    if input10 == "Back"
        location = 9
    end
end

while location == 11
    prompt.say("This is where you'll be fighting")
    input11 = prompt.select("Ready to go back?", ["Back"])
    if input11 == "Back"
        location = 9
    end
end

while location == 12
    prompt.say("This is where you'll be training")
    input12 = prompt.select("Ready to go back?", ["Back"])
    if input12 == "Back"
        location = 9
    end
end

while location == 13
    input13 = prompt.select("CHOOSE AN OPTION:", ["How Does Schedule Work", "How Do Fights Work", "About The Creators", "Back"])
    if input13 == "How Does Schedule Work"
        location = 14
    elsif input13 == "How Do Fights Work"
        location = 15
    elsif input13 == "About The Creators"
        location = 16
    elsif input13 == "Back"
        location = 9
    end
end



