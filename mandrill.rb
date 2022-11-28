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

    desc "get-message-id", "Get information about a specific message ID."
    def get_message_info(id)
      Mandrill::API.new.get_message_info(id)
    end

  end
end

Mandrill::CLI.start(ARGV)
