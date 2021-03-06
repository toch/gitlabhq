class Spinach::Features::ProjectSearchCode < Spinach::FeatureSteps
  include SharedAuthentication
  include SharedProject
  include SharedPaths

  step 'I search for term "coffee"' do
    fill_in "search", with: "coffee"
    click_button "Go"
  end

  step 'I should see files from repository containing "coffee"' do
    page.should have_content 'coffee'
    page.should have_content 'CONTRIBUTING.md'
  end

  step 'I should see empty result' do
    page.should have_content "We couldn't find any matching"
  end
end
