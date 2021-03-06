require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']

group "background" do
  
  # Run Bundle with each Gemfile edit
  guard 'bundler' do
    watch('Gemfile')
  end
  
  # Reload The Browser when changes are made.
  guard 'livereload' do
    watch(%r{app/.+\.(erb|haml)})
    watch(%r{app/helpers/.+\.rb})
    watch(%r{(public/|app/assets).+\.(css|js|html)})
    watch(%r{(app/assets/.+\.css)\.s[ac]ss}) { |m| m[1] }
    watch(%r{(app/assets/.+\.js)\.coffee})
    watch(%r{config/locales/.+\.yml})
  end
end

group "tests" do

  # Rspec
  guard 'rspec', :turnip => true, all_on_start: false, all_after_pass: false  do

      watch(%r{^spec/factories/.+\.rb$})
      watch(%r{^spec/acceptance/.+\.feature$})
      watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) { 'spec/acceptance'}

      watch(%r{^spec/acceptance/steps/*/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
  
    #rspec
      watch(%r{^spec/.+_spec\.rb$})   
      watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
      watch('spec/spec_helper.rb')    { "spec" }
      watch('spec/turnip_helper.rb')  { "spec/acceptance" }
      watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
      watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
      watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
      watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
      watch('config/routes.rb')                           { "spec/routing" }
      watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  end

  # Capybara request specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }

end



