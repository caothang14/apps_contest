class MapsController < ApplicationController
  def index
    #return list of stores that want to show in map
    @stores = Store.all
  end
end
