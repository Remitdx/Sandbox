class CleanDatabaseJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "I'm starting the fake job"
    sleep 3
    puts "OK I'm done now"
  end
end
