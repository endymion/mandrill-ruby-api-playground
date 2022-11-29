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
    option :queryfile
    def search_messages(query=nil)
      queries =
        if query
          [query]
        else
          if options[:queryfile] =~ /\.json/
            JSON.parse(File.read(options[:queryfile])).
              map{|entry| entry['@message'] }
          else
            File.readlines(options[:queryfile])
          end
        end
      queries.each{|query| query.gsub!(/^.*\: /,'').chomp! }
      Mandrill::API.new.search_messages(queries)
    end

  end
end

Mandrill::CLI.start(ARGV)
