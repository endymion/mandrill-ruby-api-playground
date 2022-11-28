require 'MailchimpTransactional'
require 'dotenv/load'
require 'byebug'
require 'awesome_print'
require 'thor'
require_relative 'lib/mandrill-api'

module Mandrill
  class CLI < Thor

    desc "ping", "ping the Mandrill API"
    def ping
      Mandrill::API.new.ping
    end

    desc "get-message-info", "Get information about a specific message ID."
    def get_message_info(id)
      Mandrill::API.new.get_message_info(id)
    end

    desc "search-messages", "Use the API's search feature."
    def search_messages(query)
      Mandrill::API.new.search_messages(query)
    end

  end
end

Mandrill::CLI.start(ARGV)
