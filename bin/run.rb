require_relative "../config/environment"
require "tty-prompt"
require 'pry'


$current_user = nil
$user = nil
$password = nil
def intro
    prompt = TTY::Prompt.new
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
    $current_user = prompt.ask("Make a username. It will be your name inside the game.")
    if array_of_usernames_signup.include?($current_user) == false
        makepassword
    else
    prompt.say("Sorry, that username is already taken. Please try another!")
    end
end

def makepassword
    prompt = TTY::Prompt.new
    sex_filter = LanguageFilter::Filter.new matchlist: :profanity, replacement: :stars
    hate_filter = LanguageFilter::Filter.new matchlist: :hate, replacement: :stars
    emoji1 = prompt.decorate("👻 ")
    $password = prompt.mask("Make a password", mask: emoji1)
    if sex_filter.match?($password) || hate_filter.match?($password)
        prompt.say("Please input another password.")
    else
        selectgender_trainer_create
    end
end

def selectgender_trainer_create
    prompt = TTY::Prompt.new
    gender = prompt.select("Choose your gender", ["Male", "Female"])
    prompt = TTY::Prompt.new
    trainer = prompt.select("Choose your trainer.", ["Doc Louis", "Mickey Goldmill", "Red", "Lance"])
    new_user = User.create({
        :username => $current_user,
        :trainer_name => trainer,
        :energy => 100,
        :money => 0,
        :flex => 1,
        :str => 1,
        :end => 1,
        :fights_won => 0,
        :weeks_trained => 0,
        :injured => false,
        :password => $password,
        :gender => gender,
        :level => 1
    })
        saveuser
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
    $password = prompt.mask("Make a password", mask: emoji1)
    if $password == checkpassword
        saveuser
    else
        $current_user = nil
        prompt.say("Sorry, you've entered the wrong password")
        loginpassword
    end
end 

def saveuser
    User.all.each do |user|
        if user.username == $current_user
            $user = user 
        end
    end
    goodluck  
end

def goodluck
    prompt = TTY::Prompt.new
    prompt.say("You're all set! Good luck!")
end

def mainmenu 
    prompt = TTY::Prompt.new
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
    choosehelp = prompt.select("CHOOSE AN OPTION:", ["How Does Schedule Work", "How Do Fights Work", "About The Creators", "Back"])
    if choosehelp == "How Does Schedule Work"
        schedule
    elsif choosehelp == "How Do Fights Work"
        fighthelp
    elsif choosehelp == "About The Creators"
        about
    elsif choosehelp == "Back"
        mainmenu
    end
end

def schedulehelp
    prompt = TTY::Prompt.new
    prompt.say("Schedule tells you what your daily schedule looks like. COMING SOON: you'll be able to change your schedule!")
    choosehelp = prompt.select("Ready to go back?", ["Back"])



end

def fighthelp
    prompt = TTY::Prompt.new
    prompt.say("It’s a turned-based combat system like pokemon!")
    prompt.say("Your moves (and your opponents) do X damage.")
    prompt.say("If you run out of energy before your opponent, you lose and have to restart the game.")
    choosehelp = prompt.select("Ready to go back?", ["Back"])

end

def about
    prompt = TTY::Prompt.new
    prompt.say("Created by Michael Evans and Barrette Banner")
    prompt.say("We are students at the Flatiron School of Houston.")
    prompt.say("We were inspired by games like Pokémon and Punchout and wanted to see if we could create our own twist in a CLI applicaiton.")
    prompt.say("When we're not at our desk, you can find us on the 10th floor enjoying the free beer and ping-pong.")
    choosehelp = prompt.select("Ready to go back?", ["Back"])
end

intro
mainmenu