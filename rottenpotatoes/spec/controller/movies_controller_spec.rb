require 'spec_helper'

describe MoviesController do

  describe 'Creating and destroying movies:' do
    it 'Should be possible to create new movies' do
      movie = mock('Movie', :title => "Mock")

      Movie.should_receive(:create!).and_return(movie)

      post :create, {:movie => movie}
    end
    it 'Should be possible to destroy saved movies' do
      movie = mock('Movie', :title => "Fake")

      Movie.should_receive(:find).with('42').and_return(movie)
      movie.should_receive(:destroy)

      post :destroy, {:id => '42'}
    end
  end

  describe 'Editing Movies information:' do
    it 'Should find data of selected movie' do
      Movie.should_receive(:find).with('42')
      get :edit, {:id => '42'}
    end
    it 'Should update data when requested' do
      movie = mock('Movie', :title => "Fake", :director => "Fake Person")
      movie.stub(:update_attributes!)

      Movie.stub(:find).and_return(movie)
      movie.should_receive(:update_attributes!)
      
      post :update, {:id => '42', :movie => mock('Movie')}
    end
  end
end
