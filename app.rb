# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'


class Event < ActiveRecord::Base
end

class Sport < ActiveRecord::Base
end

class Bar < ActiveRecord::Base
end
