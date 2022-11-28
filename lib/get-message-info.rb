module Mandrill

  class API

    def get_message_info(id)
      begin
        resp = @client.messages.info({ 'id' => id })
        puts "get-messages-info: \"#{resp}\""
      rescue MailchimpTransactional::ApiError => e
        puts "Error: #{e}"
      end
    end

  end

end