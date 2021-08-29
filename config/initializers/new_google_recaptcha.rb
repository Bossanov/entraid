if Object.const_defined?('NewGoogleRecaptcha')
  NewGoogleRecaptcha.setup do |config|
    config.site_key   = "6LcCDTAcAAAAAGX9T5LqWDYMVL0896t8LZlvzdW6"
    config.secret_key = "6LcCDTAcAAAAAAZ7coguTT0GVCdnV89IeRABgqba"
    config.minimum_score = 0.5
  end
end
