class ExampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    sleep 3

    puts "Job Done!"
  end
end
