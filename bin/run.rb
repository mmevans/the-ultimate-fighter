require_relative "../config/environment"
require "tty-prompt"
require 'pry'

#prompt = TTY::Prompt.new


# puts "hello world"
# puts "Hey, it's Barrette!"
# puts "hello world"
# puts "Hey, it's Michael!"
$current_user = nil
#$emoji1 = prompt.decorate("👻 ")
def intro
    prompt = TTY::Prompt.new
    #location = 0
    #emoji1 = prompt.decorate("👻 ")
    #current_user = nil
    prompt.say("Hello! Welcome to The Ultimate Fighter!")
    signuporsignin
end 

def signuporsignin
    prompt = TTY::Prompt.new
    input1 = prompt.select("Choose your destiny?", ["Sign Up", "Login"])
    if input1 == "Sign Up"
        makeusername
    else 
        loginusername
    end
end

def makeusername
    prompt = TTY::Prompt.new
    array_of_usernames_signup = []
    emoji1 = prompt.decorate("👻 ")
    User.all.select do |user|
        array_of_usernames_signup.push(user.username)
    end
    input2 = prompt.ask("Make a username. It will be your name inside the game.")
    if array_of_usernames_signup.include?(input2) == false
    #current_user = user
        makepassword
    else
    prompt.say("Sorry, that username is already taken. Please try another!")
    end
end

def makepassword
    prompt = TTY::Prompt.new
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

def selectgender
    prompt = TTY::Prompt.new
    input4 = prompt.select("Choose your gender", ["Male", "Female"])
    location = 5
end

def selecttrainer
    prompt = TTY::Prompt.new
    input5 = prompt.select("Choose your trainer.", ["Doc Louis", "Mickey Goldmill", "Red", "Lance"])
    puts input4
    puts input5
    location = 6
end

def usercreated
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

def loginusername
    prompt = TTY::Prompt.new
    username = nil
    array_of_usernames_login = []
    username = prompt.ask("What is your username?")
    User.all.select do |user|
        array_of_usernames_login.push(user.username)
    end
    if array_of_usernames_login.include?(username) == false
        prompt.say("Sorry that username doesn't exist.")
        signuporsignin
    else 
        $current_user = username
        puts "Current user is #{$current_user}."
        loginpassword
    end
end  

def loginpassword
    prompt = TTY::Prompt.new
    checkpassword = nil
    emoji1 = prompt.decorate("👻 ")
    User.all.each do |user|
    user.username == $current_user
    checkpassword = user.password
    end
    password = prompt.mask("Make a password", mask: emoji1)
    if password == checkpassword
        goodluck
    else
        $current_user = nil
        prompt.say("Sorry, you've entered the wrong password")
        loginpassword
    end
end 

def goodluck
    prompt = TTY::Prompt.new
    prompt.say("You're all set! Good luck!")
end

def mainmenu 
    prompt = TTY::Prompt.new
    #current_user = input6
    puts "Current user is #{$current_user}."
    input9 = prompt.select("What do you want to do?", ["Stats", "Fight", "Train", "Help"])
    if input9 == "Stats"
        stats
    elsif input9 == "Fight"
        gotofight
    elsif input9 == "Train"
        gotrain
    elsif input9 == "Help"
        help
    end
end

def stats
    prompt = TTY::Prompt.new
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
        mainmenu
    end
end

def gotofight
    prompt = TTY::Prompt.new
    prompt.say("This is where you'll be fighting")
    input11 = prompt.select("Ready to go back?", ["Back"])
    if input11 == "Back"
     mainmenu
    end
end

def gotrain
    prompt = TTY::Prompt.new
    prompt.say("This is where you'll be training")
    input12 = prompt.select("Ready to go back?", ["Back"])
    if input12 == "Back"
        mainmenu
    end
end

def help
    prompt = TTY::Prompt.new
    input13 = prompt.select("CHOOSE AN OPTION:", ["How Does Schedule Work", "How Do Fights Work", "About The Creators", "Back"])
    if input13 == "How Does Schedule Work"
        location = 14 #still need to do
    elsif input13 == "How Do Fights Work"
        location = 15 #still need to do
    elsif input13 == "About The Creators"
        location = 16 #still need to do
    elsif input13 == "Back"
        mainmenu
    end
end

intro
mainmenu