class MapsController < ApplicationController
  layout 'homepage'
  def index
    #return list of stores that want to show in map
    @stores = Store.all
  end
end
