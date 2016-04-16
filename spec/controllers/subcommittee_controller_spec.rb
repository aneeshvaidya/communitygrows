require 'rails_helper'
require 'spec_helper'

RSpec.describe SubcommitteeController, type: :controller do
    fixtures :users
    before(:each) do
        sign_in users(:tester)
    end
    describe 'index' do
       it 'renders index page' do
           get :subcommittee_index, {:committee_type => "executive"}
           response.should render_template(:subcommittee_index)
       end
    end
end