require 'MailchimpTransactional'
require 'dotenv/load'
require "thor"
require_relative 'lib/mandrill-api'

module Mandrill
  class CLI < Thor

    desc "ping", "ping the Mandrill API"
    def ping
      Mandrill::API.new.ping
    end

  end
end

Mandrill::CLI.start(ARGV)
