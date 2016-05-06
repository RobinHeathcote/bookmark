def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'alice@example.com'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oranges!'
  click_button 'Sign up'
end

def bad_sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'alice@example.com'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oraanges!'
  click_button 'Sign up'
end

def blank_email
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oranges!'
  click_button 'Sign up'
end

def invalid_email
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'example.com'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oranges!'
  click_button 'Sign up'
end