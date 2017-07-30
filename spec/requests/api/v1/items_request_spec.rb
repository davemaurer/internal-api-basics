require 'rails_helper'

describe "items api" do
  it "responds with a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'
    expect(response).to be_success

    items = JSON.parse(response.body)
  end

  it "responds with one item by id" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end

  it "creates a new item" do
    item_params = { name: "Lightsaber", description: "Is cool" }

    post "/api/v1/items", params: { item: item_params }

    item = Item.last

    assert_response :success
    expect(response).to be_success
    expect(item.name).to eq(item_params[:name])
  end
end
