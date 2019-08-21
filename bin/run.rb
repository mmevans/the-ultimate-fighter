require_relative "../config/environment"
require "tty-prompt"
require 'pry'
require 'ruby-progressbar'
#require 'tty-cursor'

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
    prompt.say("The Ultimate Fighter")
    sleep(0.5)
    signuporsignin
end 

def signuporsignin
    prompt = TTY::Prompt.new
    input1 = prompt.select("Select:", ["Sign Up", "Login"])
    if input1 == "Sign Up"
        makeusername
    else 
        loginusername
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
        sleep(0.5)
        makepassword
    else
        prompt.say("Sorry, that username is already taken. Please try another! 'Enter'")
        sleep(0.5)
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
    prompt.say("You're all set. Good luck!")
    start_game = prompt.select("Are You Ready?", ["START GAME"])
    if start_game == "START GAME"
        progressbar = ProgressBar.create(:title => "Loading", :starting_at => 0, :total => 100, :progress_mark => "█")
        100.times {progressbar.increment; sleep(0.03)}
    end
end



def mainmenu 
    puts `clear`
    prompt = TTY::Prompt.new
    input9 = prompt.select("Main Menu:", ["Stats", "Fight", "Train", "Help"])
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
    prompt.say("Money: #{$user.money}")
    prompt.say("Energt: #{$user.energy}")
    prompt.say("Strength: #{$user.str}")
    prompt.say("Flexibility: #{$user.flex}")
    prompt.say("Endurance: #{$user.end}")
    prompt.say("Trainer: #{$user.trainer_name}")
    prompt.say("Weeks Trained: #{$user.weeks_trained}")
    prompt.say("Fights Won: #{$user.fights_won}")
    prompt.say("Inured: #{$user.injured}")
    prompt.say("Gender: #{$user.gender}")
    prompt.say("Level:  #{$user.level}")
    input10 = prompt.select("Ready to go back?", ["Back"])
    if input10 == "Back"
        mainmenu
    end
end

def gotofight
    puts `clear`
    prompt = TTY::Prompt.new

    #prompt.say("This is where you'll be fighting")
    if $user.weeks_trained == 3 || $user.weeks_trained == 6 || $user.weeks_trained == 9 || $user.weeks_trained == 12
        input11 = prompt.select("#{$user.trainer_name}: Hey sport, looks like your training has paid off and your ready for the octagon. Are you ready to head out?", ["Go To Fight", "Back"])
        if input11 == "Go To Fight"
            flight1
        else 
            mainmenu
        end
    else
        5.times do
            print "."
            sleep(0.3)
          end
        puts ""
        prompt.say("#{$user.trainer_name}: Woah, you haven't finished your training yet! Your fight doesn't start for another X weeks. 'Enter'")
        gets
        prompt.say("#{$user.trainer_name}: Why don't you head on over to 'Train' in the main menu and take of what needs to be done. 'Enter'")
        gets
        input10 = prompt.select("Ready to go back?", ["Back"])
        if input10 == "Back"
            mainmenu
        end
    end
end

def wait
    3.times do
        print "."
        sleep(0.3)
    end
end

#below is flight
def flight1
    puts `clear`
    prompt = TTY::Prompt.new
    $flightcity = nil
    print "Later that day"
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    puts "  Enter"
    gets
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
    if $user.level == 1
        prompt.say("#{$user.trainer_name}: Make sure to buy a ticket going to Miami")
    elsif $user.level == 2
        prompt.say("#{$user.trainer_name}: Make sure to buy a ticket going to San Antonio")
    elsif $user.level == 3
        prompt.say("#{$user.trainer_name}: Make sure to buy a ticket going to Seattle")
    elsif $user.level == 4
        prompt.say("#{$user.trainer_name}: Make sure to buy a ticket going to Houston")
    elsif $user.level == 5
        prompt.say("#{$user.trainer_name}: Make sure to buy a ticket going to New York")
    end
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
        asktime
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
            asktime
        end
    end
end

def checkmiles
    puts `clear`
    prompt = TTY::Prompt.new
    prompt.say("Frequent Flyer Miles: #{$frequentflyermiles}")
    sleep(1.5)
    asktime
end

def asktime
    prompt = TTY::Prompt.new
    time = prompt.select("What time would you like to go at?", ["8:30AM", "11:45AM", "3:15PM"])
    buyticket
end

def buyticket
    puts `clear`
    prompt = TTY::Prompt.new
    #time = prompt.select("What time would you like to go at?", ["8:30AM", "11:45AM", "3:15PM"])
    payment = prompt.select("Great! And how would you like to pay for that?", ["Cash", "Card", "Frequent Flyer Miles"])
    if payment == "Cash"
        if $user.level > 1
            prompt.say("Great!")
            preptoboardplane
        else
            prompt.say("Sorry, I'm afraid that's not enough. Try again.") 
            buyticket 
        end
    elsif payment == "Card"
        if $user.level > 1
            prompt.say("Great!")
            preptoboardplane
        else
            prompt.say("Sorry, I'm afraid that's not enough. Try again.") 
            buyticket 
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
        prompt.say("#{$user.trainer_name}: Hey there champ! Looks like you've got your first big fight coming up. 'Enter'")
        gets
        prompt.say("#{$user.trainer_name}: I've made an easy workout routine you can follow to get you prepared for Chuck Cianwood. 'Enter'")
        gets
        array_of_level_1_workouts = []
        Workout.all.each do |workout|
            if workout.level == 1
                array_of_level_1_workouts.push(workout.str_workouts, workout.flex_workouts, workout.end_workouts)
            end
        end
        prompt.say("#{$user.trainer_name}: Here are your workouts - #{array_of_level_1_workouts}.")
        sleep(1.5)
        goback = prompt.select("Are you ready to start training?", ["Simulate Training", "Back"])
    elsif $user.weeks_trained == 3 && $user.level == 2
        prompt.say("#{$user.trainer_name}: Congrats on your first big win! Chuck never had a chance. Ha ha ha! 'Enter'")
        gets
        array_of_level_2_workouts = []
        Workout.all.each do |workout|
            if workout.level == 2
                array_of_level_2_workouts.push(workout.str_workouts, workout.flex_workouts, workout.end_workouts)
            end
        end
        prompt.say("#{$user.trainer_name}: I went ahead and changed your workout schedule to prepare you for Brawly. I'll tell you more about him closer to the fight. 'Enter'")
        gets
        prompt.say("#{$user.trainer_name}: Here are your workouts - #{array_of_level_2_workouts}")
        sleep(0.8)
        goback = prompt.select("Are you ready to start training?", ["Simulate Training", "Back"])
    elsif $user.weeks_trained == 6 && $user.level == 3
        prompt.say("#{$user.trainer_name}: Hot damn, that's two wins in a row! You're making a name for yourself out there. 'Enter'")
        gets
        prompt.say("#{$user.trainer_name}: Some people are calling you the next Ultimate Fighter! Don't let it get to your head, you still have a long way to go. 'Enter'")
        gets
        array_of_level_3_workouts = []
        Workout.all.each do |workout|
            if workout.level == 3
                array_of_level_3_workouts.push(workout.str_workouts, workout.flex_workouts, workout.end_workouts)
            end
        end
        prompt.say("#{$user.trainer_name}: Your next opponent is Maylene. She's got speed and power in her kicks... unlike you! Ha ha ha! 'Enter'")
        gets
        4.times do
            print "."
            sleep(0.5)
        end
        prompt.say("#{$user.trainer_name}: Jeez I'm kidding! 'Enter'")
        gets
        prompt.say("#{$user.trainer_name}: Here are your workouts - #{array_of_level_3_workouts}")
        sleep(0.8)
        goback = prompt.select("Are you ready to start training?", ["Simulate Training", "Back"])
    elsif $user.weeks_trained == 9 && $user.level == 4
        prompt.say("#{$user.trainer_name}: Congragulations on you're third win! I'm beginning to think you have a shot at the title, but you need at least 4 wins to challenge the champion. 'Enter'")
        gets
        prompt.say("#{$user.trainer_name}: You'll need to dedicate a lot more time to training from now on. Your next opponent, Korrina, is an animal in the cage. 'Enter'")
        array_of_level_4_workouts = []
        Workout.all.each do |workout|
            if workout.level == 4
                array_of_level_4_workouts.push(workout.str_workouts, workout.flex_workouts, workout.end_workouts)
            end
        end
        prompt.say("#{$user.trainer_name}: Here are your workouts - #{array_of_level_4_workouts}.")
        goback = prompt.select("Are you ready to start training?", ["Simulate Training", "Back"])
    elsif $user.weeks_trained == 12 && $user.level == 5
        prompt.say("#{$user.trainer_name}: Holy shit you fucking madman. The absolute madman! I always knew you had it in you, ever since your first fight with Chuck. 'Enter'")
        gets
        prompt.say("#{$user.trainer_name}: But this is it. 'Enter'")
        gets
        prompt.say("#{$user.trainer_name}: No more games... 'Enter'")
        gets
        prompt.say("#{$user.trainer_name}: No more cheap tricks.. 'Enter'")
        gets
        prompt.say("#{$user.trainer_name}: You're fighting the reigning Ultimate Fighter: Mike Tyson. He's the toughest motherfucker to walk into that octagon.")
        gets
        prompt.say("#{$user.trainer_name}: .......")
        array_of_level_5_workouts = []
        Workout.all.each do |workout|
            if workout.level == 5
                array_of_level_5_workouts.push(workout.str_workouts, workout.flex_workouts, workout.end_workouts)
            end
        end
        prompt.say("#{$user.trainer_name}: Here are your workouts - #{array_of_level_5_workouts}.")
        goback = prompt.select("Are you ready to start training?", ["Simulate Training", "Back"])
    else
        "error"
    end

    if goback == "Back"
        mainmenu
    else
        if $user.level == 1 && $user.weeks_trained == 0
            progressbar = ProgressBar.create(:title => "Simulate Training Weeks", :starting_at => 0, :total => 100, :progress_mark => "█")
            100.times {progressbar.increment; sleep(0.005)}
            sleep(0.5)
            prompt.say("#{$user.trainer_name}: You're all set! Wow three weeks just flew by, ha ha ha ha! 'Enter''")
            $user.weeks_trained += 3
            gets
            mainmenu
        elsif $user.level == 2 && $user.weeks_trained == 3
            progressbar = ProgressBar.create(:title => "Simulate Training Weeks", :starting_at => 0, :total => 100, :progress_mark => "█")
            100.times {progressbar.increment; sleep(0.005)}
            gets
            prompt.say("#{$user.trainer_name}: You're all set! Wow three weeks just flew by, ha ha ha ha! 'Enter'")
            $user.weeks_trained += 3
            gets
            mainmenu
        elsif $user.level == 3 && $user.weeks_trained == 6
            progressbar = ProgressBar.create(:title => "Simulate Training Weeks", :starting_at => 0, :total => 100, :progress_mark => "█")
            100.times {progressbar.increment; sleep(0.005)}
            gets
            prompt.say("#{$user.trainer_name}: You're all set! Wow three weeks just flew by, ha ha ha ha! 'Enter'")
            $user.weeks_trained += 3
            gets
            mainmenu
        elsif $user.level == 4 && $user.weeks_trained == 9
            progressbar = ProgressBar.create(:title => "Simulate Training Weeks", :starting_at => 0, :total => 100, :progress_mark => "█")
            100.times {progressbar.increment; sleep(0.005)}
            gets
            prompt.say("#{$user.trainer_name}: You're all set! Wow three weeks just flew by, ha ha ha ha! 'Enter'")
            $user.weeks_trained += 3
            gets
            mainmenu
        elsif $user.level == 5 && $user.weeks_trained == 12
            progressbar = ProgressBar.create(:title => "Simulate Training Weeks", :starting_at => 0, :total => 100, :progress_mark => "█")
            100.times {progressbar.increment; sleep(0.005)}
            gets
            prompt.say("#{$user.trainer_name}: You're all set! Wow three weeks just flew by, ha ha ha ha! 'Enter'")
            $user.weeks_trained += 3
            gets
            mainmenu
        else
            puts "Hey it looks like you've already done your training! Head over to the airport and catch your flight! 'Enter'"
            gets
            mainmenu
        end
    end
end


def help
    puts `clear`
    prompt = TTY::Prompt.new
    choosehelp = prompt.select("CHOOSE AN OPTION:", ["How Does Schedule Work", "How Do Fights Work", "About The Creators", "Back"])
    if choosehelp == "How does schedule work?"
        schedulehelp
    elsif choosehelp == "How do fights work?"
        fighthelp
    elsif choosehelp == "About Us!"
        about
    elsif choosehelp == "Back"
        mainmenu
    end
end


def schedulehelp
    puts `clear`
    prompt = TTY::Prompt.new
    sleep(0.5)
    prompt.say("Schedule tells you what your daily schedule looks like. It doesn't have any effect on your fights. 'Enter'")
    gets
    prompt.say("We definitley thought it might have some functionality regarding your moves/stats, but alas no 'Enter'")
    gets
    4.times do
        print "."
        sleep(0.05)
      end
    prompt.say("I'm sad just thinking about what could have been 'Enter''")
    gets
    4.times do
        print "."
        sleep(0.05)
      end
    prompt.say("This is michael talking to you btw. 'Enter'")
    gets
    choosehelp = prompt.select("Ready to go back?", ["Back"])
    if choosehelp == "Back"
        help
    end
end

def fighthelp
    puts `clear`
    prompt = TTY::Prompt.new
    prompt.say("It’s a turned-based combat system like pokemon! 'Enter'")
    gets
    prompt.say("Your moves (and your opponents) do X damage. 'Enter'")
    gets
    prompt.say("If you run out of energy before your opponent, you lose and have to restart the game. 'Enter'")
    gets
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
    prompt.say("The score is at least 1-0 to Michael, but who really keeps count ;)")
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
    prompt.say("#{$user.trainer_name}: Your opponent is #{$current_opponent.name}. 'Enter'")
    $opponent_health = $current_opponent.energy
    gets
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
    prompt.say("#{$user.trainer_name}: Your opponent is #{$current_opponent.name}. 'Enter'")
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
    prompt.say("Use 'Spacebar' to select your moves and 'Enter' when you are done!")
    sleep(2.0)
    $array_user_moves_choices = prompt.multi_select("Select 4 moves", choices, max: 4)
    if $array_user_moves_choices.count == 4
        prompt.say("#{$user.trainer_name}: QUOTE FROM TRAINER CLASS")
        globalvariablesforfight
    else
        prompt.say("oops! looks like you hit 'Enter' before selecting all your moves. No worries!")
        sleep(2.0)
        choosemoves
    end
end
### start
def globalvariablesforfight
    $array_uppercut = ["Uppercut","Uppercut"]
    $array_highjumpkick = ["High Jump Kick","High Jump Kick"]
    $array_kneeofjustice = ["Knee of Justice","Knee of Justice"]
    $array_uchimata = ["Uchi Mata","Uchi Mata"]
    $array_skullcrusher = ["Skull Crusher","Skull Crusher"]

    $array_jab = ["Jab"]
    $array_righthook = ["Right Hook"]
    $array_focuspunch = ["Focus Punch"]
    $array_hammerfist = ["Hammerfist"]
    $array_rearnakedchoke = ["Rear-Naked Choke"]
    
    # $array_recent_power_moves = [$array_uppercut, $array_highjumpkick, $array_kneeofjustice, $array_uchimata, $array_skullcrusher].reduce([], :concat)
    # $array_recent_strength_moves = [$array_jab, $array_righthook, $array_focuspunch, $array_hammerfist, $array_rearnakedchoke].reduce([], :concat)

     #$array_available_moves = []

     makemove 
end
### end
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
    sleep(1.5)
    if $opponent_health >= $opponent_full_health * 0.75
        prompt.ok("#{$user.trainer_name}: Your opponent's health is at #{$opponent_health}")
    elsif $opponent_health >= $opponent_full_health * 0.45
        prompt.warn("#{$user.trainer_name}: Your opponent's health is at #{$opponent_health}")
    else
        prompt.error("#{$user.trainer_name}: Your opponent's health is at #{$opponent_health}")
    end    
    sleep(2.0)
    $array_recent_power_moves = [$array_uppercut, $array_highjumpkick, $array_kneeofjustice, $array_uchimata, $array_skullcrusher].reduce([], :concat)
    $array_recent_strength_moves = [$array_jab, $array_righthook, $array_focuspunch, $array_hammerfist, $array_rearnakedchoke].reduce([], :concat)

    $array_available_moves = []
    $array_user_moves_choices.each do |move|
        if $array_recent_power_moves.include?(move) == false && $array_recent_strength_moves.include?(move) == false
            $array_available_moves << move
        end
    end
    $array_available_moves_opponent = []
    $opponent_move_choices.each do |move|
        if $array_recent_power_moves.include?(move) == false && $array_recent_strength_moves.include?(move) == false
            $array_available_moves_opponent << move
        end
    end

    user_attack = prompt.select("Choose a move!", $array_available_moves)

    #below is new work
    $array_uppercut.pop 
    $array_highjumpkick.pop 
    $array_kneeofjustice.pop 
    $array_uchimata.pop
    $array_skullcrusher.pop 

    $array_jab.pop
    $array_righthook.pop
    $array_focuspunch.pop
    $array_hammerfist.pop
    $array_rearnakedchoke.pop

    if user_attack == "Uppercut"
        $array_uppercut << "Uppercut"
    elsif user_attack == "High Jump Kick"
        $array_highjumpkick << "High Jump Kick"
    elsif user_attack == "Knee of Justice"
        $array_kneeofjustice << "Knee of Justice"
    elsif user_attack == "Uchi Mata"
        $array_uchimata << "Uchi Mata"
    elsif user_attack == "Skull Crusher"
        $array_skullcrusher << "Skull Crusher"
    elsif user_attack == "Jab"
        $array_jab << "Jab"
    elsif user_attack == "Right Hook"
        $array_righthook << "Right Hook"
    elsif user_attack == "Focus Punch"
        $array_focuspunch << "Focus Punch"
    elsif user_attack == "Hammerfist"
        $array_hammerfist << "Hammerfist"
    elsif user_attack == "Rear-Naked Choke"
        $array_rearnakedchoke << "Rear-Naked Choke"
    end

    #above is new work
    Moveset.all.select do |m|
        if user_attack == m.moves
            $opponent_health -= m.damage
        end
    end
    if $opponent_health <= 0
        $opponent_health = 0
        userwins
    else
        opponent_attack = $array_available_moves_opponent.sample ##here
        puts $array_available_moves_opponent
        gets
        Moveset.all.select do |m|
            if opponent_attack == m.moves
                $health -= m.damage
            end
        end
    end 
    if $health <= 0
        $health = 0
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
    prompt.say("You lost :( Better luck next time! Here is your highscore: #{high_score} 'Enter'")
    gets
    Highscore.all.each do |highscore|
        if highscore.username == $user.username && high_score > highscore.highscore
            highscore.date = DateTime.now
            highscore.highscore = high_score
        else
            highscore.username = $user.username
            highscore.date = DateTime.now
            highscore.highscore = high_score
        end
    end
    #prompt.say("You lost :( Better luck next time! Here is your highscore: #{high_score}")

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


intro
mainmenu

