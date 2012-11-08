module EditSettingsSteps

  step 'the :key field should contain :value' do |key, value| 
    # debugger
    page.has_field?(key, with: value)
  end

end