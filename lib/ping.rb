module Mandrill

  class API

    def self.ping
      begin
        client = MailchimpTransactional::Client.new(ENV['MANDRILL_API_KEY'])
        resp = client.users.ping
        puts "API ping: \"#{resp}\""
      rescue MailchimpTransactional::ApiError => e
        puts "Error: #{e}"
      end
    end

  end

end