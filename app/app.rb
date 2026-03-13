require_relative './product.rb' 
require_relative './market.rb' 
require_relative './payment.rb' 
require 'json' 

cart = [] # Váriavel global para guardar os produtos escolhidos na opção 2
products = [] # Guardo meu json como objeto neste array

file_products = File.read('../products.json')
products_hash = JSON.parse(file_products) 


products_hash.each do |name, price|
  products << Product.new(name, price)
end

jump = '' 
menu = {"0": "Sair", "1": "Ver lista de produtos", "2": "Escolher produtos","3": "Ver minha lista" , "4": "Formas de Pagamento", "5": "Limpar terminal"} 

loop do
    puts "-" * 20
    puts "Bem vindo ao supermercado do preço justo"
    puts "Aqui os preços são de outro mundo!!" 
    puts "-" * 20 

    menu.each do |key,value| 
        puts "#{key}: #{value}" 
    end 

    print "Escolha uma opção: " 
    option = gets.chomp 

    if option == "0" 
        break 
    elsif option == "1" 
        puts "Produtos: "
        products.each_with_index do |product, index|
            puts "-" * 20
            puts "ID: #{index + 1}"
            puts "Produto: #{product.name}"
            puts "Preço: R$#{product.price}"
        end
   
        puts "\nAperte Enter para continuar" 
        gets 
        system 'cls'
    elsif option == "2" 
        products.each_with_index do |product, index|
            puts "-" * 20
            puts "ID: #{index + 1}"
            puts "Produto: #{product.name}"
            puts "Preço: R$#{product.price}"
        end 
        
        print "Escolha um produto pelo ID: " 
        id_product = gets.chomp.to_i
        system 'cls'

        product = products[id_product - 1] # bug, sem este decremento, quando digitava por exemplo 2 para o (feijao_1kg) dava (macarrao_500g) do id 3, pois o indice começa com 0. Que no caso é o ID 1(arroz_5kg) 

        if product 
            cart << product 
            puts "O produto #{product.name} esta no seu carrinho!" 
        else 
            puts "ID inválido!" 
        end 
    elsif option == "3" 
        if cart.empty? 
             puts "-" * 20 
            puts "\nSeu carrinho está vazio." 
             puts "-" * 20 
        else
            total = 0
            cart.each do |product|
            puts "-" * 20
            puts "#{product.name} - R$#{"%.2f" % product.price}"
            total += product.price
            puts "-" * 20
            end
            total_formatted = "%.2f" % total 
            puts "Valor total da compra: R$#{total_formatted}" 
            puts "-" * 20
        end

        puts "\nAperte Enter para continuar"
        gets 
        system 'cls'
    
    elsif option == "4"

        if cart.empty?
            puts "\nSeu carrinho esta vazio! Adicione produtos para liberar essa opção" 
            puts "\nAperte Enter para continuar" 
            gets 
            system 'cls'
        else
            total = cart.sum(&:price)
            payment = Payment.new

            print "\nEscolha a forma de pagamento:"
            puts
            puts "1 - Crédito"
            puts "2 - Débito"
            puts "3 - Dinheiro"

            pay_option = gets.chomp

            case pay_option
            when "1"
            payment.credit
            cart.clear
            puts "\nCompra finalizada! O carrinho foi limpo."
            sleep 2.5
            when "2"
            payment.debit
            cart.clear
            puts "\nCompra finalizada! O carrinho foi limpo."
            sleep 2.5
            when "3"
            puts "Quanto você vai entregar em dinheiro?"
            print "R$ "
            cash = gets.chomp.to_f 
            if payment.money(total, cash)
                cart.clear 
                puts "\nCompra finalizada! O carrinho foi limpo." 
                sleep 2.5 
            else 
                puts "\nPagamento cancelado." 
                sleep 2.5 
            end 
            else
            puts "Opção inválida"
            end
        end
    elsif option == "5" 
        2.times do |t|
            puts "Limpando a tela..." 
            sleep 1 
            system 'cls'
        end
    else 
        puts "Opção inválida!"

    end
end
1.times do |t|
    puts "\nEncerrando Sistema...."
    sleep 2 
    system 'cls'
end