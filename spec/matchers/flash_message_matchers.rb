RSpec::Matchers.define :have_error_message do |message|
  element = 'div.alert.alert-error'

  match do |page|
    expect(page).to have_selector(element, text: message)
  end

  failure_message_for_should do
    "expected to find #{element} containing the message '#{message}', but none was found"
  end
end


RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-success', text: message)
  end
end
