class TrailerSellChannel < ApplicationCable::Channel
  def subscribed
    stream_from "trailer_sell_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
