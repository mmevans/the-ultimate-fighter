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
    prompt.say("Use 'Spacebar' to select your moves and 'Enter' when you are done! 'Enter'")
    gets
    $array_user_moves_choices = prompt.multi_select("Select 4 moves", choices, max: 4)
    if $array_user_moves_choices.count == 4
        prompt.say("#{$user.trainer_name}: QUOTE FROM TRAINER CLASS")
        globalvariablesforfight
    else
        prompt.say("oops! looks like you hit 'Enter' before selecting all your moves. No worries! 'Enter'")
        gets
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
    sleep(1.0)
    if $opponent_health >= $opponent_full_health * 0.75
        prompt.ok("#{$user.trainer_name}: Your opponent's health is at #{$opponent_health}")
    elsif $opponent_health >= $opponent_full_health * 0.45
        prompt.warn("#{$user.trainer_name}: Your opponent's health is at #{$opponent_health}")
    else
        prompt.error("#{$user.trainer_name}: Your opponent's health is at #{$opponent_health}")
    end    
    sleep(1.0)
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
    sleep(1.0) 
    prompt.say("#{$user.trainer_name}: You've leveled up! You're now level #{$user.level}!")
    sleep(1.0)
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