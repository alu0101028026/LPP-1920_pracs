require './lib/alimento/alimento.rb'
require './lib/alimento/plato.rb'
require './lib/alimento/lista.rb'

RSpec.describe Alimentos do
	before :all do 

		@a1 = Alimentos.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
		@a2 = Alimentos.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
		@a3 = Alimentos.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
		@a4 = Alimentos.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
		@a5 = Alimentos.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.4)
		@a6 = Alimentos.new("Salmon", 19.9, 0.0, 13.6, 6.0, 3.7)
		@a7 = Alimentos.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)
		@a8 = Alimentos.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
		@a9 = Alimentos.new("Cafe", 0.1, 0.0, 0.0, 0.4, 0.3)
		@a10 = Alimentos.new("Camarones", 17.6, 1.5, 0.6, 18.0, 2.0)
		@a11 = Alimentos.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
		@a12 = Alimentos.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
		@a13 = Alimentos.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
		@a14 = Alimentos.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
		@a15 = Alimentos.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
		
		@hombre = [@a5, @a6, @a4]
		@mujer = [@a4, @a7, @a8]
                

        end

        context "Probando que parametros existen" do
                it "debe tener un nombre" do
                        expect(@a1.name).to_not eq(nil)
                end
                it "debe tener proteinas" do
                        expect(@a1.proteina).to_not eq(nil)
                end
                it "debe tener carbohidratos" do
                        expect(@a1.carbohidratos).to_not eq(nil)
                end
                it "debe tener lipidos" do
                        expect(@a1.lipidos).to_not eq(nil)
                end
                it "debe tener GEI" do
                        expect(@a1.gei).to_not eq(nil)
                end
                it "debe tener terreno" do
                        expect(@a1.terreno).to_not eq(nil)
                end
        end


        context " Probando tipo de dato de los parámetros" do
                it "name debe ser un string" do
			expect(@a2.name).to be_kind_of(String)
		end
		it "proteina debe ser un float" do
                        expect(@a2.proteina).to be_kind_of(Float)
                end
		it "carbohidratos debe ser un float" do
                        expect(@a2.carbohidratos).to be_kind_of(Float)
                end
                it "lipidos debe ser un float" do
                        expect(@a2.lipidos).to be_kind_of(Float)
                end
		it "GEI debe ser un float" do
                        expect(@a2.gei).to be_kind_of(Float)
                end
		it "terreno debe ser un float" do
                        expect(@a2.terreno).to be_kind_of(Float)
                end
	end


	context "Probando los datos del alimento" do
		it "debe acceder al nombre" do
			expect(@a3.name).to eq("Chocolate")
		end
		it "debe acceder a proteinas" do
			expect(@a3.proteina).to eq(5.3)
		end
		it "debe acceder a carbohidratos" do
			expect(@a3.carbohidratos).to eq(47.0)
                end
		it "debe acceder a lipidos" do
			expect(@a3.lipidos).to eq(30.0)
                end
		it "debe acceder a GEI" do
			expect(@a3.gei).to eq(2.3)
                end
		it "debe acceder a terreno" do
			expect(@a3.terreno).to eq(3.4)
                end
	end

	context "Probar que accede a los metodos" do
		it "acceder al metodo de Nombre" do
			expect(@a4.Nombre).to eq("Huevos")
		end
		it "acceder al metodo GEI" do
			expect(@a4.GEI).to eq(4.2)
		end
		it "acceder al metodo Terreno" do
			expect(@a4.Terreno).to eq(5.7)
		end
		it "acceder al metodo to_s" do
			expect(@a4.to_s).to eq("\tAlimento\t= Huevos\n\tProteinas\t= 13.0\n\tCarbohidratos\t= 1.1\n\tLipidos\t= 11.0\n\tGEI\t= 4.2\n\tTerreno\t= 5.7")
		end
		it "acceder al metodo de valor energetico" do
			expect(@a4.Valor_energetico).to eq(155.4)
		end

	end

	context "Hacer cálculos del impacto ambiental" do
		it "calcular el impacto ambiental de un hombre (GEI)" do
			
			result = (((@hombre[0].proteina * @hombre[0].gei)/1000) + ((@hombre[1].proteina * @hombre[1].gei)/1000) + ((@hombre[2].proteina * @hombre[2].gei)/1000))
			expect(result).to eq(1.2289999999999999)


		end
		it "calcular impacto ambiental de un hombre (Terreno)" do

			result = @hombre[0].terreno + @hombre[1].terreno +  @hombre[2].terreno
                        expect(result).to eq(173.79999999999998)
		end
		it "calcular el impacto ambiental de una mujer (GEI)" do

			result = (((@mujer[0].proteina * @mujer[0].gei)/1000) + ((@mujer[1].proteina * @mujer[1].gei)/1000) + ((@mujer[2].proteina * @mujer[2].gei)/1000))
			expect(result).to eq(0.0766)
		end
		it "calcular el impacto ambiental de una mujer (Terreno)" do

			result = @mujer[0].terreno +  @mujer[1].terreno +  @mujer[2].terreno
			expect(result).to eq(15.8)
		end

	end


#----------------------------------------------------------------------------------------------------------------------------------
#COMPARBLES	

	context "Instancias Comparables" do

		it "Mayor" do
			expect(@a15 > @a11).to eq(true)
			expect(@a9 > @a7).to eq(false)
		end
		it "Menor" do
			expect(@a1 < @a3).to eq(true)
			expect(@a14 < @a9).to eq(false)
		end
		it "Igual" do
			expect(@a8 == @a10).to eq(false)
			
			huevos = Alimentos.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
			expect(@a4 == huevos).to eq(true)
		end
		it "menor igual" do
			expect(@a1 <= @a3).to eq(true)
		end
		it "mayor igual" do
			expect(@a15 >= @a4).to eq(true)
		end
		it "between" do
			expect(@a10.between?(@a9, @a15)).to eq(true)
			expect(@a15.between?(@a4, @a2)).to eq(false)
		end

	end
                         

end



#--------------------------------------------------------------------------------------------------------------------------------------------
# PRUEBAS DE DOUBLY LINKED LISTS

describe List do

	before :all do


		 @a1 = Alimentos.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
                @a2 = Alimentos.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
                @a3 = Alimentos.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
                @a4 = Alimentos.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
                @a5 = Alimentos.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.4)

		@a6 = Alimentos.new("Salmon", 19.9, 0.0, 13.6, 6.0, 3.7)
		@a7 = Alimentos.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)
                @a8 = Alimentos.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
                @a9 = Alimentos.new("Cafe", 0.1, 0.0, 0.0, 0.4, 0.3)
                @a10 = Alimentos.new("Camarones", 17.6, 1.5, 0.6, 18.0, 2.0)
                @a11 = Alimentos.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
                @a12 = Alimentos.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
                @a13 = Alimentos.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
                @a14 = Alimentos.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
                @a15 = Alimentos.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)



		@n1 = Node.new(@a1, nil, nil)
		@n2 = Node.new(@a2, nil, nil)
		@n3 = Node.new(@a3, nil, nil)
		@n4 = Node.new(@n4, nil, nil)
		@n5 = Node.new(@n5, nil, nil)
		@n6 = Node.new(@n6, nil, nil)

		@l1 = List.new()
		@l2 = List.new()

		@l2.Insert_tail("nodo1")
		@l2.Insert_tail("nodo2")
		@l2.Insert_tail("nodo3")

		@espanola = List.new()
		@vasca = List.new()
		@vegetaria = List.new()
		@vegetaliana = List.new()
		@locura = List.new()



	end


	context "Comprobar lista y nodo" do
		it "lista 1 esta vacia" do
			expect(@l1.head).to eq(nil)
			expect(@l1.tail).to eq(nil)
			expect(@l1.size).to eq(0)
		end
		it "comprobar nodo" do
			@node = Node.new(@a6, @a5, @a2)

			expect(@node.value).to eq(@a6)
			expect(@node.next).to eq(@a5)
			expect(@node.prev).to eq(@a2)
		end



	end

	context "Comprobar metodos" do

		it "insertar elemento en head" do
			@l1.Insert_head(@n1)
                        @l1.Insert_head(@n2)

                	@l1.Insert_head(@n3)
                	@l1.Insert_head(@n4)

			expect(@l1.Head).to eq(@n4)
			expect(@l1.Tail).to eq(@n1)
			expect(@l1.head.next.value).to eq(@n3)
			expect(@l1.head.prev).to eq(nil)
			expect(@l1.size).to eq(4)
		end
		it "insertar en tail" do

			@l1.Insert_tail(@n5)

			expect(@l1.Head).to eq(@n4)
			expect(@l1.Tail).to eq(@n5)
			expect(@l1.tail.next).to eq(nil)
			expect(@l1.tail.prev.value).to eq(@n1)
			expect(@l1.size).to eq(5)
		end
		it "insertar elementos en head" do
			a = [@n6, @n3, @n4]



			@l1.Insert_elements_head(a)

			expect(@l1.head.value).to eq(@n4)
			expect(@l1.head.next.value).to eq(@n3)
			expect(@l1.tail.value).to eq(@n5)
			expect(@l1.size).to eq(8)
		end
		it "insertar elementos en tail" do
			a = [@n1, @n5, @n2]

                        @l1.Insert_elements_tail(a)

			expect(@l1.head.value).to eq(@n4)
			expect(@l1.tail.prev.value).to eq(@n5)
			expect(@l1.tail.value).to eq(@n2)
			expect(@l1.size).to eq(11)

		end
		it "eliminar head" do


			expect(@l1.head.value).to eq(@n4)

			@l1.Remove_head

			expect(@l1.head.value).to eq(@n3)
			expect(@l1.head.prev).to eq(nil)

			expect(@l1.size).to eq(10)
		end
		it "eliminar tail" do


			expect(@l1.tail.value).to eq(@n2)

                        @l1.Remove_tail

			expect(@l1.tail.value).to eq(@n5)
			expect(@l1.tail.next).to eq(nil)

			expect(@l1.size).to eq(9)
		end
		it "eliminar todos elementos" do


			expect(@l1.head.value).to eq(@n3)
			expect(@l1.tail.value).to eq(@n5)

			@l1.Remove_all

			expect(@l1.head).to eq(nil)

			expect(@l1.Is_Empty).to eq(true)
		end


	end

	context "Dietas" do
		it "Española" do
			@espanola.Insert_tail(@a15)
			@espanola.Insert_tail(@a4)
			@espanola.Insert_tail(@a3)
			@espanola.Insert_tail(@a13)



			@Terreno = @espanola.head.value.terreno + @espanola.head.next.value.terreno + @espanola.tail.value.terreno + @espanola.tail.prev.value.terreno

			@GEI = (@espanola.head.value.gei + @espanola.head.next.value.gei + @espanola.tail.value.gei + @espanola.tail.prev.value.gei).round(2)


			expect(@Terreno).to eq(12.72)

			#Diario
			expect(@GEI).to eq(7.14)

			#Anual
			expect(@GEI*365).to eq(2606.1)
		end
		it "Vasca" do
                        @vasca.Insert_tail(@a15)

                        @vasca.Insert_tail(@a3)
                        @vasca.Insert_tail(@a13)



                        @Terreno = @vasca.head.value.terreno + @vasca.head.next.value.terreno + @vasca.tail.value.terreno

                        @GEI = (@vasca.head.value.gei + @vasca.head.next.value.gei + @vasca.tail.value.gei ).round(2)


			expect(@Terreno).to eq(7.02)

                        #Diario
			expect(@GEI).to eq(2.94)

                        #Anual
			expect(@GEI*365).to eq(1073.1)
		end

		it "vegetaria" do
                        @vegetaria.Insert_tail(@a15)
                        @vegetaria.Insert_tail(@a14)
                        @vegetaria.Insert_tail(@a8)
                        @vegetaria.Insert_tail(@a4)

			@Terreno = @vegetaria.head.value.terreno + @vegetaria.head.next.value.terreno + @vegetaria.tail.value.terreno + @vegetaria.tail.prev.value.terreno

                        @GEI = (@vegetaria.head.value.gei + @vegetaria.head.next.value.gei + @vegetaria.tail.value.gei + @vegetaria.tail.prev.value.gei).round(2)




			expect(@Terreno).to eq(20.2)

                        #Diario
			expect(@GEI).to eq(9.8)

                        #Anual
			expect((@GEI*365).round(2)).to eq(3577)
		end
		it "vegetaliana" do
                        @vegetaliana.Insert_tail(@a15)
                        @vegetaliana.Insert_tail(@a9)

                        @vegetaliana.Insert_tail(@a12)
                        @vegetaliana.Insert_tail(@a8)

			@Terreno = @vegetaliana.head.value.terreno + @vegetaliana.head.next.value.terreno + @vegetaliana.tail.value.terreno + @vegetaliana.tail.prev.value.terreno

                        @GEI = (@vegetaliana.head.value.gei + @vegetaliana.head.next.value.gei + @vegetaliana.tail.value.gei + @vegetaliana.tail.prev.value.gei).round(2)



                        expect(@Terreno).to eq(46.9)

                        #Diario
                        expect(@GEI).to eq(13.8)

                        #Anual
                        expect(@GEI*365).to eq(5037)
		end
		it "locura" do
                        @locura.Insert_tail(@a2)

                        @locura.Insert_tail(@a5)
                        @locura.Insert_tail(@a9)

			@Terreno = @locura.head.value.terreno + @locura.head.next.value.terreno + @locura.tail.value.terreno

                        @GEI = (@locura.head.value.gei + @locura.head.next.value.gei + @locura.tail.value.gei ).round(2)



                        expect(@Terreno).to eq(171.8)

                        #Diario
                        expect(@GEI).to eq(56.1)

                        #Anual
                        expect(@GEI*365).to eq(20476.5)
		end

	end
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#ENUMERABLES

	context " prueba enumerable" do
		it " each " do
			result = ""
			@l2.each do |i|
				result +=  i + "\n" 
			end

			expect(result).to eq("nodo1\nnodo2\nnodo3\n")
		end
		it " sort" do

			@l1.Insert_tail(@a1)
			@l1.Insert_tail(@a2)
			@l1.Insert_tail(@a3)
			@l1.Insert_tail(@a4)




			expect(@l1.sort).to eq([@a2,@a4,@a1,@a3])
		end

		it "collect" do
			
			expect(@l1.collect{|i| i.name}).to eq(["Carne de cordero", "Pollo", "Chocolate", "Huevos"])
		end
		it "select" do
			expect(@l1.select{ |i| i.terreno.between?(5,100)}).to eq([@a2,@a4])
		end
		it "max" do
			expect(@l1.max).to eq(@a3)
		end
		it "min" do
			expect(@l1.min).to eq(@a2)
		end

 

	end



end











#---------------------------------------------------------------------------------------------------------------------------------------------------------------
#Pruebas de Clase Plato






describe Plato do
	before :all do


		 @a1 = Alimentos.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
                @a2 = Alimentos.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
                @a3 = Alimentos.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
                @a4 = Alimentos.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
                @a5 = Alimentos.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.4)

                @a6 = Alimentos.new("Salmon", 19.9, 0.0, 13.6, 6.0, 3.7)
                @a7 = Alimentos.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)
                @a8 = Alimentos.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
                @a9 = Alimentos.new("Cafe", 0.1, 0.0, 0.0, 0.4, 0.3)
                @a10 = Alimentos.new("Camarones", 17.6, 1.5, 0.6, 18.0, 2.0)
                @a11 = Alimentos.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
                @a12 = Alimentos.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
                @a13 = Alimentos.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
                @a14 = Alimentos.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
                @a15 = Alimentos.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)


		@list = List.new()
		

		@list.Insert_head(@a2)
		@list.Insert_head(@a3)
		@list.Insert_head(@a4)
		@gr = List.new()
		@gr.Insert_head(70.0)
		@gr.Insert_head(15.0)
		@gr.Insert_head(35.0)

		@p = List.new()
		@l = List.new()
		@c = List.new()
		@g = List.new()
		@t = List.new()
	
		@names = List.new()
		n = @list.head

		while !n.nil?
			
			@p.Insert_head(n.value.proteina)
			@l.Insert_head(n.value.lipidos)
			@c.Insert_head(n.value.carbohidratos)
			@names.Insert_head(n.value.name)
			@g.Insert_head(n.value.gei)
			@t.Insert_head(n.value.terreno)

			n = n.next
			
			
		end

		@p1 = Plato.new("Plato1", @names, @gr, @p, @l, @c)

		@plato_herencia = Plato_herencia.new("Plato2", @names, @gr, @p, @l, @c, @g, @t)

		@li = List.new()

                @li.Insert_head(@a7)
                @li.Insert_head(@a6)
                @li.Insert_head(@a1)
		@gra = List.new()
		@gra.Insert_head(80.0)
		@gra.Insert_head(10.0)
		@gra.Insert_head(35.0)

                @pr = List.new()
                @li = List.new()
                @ca = List.new()
                @ge = List.new()
                @te = List.new()

                @na = List.new()
                n = @li.head
		

                while !n.nil?
                        @pr.Insert_head(n.value.proteina)
                        @li.Insert_head(n.value.lipidos)
                        @ca.Insert_head(n.value.carbohidratos)
                        @na.Insert_head(n.value.name)
                        @ge.Insert_head(n.value.gei)
                        @te.Insert_head(n.value.terreno)

                        n = n.next
		

                end



                @p_h = Plato_herencia.new("Plato3", @na, @gra, @pr, @li, @ca, @ge, @te)

		@espanola = List.new()

                @espanola.Insert_head(@a15)
                @espanola.Insert_head(@a4)
                @espanola.Insert_head(@a3)
  		@espanola.Insert_head(@a13)
		@gr1 = List.new()
		@gr1.Insert_head(70.0)
		@gr1.Insert_head(20.0)
		@gr1.Insert_head(35.0)
		@gr1.Insert_head(55.0)

		@pr1= List.new()
                @l1 = List.new()
                @c1 = List.new()

                @n1 = List.new()
                n = @espanola.head
		
                while !n.nil?
                        @pr1.Insert_head(n.value.proteina)
                        @l1.Insert_head(n.value.lipidos)
                        @c1.Insert_head(n.value.carbohidratos)
                        @n1.Insert_head(n.value.name)
                        n = n.next
                end
                @esp = Plato.new("Espanola", @n1, @gr1, @pr1, @l1, @c1)

		@vasca = List.new()

                @vasca.Insert_head(@a15)
                @vasca.Insert_head(@a3)
                @vasca.Insert_head(@a13)
		@gr2 = List.new()
		@gr2.Insert_head(70.0)
		@gr2.Insert_head(10.0)
		@gr2.Insert_head(45.0)

                @p2= List.new()
                @l2 = List.new()
                @c2 = List.new()

                @n2 = List.new()
                n = @vasca.head
		
                while !n.nil?
                        @p2.Insert_head(n.value.proteina)
                        @l2.Insert_head(n.value.lipidos)
                        @c2.Insert_head(n.value.carbohidratos)
                        @n2.Insert_head(n.value.name)
                        n = n.next
			
                end
                @vas = Plato.new("Vasca", @n2, @gr2, @p2, @l2, @c2)

		@vegetaria = List.new()

                @vegetaria.Insert_head(@a15)
                @vegetaria.Insert_head(@a3)
                @vegetaria.Insert_head(@a13)
		@gr3 = List.new()
		@gr3.Insert_head(70.0)
		@gr3.Insert_head(10.0)
		@gr3.Insert_head(35.0)

                @p3= List.new()
                @l3 = List.new()
                @c3 = List.new()

                @n3 = List.new()
                n = @vegetaria.head
	
                while !n.nil?
                        @p3.Insert_head(n.value.proteina)
                        @l3.Insert_head(n.value.lipidos)
                        @c3.Insert_head(n.value.carbohidratos)
                        @n3.Insert_head(n.value.name)
                        n = n.next
			
                end
                @vegetar = Plato.new("Vegetaria", @n3, @gr3, @p3, @l3, @c3)

		@vegetaliana = List.new()

                @vegetaliana.Insert_head(@a15)
                @vegetaliana.Insert_head(@a9)
                @vegetaliana.Insert_head(@a12)
		@vegetaliana.Insert_head(@a8)
		@gr4 = List.new()
		@gr4.Insert_head(70.0)
		@gr4.Insert_head(10.0)
		@gr4.Insert_head(35.0)
		@gr4.Insert_head(55.0)

                @p4= List.new()
                @l4 = List.new()
                @c4 = List.new()

                @n4 = List.new()
                n = @vegetaliana.head
		
                while !n.nil?
                        @p4.Insert_head(n.value.proteina)
                        @l4.Insert_head(n.value.lipidos)
                        @c4.Insert_head(n.value.carbohidratos)
                        @n4.Insert_head(n.value.name)
                        n = n.next
	
                end
                @vegetal = Plato.new("Vegetaliana", @n4, @gr4, @p4, @l4, @c4)


		@locura = List.new()

                @locura.Insert_head(@a15)
                @locura.Insert_head(@a9)
                @locura.Insert_head(@a12)
		@locura.Insert_head(@a8)
		@gr5 = List.new()
		@gr5.Insert_head(70.0)
		@gr5.Insert_head(10.0)
		@gr5.Insert_head(35.0)
		@gr5.Insert_head(55.0)

                @p5= List.new()
                @l5 = List.new()
                @c5 = List.new()

                @n5 = List.new()
                n = @locura.head
		
                while !n.nil?
                        @p5.Insert_head(n.value.proteina)
                        @l5.Insert_head(n.value.lipidos)
                        @c5.Insert_head(n.value.carbohidratos)
                        @n5.Insert_head(n.value.name)
                        n = n.next
			
                end
                @loc = Plato.new("Locura para el Carne", @n5, @gr5, @p5, @l5, @c5)

		@lista_platos = List.new()
		@lista_platos.Insert_head(@esp)
		@lista_platos.Insert_head(@vas)
		@lista_platos.Insert_head(@vegetar)
		@lista_platos.Insert_head(@vegetal)
		@lista_platos.Insert_head(@loc)
	end




	context "expectativas de un plato" do
		it "nombre de plato" do
			expect(@p1.name).to eq("Plato1")
		end
		it "metodo de nombre" do
			expect(@p1.Name).to eq("Plato1")
		end
		it "metodo proteinas" do
			expect(@p1.Proteinas).to eq(68.42)
		end
		it "metodo lipidos" do
			expect(@p1.Lipidos).to eq(127.44)
		end
		it "metodo carbohidratos" do
			expect(@p1.Carbohidratos).to eq(31.28)
		end
		it "metodo VCT" do
			expect(@p1.VCT).to eq(227.14)
		end
		it "porcentaje proteinas" do
			expect(@p1.Porcentaje_prot).to eq(30.12)
		end
		it "porcentaje lipidos" do
			expect(@p1.Porcentaje_lip).to eq(56.11)
		end
		it "porcentaje carbohidratos" do
			expect(@p1.Porcentaje_carb).to eq(13.77)
		end
		it "metodo gramos de total de todos alimentos" do
			expect(@p1.Gramos).to eq(120.0)
		end
		it "metodo de gramos total de proteinas" do
			expect(@p1.Gramos_prot).to eq(17.1)
		end
		it "metodo de gramos total de lipidos" do
			expect(@p1.Gramos_lip).to eq(14.16)
		end
		it "metodo de gramos total de carbohidratos" do
			expect(@p1.Gramos_carb).to eq(7.82)
		end
		it "metodo de alimentos del plato" do
			expect(@p1.Alimentos).to eq("Pollo, Chocolate, Huevos, ")
		end
		it " metodo to_s" do
			expect(@p1.to_s).to eq("\tPlato: Plato1\nAlimentos: Pollo, Chocolate, Huevos, \nPorcentaje Proteinas: 30.12\nPorcentaje Lipidos: 56.11\nPorcentaje Cerbohidratos: 13.77\nKcal total: 227.14")
		end

	end

	context " Plato clase heredada" do
		it "metodo gei" do
			expect(@plato_herencia.GEI_total).to eq(5.28)
		end
		it "metodo terreno" do
			expect(@plato_herencia.Terreno_total).to eq(6.99)
		end
		it "metodo to_s" do
			expect(@plato_herencia.to_s).to eq("( \tPlato: Plato2\nAlimentos: Pollo, Chocolate, Huevos, \nPorcentaje Proteinas: 30.12\nPorcentaje Lipidos: 56.11\nPorcentaje Cerbohidratos: 13.77\nKcal total: 227.14\nGei Total: 5.28\nTerreno Total: 6.99 )")
		end
	end

	context "Pruebas para comprobar jerarquia" do
		it "comprobar clase de un objeto" do
			expect(@p1).to be_an_instance_of(Plato)
			expect(@plato_herencia).to be_an_instance_of(Plato_herencia)
			
		end
		it  "comprobar tipo de objeto" do
			expect(@p1.respond_to?('Porcentaje_prot')).to eq(true)
			expect(@p1.respond_to?('GEI_total')).to eq(false)
			expect(@plato_herencia.respond_to?('GEI_total')).to eq(true)
			expect(@plato_herenia.respond_to?('VCT')).to eq(false)
		end
		it "jerarquia de clase" do
			expect(@p1.is_a?(BasicObject)).to eq(true)
			expect(@p1.is_a?(Object)).to eq(true)
			expect(@plato_herencia.is_a?(BasicObject)).to eq(true)
			expect(@plato_herencia.is_a?(Object)).to eq(true)



		end
		it "superclass" do
			expect(Plato_herencia.superclass).to eq(Plato)
		end
	end



	context "Comparables para jerarquia de clases" do

		it "mayor" do
			expect(@plato_herencia > @p_h).to eq(true)
		end
		it "menor" do
			expect(@p_h < @plato_herencia).to eq(true)
			expect(@p_h > @plato_herencia).to eq(false)
		end
		it "igual" do
			p_h2 = Plato_herencia.new("Plato3", @na, @gra, @pr, @li, @ca, @ge, @te)
			expect(@p_h == p_h2).to eq(true)
		end
#------------------------------------------------------------------------------------------------------------------
#COMPARABLES

	end

	context " Trabajar con platos de cinco dietas" do
		it "mayor" do
			expect(@esp > @vas).to eq(true)
			expect(@vegetal > @loc).to eq(false)
		end
		it "menor" do
			expect(@vegetal < @vegetar).to be(false)
			expect(@loc < @esp).to be(true)
		end
		it "igual" do
			expect(@vegetal == @vegetar).to eq(false)
			expect(@loc == @vas).to be(false)
		end
		it " menos igual" do
			expect(@vegetal <= @esp).to eq(true)
		end
		it "mayor igual" do
			expect(@esp >= @loc).to eq(true)
		end

	end

#----------------------------------------------------------------------------------------------------------------------
#ENUMERABLES

	context "enumerar lista de platos" do
		it "sort" do
			expect(@lista_platos.sort).to eq([@vegetar,@vas,@loc,@vegetal,@esp])
		end
		it "collect" do
			expect(@lista_platos.collect{|i| i.name}).to eq(["Locura para el Carne", "Vegetaliana", "Vegetaria", "Vasca", "Espanola"])
		end
		it " select" do
			expect(@lista_platos.select{ |i| i.Gramos.between?(100,165)}).to eq([@vegetar,@vas])
		end
		it "max" do
			expect(@lista_platos.max).to eq(@esp)
		end
		it "min" do
			expect(@lista_platos.min).to eq(@vegetar)
		end
	end


end


