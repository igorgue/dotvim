#!/usr/bin/env ruby

#
# This script basically install the vim config,
# puts your old confirations in a backup folder in home
#

# Opening the class String.
# Monkey patching to add red, green and yellow colored outputs.
#
# Examples
#
#   puts "testing this".red
#   # => "testing this" # Color red in terminal
#
class String
  def red
    "\e[31m#{self}\e[0m" 
  end

  def green
    "\e[32m#{self}\e[0m"
  end

  def yellow
    "\e[33m#{self}\e[0m"
  end
end

# Moves old confurations to a new directory
#
#   mv .vim .vim.backup
#   ...
#
def move_old_config
  puts "Starting to move all the dictories to a backup place".red
  puts "Move .vim to .vim.backup".green

  `mv ~/.vim ~/.vim.backup`

  puts "Move .vimrc to .vimrc.backup".green

  `mv ~/.vimrc ~/.vimrc.backup`

  puts "Move .gvimrc to .gvimrc.backup".green

  `mv ~/.gvim ~/.vimrc.backup`
end

# Gets the vim repo from github
#
#   git clone https://github.com/igorgue/dotvim.git .vim
#
def get_dotvim
  puts "Cloning repo locally".red
  puts "Executing git clone".green

  `cd ~ && git clone https://github.com/igorgue/dotvim.git .vim`

  puts "Getting submodules".green
  `cd ~/.vim && git submodule init && git submodule update`
end

# Links the rc files to home
#
#   ln -s ~/.vim/vimrc ~/.vimrc
#
def link_rc_files
  puts "Linking rc files".red
  puts "Executing ln -s".green

  `cd ~ && ln -s .vim/vimrc .vimrc`
  `cd ~ && ln -s .vim/gvimrc .gvimrc`
end

if __FILE__ == $0
  puts "PRO TIP: You can put your own modifications in the ~/.vimrc.local and ~/.gvimrc.local files".green
  move_old_config
  get_dotvim
  link_rc_files
  puts "Wanna retry? copy and paste this:".yellow
  puts "curl https://raw.github.com/igorgue/dotvim/master/install.rb | ruby".yellow
end
