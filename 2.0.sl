const
    PP = 50

var
    i, nuevoid, IDBuscado, indicePaciente : numerico
    eleccion1, eleccion2, eleccion3  : numerico 
    siono : logico

    Pacientes : vector [PP] registro
{
	nombre : cadena
	id : numerico
	vecesenhospital : numerico
	direccion :cadena
	telefono : numerico
	medicostratantes : vector [5] cadena
	FdUC : cadena
}
	Medicos : vector [PP] registro
{
	id : numerico
	nombre : cadena
	honorario : numerico
	pacientespormes : cadena
	cantdevisitas : numerico
	honorariostotal : numerico
	sm : cadena
}
	ServiciosMedicos : vector [PP] registro
{
	id : numerico
	nombre : cadena
	pacientessmpormes : cadena
}

inicio

cls()

	inicializacionMedicos()
	inicializacionServiciosMedicos()
	inicializaciondepacientes()
	
	mientras (eleccion1 <> 9)
	{
		indicePaciente = 0
    imprimir("1 - Buscar Paciente\n2 - Reporte Mensual\n")
    leer(eleccion1)
    si (eleccion1 == 1)
    {
        imprimir("introduzca su id \n")
		leer (IDBuscado)
			indicePaciente = BuscaIDs (IDBuscado)
        si         (indicePaciente == 0)
        {
				imprimir ("no se encontro el paciente, ingrese los datos \n")
            CrearPaciente()
				sino
					imprimir("Nombre: ", Pacientes[indicePaciente].nombre, "\n")
					imprimir("ID: ", Pacientes[indicePaciente].id, "\n") 
					imprimir("Direccion: ", Pacientes[indicePaciente].direccion, "\n")
					imprimir("Telefono", Pacientes[indicePaciente].telefono, "\n")
					imprimir("Fecha de ultima consulta: ", Pacientes[indicePaciente].FdUC, "\n")
					imprimir("Medicos tratantes: ", Pacientes[indicePaciente].medicostratantes[indicePaciente], "\n")
        }
		
        
    }
    si (eleccion1 == 2)
    {
		imprimir("1 - visitas del paciente\n2 - Medicos Tratantes Por Paciente\n3 - Pacientes Atendidos Por Servicio Medico\n4 - Pacientes Atendidos Por Medico\n5 - Lista De Honorarios\n")
		leer(eleccion2)
		si (eleccion2 == 1)
		{
			visitasdelpaciente ()
		}
		si (eleccion2 == 2)
		{
			medicostratantes ()
		}
		si (eleccion2 == 3)
		{
			pacientestratadosporServicioMedico()
		}
		si (eleccion2 == 4)
		{
			pacientestratadospormedico()
		}
		si (eleccion2 == 5)
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

subrutina inicializaciondepacientes()
inicio
	Pacientes[1].nombre = "juan"
	Pacientes[1].id = 1
	Pacientes[1].direccion = "pesea 2233"
	Pacientes[1].telefono = 2235793123
	Pacientes[1].FdUC = "3/11/21"
	Pacientes[1].medicostratantes[1] = Medicos[1].nombre
	Pacientes[1].vecesenhospital = 2

	Pacientes[2].nombre = "pedro"
	Pacientes[2].id = 2
	Pacientes[2].direccion = "Arenales 4235"
	Pacientes[2].telefono = 2234456430
	Pacientes[2].FdUC = "11/3/21"
	Pacientes[2].medicostratantes[1] = Medicos[4].nombre
	Pacientes[2].vecesenhospital = 1

	Pacientes[3].nombre = "Leonel"
	Pacientes[3].id = 3
	Pacientes[3].direccion = "alsina 3321"
	Pacientes[3].telefono = 2231145764
	Pacientes[3].FdUC = "31/10/21"
	Pacientes[3].medicostratantes[1] = Medicos[3].nombre
	Pacientes[3].medicostratantes[2] = Medicos[1].nombre
	Pacientes[3].vecesenhospital = 8

	Pacientes[4].nombre = "julian"
	Pacientes[4].id = 4
	Pacientes[4].direccion = "belgrano 5300"
	Pacientes[4].telefono = 2234611234
	Pacientes[4].FdUC = "2/11/21"
	Pacientes[4].medicostratantes[1] = Medicos[2].nombre
	Pacientes[4].vecesenhospital = 3

	Pacientes[5].nombre = "javier"
	Pacientes[5].id = 5
	Pacientes[5].direccion = "Santiago del Estero 3346"
	Pacientes[5].telefono = 2234523563
	Pacientes[5].FdUC = "3/5/21"
	Pacientes[5].medicostratantes[1] = Medicos[1].nombre
	Pacientes[5].medicostratantes[2] =  Medicos[5].nombre
	Pacientes[5].vecesenhospital = 5

	Pacientes[6].nombre = "Felipe"
	Pacientes[6].id = 6
	Pacientes[6].direccion = "O´higgins 2234"
	Pacientes[6].telefono = 2234565128
	Pacientes[6].FdUC = "23/3/21"
	Pacientes[6].medicostratantes[1] = Medicos[3].nombre
	Pacientes[6].medicostratantes[2] = Medicos[2].nombre
	Pacientes[6].vecesenhospital = 4

	Pacientes[7].nombre = "jose"
	Pacientes[7].id = 7
	Pacientes[7].direccion = "Talcahuano 3212"
	Pacientes[7].telefono = 2235465612
	Pacientes[7].FdUC = "21/5/21"
	Pacientes[7].medicostratantes[1] = Medicos[5].nombre
	Pacientes[7].vecesenhospital = 3

fin

subrutina inicializacionMedicos()
	inicio
	Medicos[1].nombre = "Leandro Sanz"
	Medicos[1].id = 1
	Medicos[1].honorario = 400
	Medicos[1].pacientespormes = Pacientes[5].nombre + Pacientes[1].nombre + Pacientes[3].nombre
	Medicos[1].cantdevisitas = Pacientes[5].vecesenhospital + Pacientes[1].vecesenhospital + Pacientes[3].vecesenhospital
	Medicos[1].sm = ServiciosMedicos[2].nombre


	Medicos[2].nombre = "Agustin carrocera"
	Medicos[2].id = 2
	Medicos[2].honorario = 430
	Medicos[2].pacientespormes = Pacientes[2].nombre + Pacientes[6].nombre + Pacientes[4].nombre
	Medicos[2].cantdevisitas = Pacientes[2].vecesenhospital + Pacientes[6].vecesenhospital + Pacientes[4].vecesenhospital
	Medicos[2].sm = ServiciosMedicos[3].nombre


	Medicos[3].nombre = "valentin bakker"
	Medicos[3].id = 3
	Medicos[3].honorario = 420
	Medicos[3].pacientespormes = Pacientes[6].nombre + Pacientes[3].nombre
	Medicos[3].cantdevisitas = Pacientes[6].vecesenhospital + Pacientes[3].vecesenhospital
	Medicos[3].sm = ServiciosMedicos[3].nombre


	Medicos[4].nombre = "Ginna galli"
	Medicos[4].id = 4
	Medicos[4].honorario = 360
	Medicos[4].pacientespormes = Pacientes[2].nombre
	Medicos[4].cantdevisitas = Pacientes[2].vecesenhospital
	Medicos[4].sm = ServiciosMedicos[1].nombre


	Medicos[5].nombre = "Dante Jorgensen"
	Medicos[5].id = 5
	Medicos[5].honorario = 400
	Medicos[5].pacientespormes = Pacientes[7].nombre
	Medicos[5].cantdevisitas = Pacientes[7].vecesenhospital
	Medicos[5].sm = ServiciosMedicos[1].nombre


    fin


subrutina visitasdelpaciente ()
	var
i : numerico
	inicio
		imprimir("introduzca el ID del paciente\n")
		leer(IDBuscado)
		i = BuscaIDs(IDBuscado)
		si (i == 0)
			{
				imprimir("id no encontrado\n")
				sino
					imprimir("Este paciente estuvo ", Pacientes[i].vecesenhospital, " veces este mes en el hospital\n")
			}
	fin

subrutina medicostratantes ()
	var
	i, j : numerico
	inicio
	
	desde i = 1 hasta 10
	{
		desde j = 1 hasta 5
		{
		si (Pacientes[i].nombre <> "" and Pacientes[i].medicostratantes[j] <> "")
			{
				imprimir(Pacientes[i].nombre, " es tratado por ", Pacientes[i].medicostratantes[j], "\n")
			}
			i = i + 1
			j = j + 1
		}
	}
	fin

subrutina pacientestratadospormedico()
	inicio
		
		imprimir("Seleccione al medico que desea ver\n")
		imprimir("1 - Leandro Sanz\n2 - Agustin carrocera\n3 - Valentin Bakker\n4 - Ginna Galli\n5 - Dante Jorgensen\n")
		leer (eleccion3)
		si (eleccion3 == 1)
		{
			imprimir("Leandro Sanz tuvo a los pacientes ", Medicos[1].pacientespormes, " este mes\n")
		}
		si (eleccion3 == 2)
		{
			imprimir("Agustin Carrocera tuvo a los pacientes ", Medicos[2].pacientespormes, " este mes\n")
		}
		si (eleccion3 == 3)
		{
			imprimir("Valentin Bakker tuvo a los pacientes ", Medicos[3].pacientespormes, " este mes\n")
		}
		si (eleccion3 == 4)
		{
			imprimir("Ginna Galli tuvo a los pacientes ", Medicos[4].pacientespormes, " este mes\n")
		}
		si (eleccion3 == 5)
		{
			imprimir("Dante Jorgensen tuvo a los pacientes ", Medicos[5].pacientespormes, " este mes\n")
		}
    fin

subrutina pacientestratadosporServicioMedico ()
	inicio
		ServiciosMedicos[2].pacientessmpormes = Medicos[1].pacientespormes
		ServiciosMedicos[1].pacientessmpormes = Medicos[4].pacientespormes + Medicos[5].pacientespormes
		ServiciosMedicos[3].pacientessmpormes = Medicos[2].pacientespormes + Medicos[3].pacientespormes
		imprimir("Seleccione al servicio medico que desea ver\n")
		imprimir("1 - Pediatria\n2 - Traumatologia\n3 - Neurologia\n")
		leer(eleccion1)
		si (eleccion1 == 1)
		{
			imprimir("Pediatria tuvo ", ServiciosMedicos[1].pacientessmpormes, " este mes\n")
		}
		si (eleccion1 == 2)
		{
			imprimir("Traumatologia tuvo ", ServiciosMedicos[2].pacientessmpormes, " este mes\n")
		}
		si (eleccion1 == 3)
		{
			imprimir("Neurologia tuvo ", ServiciosMedicos[3].pacientessmpormes, " este mes\n")
		}

    fin


subrutina listahonorarios()
	var
	i : numerico
	inicio
		
		inicializacionMedicos()
		
			imprimir ("los honorarios de ", Medicos[1].nombre, "son \n")
			imprimir (Medicos[1].honorario, "\n")
			imprimir ("Cantidad de Pacientes tratados este mes: ", Medicos[1].cantdevisitas, "\n")
			Medicos[1].honorariostotal = Medicos[1].honorario * Medicos[1].cantdevisitas
			imprimir (Medicos[1].honorariostotal, "\n")
			imprimir ("los honorarios de ", Medicos[2].nombre, "son \n")
			imprimir (Medicos[2].honorario, "\n")
			imprimir ("Cantidad de Pacientes tratados este mes: ", Medicos[2].cantdevisitas, "\n")
			Medicos[2].honorariostotal = Medicos[2].honorario * Medicos[2].cantdevisitas
			imprimir (Medicos[2].honorariostotal, "\n")
			imprimir ("los honorarios de ", Medicos[3].nombre, "son \n")
			imprimir (Medicos[3].honorario, "\n")
			imprimir ("Cantidad de Pacientes tratados este mes: ", Medicos[3].cantdevisitas, "\n")
			Medicos[3].honorariostotal = Medicos[3].honorario * Medicos[3].cantdevisitas
			imprimir (Medicos[4].honorariostotal, "\n")
			imprimir ("los honorarios de ", Medicos[4].nombre, "son \n")
			imprimir (Medicos[4].honorario, "\n")
			imprimir ("Cantidad de Pacientes tratados este mes: ", Medicos[4].cantdevisitas, "\n")
			Medicos[4].honorariostotal = Medicos[4].honorario * Medicos[4].cantdevisitas
			imprimir (Medicos[4].honorariostotal, "\n")
			imprimir ("los honorarios de ", Medicos[5].nombre, "son \n")
			imprimir (Medicos[5].honorario, "\n")
			imprimir ("Cantidad de Pacientes tratados este mes: ", Medicos[5].cantdevisitas, "\n")
			Medicos[5].honorariostotal = Medicos[5].honorario * Medicos[5].cantdevisitas
			imprimir (Medicos[5].honorariostotal, "\n")

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
				imprimir("introduzca su ultima consulta\n")
				leer(Pacientes[indiceespaciovacio].FdUC)
				imprimir("ingrese al medico tratante\n")
				leer(Pacientes[indiceespaciovacio].medicostratantes[indiceespaciovacio])
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
	indiceespaciovacio = -1

    desde i = 1 hasta PP 
    {
	    si(Pacientes[i].id == 0)
    	{
    		indiceespaciovacio = i
    	}
		i = i + 1
    }	
    retorna(indiceespaciovacio)

 fin 