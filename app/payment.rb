class Payment 

    def credit 
        puts "Pagamento no crédito" 
        2.times do |t| 
            puts "\nProcessando pagamento..." 
            sleep 1.5 
        end 
        puts "\nPagamento finalizado" 
        puts "\nAperte Enter para continuar" 
        gets 
    end 

    def money(total, cash) 
        puts "\nPagamento em dinheiro" 
        change = cash - total 

        if change < 0 
            puts "\nERRO: Valor insuficiente!" 
            puts "Faltam: R$#{"%.2f" % change.abs}" # O .abs transforma negativo em positivo 
            puts "\nAperte Enter para continuar" 
            gets 
            system 'cls' 
            return false 
        else
            puts "Valor da Compra: R$#{"%.2f" % total}"
            sleep 1
            puts "Valor Entregue: R$#{"%.2f" % cash}"
            sleep 1
            puts "-" * 20
            puts "Seu troco: R$#{"%.2f" % change}"
            puts "-" * 20
            puts "\nAperte Enter para continuar"
            gets
            system 'cls' 
            return true 
        end
    end 

    def debit 
        puts "Pagamento no débito" 
                2.times do |t|
            puts "\nProcessando pagamento..." 
            sleep 1
        end 
        puts "\nPagamento finalizado"
        puts "\nAperte Enter para continuar"
        gets
    end 
end