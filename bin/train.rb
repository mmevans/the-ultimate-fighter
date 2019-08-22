def gotrain
    puts `clear`
    prompt = TTY::Prompt.new(active_color: :blue)
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
        prompt.say("#{$user.trainer_name}: Here are your workouts - #{array_of_level_1_workouts}")
        sleep(0.8)
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
        sleep(0.5)
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
            puts `clear`
            prompt.say("#{$user.trainer_name}: You're all set! Wow three weeks just flew by, ha ha ha ha! 'Enter''")
            $user.weeks_trained += 3
            gets
            mainmenu
        elsif $user.level == 2 && $user.weeks_trained == 3
            progressbar = ProgressBar.create(:title => "Simulate Training Weeks", :starting_at => 0, :total => 100, :progress_mark => "█")
            100.times {progressbar.increment; sleep(0.005)}
            sleep(0.5)
            puts `clear`
            prompt.say("#{$user.trainer_name}: You're all set! Wow three weeks just flew by, ha ha ha ha! 'Enter'")
            $user.weeks_trained += 3
            gets
            mainmenu
        elsif $user.level == 3 && $user.weeks_trained == 6
            progressbar = ProgressBar.create(:title => "Simulate Training Weeks", :starting_at => 0, :total => 100, :progress_mark => "█")
            100.times {progressbar.increment; sleep(0.005)}
            sleep(0.5)
            puts `clear`
            prompt.say("#{$user.trainer_name}: You're all set! Wow three weeks just flew by, ha ha ha ha! 'Enter'")
            $user.weeks_trained += 3
            gets
            mainmenu
        elsif $user.level == 4 && $user.weeks_trained == 9
            progressbar = ProgressBar.create(:title => "Simulate Training Weeks", :starting_at => 0, :total => 100, :progress_mark => "█")
            100.times {progressbar.increment; sleep(0.005)}
            sleep(0.5)
            puts `clear`
            prompt.say("#{$user.trainer_name}: You're all set! Wow three weeks just flew by, ha ha ha ha! 'Enter'")
            $user.weeks_trained += 3
            gets
            mainmenu
        elsif $user.level == 5 && $user.weeks_trained == 12
            progressbar = ProgressBar.create(:title => "Simulate Training Weeks", :starting_at => 0, :total => 100, :progress_mark => "█")
            100.times {progressbar.increment; sleep(0.005)}
            sleep(0.5)
            puts `clear`
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