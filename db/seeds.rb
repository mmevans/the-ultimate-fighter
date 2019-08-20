User.destroy_all
Opponent.destroy_all
Trainer.destroy_all
Fight.destroy_all
Moveset.destroy_all
Schedule.destroy_all
Workout.destroy_all


chuck_level_1 = Opponent.create({
    :name => "Chuck Cianwood",
    :gender => "Male",
    :level => 1,
    :energy => 100,
    :str => 1,
    :flex => 1,
    :end => 1,
    :fights_won => 1
})

brawly_level_2 = Opponent.create({
    :name => "Brawly Dewford",
    :gender => "Male",
    :level => 2,
    :energy => 200,
    :str => 2,
    :flex => 2,
    :end => 2,
    :fights_won => 2
})

maylene_level_3 = Opponent.create({
    :name => "Maylene Veilstone",
    :gender => "Female",
    :level => 3,
    :energy => 300,
    :str => 3,
    :flex => 3,
    :end => 3,
    :fights_won => 3
})

korrina_level_4 = Opponent.create({
    :name => "Korrina Shalour",
    :gender => "Female",
    :level => 4,
    :energy => 400,
    :str => 4,
    :flex => 4,
    :end => 4,
    :fights_won => 4
})

mike_level_5 = Opponent.create({
    :name => "Mike Tyson",
    :gender => "Male",
    :level => 5,
    :energy => 500,
    :str => 5,
    :flex => 5,
    :end => 5,
    :fights_won => 100
})

red = Trainer.create({
    :name => "Red", 
    :phrase1 => "If they can make penicillin out of moldy bread, we can sure make something out of you",
    :phrase2 => "You'll get the sweet taste of victory from training. Not from chocolate! Ha ha ha ha!",
    :phrase3 => "You're working up a sweat! Keep it up and this punk won't stand a chance!",
    :phrase4 => "Woah, look at those muscles! You're biceps are as big as your head! Ha ha ha ha!",
    :phrase5 => "You're speed is incredible, at this rate you're opponent won't land a hit!",
    :phrase6 => "Don't cry, kid. There's always nex time",
    :phrase7 => "I guess it's back to gym for you. Maybe we need to work on your form.",
    :phrase8 => "Son, you gotta give 110% out there! I know mathematically it's only possible to give 100%, but you gotta squeeeeze that extra ten percent out there for me!",
    :phrase9 => "Float like a butterfly, sting like a bee. His hands can't hit what his eyes can't see.",
    :phrase10 => "Congralutions, you're the ultimate fighting champion! Drinks are on you tonight! Ha ha ha!"
})

lance = Trainer.create({
    :name => "Lance", 
    :phrase1 => "If they can make penicillin out of moldy bread, we can sure make something out of you",
    :phrase2 => "You'll get the sweet taste of victory from training. Not from chocolate! Ha ha ha ha!",
    :phrase3 => "You're working up a sweat! Keep it up and this punk won't stand a chance!",
    :phrase4 => "Woah, look at those muscles! You're biceps are as big as your head! Ha ha ha ha!",
    :phrase5 => "You're speed is incredible, at this rate you're opponent won't land a hit!",
    :phrase6 => "Don't cry, kid. There's always nex time",
    :phrase7 => "I guess it's back to gym for you. Maybe we need to work on your form.",
    :phrase8 => "Son, you gotta give 110% out there! I know mathematically it's only possible to give 100%, but you gotta squeeeeze that extra ten percent out there for me!",
    :phrase9 => "Float like a butterfly, sting like a bee. His hands can't hit what his eyes can't see.",
    :phrase10 => "Congralutions, you're the ultimate fighting champion! Drinks are on you tonight! Ha ha ha!"
})

doc_louis = Trainer.create({
    :name => "Doc Louis", 
    :phrase1 => "If they can make penicillin out of moldy bread, we can sure make something out of you",
    :phrase2 => "You'll get the sweet taste of victory from training. Not from chocolate! Ha ha ha ha!",
    :phrase3 => "You're working up a sweat! Keep it up and this punk won't stand a chance!",
    :phrase4 => "Woah, look at those muscles! You're biceps are as big as your head! Ha ha ha ha!",
    :phrase5 => "You're speed is incredible, at this rate you're opponent won't land a hit!",
    :phrase6 => "Don't cry, kid. There's always nex time",
    :phrase7 => "I guess it's back to gym for you. Maybe we need to work on your form.",
    :phrase8 => "Son, you gotta give 110% out there! I know mathematically it's only possible to give 100%, but you gotta squeeeeze that extra ten percent out there for me!",
    :phrase9 => "Float like a butterfly, sting like a bee. His hands can't hit what his eyes can't see.",
    :phrase10 => "Congralutions, you're the ultimate fighting champion! Drinks are on you tonight! Ha ha ha!"
})

mickey_goldmill = Trainer.create({
    :name => "Mickey Goldmill", 
    :phrase1 => "If they can make penicillin out of moldy bread, we can sure make something out of you",
    :phrase2 => "You'll get the sweet taste of victory from training. Not from chocolate! Ha ha ha ha!",
    :phrase3 => "You're working up a sweat! Keep it up and this punk won't stand a chance!",
    :phrase4 => "Woah, look at those muscles! You're biceps are as big as your head! Ha ha ha ha!",
    :phrase5 => "You're speed is incredible, at this rate you're opponent won't land a hit!",
    :phrase6 => "Don't cry, kid. There's always nex time",
    :phrase7 => "I guess it's back to gym for you. Maybe we need to work on your form.",
    :phrase8 => "Son, you gotta give 110% out there! I know mathematically it's only possible to give 100%, but you gotta squeeeeze that extra ten percent out there for me!",
    :phrase9 => "Float like a butterfly, sting like a bee. His hands can't hit what his eyes can't see.",
    :phrase10 => "Congralutions, you're the ultimate fighting champion! Drinks are on you tonight! Ha ha ha!"
})

level_1_jab = Moveset.create({
    :level => 1,
    :moves => "Jab",
    :damage => 20,
    :move_type => "str_move"
})
level_1_lowkick = Moveset.create({
    :level => 1,
    :moves => "Low-Kick",
    :damage => 18,
    :move_type => "flex_move"
})
level_1_bobandweave = Moveset.create({
    :level => 1,
    :moves => "Bob and Weave",
    :damage => 15,
    :move_type => "end_move"
})
level_1_uppercut = Moveset.create({
    :level => 1,
    :moves => "Uppercut",
    :damage => 35,
    :move_type => "power_move"
})
level_2_righthook = Moveset.create({
    :level => 2,
    :moves => "Right Hook",
    :damage => 35,
    :move_type => "str_move"
})
level_2_karatechop = Moveset.create({
    :level => 2,
    :moves => "Karate Chop",
    :damage => 32,
    :move_type => "flex_move"
})
level_2_tieup = Moveset.create({
    :level => 2,
    :moves => "Tie Up",
    :damage => 26,
    :move_type => "end_move"
})
level_2_jumpkick = Moveset.create({
    :level => 2,
    :moves => "High Jump Kick",
    :damage => 61,
    :move_type => "power_move"
})
level_3_focuspunch = Moveset.create({
    :level => 3,
    :moves => "Focus Punch",
    :damage => 61,
    :move_type => "str_move"
})
level_3_doublekick = Moveset.create({
    :level => 3,
    :moves => "Double Kick",
    :damage => 56,
    :move_type => "flex_move"
})
level_3_parry = Moveset.create({
    :level => 3,
    :moves => "Parry",
    :damage => 46,
    :move_type => "end_move"
})
level_3_knee = Moveset.create({
    :level => 3,
    :moves => "Knee of Justice",
    :damage => 106,
    :move_type => "power_move"
}) 
level_4_hammerfist = Moveset.create({
    :level => 4,
    :moves => "Hammerfist",
    :damage => 90,
    :move_type => "str_move"
})
level_4_roundkick = Moveset.create({
    :level => 4,
    :moves => "Round House Kick",
    :damage => 75,
    :move_type => "flex_move"
})
level_4_butterflyguard = Moveset.create({
    :level => 4,
    :moves => "Butterfly Guard",
    :damage => 63,
    :move_type => "end_move"
})
level_4_uchimata = Moveset.create({
    :level => 4,
    :moves => "Uchi Mata",
    :damage => 137,
    :move_type => "power_move"
})
level_5_choke = Moveset.create({
    :level => 5,
    :moves => "Rear-Naked Choke",
    :damage => 103,
    :move_type => "str_move"
})
level_5_takedown = Moveset.create({
    :level => 5,
    :moves => "Double Leg Takedown",
    :damage => 89,
    :move_type => "flex_move"
})
level_5_parry = Moveset.create({
    :level => 5,
    :moves => "Parry & DoubleSlap",
    :damage => 79,
    :move_type => "end_move"
})
level_5_skullcrusher = Moveset.create({
    :level => 5,
    :moves => "Skull Crusher",
    :damage => 150,
    :move_type => "power_move"
})

workout_level_1 = Workout.create({
    :str_workouts => "Knee Push-ups",
    :flex_workouts => "Calf Stretch",
    :end_workouts => "Elliptical",
    :level => 1
})
workout_level_2 = Workout.create({
    :str_workouts => "Push-ups",
    :flex_workouts => "Squats",
    :end_workouts => "Cycling",
    :level => 2
})
workout_level_3 = Workout.create({
    :str_workouts => "Bicep Curls",
    :flex_workouts => "Tricep Extensions",
    :end_workouts => "Running",
    :level => 3
})
workout_level_4 = Workout.create({
    :str_workouts => "Bench Press",
    :flex_workouts => "Deadlifts",
    :end_workouts => "Tabata",
    :level => 4
})
workout_level_5 = Workout.create({
    :str_workouts => "Weighted Pull-ups",
    :flex_workouts => "Weighted Dips",
    :end_workouts => "Running Suicides",
    :level => 5
})

schedule_level_1 = Schedule.create({
    :sleep => "7 hours",
    :job => "9 hours",
    :food => "2 hours",
    :workout => "2 hours",
    :relax => "4 hours"
})
schedule_level_2 = Schedule.create({
    :sleep => "7 hours",
    :job => "8 hours",
    :food => "2 hours",
    :workout => "3 hours",
    :relax => "4 hours"
})
schedule_level_3 = Schedule.create({
    :sleep => "8 hours",
    :job => "5 hours",
    :food => "3 hours",
    :workout => "4 hours",
    :relax => "4 hours"
})
schedule_level_4 = Schedule.create({
    :sleep => "9 hours",
    :job => "4 hours",
    :food => "2 hours",
    :workout => "5 hours",
    :relax => "6 hours"
})
schedule_level_5 = Schedule.create({
    :sleep => "10 hours",
    :job => "0 hours",
    :food => "2 hours",
    :workout => "6 hours",
    :relax => "6 hours"
})

barrette = User.create({
    :username => "Barrette",
    :trainer_name => nil,
    :energy => 100,
    :money => 0,
    :flex => 1,
    :str => 1,
    :end => 1,
    :fights_won => 0,
    :weeks_trained => 0,
    :injured => false,
    :password => nil,
    :gender => 'Male',
    :level => 1
})

michael = User.create({
    :username => "Michael",
    :trainer_name => nil,
    :energy => 100,
    :money => 0,
    :flex => 1,
    :str => 1,
    :end => 1,
    :fights_won => 0,
    :weeks_trained => 0,
    :injured => false,
    :password => nil,
    :gender => 'Male',
    :level => 1
})






