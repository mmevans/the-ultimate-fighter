require_relative "../config/environment"
require "tty-prompt"
require 'pry'
require 'ruby-progressbar'

$current_user = nil
$user = nil
$password = nil
$current_opponent = nil
$health = 100
$opponent_health = nil
$opponent_full_health = 100
$array_user_moves_choices = []
$opponent_move_choices = []
$flightcity = nil 
$frequentflyermiles = 0
def intro
    prompt = TTY::Prompt.new
    prompt.say("Hello! Welcome to The Ultimate Fighter!")
    sleep(0.5)
    signuporsignin
end 

def signuporsignin
    prompt = TTY::Prompt.new
    input1 = prompt.select("Choose your destiny?", ["Sign Up", "Login"])
    if input1 == "Sign Up"
        makeusername
        sleep(1.0)
    else 
        loginusername
        sleep(1.0)
    end
end

def makeusername
    puts `clear`
    prompt = TTY::Prompt.new
    array_of_usernames_signup = []
    emoji1 = prompt.decorate("👻 ")
    User.all.select do |user|
        array_of_usernames_signup.push(user.username)
    end
    $current_user = prompt.ask("Make a username:")
    if array_of_usernames_signup.include?($current_user) == false
        sleep(1.0)
        makepassword
    else
        prompt.say("Sorry, that username is already taken. Please try another!")
        makeusername
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
        makepassword
    else
        selectgender_trainer_create
    end
end

def selectgender_trainer_create
    puts `clear`
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
    puts `clear`
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

    $password = prompt.mask("Enter your password:", mask: emoji1)
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
    puts `clear`
    prompt = TTY::Prompt.new
    prompt.say("You're all set! Good luck!")
    start_game = prompt.select("Are You Ready?", ["START GAME"])
    if start_game == "START GAME"
        progressbar = ProgressBar.create(:title => "Loading", :starting_at => 0, :total => 100, :progress_mark => "█")
        100.times {progressbar.increment; sleep(0.03)}
    end
end


def mainmenu 
    puts `clear`
    prompt = TTY::Prompt.new
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
    puts `clear`
    prompt = TTY::Prompt.new
    prompt.say("MONEY: #{$user.money}")
    prompt.say("ENERGY: #{$user.energy}")
    prompt.say("STRENGTH: #{$user.str}")
    prompt.say("FLEXIBILITY: #{$user.flex}")
    prompt.say("ENDURANCE: #{$user.end}")
    prompt.say("TRAINER: #{$user.trainer_name}")
    prompt.say("WEEKS TRAINED: #{$user.weeks_trained}")
    prompt.say("FIGHTS WON: #{$user.fights_won}")
    prompt.say("INJURED: #{$user.injured}")
    prompt.say("GENDER: #{$user.gender}")
    prompt.say("LEVEL:  #{$user.level}")
    input10 = prompt.select("Ready to go back?", ["Back"])
    if input10 == "Back"
        mainmenu
    end
end

def gotofight
    puts `clear`
    prompt = TTY::Prompt.new
    input11 = prompt.select("What do you want to do?", ["Go To Fight", "Back"])
    if input11 == "Go To Fight"
        flight1
    else 
        mainmenu
    end
end

#below is flight
def flight1
    puts `clear`
    prompt = TTY::Prompt.new
    $flightcity = nil
    prompt.say("Later that day...")
    prompt.say("The Los Angeles Airport")
    sleep(2)
    flight1 = prompt.select("What do you want to do?", ["Go Inside", "Go Back Home"])
    if flight1 == "Go Inside"
        flight2
    else
        mainmenu
    end
end

def flight2
    puts `clear`
    prompt = TTY::Prompt.new
    prompt.say("Inside...")
    prompt.say("Lady at desk: Hello there! Can I help you?")
    flight2 = prompt.select("Make a choice", ["Yes, I need to buy a ticket", "Na, I'm fine...thanks"])
    if flight2 == "Yes, I need to buy a ticket"
        ## big if statement that tells user where to buy ticket to
        flight3
    else 
        preptoboardplane #i think
    end
end

def flight3
    puts `clear`
    prompt = TTY::Prompt.new
    prompt.say("Okay, please select a location.")
    flight3 = prompt.select("Scroll down to see more options.", ["Miami", "New York", "Houston", "San Antonio", "Seattle", "Denver", "Nashville" ])
    if flight3 == "Miami"
        $flightcity = "Miami"
    elsif flight3 == "New York"
        $flightcity = "New York"
    elsif flight3 == "Houston"
        $flightcity = "Houston"
    elsif flight3 == "San Antonio"
        $flightcity = "San Anotnio"
    else
        $flightcity = "Seattle"
    end
    flightweather
end

def flightweather
    puts `clear`
    prompt = TTY::Prompt.new
    weather = ["good", "medium", "bad"]
    current_weather = weather.sample
    if current_weather == "good"
        prompt.say("Wonderful! I heard that #{$flightcity} has been having beautiful weather lately!")
    elsif current_weather == "medium"
        prompt.say("Ah, #{$flightcity}! Great!")
    else
        prompt.say("Hope you brought a jacket. I heard a pilot talking earlier today that #{$flightcity} was having nasty weather.")
    end
    if $user.level == 1
        buyticketlevel1
    else
        buyticket
    end
end

def buyticketlevel1
    puts `clear`
    prompt = TTY::Prompt.new
    time = prompt.select("What time would you like to go at?", ["8:30AM", "11:45AM", "3:15PM"])
    payment = prompt.select("Great! And how would you like to pay for that?", ["Cash", "Card", "Frequent Flyer Miles"])
    if payment == "Cash"
        prompt.say("Oh no! I'm afriad that's not enough")
        flighthelp
    elsif payment == "Card"
        prompt.say("Oh no! I'm afraid your card was denied")
        flighthelp
    else
        prompt.say("Oh, no! It looks like you don't have any")
        flighthelp
    end
end

def flighthelp
    puts `clear`
    prompt = TTY::Prompt.new
    prompt.say("#{$user.trainer_name}: Shoot! This isn't good.")
    help1 = prompt.select("#{$user.trainer_name}: Is there any other way to pay for this flight?", ["Give Up", "Call Mom"])
    if help1 == "Give Up"
        prompt.say("#{$user.trainer_name}: Guess this is the end of our journey kid.")
        exit
    else
        callmom
    end
end

def callmom
    puts `clear`
    prompt = TTY::Prompt.new
    prompt.say("Ring...Ring...Ring...")
    help2 = prompt.select("Hey kiddo! How's my little fighter doing?", ["I Need Some Help", "Sorry I butt dialed you. Talk to you later"])
    if help2 == "Sorry I butt dialed you. Talk to you later"
        prompt.say("#{$user.trainer_name}: Guess this is the end of our journey kid.")
    else
        puts `clear`
        prompt.say("Mom: Sure think! Anything for you. Let me add some of my frequent flyer miles to your account.")
        $frequentflyermiles += 30000
        help3 = prompt.select("Mom: You're all set. If you want you can check that they're there.", ["Check Frequent Flyer Miles", "Go Buy Ticket"])
        if help3 == "Check Frequent Flyer Miles"
            checkmiles
        else 
            buyticket
        end
    end
end

def checkmiles
    puts `clear`
    prompt = TTY::Prompt.new
    prompt.say("Frequent Flyer Miles: #{$frequentflyermiles}")
    sleep(1.5)
    buyticket
end

def buyticket
    puts `clear`
    prompt = TTY::Prompt.new
    time = prompt.select("What time would you like to go at?", ["8:30AM", "11:45AM", "3:15PM"])
    payment = prompt.select("Great! And how would you like to pay for that?", ["Cash", "Card", "Frequent Flyer Miles"])
    if payment == "Cash"
        if $user.level > 1
            prompt.say("Great!")
            preptoboardplane
        else
            prompt.say("Sorry, I'm afraid that's not enough. Try again.") #maybe create new def to not repeat time
            buyticket #change this if new def
        end
    elsif payment == "Card"
        if $user.level > 1
            prompt.say("Great!")
            preptoboardplane
        else
            prompt.say("Sorry, I'm afraid that's not enough. Try again.") #maybe create new def to not repeat time
            buyticket #change this if new def
        end
    elsif payment == "Frequent Flyer Miles"
        prompt.say("Great!")
        preptoboardplane
    end
end

def preptoboardplane
    puts `clear`
    prompt = TTY::Prompt.new
    if $flightcity == nil
        prompt.say("#{$user.trainer_name}: Shoot, why didn't you buy a ticket! Now we'll miss the flight.")
        prompt.say("#{$user.trainer_name}: I'm sorry kid, but you'll have to forefit.")
        exit
    else
        if $user.level == 1 && $flightcity == "Miami"
            boardplane 
        elsif $user.level == 2 && $flightcity == "San Antonio"
            boardplane
        elsif $user.level == 3 && $flightcity == "Seattle"
            boardplane
        elsif $user.level ==  4 && $flightcity == "Houston"
            boardplane
        elsif $user.level == 5 && $flightcity == "New York"
            boardplane
        else
            prompt.say("#{$user.trainer_name}: Shoot, you bought a ticket to the wrong city! Now we'll miss the fight.")
        prompt.say("#{$user.trainer_name}: I'm sorry kid, but you'll have to forefit.")
        exit
        end
    end
end

def boardplane
    puts `clear`
    prompt = TTY::Prompt.new
    prompt.say("Flight Attendant: Welcome Aboard!")
    #some sort of entertaining wait
    prompt.say("Welcome to #{$flightcity}")
    realfightinfo
end

##above is fight
def gotrain
    puts `clear`
    prompt = TTY::Prompt.new
    if $user.weeks_trained == 0 && $user.level == 1
        prompt.say("#{$user.trainer_name}: Hey there champ! Looks like you've got your first big fight coming up. I've made an easy workout routine you can follow to get you prepared for Chuck Cianwood.")
        sleep(4.0)
        array_of_level_1_workouts = []
        Workout.all.each do |workout|
            if workout.level == 1
                array_of_level_1_workouts.push(workout.str_workouts)
                array_of_level_1_workouts.push(workout.flex_workouts)
                array_of_level_1_workouts.push(workout.end_workouts)
            end
        end
        puts "#{$user.trainer_name}: Here are your workouts for the next three weeks #{array_of_level_1_workouts}"
        puts
        sleep(2.0)
        goback = prompt.select("Ready to go back?", ["Back"])
    end
    if goback == "Back"
        mainmenu
    end
end


def help
    puts `clear`
    prompt = TTY::Prompt.new
    choosehelp = prompt.select("CHOOSE AN OPTION:", ["How Does Schedule Work", "How Do Fights Work", "About The Creators", "Back"])
    if choosehelp == "How Does Schedule Work"
        schedulehelp
    elsif choosehelp == "How Do Fights Work"
        fighthelp
    elsif choosehelp == "About The Creators"
        about
    elsif choosehelp == "Back"
        mainmenu
    end
end


def schedulehelp
    puts `clear`
    prompt = TTY::Prompt.new
    prompt.say("Schedule tells you what your daily schedule looks like. COMING SOON: you'll be able to change your schedule!")
    choosehelp = prompt.select("Ready to go back?", ["Back"])
    if choosehelp == "Back"
        help
    end
end

def fighthelp
    puts `clear`
    prompt = TTY::Prompt.new
    prompt.say("It’s a turned-based combat system like pokemon!")
    sleep(2.0)
    prompt.say("Your moves (and your opponents) do X damage.")
    sleep(2.0)
    prompt.say("If you run out of energy before your opponent, you lose and have to restart the game.")
    sleep(2.0)
    choosehelp = prompt.select("Ready to go back?", ["Back"])
    if choosehelp == "Back"
        help
    end
end

def about
    puts `clear`
    prompt = TTY::Prompt.new
    prompt.say("Created by Michael Evans and Barrette Banner")
    prompt.say("We are students at the Flatiron School of Houston.")
    prompt.say("We were inspired by games like Pokémon and Punchout and wanted to see if we could create our own twist in a CLI applicaiton.")
    prompt.say("When we're not at our desk, you can find us on the 10th floor enjoying the free beer and ping-pong.")
    choosehelp = prompt.select("Ready to go back?", ["Back"])
    if choosehelp == "Back"
        help
    end
end


# build out conditional to check if weeks_trained is the right amount
def realfightinfo
    puts `clear`
    $health *= $user.level
    prompt = TTY::Prompt.new
    Opponent.all.select do |opponent|
        if $user.level == opponent.level
            $current_opponent = opponent
        end
    end
    prompt.say("#{$user.trainer_name}: Your opponent is #{$current_opponent.name}.")
    $opponent_health = $current_opponent.energy
    sleep(1.0)
    choosefight = prompt.select("Select:", ["Opponent Info","Start Fight"])
    $opponent_full_health = $opponent_health
    if choosefight == "Opponent Info"
        opponentinfo
    else
        choosemoves
    end
end

def opponentinfo
    puts `clear`
    prompt = TTY::Prompt.new
    prompt.say("#{$user.trainer_name}: Your opponent is #{$current_opponent.name}.")
    prompt.say("#{$user.trainer_name}: Keep your gloves up and stay focused!")
    sleep(0.75)
    choosefight = prompt.select("Ready To Start", ["Back"])
    if choosefight == "Back"
        realfightinfo
    end
end

def choosemoves
    puts `clear`
    prompt = TTY::Prompt.new
    array_all_moves = []
    case $user.level
    when 1
        Moveset.all.select do |m|
            if m.level == 1
                array_all_moves.push(m.moves)
                $opponent_move_choices.push(m.moves)
            end
        end
    when 2
        Moveset.all.select do |m|
            if  m.level == 1
                array_all_moves.push(m.moves)
            end
            if m.level == 2
                array_all_moves.push(m.moves)
                $opponent_move_choices.push(m.moves)
            end
        end
    when 3
        Moveset.all.select do |m|
            if  m.level == 1
                array_all_moves.push(m.moves)
            end
            if m.level == 2
                array_all_moves.push(m.moves)
            end
            if m.level == 3
                array_all_moves.push(m.moves)
                $opponent_move_choices.push(m.moves)
            end
        end
    when 4
        Moveset.all.select do |m|
            if  m.level == 1
                array_all_moves.push(m.moves)
            end
            if m.level == 2
                array_all_moves.push(m.moves)
            end
            if m.level == 3
                array_all_moves.push(m.moves)
            end
            if m.level == 4
                array_all_moves.push(m.moves)
                $opponent_move_choices.push(m.moves)
            end
        end
    when 5
        Moveset.all.select do |m|
            array_all_moves.push(m.moves)
        end
        Moveset.all.select do |m|
            if m.level == 5
                $opponent_move_choices.push(m.moves)
            end
        end
    else
        "end"
    end

    choices = array_all_moves
    prompt.say("Use 'spacebar' to select your moves and press 'Enter' when you are done!")
    sleep(2.0)
    $array_user_moves_choices = prompt.multi_select("Select 4 moves", choices, max: 4)
    if $array_user_moves_choices.count == 4
        prompt.say("#{$user.trainer_name}: QUOTE FROM TRAINER CLASS")
        makemove
    else
        prompt.say("oops! looks like you hit 'Enter' before selecting all your moves. No worries!")
        sleep(2.0)
        choosemoves
    end
end


def makemove
    puts `clear`
    prompt = TTY::Prompt.new
    if $health >= $opponent_full_health * 0.75
        prompt.ok("#{$user.trainer_name}: Your health is at #{$health}")
    elsif $health >= $opponent_full_health * 0.45
        prompt.warn("#{$user.trainer_name}: Your health is at #{$health}")
    else
        prompt.error("#{$user.trainer_name}: Your health is at #{$health}")
    end
    sleep(3.0)
    if $opponent_health >= $opponent_full_health * 0.75
        prompt.ok("#{$user.trainer_name}: Your opponent's health is at #{$opponent_health}")
    elsif $opponent_health >= $opponent_full_health * 0.45
        prompt.warn("#{$user.trainer_name}: Your opponent's health is at #{$opponent_health}")
    else
        prompt.error("#{$user.trainer_name}: Your opponent's health is at #{$opponent_health}")
    end    
    sleep(2.0)
    user_attack = prompt.select("Choose a move!", $array_user_moves_choices)
    Moveset.all.select do |m|
        if user_attack == m.moves
            $opponent_health -= m.damage
        end
    end
    if $opponent_health <= 0
        userwins
    else
        opponent_attack = $opponent_move_choices.sample
        Moveset.all.select do |m|
            if opponent_attack == m.moves
                $health -= m.damage
            end
        end
    end 
    if $health <= 0
        userloses
    else 
        makemove
    end
end

def userwins
    puts `clear`
    prompt = TTY::Prompt.new
    $user.level += 1
    prompt.say("#{$user.trainer_name}: You knocked em out cold! What a fight...")
    sleep(1.5) 
    prompt.say("#{$user.trainer_name}: You've leveled up! You're now level #{$user.level}!")
    $user.money += ($health * 100)
    $health = 100
    afterwin
end

def userloses
    puts `clear`
    prompt = TTY::Prompt.new
    $user.money += ($health * 100)
    high_score = $user.money
    #add high_score to high score table and see if it's the highest score ever
    exit
end

def afterwin
    puts `clear`
    prompt = TTY::Prompt.new
    if $user.level == 6
        prompt.say("#{$user.trainer_name}: Congrats you've won the game!")
        high_score = $user.money
        exit
        #party 
        ##tell them if they beat the high score. tell them their score
    else
        prompt.say("#{$user.trainer_name}: Great job #{$current_user}! You've passed level #{$user.level - 1}.")
        prompt.say("#{$user.trainer_name}: Only #{6 - $user.level} to go!")
        choosewhenready = prompt.select("Select:", ["Continue"])
        if choosewhenready == "Continue"
            progressbar = ProgressBar.create(:title => "Loading", :starting_at => 0, :total => 100, :progress_mark => "█")
            100.times {progressbar.increment; sleep(0.03)}
            mainmenu
        end
    end
end

#


intro
mainmenu

