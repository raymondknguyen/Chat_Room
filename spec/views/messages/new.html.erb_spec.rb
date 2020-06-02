require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    user = create(:regular_user)
    room = create(:room)
    assign(:message, Message.new(
      content: "MyText",
      user: user,
      room: room
    ))
  end
end
