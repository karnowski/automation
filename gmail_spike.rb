#!/usr/bin/env ruby

# README:
# gem install gmail --version 0.3.4
# gem install highline --version 1.6.1

require 'rubygems'
require 'gmail'
require 'highline/import'

password = ask("Enter your password:") { |q| q.echo = false }
puts "Working..."

Gmail.connect!("larry@hickorywind.org", password) do |gmail|
  # puts gmail.mailbox('[Gmail]/All Mail').count
  emails = gmail.mailbox('[Gmail]/All Mail').find(:to => "WUNC BPM <bpm@wunc.org>")
  puts emails.first.body.decoded
end
