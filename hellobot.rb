require "socket"

msgcounter = 0
server = "irc.bitmakerlabs.com"
port = "6667"
nick = "SpeaksShakespeare"
channel = "#cohort5"
greeting_prefix = "privmsg #{channel} :"
greetings = ["good day", "good day!"]

irc_server = TCPSocket.open(server, port)
#This will point to the open TCP socket. TCP is how we connect to the internet; it's a "certain method of connecting"
#The .open method opens the socket.

irc_server.puts "USER bhellobot 0 * BHelloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
irc_server.puts "PRIVMSG #{channel} :Hello from IRC Bot"

# Hello, Bot!
until irc_server.eof? do
  msg = irc_server.gets.downcase
  msgcounter += 1
  puts msg

  was_greeted = false
  greetings.each do |g|
    was_greeted = true if msg.include?(g)
  end

  if msg.include?(greeting_prefix) and was_greeted
          message_array = [1,2,3,4,5].sample
          if message_array == 1
            response = "Life's but a walking shadow, a poor player that struts and frets his hour upon the stage and then is heard no more."
            irc_server.puts "PRIVMSG #{channel} :#{response}"
          elsif message_array == 2
            response = "To die, to sleep— no more; and by a sleep, to say we end the Heart-ache, and the thousand natural shocks that Flesh is heir to?"
            irc_server.puts "PRIVMSG #{channel} :#{response}"
          elsif message_array == 3 
            response = "O, she doth teach the torches to burn bright. It seems she hangs upon the cheek of night Like a rich jewel in an Ethiop's ear."
            irc_server.puts "PRIVMSG #{channel} :#{response}"
          elsif message_array == 4 
            response = "Why, this is very midsummer madness!"
            irc_server.puts "PRIVMSG #{channel} :#{response}"
          elsif message_array == 5
            response = "Now is the winter of our discontent!"
            irc_server.puts "PRIVMSG #{channel} :#{response}"
          else
          end
  end

  if msgcounter == 20
      response = "Say 'good day' and prepare thyself for Shakespeare!"
      irc_server.puts "PRIVMSG #{channel} :#{response}"
      msgcounter = 0
  end
end