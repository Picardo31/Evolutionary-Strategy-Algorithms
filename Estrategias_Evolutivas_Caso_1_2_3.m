%Método de Estrategías Evolutivas
        g =  input('Caso 1:Hijo reemplaza al peor padre\nCaso 2:Sobreviven los mejores entres los padres e hijos\nCaso 3:Selección entre hijos:\n');
        switch g
            case 1
                tic
                %Parametros
                n = input('Ingrese numero de individuos:');   %numero de elementos de la poblacion (1000)
                muta = input('Ingrese porcentaje de mutación:');     %porcentaje de mutacion (0.15)
                deses = input('Ingrese desviación estandar:');        %desviacion estandar de la poblacion (5)
                div = input('Ingrese divisor:');          %divisor (1000)
                gene = input('Ingrese generacion:');         %generación limite (70)
                salida = 0.9999999;         %parametro de salida
                %optimo: 95.823793608465
                x0 = input('Ingrese limite inferior de muestra poblacional:');      %Limite de elección de valor de cada generación [0,100]
                x1 = input('Ingrese limite superior de muestra poblaciona:');
                np = 10000;     % numero de veces de poblacion
                po = randi([x0,x1],1,n);        %Poblacion inicial, elección de valor de cada generación
                for gz = 1:1:gene
                    %Fitnes
                    for i = 1:1:n
                        fit(1,i)= f(po(i));
                    end
                    %Maximo
                    [r,s] = max(fit);
                    valg(gz,1) = po(s);
                    valg(gz,2) = r;
                    %Seleccion
                    %Mating pool number
                    men = min(fit); %valor menor
                    fs = abs(men) + 1; %factor de suma
                    ex = 1 + gz/div;
                    for i = 1:1:n
                        suma(1,i) = fit(1,i) + fs;
                        elevado(1,i) = suma(1,i)^ex;
                        mult(1,i) = round(100*elevado(1,i));
                        MPN(1,i) = round(mult(1,i)/3);      %MatingPoolNumber
                    end 
                    sMPN = (sum(MPN));                  %Suma de matingpoolnumber
                    if sMPN > np                        %np,Limite de suma total
                        MPN/3;
                        sMPN = (sum(MPN));
                    end
                    i = 1;
                    j = 1;
                    aux = 1;
                    while aux < sMPN
                        for j = 1:1:MPN(1,i)
                            mP(1,aux) = po(1,i);       %MatingPool
                            aux = aux + 1;
                        end
                        i = i + 1;
                    end
                    %Seleccion
                    for t = 1:1:n
                        padres = rand(1,2);
                        padre11 = mP(1,round(padres(1)*sMPN));
                        padre22 = mP(1,round(padres(2)*sMPN));
                        %Mezcla
                        media = ((padre11 + padre22)/2);
                        desv = (deses/100)*media;
                        i = round(rand());
                        if (i == 0)  %si es cero es negativo
                            desv = - desv;
                        end
                        hijo = media + desv;
                        
                        %Mutación
                        mutar = round(muta*n);
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
                        if hijo < x0
                            hijo = x0;
                        end
                        if hijo > x1
                            hijo = x1;
                        end
                        
                        %Reemplazo del peor padre por hijo
                        if padre11 > padre22
                            padre22 = hijo;
                        else
                            padre11 = hijo;
                        end
                        hijos(1,t) = hijo;
                        padre1(1,t) = padre11;
                        padre2(1,t) = padre22;
                    end
                    if padre1(1,t) > padre2(1,t)
                        po = padre1;
                    else
                        po = padre2;
                    end
                end
                x = 1:1:gene;
                plot(x,valg)
                hold on
                grid on
                toc   %final de cronometro
                
            case 2
                tic
                %Parametros
                n = input('Ingrese numero de individuos:');   %numero de elementos de la poblacion (1000)
                muta = input('Ingrese porcentaje de mutación:');     %porcentaje de mutacion (0.15)
                deses = input('Ingrese desviación estandar:');        %desviacion estandar de la poblacion (5)
                div = input('Ingrese divisor:');          %divisor (1000)
                gene = input('Ingrese generacion:');         %generación limite (70)
                salida = 0.9999999;         %parametro de salida
                %optimo: 95.823793608465
                x0 = input('Ingrese limite inferior de muestra poblacional:');      %Limite de elección de valor de cada generación [0,100]
                x1 = input('Ingrese limite superior de muestra poblaciona:');
                np = 10000;     % numero de veces de poblacion
                po = randi([x0,x1],1,n);        %Poblacion inicial, elección de valor de cada generación
                for gz = 1:1:gene
                    %Fitnes
                    for i = 1:1:n
                        fit(1,i)= f(po(i));
                    end
                    %Maximo
                    [r,s] = max(fit);
                    valg(gz,1) = po(s);
                    valg(gz,2) = r;
                    %Seleccion
                    %Mating pool number
                    men = min(fit); %valor menor
                    fs = abs(men) + 1; %factor de suma
                    ex = 1 + gz/div;
                    for i = 1:1:n
                        suma(1,i) = fit(1,i) + fs;
                        elevado(1,i) = suma(1,i)^ex;
                        mult(1,i) = round(100*elevado(1,i));
                        MPN(1,i) = round(mult(1,i)/3);      %MatingPoolNumber
                    end 
                    sMPN = (sum(MPN));                  %Suma de matingpoolnumber
                    if sMPN > np                        %np,Limite de suma total
                        MPN/3;
                        sMPN = (sum(MPN));
                    end
                    i = 1;
                    j = 1;
                    aux = 1;
                    while aux < sMPN
                        for j = 1:1:MPN(1,i)
                            mP(1,aux) = po(1,i);       %MatingPool
                            aux = aux + 1;
                        end
                        i = i + 1;
                    end
                    %Seleccion
                    for t = 1:1:n
                        padres = rand(1,2);
                        padre11 = mP(1,round(padres(1)*sMPN));
                        padre22 = mP(1,round(padres(2)*sMPN));
                        %Mezcla
                        media = ((padre11 + padre22)/2);
                        desv = (deses/100)*media;
                        i = round(rand());
                        if (i == 0)  %si es cero es negativo
                            desv = - desv;
                        end
                        hijo = media + desv;
                        
                        %Mutación
                        mutar = round(muta*n);
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
                        if hijo < x0
                            hijo = x0;
                        end
                        if hijo > x1
                            hijo = x1;
                        end
                        %Pelea entre padres e hijos
                        if padre11 > padre22
                            if padre11 > hijo
                                sobrevv(1,t) = padre11;
                            end
                        end
                        if padre22 > padre11
                            if padre22 > hijo
                                sobrevv(1,t) = padre22;
                            end
                        end
                        if hijo > padre11
                            if hijo > padre22
                                sobrevv(1,t) = hijo;
                            end
                        end
                        
                        if padre11 > padre22
                            if padre11 < hijo && padre22 < hijo
                                sobrevv(1,t) = hijo;
                            end
                        end
                        if padre22 > padre11
                            if padre22 < hijo && padre11 < hijo
                                sobrevv(1,t) = hijo;
                            end
                        end
                        if hijo > padre11
                            if hijo < padre22 && padre11 < hijo
                                sobrevv(1,t) = padre22;
                            end
                        end
                        if hijo > padre22
                            if hijo < padre11
                                sobrevv(1,t) = padre11;
                            end
                        end
                        sobrev(1,t) = padre11;
                        if hijo > padre11
                            sobrev(1,t) = hijo;
                        end
                        
                    end
                    po = sobrev;
                end
                x = 1:1:gene;
                plot(x,valg)
                hold on
                grid on

                toc
            case 3
                tic    %inicio de cronometro
                %Parametros
                n = input('Ingrese numero de individuos:');   %numero de elementos de la poblacion (1000)
                muta = input('Ingrese porcentaje de mutación:');     %porcentaje de mutacion (0.15)
                deses = input('Ingrese desviación estandar:');        %desviacion estandar de la poblacion (5)
                div = input('Ingrese divisor:');          %divisor (1000)
                gene = input('Ingrese generacion:');         %generación limite (70)
                salida = 0.9999999;         %parametro de salida
                %optimo: 95.823793608465
                x0 = input('Ingrese limite inferior de muestra poblacional:');      %Limite de elección de valor de cada generación [0,100]
                x1 = input('Ingrese limite superior de muestra poblaciona:');
                np = 10000;     % numero de veces de poblacion
                po = randi([x0,x1],1,n);        %Poblacion inicial, elección de valor de cada generación
                for gz = 1:1:gene
                    %Fitnes
                    for i = 1:1:n
                        fit(1,i)= f(po(i));
                    end
                    %Maximo
                    [r,s] = max(fit);
                    valg(gz,1) = po(s);
                    valg(gz,2) = r;
                    %Seleccion
                    %Mating pool number
                    men = min(fit); %valor menor
                    fs = abs(men) + 1; %factor de suma
                    ex = 1 + gz/div;
                    for i = 1:1:n
                        suma(1,i) = fit(1,i) + fs;
                        elevado(1,i) = suma(1,i)^ex;
                        mult(1,i) = round(100*elevado(1,i));
                        MPN(1,i) = round(mult(1,i)/3);      %MatingPoolNumber
                    end 
                    mpnnn = (sum(MPN)); 
                    sMPN = (sum(MPN));                  %Suma de matingpoolnumber
                    if sMPN > np                        %np,Limite de suma total
                        MPN/3;
                        sMPN = (sum(MPN));
                    end
                    i = 1;
                    j = 1;
                    aux = 1;
                    while aux < sMPN
                        for j = 1:1:MPN(1,i)
                            mP(1,aux) = po(1,i);       %MatingPool
                            aux = aux + 1;
                        end
                        i = i + 1;
                    end
                    %Seleccion
                    for t = 1:1:n
                        padres = rand(1,2);
                        padre1 = mP(1,round(padres(1)*sMPN));
                        padre2 = mP(1,round(padres(2)*sMPN));
                        %Mezcla
                        media = ((padre1 + padre2)/2);
                        desv = (deses/100)*media;
                        i = round(rand());
                        if (i == 0)  %si es cero es negativo
                            desv = - desv;
                        end
                        hijo = media + desv;
                        %Mutación
                        mutar = round(muta*n);
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
                        if hijo < x0
                            hijo = x0;
                        end
                        if hijo > x1
                            hijo = x1;
                        end
                        hijos(1,t) = hijo;
                    end
                    po = hijos;
                end
                x = 1:1:gene;
                plot(x,valg)
                hold on
                grid on
                %syms x
                %ezplot(f(x),[-gene,gene])
                toc   %final de cronometro
        end
%-----------------------------------------------------------------------
function funcion = f(x)
   %funcion = x*sin(x); 
   funcion = (x^3) - 3*x + 2;
end