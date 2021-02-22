feature "bookmark display page" do
  scenario "displays the bookamrks" do
    visit '/'
    expect(page).to have_content "Bookmarks:"
  end
end 
