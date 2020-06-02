require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    user = create(:regular_user)
    user2 = create(:regular_user)
    room = create(:room)
    assign(:messages, [
      Message.create!(
        context: "MyText",
        user: user,
        room: room
      ),
      Message.create!(
        context: "MyText",
        user: user2,
        room: room
      )
    ])
  end

  xit "renders a list of messages" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
