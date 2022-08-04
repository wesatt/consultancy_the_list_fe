require 'rails_helper'


RSpec.describe 'User Dashboard Page', :vcr, type: :feature do
  describe 'Not logged in' do
    it 'trying to visit it directly returns you to the homepage if you are not logged in' do
      visit '/'
      expect(page).to_not have_content('Please login before trying to navigate')

      visit '/dashboard'

      expect(page).to have_current_path('/')
      expect(page).to have_content('Please login before trying to navigate')
    end
  end

  describe 'Logged in' do
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
      users = UserFacade.list_all_users
      test_user = users.first
      @recs = RecommendationFacade.get_user_recs(test_user.id)
      books = @recs[:book]
      movies = @recs[:movie]
      @test_book = books.first
      @test_movie = movies.first
      test_movie2 = movies.second
      hash = {'email' => test_user.email, 'name' => test_user.name, 'id' => test_user.id}
      RecommendationFacade.update_recomm_status({status: 'pending', id: @test_movie.id}, hash)
      RecommendationFacade.update_recomm_status({status: 'accepted', id: test_movie2.id}, hash)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(hash)
    end

    it 'lists a users recommendations on the page' do
      visit '/dashboard'

      expect(page).to have_content(@test_book.title)
      expect(page).to have_content(@test_movie.title)
    end

    it 'has a button to change a recs status' do
      visit '/dashboard'

      within '#pendMovie' do
        expect(page).to have_button("Accept")
        expect(page).to have_button("Reject")
      end

      within "#pendRead" do
        expect(page).to have_button("Accept")
        expect(page).to have_button("Reject")
      end

      within '#recRead' do
        expect(page).to have_button("Complete")
      end

      within "#recMovie" do
        expect(page).to have_button("Complete")
      end

    end

    it 'will move the rec to the appropriate colomn after button is pushed' do
      visit '/dashboard'

      within '#pendMovie' do
        within "#pendingMovieEntry-#{@test_movie.id}" do
          click_button("Accept")
        end
      end

      within "#recMovie" do
        expect(page).to have_content(@test_movie.title)
      end
    end
  end
end
