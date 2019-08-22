def gotofight
    puts `clear`
    prompt = TTY::Prompt.new

    #prompt.say("This is where you'll be fighting")
    if ($user.weeks_trained == 3 && $user.level == 1)|| ($user.weeks_trained == 6 && $user.level == 2) || ($user.weeks_trained == 9 && $user.level == 3) || ($user.weeks_trained == 12 && $user.level == 4) || ($user.weeks_trained == 15 && $user.level == 5)
        input11 = prompt.select("#{$user.trainer_name}: Hey sport, looks like your training has paid off and your ready for the octagon! Quick, go catch your flight!", ["Go To Fight", "Back"])
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
    prompt = TTY::Prompt.new
    $flightcity = nil
    print "Later that day"
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    puts "\n'Enter'"
    gets
    prompt.say("The Los Angeles Airport 'Enter'")
    gets
    flight1 = prompt.select("Select:", ["Go Inside", "Go Back Home"])
    if flight1 == "Go Inside"
        flight2
    else
        mainmenu
    end
end

def flight2
    puts `clear`
    prompt = TTY::Prompt.new
    print "Inside"
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    puts "\n'Enter'"
    gets
    prompt.say("Baggage Handlers: Good morning! How can I help you?")
    flight2 = prompt.select("Select:", ["Yes, I need to buy a ticket!", "Nah, I'm fine...thanks."])
    if flight2 == "Yes, I need to buy a ticket!"
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
#################
def buyticketlevel1
    puts `clear`
    prompt = TTY::Prompt.new
    sleep(1.0)
    payment = prompt.select("Great! And how would you like to pay for that?", ["Cash", "Card", "Frequent Flyer Miles"])
    if payment == "Cash"
        prompt.say("Oh no! I'm afriad that's not enough. 'Enter'")
        gets
        flighthelp
    elsif payment == "Card"
        prompt.say("Oh no! I'm afraid your card was denied. 'Enter'")
        gets
        flighthelp
    else
        prompt.say("Oh, no! It looks like you don't have any. 'Enter'")
        gets
        flighthelp
    end
end
###################
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

################
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
