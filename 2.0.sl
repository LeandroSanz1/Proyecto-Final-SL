/*
visitas del Paciente
medicos tratantes
pacientes tratados por medico
pacientes tratados por ServicioMedico
es atendido por mas de 1 medico?
lista mensual de los honorarios
*/

const
    PP = 50

var
    i, nuevoid, IDBuscado, indicePaciente : numerico
    eleccion : numerico 
    siono : logico

    Pacientes : vector [PP] registro
{
	nombre : cadena
	id : numerico
	vecesenhospital : numerico
	direccion :cadena
	telefono : cadena
	medicotratante : cadena
}
	Medicos : vector [PP] registro
{
	id : numerico
	nombre : cadena
	honorario : numerico
	pacientespormes : numerico
	honorariostotal : numerico
	sm : cadena
}
	ServiciosMedicos : vector [PP] registro
{
	id : numerico
	nombre : cadena
	pacientessmpormes : numerico
}

inicio

//armar menu
cls()
	inicializacionMedicos()
    inicializacionServiciosMedicos()
    eleccion = 0
// menu 
//	1 - buscar paciente
//  2 - reporte Mensual
//		1	- visita del paciente
//		2	- Medicos tratantes por paciente 
//      3	- Veces por ServicioMedico
//      4	- pacientes mes por medico
//      5	- lista de honorarios
 
// mientras no se seleccione salir sigue ejecutandose 
	mientras (eleccion <> 9)
	{
    imprimir("1 - Buscar Paciente\n2 - Reporte Mensual\n")
    leer(eleccion)
    si (eleccion == 1)
    {
        imprimir("introduzca su id \n")
		leer (IDBuscado)
			indicePaciente = BuscaIDs (IDBuscado)
        si         (indicePaciente == 0)
        {
            CrearPaciente()
				sino
					imprimir(Pacientes[indicePaciente])
        }
		
        
    }
    si (eleccion == 2)
	// 3 = lista / 4 = lista
    {
		imprimir("1 - visitas del paciente\n2 - Medicos Tratantes Por Paciente\n3 - Pacientes Atendidos Por Servicio Medico\n4 - Pacientes Atendidos Por Medico\n5 - Lista De Honorarios\n")
		leer(eleccion)
		si (eleccion == 1)
		{
			visitasdelpaciente ()
		}
		si (eleccion == 2)
		{
			medicostratantes ()
		}
		si (eleccion == 3)
		{
			pacientestratadosporServicioMedico()
		}
		si (eleccion == 4)
		{
			pacientestratadosporServicioMedico ()
		}
		si (eleccion == 5)
		{
			listahonorarios()
		}
	}
	}

fin



subrutina inicializacionServiciosMedicos ()
inicio
ServiciosMedicos[1].id = 1
ServiciosMedicos[1].nombre = "Pediatria"

ServiciosMedicos[2].id = 2
ServiciosMedicos[2].nombre = "Traumatologia"

ServiciosMedicos[3].id = 3
ServiciosMedicos[3].nombre = "Neurologia"
fin

subrutina inicializacionMedicos()
	inicio
    Medicos[1].nombre = "Leandro Sanz"
	Medicos[1].id = 1
	Medicos[1].honorario = 400
	Medicos[1].pacientespormes = random(200)
	Medicos[1].sm = ServiciosMedicos[2].nombre


	Medicos[2].nombre = "Agustin carrocera"
	Medicos[2].id = 2
	Medicos[2].honorario = 430
	Medicos[2].pacientespormes = random(100)
	Medicos[2].sm = ServiciosMedicos[3].nombre


	Medicos[3].nombre = "valentin bakker"
	Medicos[3].id = 3
	Medicos[3].honorario = 420
	Medicos[3].pacientespormes = random(100)
	Medicos[3].sm = ServiciosMedicos[3].nombre


	Medicos[4].nombre = "Ginna galli"
	Medicos[4].id = 4
	Medicos[4].honorario = 360
	Medicos[4].pacientespormes = random(200)
	Medicos[4].sm = ServiciosMedicos[1].nombre


	Medicos[5].nombre = "Dante Jorgensen"
	Medicos[5].id = 5
	Medicos[5].honorario = 400
	Medicos[5].pacientespormes = random(200)
	Medicos[5].sm = ServiciosMedicos[1].nombre


    fin

subrutina visitasdelpaciente ()
	var
	i : numerico
	inicio
	desde i = 1 hasta PP
	{
		Pacientes[i].vecesenhospital = random(30)
		imprimir("introduzca el ID del paciente\n")
		leer(IDBuscado)
		BuscaIDs(IDBuscado)
		imprimir("Este paciente estuvo ", Pacientes[i].vecesenhospital, "veces este mes en el hospital\n")
		i = i + 1
	}
	fin

subrutina medicostratantes ()
	var
	i : numerico
	inicio
	desde i = 1 hasta PP
	{
		Pacientes[i].medicotratante = Medicos[random(5)].nombre
		imprimir(Pacientes[i].medicotratante, "\n")
		i = i + 1
	}
    fin

subrutina pacientestratadospormedico()
	inicio
		
		imprimir("Seleccione al medico que desea ver\n")
		imprimir("1 - Leandro Sanz\n2 - Agustin carrocera\n3 - Valentin Bakker\n4 - Ginna Galli\n5 - Dante Jorgensen")
		leer (eleccion)
		si (eleccion == 1)
		{
			imprimir("Leandro Sanz tuvo ", Medicos[1].pacientespormes, "este mes\n")
		}
		si (eleccion == 2)
		{
			imprimir("Agustin Carrocera tuvo ", Medicos[2].pacientespormes, "este mes\n")
		}
		si (eleccion == 3)
		{
			imprimir("Valentin Bakker tuvo ", Medicos[3].pacientespormes, "este mes\n")
		}
		si (eleccion == 4)
		{
			imprimir("Ginna Galli tuvo ", Medicos[4].pacientespormes, "este mes\n")
		}
		si (eleccion == 5)
		{
			imprimir("Dante Jorgensen tuvo ", Medicos[5].pacientespormes, "este mes\n")
		}
    fin

subrutina pacientestratadosporServicioMedico ()
	inicio
		ServiciosMedicos[2].pacientessmpormes = Medicos[1].pacientespormes
		ServiciosMedicos[1].pacientessmpormes = Medicos[4].pacientespormes + Medicos[5].pacientespormes
		ServiciosMedicos[3].pacientessmpormes = Medicos[2].pacientespormes + Medicos[3].pacientespormes
		imprimir("Seleccione al servicio medico que desea ver\n")
		imprimir("1 - Pediatria\n2 - Traumatologia\n3 - Neurologia")
		leer(eleccion)
		si (eleccion == 1)
		{
			imprimir("Pediatria tuvo ", ServiciosMedicos[1].pacientessmpormes, "este mes\n")
		}
		si (eleccion == 2)
		{
			imprimir("Traumatologia tuvo ", ServiciosMedicos[2].pacientessmpormes, "este mes\n")
		}
		si (eleccion == 3)
		{
			imprimir("Neurologia tuvo", ServiciosMedicos[3].pacientessmpormes, "este mes\n")
		}

    fin


subrutina listahonorarios()
	var
	i : numerico
	inicio
		inicializacionMedicos()
		desde i = 1 hasta 6
		{
			imprimir (Medicos[i].nombre, "\n")
			imprimir (Medicos[i].honorario, "\n")
			imprimir ("Cantidad de Pacientes tratados este mes: ", Medicos[i].pacientespormes, "\n")
			Medicos[i].honorariostotal=Medicos[i].honorario*Medicos[i].pacientespormes
			imprimir (Medicos[i].honorariostotal, "\n")
			i = i + 1
		}

    fin

subrutina BuscaIDs( DatoBuscado : numerico) retorna numerico
var

	j, indiceElemento : numerico
	encontrado : logico
inicio
	j = 1
	encontrado = FALSE
	indiceElemento = 0
	mientras (j <= PP and not(encontrado))
	{
		si(Pacientes[j].id == DatoBuscado)
		{
			encontrado = TRUE	
			indiceElemento = j
		}
		j = j + 1
	}
	retorna(indiceElemento)
fin

subrutina CrearPaciente ()
    var
	indiceespaciovacio : numerico
    inicio
    	
	    indiceespaciovacio = BuscarEspacioVacio()
    	si (indiceespaciovacio == -1)
    	{
			imprimir("no hay lugar\n")
			sino
				Pacientes[indiceespaciovacio].id = NuevoID()
				imprimir("introduzca su nombre \n")
				leer(Pacientes[indiceespaciovacio].nombre)
				imprimir("introduzca su direccion\n")
				leer(Pacientes[indiceespaciovacio].direccion)
				imprimir("introduzca un numero de telefono\n")
				leer(Pacientes[indiceespaciovacio].telefono)
		}   
fin

subrutina NuevoID () retorna numerico
    var
    idmasgrande : numerico
    inicio
    	idmasgrande = 0
    	desde i = 1 hasta PP
    	{
    		si(Pacientes[i].id > idmasgrande)
    		{
    			idmasgrande = Pacientes[i].id
    			i = i + 1
    		}
    	}
    retorna (idmasgrande + 1)

fin	

subrutina BuscarEspacioVacio () retorna numerico
var
    indiceespaciovacio : numerico
inicio
    desde i = 1 hasta PP 
    {
	    si(Pacientes[i].id == 0)
    	{
    		indiceespaciovacio = i
    		sino
    			indiceespaciovacio = -1
    	}

    }	
    retorna(indiceespaciovacio)
fin