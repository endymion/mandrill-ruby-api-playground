module Mandrill

  class API

    def ping
      begin
        resp = @client.users.ping
        puts "API ping: \"#{resp}\""
      rescue MailchimpTransactional::ApiError => e
        puts "Error: #{e}"
      end
    end

  end

end