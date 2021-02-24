feature "Home page" do
  scenario "displays the bookmark manager" do
    visit '/bookmarks'
    expect(page).to have_content "Bookmarks Manager"
  end
end

feature "Bookmarks" do
  scenario "Add bookmark and then View " do
    visit '/bookmarks'
    fill_in :new_url, with: 'http://www.mylittlepony.com'
    fill_in :new_title, with: 'My Little Pony'
    click_button "Submit"
    fill_in :new_url, with: "http://www.google.com"
    fill_in :new_title, with: "Google"
    click_button "Submit"
    expect(page).to have_content("Google")
    expect(page).to have_link('My Little Pony', href: 'http://www.mylittlepony.com')
    expect(page).to have_link("Google", href: 'http://www.google.com')
  end
end
