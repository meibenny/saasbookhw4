require 'spec_helper'

describe Movie do
  describe 'original attributes' do
    before(:each) do
      @movie = Movie.create!(@attr)
    end
    it 'has a title attribute' do
      @movie.should respond_to(:title)
    end
    it 'has a rating attribute' do
      @movie.should respond_to(:rating)
    end
    it 'has a release_date attribute' do
      @movie.should respond_to(:release_date)
    end
    it 'has a description attribute' do
      @movie.should respond_to(:description)
    end
  end

  describe 'director attribute' do
    it 'is a new Movie attribute' do
      @movie = Movie.create!(:director => nil)
      @movie.should respond_to(:director)
    end
    it 'has a director attribute' do
      @movie = Movie.create(@attr)
      @movie.should respond_to(:director)
    end
  end
end
