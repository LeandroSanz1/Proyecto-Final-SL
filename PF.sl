const
PP = 50

var

i : numerico
nuevoid, indiceespaciovacio, honorario, IDBuscado : numerico
siono : logico
Pacientes : vector [PP] registro
{
	nombre : cadena
	id : numerico
	FdUC : cadena
	direccion :cadena
	telefono : cadena
}
ServiciosMedicos : registro
{
	
	pediatria : cadena
	neurologia : cadena
	oncologia : cadena
}
Medicos : vector [PP] registro
{
	id : numerico
	nombre : cadena
	honorario : numerico
	tratados : numerico
	honorariostotal : numerico
}
inicio
	cls()
	i=1
	inicializacionMedicos()
// menu 
//	1 - buscar paciente
//  2 - reporte Mensual
//		- visita del paciente
//		- MEdicos tatantes por paciente 
//  9 - Salir 

	imprimir("ya estuvo en nuestro hospital? \n")
	leer(siono)
	si (siono == TRUE)
	{
		imprimir("introduzca su id \n")
		leer (IDBuscado)
		//buscar el indice del paciente en Pacientes por el IDBuscado

		indicePaciente = buscarPaciente(IDBuscado)
		si indicePaciente == false
		{//si no lo ecuentra mostrar crear paciente

		}sino{

		}

		imprimir(Pacientes[i] "\n")
		mientras siono == TRUE
		{
			si  siono == TRUE
			{
				i = 1
				imprimir("estuvo mas veces en el hospital?\n")
				leer(siono)
				imprimir("quien fue su medico tratante?\n")
				imprimir("seleccione al medico correspondiente al numero de abajo\n")
				//recorrer el vector de medicos y mostrarlos por pantall

				imprimir("1 - Leandro Sanz, 2 - Agustin carrocera, valentin bakker, Ginna galli, Dante Jorgensen\n")
				imprimir("		1				2					3			4				5")
				leer (Medico.id)
				
				i = i + 1
			}
			i=1
		}
		sino
		// crear paciente
			nuevoid = NuevoID()
			indiceespaciovacio = BuscarEspacioVacio()
				si (indiceespaciovacio == -1)
				{
					Paciente[i].[indiceespaciovacio] = Pacientes[i].nombre
					Paciente[i].id[indiceespaciovacio] = nuevoid
				}
			imprimir("introduzca su nombre \n")
			leer(Pacientes[i].nombre)
			BuscarEspacioVacio(Pacientes[i])
			Pacientes[indiceespaciovacio] = Pacientes[i].nombre
			imprimir("introduzca su direccion\n")
			leer(Paciente.direccion)
			imprimir("introduzca un numero de telefono\n")
			leer(Paciente[i].telefono)
			imprimir("introduzca el area de consulta\n")
			leer(Paciente[i])		
	}

	i = 1
	imprimir("introduzca su id: ")
	leer(Medico[i].id)
	busqueda(Medico[i].id)
	imprimir("introduzca la cantidad de pacientes tratados este mes: ")
	leer(Medico.tratados)
	Medico.honorariostotal = (Medico.honorarios*Medico.tratados)
	imprimir ("\nsus honorarios de este mes son:", Medico.honorariostotal, "$")

	//buscar indice y tomarlo para calcular honorarios mensuales

fin

subrutina BuscarEspacioVacio (arreglo:vector[PP]) retorna numerico
var
indiceespaciovacio : numerico
inicio
desde i = 1 hasta PP + 1
{
	si(Paciente[i].id == 0)
	{
		indiceespaciovacio = i
		sino
			indiceespaciovacio = -1
	}
	
}	
retorna(indiceespaciovacio)
fin
//ordena un vector de menor a mayor
subrutina OrdenarBurbujaMejorada(ref arreglo : vector [PP] numerico) 
var
	j, auxiliar : numerico
	ordenado : logico
inicio
	ordenado = TRUE
	i = 1
	mientras (i <= PP-1 and ordenado)
	{
		ordenado = FALSE
		desde j = 1 hasta PP-1
		{
			si (array[j] > array[j+1])
			{
				auxiliar = array[j]
				array[j] = array[j+1]
				array[j+1] = auxiliar
				ordenado = TRUE;
			}
		}
		i = i + 1
	}
fin



/*
 la funcion tiene que recibir un arreglo,
 detro de la funcion tenes que recorrer ese arreglo
 y guardar en una variable el valor de id mas grande
 que tenga guardado, cuando terminas de recorrer el
 arregle devolves el id encontrdo mas uno
*/
subrutina NuevoID () retorna numerico
var
idmasgrande : numerico
inicio
	idmasgrande = 0
	desde i = 1 hasta PP + 1 
	{
		si(Paciente.pacientesid[i] > idmasgrande)
		{
			idmasgrande = Paciente.pacientesid[i]
			i = i + 1
		}
	}
retorna (idmasgrande + 1)

fin	


subrutina busqueda(ref array : vector [PP] numerico; DatoBuscado : numerico) retorna numerico
var

	j, indiceElemento : numerico
	encontrado : logico
inicio
	j = 1
	encontrado = FALSE
	indiceElemento = 0
	mientras (j <= PP and not(encontrado))
	{
		si(array[j] == DatoBuscado)
		{
			encontrado = TRUE
			indiceElemento = j
		}
		j = j + 1
	}
	retorna(indiceElemento)
fin
subrutina inicializacionMedicos()
	Medicos[1].nombre = "Leandro Sanz"
	Medicos[1].id = 1
	Medicos[1].honorario = 440

	Medicos[2].nombre = "Agustin carrocera"
	Medicos[2].id = 2
	Medicos[2].honorario = 430
	
	Medicos[3].nombre = "valentin bakker"
	Medicos[3].id = 3
	Medicos[3].honorario = 420
	
	Medicos[4].nombre = "Ginna galli"
	Medicos[4].id = 4
	Medicos[4].honorario = 360

	Medicos[5].nombre = "Dante Jorgensen"
	Medicos[5].id = 5
	Medicos[5].honorario = 400
fin
