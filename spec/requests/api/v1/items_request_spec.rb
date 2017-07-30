require 'rails_helper'

describe "items api" do
  it "responds with a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success
  end
end
