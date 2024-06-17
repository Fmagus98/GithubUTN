Proceso trabajoIntegrador
    Definir usuario, contrasena Como Caracter;
	Definir usuarioCorrecto, contrasenaCorrecta Como Caracter;
	Definir usuarioItem, contrasenaItem Como Caracter;
	Dimension usuarioItem[2],contrasenaItem[2];
    Definir logueado Como Logico;
	
	Definir hamburguesa Como Real;
	Definir nroItem, nombres Como Caracter;
	Definir precios, tiempos Como Real;
	Definir i, tipo, n Como Entero;
	Dimension nroItem[3], nombres[3], precios[3], tiempos[3];
    
	Definir tipoHamburguesa, extraCarne, papas, gaseosa Como Caracter;
    Definir total, descuento, tiempoEspera Como Real;
    Definir ticket Como Caracter;
	
	//Definimos las variables para utilizar en el historial de compras del usuario
	Definir historial Como Cadena;
	Dimension  historial[100];
	Definir indiceHistorial Como Entero;
	Definir compra Como Cadena;
	Definir verHistorial Como Caracter;
    
	//Usuarios Precargados
	usuarioItem[0] <- "admin";
    contrasenaItem[0] <- "1234";
	
	usuarioItem[1] <- "user";
    contrasenaItem[1] <- "4321";
    
	
    logueado <- Falso;
    total <- 0;
    descuento <- 0.1; // 10% de descuento para usuarios logueados
    tiempoEspera <- 10; // Tiempo de espera en minutos base
	
	//Inicializamos el historial 
	indiceHistorial <- 0;
	
    // Proceso de Login
    Escribir "Bienvenido a la Tienda de Comidas R�pidas";
    Escribir "Ingrese su nombre de usuario: ";
    Leer usuario;
    Escribir "Ingrese su contrase�a: ";
    Leer contrasena;
    n <- 0;
	
	Mientras n < 2 y logueado == Falso Hacer
		Si usuario = usuarioItem[n] y contrasena = contrasenaItem[n] Entonces
			logueado <- Verdadero;
		FinSi
		n <- n + 1;
	FinMientras
	
	Si logueado Entonces
		Escribir "Login exitoso. Usted recibir� un descuento del 10%.";
	SiNo
		Escribir "Login fallido. No recibir� descuento.";
	FinSi
		
    // Inicializamos el men�; esto funciona a modo de Diccionario
    nroItem[0] <- "1. ";
	nombres[0] <- "Hamburguesa Simple";
    precios[0] <- 500;
    tiempos[0] <- 2;
	
	nroItem[1] <- "2. ";
    nombres[1] <- "Hamburguesa Doble";
    precios[1] <- 1000;
    tiempos[1] <- 3;
	
	nroItem[2] <- "3. ";
    nombres[2] <- "Hamburguesa Triple";
    precios[2] <- 1500;
    tiempos[2] <- 4;

    // Mostrar Men�
	Escribir "Men�:";
    Para i <- 0 Hasta 2 Hacer
        Escribir nroItem[i], nombres[i], " - $", precios[i];
    FinPara
    Escribir "Seleccione el tipo de hamburguesa (1-3):";
    
    // Selecci�n del tipo de hamburguesa
    Repetir
        Leer tipoHamburguesa;
        Si tipoHamburguesa >= "1" y tipoHamburguesa <= "3" Entonces
            tipo <- ConvertirANumero(tipoHamburguesa) - 1;
            hamburguesa <- precios[tipo];
            total <- total + precios[tipo];
            tiempoEspera <- tiempoEspera + tiempos[tipo];
        Sino
            Escribir "Selecci�n inv�lida. Intente nuevamente.";
        FinSi
    Hasta Que tipoHamburguesa >= "1" y tipoHamburguesa <= "3"
  
	// Opciones adicionales
	Escribir "�Desea carne extra? (S/N) --> $500: ";
	Leer extraCarne;
	
	Si extraCarne = 'S' o extraCarne = 's' Entonces
		total <- total + 500;
		tiempoEspera <- tiempoEspera + 3;
		// en el caso de que elija hamburguesa doble, ver que se le puede informar al usuario
	FinSi
	
	Escribir "�Desea papas fritas? (S/N) --> $250:";
	Leer papas;
	Si papas = 'S' o papas = 's' Entonces
		total <- total + 250;
		tiempoEspera <- tiempoEspera + 2;
		// a�adir tipos de papas
	FinSi
	
	Escribir "�Desea gaseosa? (S/N) --> $1000:";
	Leer gaseosa;
	Si gaseosa = 'S' o gaseosa = 's' Entonces
		total <- total + 1000;
		tiempoEspera <- tiempoEspera + 1;
		// a�adir tipos de gaseosas
	FinSi
	
	// Generar y mostrar ticket
	Escribir "------- Ticket de Compra -------";
	Escribir " ", nombres[tipo], ": $ ", ConvertirATexto(precios[tipo]);
	
	Si extraCarne = 'S' o extraCarne = 's' Entonces
		Escribir " + Carne extra: $ 500";
	FinSi
	
	Si papas = 'S' o papas = 's' Entonces
		Escribir " + Papas fritas: $ 250";
	FinSi
	
	Si gaseosa = 'S' o gaseosa = 's' Entonces
		Escribir " + Gaseosa: $ 1000";
	FinSi
	
	// Aplicar descuento si est� logueado
	Si logueado = Verdadero Entonces		
		total <- total * (1 - descuento);		
		Escribir "  + Descuento del 10% => Total: $ ", ConvertirATexto(total);

	SiNo
		Escribir " ...............................";
		Escribir " Total: $ ", ConvertirATexto(total);
	FinSi
	
	Escribir " Tiempo de espera: ", ConvertirATexto(tiempoEspera), " minutos";
	Escribir "--------------------------------";	
	
	//----------------------------------- Historial de compras del usuario -------------------------------------------
	// Guardamos la compra en el historial
	compra <- nombres[tipo];
    compra <- Concatenar(compra, " - $");
    compra <- Concatenar(compra, ConvertirATexto(precios[tipo]));
	
    Si extraCarne = 'S' o extraCarne = 's' Entonces
        compra <- Concatenar(compra, " + Carne extra: $500");
    FinSi
    Si papas = 'S' o papas = 's' Entonces
        compra <- Concatenar(compra, " + Papas fritas: $250");
    FinSi
    Si gaseosa = 'S' o gaseosa = 's' Entonces
        compra <- Concatenar(compra, " + Gaseosa: $1000");
    FinSi
    Si logueado = Verdadero Entonces        
        compra <- Concatenar(compra, " + Descuento del 10% => Total: $");
        compra <- Concatenar(compra, ConvertirATexto(total));
    SiNo
        compra <- Concatenar(compra, " Total: $");
        compra <- Concatenar(compra, ConvertirATexto(total));
    FinSi
	
    // A�adimos la compra al historial
    historial[indiceHistorial] <- compra;
    indiceHistorial <- indiceHistorial + 1;
	
    // Mostramos el historial de compras si el usuario lo desea
    Escribir "�Desea ver el historial de compras? (S/N): ";
    Leer verHistorial;
    Si verHistorial = 'S' o verHistorial = 's' Entonces
        Escribir "------- Historial de Compras -------";
        Para i <- 0 Hasta indiceHistorial - 1 Hacer
            Escribir historial[i];
        FinPara
        Escribir "-------------------------------------";
    FinSi
FinProceso


// Tareas a realizar:
// 1_ Crear un bucle en el caso que se elija mal la hamburguesa [LISTO]
// 2_ Crear un array con clientes [LISTO]
// 3_ Ver la l�gica en el adicional de extra carne cuando se eligi� hamburguesa doble
// 4_ A�adir l�gica de precios en tipos de papas
// 5_ A�adir l�gica de precios en tipos de gaseosa
// 6_ Refactorizar el c�digo --> Final [INICIADO]
// 7_ Se podr�a crear una funci�n para crear usuario
// 8_ Realizar un bucle para productos adicionales al introducir un dato no v�lido
// 9_ Crear funci�n de la compra de producto
// 10_ A�adir n� de ticket en cada compra (Bloqueado por punto 9) 
// 11_ Historial de compra del usuario.
// 12_ Informar al usuario el pedido --> tiempo de espera (utilizar funci�n esperar)
// 13_ Crear l�gica de compra en pesos(opcional)
// 14_ Compra con Tarjeta (Bloqueado por punto 13)


// Requisitos:
// 1_ Ciclos
// 2_ Condicionales
// 3_ Arreglos
// 4_ Matrices
// 5_ Funciones
// 6_ Recursividad (opcional)
// 7_ Video de presenracion 15' - 30'
