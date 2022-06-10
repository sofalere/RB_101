require "socket"

server = TCPServer.new("localhost", 3003)

# def parse_method(request_line)
#   method_name = ''
#   request_line.chars.each do |char| 
#     method_name << char
#     break if char == ' '
#   end
#   method_name
# end

# def parse_path(request_line)
#   request_line.split[1].split('?')[0]
# end

# def parse_query(request_line)
#   return nil unless request_line.include?('?')
#   query_ar = request_line.split('?')[1].split[0].split('&')
#   query_ar.each_with_object({}) do |pair, qhash|
#     key, val = pair.split('=')
#     qhash[key] = val
#   end
# end

def parse_request(request_line)
  method_name, path_params, http = request_line.split
  path, params = path_params.split('?')
  params = params.split('&').each_with_object({}) do |pair, param_hash|
    key, val = pair.split('=')
    param_hash[key] = val
  end

  [method_name, path, params]
end

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  # client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts request_line
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Rolls!</h1>"
  rolls = params["rolls"].to_i
  sides = params["sides"].to_i

  rolls.times do 
    roll = rand(sides) + 1
    client.puts roll
  end

  client.puts "</body>"
  client.puts "</html>"

  client.close
end
