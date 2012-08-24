require 'spec_helper'
describe MoviesController do
  before :all do
      @movie1 = FactoryGirl.create(:movie, :id => 1, :director =>'yash')
      @movie2 = FactoryGirl.create(:movie, :id => 2, :director =>'yashx')
      @movie3 = FactoryGirl.create(:movie, :id => 3, :director => 'yash')
  end
  describe "show" do
   it "should show a movie detail by id" do
     post :show, {:id => '1'}
   end
 end
  describe 'find similar' do
    it 'should call the model method that finds movies with same director' do
#movie1 = FactoryGirl.create(:movie, :id => 1, :director =>'yash')
#     movie2 = FactoryGirl.create(:movie, :id => 2, :director =>'yashx')
#     movie3 = FactoryGirl.create(:movie, :id => 3, :director => 'yash')
      Movie.should_receive(:find_movies_by).with('yash')
      post :similar, {:id => '1'}
    end

    it 'should handle no director' do
#     movie1 = FactoryGirl.create(:movie, :id => 1, :director =>'yash')
#     movie2 = FactoryGirl.create(:movie, :id => 2, :director => nil)
#     movie3 = FactoryGirl.create(:movie, :id => 3, :director => 'yash')
      Movie.should_not_receive(:find_movies_by).with(nil)
      post :similar, {:id => '2'}
    end

    it 'should select Similar Movies template for rendering' do
#     movie1 = FactoryGirl.create(:movie, :id => 1, :director =>'yash')
#     movie2 = FactoryGirl.create(:movie, :id => 2, :director =>'yashx')
#     movie3 = FactoryGirl.create(:movie, :id => 3, :director => 'yash')
      Movie.stub(:find_movies_by)
      post :similar, {:id => '1'}
      response.should render_template('similar')
    end
  end
end
