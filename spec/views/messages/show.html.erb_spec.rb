require 'rails_helper'

RSpec.describe "messages/show", type: :view do
  before(:each) do
    user = create(:regular_user)
    room = create(:room)
    @message = assign(:message, Message.create!(
      content: "MyText",
      user: user,
      room: room
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
