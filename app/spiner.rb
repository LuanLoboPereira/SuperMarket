require 'tty-spinner'
module  Spinner 
  class SpinnerProgress 
    def progress
      spinner = TTY::Spinner.new("[:spinner] Carregando lista de produtos...", format: :pulse_2)
      spinner.auto_spin # Automatic animation with default interval
      sleep(2) # Perform task
      spinner.stop("Done!") # Stop animation
    end
end 
end
