#!/usr/bin/ruby

INTERVAL = 60
HOSTNAME = `hostname`.chomp!
VARNISH_COMMAND = "/usr/bin/varnishtop -i TxStatus -1"
STDOUT.sync = true

def get_statuses
  status = Hash.new
  f = IO.popen(VARNISH_COMMAND)
  f.readlines.each do |line|
    line_array = line.split(/\s+/)
    status[line_array[3]] = line_array[1].to_i
  end
  return status
end

def print_status_results(statuses)
  statuses.each do |key,val|
    puts "PUTVAL #{HOSTNAME}/varnish/http_response_codes-#{key} interval=#{INTERVAL} N:#{val}"
  end
end

while true do
  statuses = get_statuses()
  print_status_results statuses
  sleep INTERVAL
end

exit 0