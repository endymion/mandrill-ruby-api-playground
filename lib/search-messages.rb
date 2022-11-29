module Mandrill

  class API

    def search_messages(queries)
      queries.each do |query|
        puts "Querying for: #{query}"
        begin
          resp = @client.messages.search({ 'query' => query })
          puts "search-messages: \"#{resp}\""
          if resp.count.zero?
            puts "MISSING: #{query}"
          end
        rescue MailchimpTransactional::ApiError => e
          puts "Error: #{e}"
        end
        sleep(1)
      end
    end

  end

end