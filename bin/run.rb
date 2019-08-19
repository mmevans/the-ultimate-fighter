require_relative "../config/environment"
require "tty-prompt"

prompt = TTY::Prompt.new


# puts "hello world"
# puts "Hey, it's Barrette!"
# puts "hello world"
# puts "Hey, it's Michael!"

prompt.say("Hello! Welcome to The Ultimate Fighter!")

prompt.select("Choose your destiny?", ["Sign", "Login"])