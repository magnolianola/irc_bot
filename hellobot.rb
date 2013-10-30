require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "Horse_ebooks_bitmakerbot"
channel = "#bitmakerlabs"
greeting_prefix = "privmsg #{channel} :"
greetings = ["hi", "hola", "yo", "sup", "wazup", "guten tag", "howdy", "salutations", "who the hell are you?", "konnichiwa"]
article = ["what"]
irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bhorse_ebooks_bitmaker 0 * BHorseEbooksBitmaker"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
irc_server.puts "PRIVMSG #{channel} :Crumbs"

# Hello, Bot!
until irc_server.eof? do
  msg = irc_server.gets.downcase
  puts msg

  was_greeted = false
  greetings.each do |g|
    was_greeted = true if msg.include?(g)
  end

  said_article = false
  article.each do |x|
    said_article = true if msg.include?(x)
  end

  if msg.include?(greeting_prefix) and was_greeted
    response = "Not only that, but whether you believe it (or want to believe it) the car salesmen will continue to laugh"
  	irc_server.puts "PRIVMSG #{channel} :#{response}"
  end

  if msg.include?(greeting_prefix) and said_article
    response = "Demand Furniture."
    irc_server.puts "PRIVMSG #{channel} :#{response}"
  end
end

