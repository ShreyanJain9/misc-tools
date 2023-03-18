require 'openai'
require 'discordrb'

gpt = OpenAI::Client.new(access_token: '')

bot = Discordrb::Commands::CommandBot.new token: '',
                                          client_id: 168_123_456_789_123_456, prefix: '!'

bot.command :chatgpt do |event, prompt|
  gpt_prompt = prompt
  response = gpt.chat(
    parameters: {
      model: 'gpt-3.5-turbo', # Required.
      messages: [{ role: 'user', content: gpt_prompt }], # Required.
      temperature: 0.7
    }
  )
  chatresponse = response.dig('choices', 0, 'message', 'content')
  # => "Hello! How may I assist you today?"
  chatresponse
end

# => [", there lived a great"]

bot.command :dalle do |event, dalleprompt|
  response = client.images.generate(parameters: { prompt: dalleprompt,
                                                  size: '512x512' })
  imgurl = response.dig('data', 0, 'url')
  imgurl
end

bot.run
