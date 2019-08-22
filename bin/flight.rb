def gotofight
    puts `clear`
    prompt = TTY::Prompt.new(active_color: :blue)

    #prompt.say("This is where you'll be fighting")
    if ($user.weeks_trained == 3 && $user.level == 1)|| ($user.weeks_trained == 6 && $user.level == 2) || ($user.weeks_trained == 9 && $user.level == 3) || ($user.weeks_trained == 12 && $user.level == 4) || ($user.weeks_trained == 15 && $user.level == 5)
        input11 = prompt.select("#{$user.trainer_name}: Hey sport, looks like your training has paid off and your ready for the octagon! Quick, go catch your flight!", ["Go To Fight", "Back"])
        if input11 == "Go To Fight"
            flight1
        else 
            mainmenu
        end
    else
        prompt.say("#{$user.trainer_name}: Woah, you haven't finished your training yet! Your fight doesn't start for another 3 weeks. 'Enter'")
        gets
        prompt.say("#{$user.trainer_name}: Why don't you head on over to 'Train' in the main menu and take of what needs to be done. 'Enter'")
        gets
        input10 = prompt.select("Ready to go back?", ["Back"])
        if input10 == "Back"
            mainmenu
        end
    end
end

#below is flight
def flight1
    puts `clear`
    prompt = TTY::Prompt.new(active_color: :blue)
    $flightcity = nil
    sleep(0.8)
    prompt.say("The Los Angeles Airport")
    sleep(0.5)
    flight1 = prompt.select("Select:", ["Head Inside", "Give Up On Your Dreams"])
    if flight1 == "Head Inside"
        flight2
    else
        mainmenu
    end
end

def flight2
    puts `clear`
    prompt = TTY::Prompt.new(active_color: :blue)
    sleep(0.8)
    prompt.say("Baggage Handler: Good morning! How can I help you?")
    flight2 = prompt.select("Select:", ["Yes, I need to buy a ticket!", "Nah, I'm fine...thanks."])
    if flight2 == "Yes, I need to buy a ticket!"
        flight3
    else 
        preptoboardplane
    end
end

def flight3
    puts `clear`
    prompt = TTY::Prompt.new(active_color: :blue)
    prompt.say("Baggage Handler: Of course! Where will you be heading today?")
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
    flight4 = prompt.select("Scroll down to see more options.", ["Miami", "New York", "Houston", "San Antonio", "Seattle", "Denver", "Nashville" ])
    if flight4 == "Miami"
        $flightcity = "Miami"
    elsif flight4 == "New York"
        $flightcity = "New York"
    elsif flight4 == "Houston"
        $flightcity = "Houston"
    elsif flight4 == "San Antonio"
        $flightcity = "San Antonio"
    else
        $flightcity = "Seattle"
    end
    flightweather
end
##################
def flightweather
    puts `clear`
    prompt = TTY::Prompt.new(active_color: :blue)
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
#################
def buyticketlevel1
    puts `clear`
    prompt = TTY::Prompt.new(active_color: :blue)
    sleep(1.0)
    payment = prompt.select("Great! And how would you like to pay for that?", ["Cash", "Card", "Frequent Flyer Miles"])
    if payment == "Cash"
        prompt.say("I'm sorry, but you are $798 short. We do accept card! 'Enter'")
        gets
        flighthelp
    elsif payment == "Card"
        prompt.say("Sir, this is a Dave & Buster's Power Card. 'Enter'")
        gets
        flighthelp
    else
        prompt.say("#{$user.username}: Damn, I don't have any points... 'Enter'")
        gets
        flighthelp
    end
end
###################
def flighthelp
    puts `clear`
    prompt = TTY::Prompt.new(active_color: :blue)
    sleep(0.3)
    prompt.say("#{$user.trainer_name}: Shoot! This isn't good. 'Enter'")
    gets
    help1 = prompt.select("#{$user.trainer_name}: Is there any other way to pay for this flight?", ["Give Up", "Call Mom"])
    if help1 == "Give Up"
        prompt.say("#{$user.trainer_name}: Guess this is the end of our journey kid.")
        exit
    else
        callmom
    end
end

################
def callmom
    puts `clear`
    prompt = TTY::Prompt.new(active_color: :blue)
    sleep(0.75)
    print "."
    sleep(0.1)
    print "."
    sleep(0.1)
    print "."
    sleep(0.1)
    print "Ring"
    print "."
    sleep(0.1)
    print "."
    sleep(0.1)
    print "."
    sleep(0.1)
    print "Ring"
    print "."
    sleep(0.1)
    print "."
    sleep(0.1)
    print "."
    sleep(0.1)
    print "Ring"
    sleep(0.8)
    help2 = prompt.select("Hey kiddo! How's my little fighter doing?", ["I Need Some Help", "Sorry I butt dialed you. Talk to you later"])
    if help2 == "Sorry I butt dialed you. Talk to you later"
        sleep(1.0)
        prompt.say("#{$user.trainer_name}: Guess this is the end of our journey kid.")
        userloses
    else
        puts `clear`
        prompt.say("Mom: Sure thing! Anything for you. Let me add some of my frequent flyer miles to your account. 'Enter'")
        gets
        $frequentflyermiles += 30000
        help3 = prompt.select("Mom: You're all set! Good luck! I love you <3", ["Check Frequent Flyer Miles", "Go Buy Ticket"])
        prompt.say("#{$user.username}: I love you too!")
        sleep(0.5)
        if help3 == "Check Frequent Flyer Miles"
            checkmiles
        else 
            asktime
        end
    end
end

def checkmiles
    puts `clear`
    prompt = TTY::Prompt.new(active_color: :blue)
    prompt.say("Frequent Flyer Miles: #{$frequentflyermiles}")
    sleep(1.5)
    asktime
end

def asktime
    prompt = TTY::Prompt.new(active_color: :blue)
    time = prompt.select("What time would you like to go at?", ["8:30AM", "11:45AM", "3:15PM"])
    buyticket
end

def buyticket
    puts `clear`
    prompt = TTY::Prompt.new(active_color: :blue)
    #time = prompt.select("What time would you like to go at?", ["8:30AM", "11:45AM", "3:15PM"])
    payment = prompt.select("Great! And how would you like to pay for that?", ["Cash", "Card", "Frequent Flyer Miles"])
    if payment == "Cash"
        if $user.level > 1
            prompt.say("Great!")
            preptoboardplane
        else
            prompt.say("I'm sorry but you're about $798 short. We do accept credit cards!") 
            gets
            buyticket 
        end
    elsif payment == "Card"
        if $user.level > 1
            prompt.say("Great!")
            preptoboardplane
        else
            prompt.say("Sir, this is a Dave & Buster's Power Card. 'Enter''")
            gets 
            buyticket 
        end
    elsif payment == "Frequent Flyer Miles"
        prompt.say("Great!")
        preptoboardplane
    end
end

def preptoboardplane
    puts `clear`
    prompt = TTY::Prompt.new(active_color: :blue)
    if $flightcity == nil
        prompt.say("#{$user.trainer_name}: Shoot, why didn't you buy a ticket! Now we'll miss the flight.")
        prompt.say("#{$user.trainer_name}: I'm sorry kid, but you'll have to forefit.")
        userloses
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
            sleep(0.5)
            prompt.say("#{$user.trainer_name}: I'm sorry kid, but you'll have to forefit. 'Enter'")
            gets
            userloses
        end
    end
end

def boardplane
    puts `clear`
    prompt = TTY::Prompt.new(active_color: :blue)
    prompt.say("Flight Attendant: Welcome Aboard!")
    progressbar = ProgressBar.create(:title => "Simulating Flight", :starting_at => 0, :total => 50, :progress_mark => "█")
    50.times {progressbar.increment; sleep(0.03)}
    prompt.say("Welcome to #{$flightcity}")
    arena_prompt = prompt.select("Select:", ["Head To Arena", "Head Back Home"])
    if arena_prompt == "Head To Arena"
        realfightinfo
    else
        userloses
    end
end
