require "rails_helper"

describe V1::ContactsController, type: :controller do
  it "test request without accept header returns 406 OK" do
    get :index
    expect(response).to have_http_status(406)
  end

  it "test if request index return 200 OK" do
    request.accept = "application/json"
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET v1/contacts/:id" do
    contact = Contact.first
    request.accept = "application/json"
    get :show, { id: contact.id }
    
    response_body = JSON.parse(response.body)
    
    expect(response_body.fetch("data").fetch("id")).to eql(contact.id.to_s)
  end
end
