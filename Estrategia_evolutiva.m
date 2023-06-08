clc,clear;
g =  menu('Defina Caso de Evoluación','Caso 1:Hijo reemplaza al peor padre','Caso 2:Sobreviven los mejores entres los padres e hijos','Caso 3:Selección entre hijos');
switch g
    case 1
        tic
        %Parametros
        n = input('Ingrese numero de individuos:');   %numero de elementos de la poblacion (1000)
        genes = input('Ingrese numero de genes:');  %numero de genes (1)
        mutacion_chance = input('Ingrese porcentaje de mutación:');     %porcentaje de mutacion (0.15)
        mutacion_SD = input('Ingrese desviación estandar:');        %desviacion estandar de la poblacion (5)
        divisor = input('Ingrese divisor:');          %divisor (1000)
        genera = input('Ingrese generacion:');         %generación limite (70)
        salida = 0.9999999;         %parametro de salida
        %optimo: 95.823793608465
        
        toc
    case 2
        tic
        %Parametros
        n = input('Ingrese numero de individuos:');   %numero de elementos de la poblacion (1000)
        genes = input('Ingrese numero de genes:');  %numero de genes (1)
        mutacion_chance = input('Ingrese porcentaje de mutación:');     %porcentaje de mutacion (0.15)
        mutacion_SD = input('Ingrese desviación estandar:');        %desviacion estandar de la poblacion (5)
        divisor = input('Ingrese divisor:');          %divisor (1000)
        genera = input('Ingrese generacion:');         %generación limite (70)
        salida = 0.9999999;         %parametro de salida
        %optimo: 95.823793608465
        
        toc
    case 3
        tic    %inicio de cronometro

        %Parametros
        n = input('Ingrese numero de individuos:');   %numero de elementos de la poblacion (1000)
        genes = input('Ingrese numero de genes:');  %numero de genes (1)
        mutacion_chance = input('Ingrese porcentaje de mutación:');     %porcentaje de mutacion (0.15)
        mutacion_SD = input('Ingrese desviación estandar:');        %desviacion estandar de la poblacion (5)
        divisor = input('Ingrese divisor:');          %divisor (1000)
        genera = input('Ingrese generacion:');         %generación limite (70)
        salida = 0.9999999;         %parametro de salida
        %optimo: 95.823793608465

         %Algoritmo
         %ecuacion = y = x*sin(x)
         rango = [0,100];

         %Poblacion inicial
         poblacion = randi([0,100],1,n);
       

         for generacion = 1:1:genera

             %Fitnes
             for i = 1:1:n
                 fitness(1,i)= poblacion(i)*sin(poblacion(i));
             end

             %Maximo
             [r,s] = max(fitness);
             gana(generacion,1) = poblacion(s);
             gana(generacion,2) = r;

             %Seleccion
             %Mating pool number
             menor = min(fitness); %valor menor
             fs = abs(menor) + 1; %factor de suma
             exponente = 1 + generacion/divisor;

             for i = 1:1:n
                 suma(1,i) = fitness(1,i) + fs;
                 elevado(1,i) = suma(1,i)^exponente;
                 multired(1,i) = round(100*elevado(1,i));
                 matingPoolNumb(1,i) = round(multired(1,i)/3);

             end 
             sum_mating_pool = (sum(matingPoolNumb));
             if sum_mating_pool>10000
                 matingPoolNumb/3;
                 sum_mating_pool = (sum(matingPoolNumb));
             end
             i = 1;
             j = 1;
             aux = 1;
             while aux < sum_mating_pool
                 for j = 1:1:matingPoolNumb(1,i)
                     matingPool(1,aux) = poblacion(1,i);
                     aux = aux + 1;
                 end
                 i = i + 1;
             end

             %Seleccion
             for t = 1:1:n
                 padres = rand(1,2);
                 padre1 = matingPool(1,round(padres(1)*sum_mating_pool));
                 padre2 = matingPool(1,round(padres(2)*sum_mating_pool));

                 %Mezcla
                 media = ((padre1 + padre2)/2);
                 desv = 0.05*media;
                 i = round(rand());
                 if (i == 0)  %si es cero es negativo
                     desv = - desv;
                 end
                 hijo = media + desv;

                 %Mutación
                 mutar = round(mutacion_chance*n);
                 j = 1;
                 if j <= mutar
                     i = round(rand());  %para ver si muta
                     if i == 0  % si es cero muta
                         desv = rand*5;
                         i = round(rand());
                         if i == 0      %si es cero es negativo
                             desv = -desv;
                         end
                         hijo = hijo + desv;
                     end
                     j = j +1;
                 end

                 %Correción
                 if hijo < 0
                     hijo = 0;
                 end
                 if hijo > 100
                     hijo = 100;
                 end
                 hijos(1,t) = hijo;
             end
             poblacion = hijos;
         end

         %Grafica
         x = 1:1:genera;
         plot(x,gana)
        toc   %final de cronometro
             
end
     