require 'spec_helper'

describe 'Our Numerology App' do
  include SpecHelper
  
  it "displays an error message if the input is too short" do
    birthdate = '/090319'
    post("/", { birthdate: birthdate })
    expect(last_response).to match(/#{'You should enter a valid birthdate in the form of mmddyyyy.'}/)
  end
  
  it "displays an error message if the input is non-numeric" do
    birthdate = '/12axy3jk'
    post("/", { birthdate: birthdate })
    expect(last_response).to match(/#{'You should enter a valid birthdate in the form of mmddyyyy.'}/)
  end
  
end