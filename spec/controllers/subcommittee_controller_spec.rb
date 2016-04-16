require 'rails_helper'
require 'spec_helper'

RSpec.describe SubcommitteeController, type: :controller do
    describe 'index' do
       it 'renders index page' do
           get :subcommittee_index, {:committee_type => "executive"}
           response.should render_template(:subcommittee_index)
       end
    end
end