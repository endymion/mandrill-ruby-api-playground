module Mandrill

  class API

    def search_messages(query)
      begin
        resp = @client.messages.search({ 'query' => query })
        puts "search-messages: \"#{resp}\""
      rescue MailchimpTransactional::ApiError => e
        puts "Error: #{e}"
      end
    end

  end

end