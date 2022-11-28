require_relative 'ping'

module Mandrill

  class API

    def initialize
      begin
        @client = MailchimpTransactional::Client.new(ENV['MANDRILL_API_KEY'])
      rescue MailchimpTransactional::ApiError => e
        puts "Error: #{e}"
      end
    end

  end

end