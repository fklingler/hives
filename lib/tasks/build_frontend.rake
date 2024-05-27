# Define a task that will build frontend app
task :build_frontend do
  # In the frontend app folder, we need to run the 'build' npm script
  Dir.chdir(Rails.root.join('app', 'frontend')) do
    system('npm install')
    system('npm run build')
  end
end

# Add the task to the assets:precompile task, so that it's executed automatically when
# app is deployed
if Rake::Task.task_defined?('assets:precompile')
  Rake::Task['assets:precompile'].enhance ['build_frontend']
else 
  desc 'Build frontend'
  Rake::Task.define_task('assets:precompile' => ['build_frontend'])
end