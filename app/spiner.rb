require 'tty-spinner'
module  Spinner 
  class SpinnerProgress 
    def progress
      spinner = TTY::Spinner.new("[:spinner] Carregando lista de produtos...", format: :bouncing_ball)
      spinner.auto_spin 
      sleep(1.5) 
      spinner.stop("\nProdutos Carregados") 
    end
end 
end
