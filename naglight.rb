require 'rubygems'
require 'sinatra'
require 'json'

require 'lib/ruby-mk-livestatus'
# You can override some defaults of ruby-mk-livestatus
# Respect the Array !
$mk_livestatus_socket_paths += ["/home/nagios/live"]
# true / false
$mk_livestatus_debug=true


get '/' do
end

get '/api/get/contacts' do
  response.header['Content-type'] = 'application/x-javascript; charset=UTF-8'
  return get_contacts
end