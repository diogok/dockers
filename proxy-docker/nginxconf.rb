#!/usr/bin/env ruby

require 'uri'
require 'json'
require 'erb'
require 'zlib'

class Namespace
  def initialize(data,config)
    @data=data
    @config=config
  end
  def get_binding
    binding
  end
end

last = ""
template = File.read("/etc/nginx/nginx.conf.erb")

while true do
  sleep 2

  data={}

  `docker ps | awk '{ print $1 }'`.split("\n")[1..-1].each {|cid|
    begin
      containers = JSON.parse `docker inspect #{cid}`
      container = containers[0]
      name = container["Name"][1..-1]
      ip   = container["NetworkSettings"]["IPAddress"]
      if ip == "" then
        ip = `getent hosts #{name} | awk '{print $1}' | head -n 1`.gsub("\n","")
      end
      if ip != "" then
        ports =  container["NetworkSettings"]["Ports"]
        ports.each {|k,v|
          if !v.nil? then
            if !data.has_key?(name) then
              if !v[0]["HostPort"].empty? then
                port = k.split("/").first 
                data[name] = "#{ip}:#{port}"
              end
            end
          end
        }
      end
    rescue Exception => e
      puts e
    end
  }

  ns = Namespace.new(data,{})
  result=ERB.new(template).result(ns.get_binding)

  actual = Zlib::crc32(result)

  if actual != last then
    puts "Writing /etc/nginx/nginx.conf"
    puts result
    File.open('/etc/nginx/nginx.conf', 'w') { |file| file.write(result) }
    `/usr/sbin/nginx -s reload`
    last = actual
  end

end

