Proceso trabajoIntegrador
    Definir usuario, contrasena Como Caracter;
	Definir usuarioCorrecto, contrasenaCorrecta Como Caracter;
    Definir logueado Como Logico;
    Definir tipoHamburguesa Como Entero;
	Definir hamburguesa Como Real;
    Definir extraCarne, papas, gaseosa Como Caracter;
    Definir total, descuento, tiempoEspera Como Real;
    Definir ticket Como Caracter;
    
    // Variables de usuario y contrase�a para login
    usuarioCorrecto <- "admin";
    contrasenaCorrecta <- "1234";
    
    logueado <- Falso;
    total <- 0;
    descuento <- 0.1; // 10% de descuento para usuarios logueados
    tiempoEspera <- 10; // Tiempo de espera en minutos base
	
    // Proceso de Login
    Escribir "Bienvenido a la Tienda de Comidas R�pidas";
    Escribir "Ingrese su nombre de usuario: ";
    Leer usuario;
    Escribir "Ingrese su contrase�a: ";
    Leer contrasena;
    
    Si usuario = usuarioCorrecto y contrasena = contrasenaCorrecta Entonces
        logueado <- Verdadero;
        Escribir "Login exitoso. Usted recibir� un descuento del 10%.";
    SiNo
        Escribir "Login fallido. No recibir� descuento.";
    FinSi
	
    // Mostrar Men�
    Escribir "Men�:";
    Escribir "1. Hamburguesa Cl�sica - $500.00";
    Escribir "2. Hamburguesa con Queso - $1000.00";
    Escribir "3. Hamburguesa Doble - $1500";
    Escribir "Seleccione el tipo de hamburguesa (1-3):";
    // podriamos a�adir combos y en caso de que selecione un combo se descarta los adicionales
	Repetir
		Leer tipoHamburguesa; // guarda que crashea si le pas�s un string jaja
		Segun tipoHamburguesa Hacer
			1:  
				hamburguesa <- 500;
				total <- total + 500;
				tiempoEspera <- tiempoEspera + 2;
			2:
				hamburguesa <- 1000;
				total <- total + 1000;
				tiempoEspera <- tiempoEspera + 3;
			3:
				hamburguesa <- 1500;
				total <- total + 1500;
				tiempoEspera <- tiempoEspera + 4;
			De Otro Modo:
				Escribir "Selecci�n inv�lida. Intente nuevamente.";
		FinSegun
	Hasta Que tipoHamburguesa == 1 o tipoHamburguesa == 2 o tipoHamburguesa == 3
	
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
	
	// Generar ticket
	ticket <- "----- Ticket de Compra -----      ";
	ticket <- concatenar(ticket, "Hamburguesa: $ ");
	ticket <- concatenar(ticket, ConvertirATexto(hamburguesa));
	
	Si extraCarne = 'S' o extraCarne = 's' Entonces
		ticket <- concatenar(ticket," + Carne extra: $500");
	FinSi
	
	Si papas = 'S' o papas = 's' Entonces
		ticket <- concatenar(ticket," + Papas fritas: $250");
	FinSi
	
	Si gaseosa = 'S' o gaseosa = 's' Entonces
		ticket <- concatenar(ticket," + Gaseosa: $1000");
	FinSi
	
	// Aplicar descuento si est� logueado
	Si logueado = Verdadero Entonces
		ticket <- concatenar(ticket, " --> Total: $");
		ticket <- concatenar(ticket, ConvertirATexto(total));
		total <- total * (1 - descuento);
		ticket <- concatenar(ticket, " + Descuento del 10% --> Total: $");
		ticket <- concatenar(ticket, ConvertirATexto(total));

	SiNo
		ticket <- concatenar(ticket," --> Total: $");
		ticket <- concatenar(ticket,ConvertirATexto(total));
	FinSi
	
	ticket <- concatenar(ticket, "     Tiempo de espera: ");
	ticket <- concatenar(ticket, ConvertirATexto(tiempoEspera));
	ticket <- concatenar(ticket, " minutos");
	ticket <- concatenar(ticket, "---------------------------");
	
	// Mostrar ticket
	Escribir ticket;
FinProceso


// Tareas a realizar
// 1_ Crear un bucle en el caso que se elija mal la hamburguesa [LISTO, ver bug]
// 2_ Crear un array con clientes
// 3_ Ver la l�gica en el adicional de extra carne cuando se eligi� hamburguesa doble
// 4_ A�adir l�gica de precios en tipos de papas
// 5_ A�adir l�gica de precios en tipos de gaseosa
// 6_ Refactorizar el c�digo --> Final

