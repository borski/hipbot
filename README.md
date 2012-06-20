# Hipbot

Hipbot is a bot for HipChat, written in ruby & eventmachine.

This is a work in progress.

## Usage

Subclass Hipbot::Bot and customize robot responses.

``` ruby
require 'hipbot'

class MyCompanyBot < Hipbot::Bot
  hipchat_token 'secret'
  name 'robot'

  # simple reply to '@robot hello!'
  on /^hello.*/ do
    reply('hello!')
  end

  # tasks with arguments: '@robot deploy to production pls'
  on /deploy to (.*) pls/ do |stage|
    reply('deploying to #{stage}!')
    # deploy instructions
  end

  # global messages
  on /.*hello everyone.*/, global: true do
    reply('hello!')
  end
end

robot = MyCompanyBot.new
robot.start!
```