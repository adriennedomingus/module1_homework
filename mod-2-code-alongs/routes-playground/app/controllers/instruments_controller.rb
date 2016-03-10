class InstrumentController < ApplicationController

  def show
    @instrument = Instrument.find_by(name: params[:name])
  end
end
