class ApplicationController < ActionController::Base


  def hello
    @shows = Show.all
  end



end
