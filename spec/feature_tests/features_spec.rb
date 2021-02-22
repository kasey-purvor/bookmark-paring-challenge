feature "Home page" do
  scenario "displays the bookmark link" do
    visit '/home'
    expect(page).to have_content "view bookmarks"
  end
end 

feature "Bookmarks" do
  scenario "View bookmarked pages" do
    visit '/bookmarks'
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end 
