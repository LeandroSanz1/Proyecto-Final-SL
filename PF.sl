const
PP = 50

var

i : numerico
nuevoid, indiceespaciovacio, honorario : numerico
siono : logico
pacientes : vector [PP] cadena
Paciente : registro
{
	id : numerico
	FdUC : cadena
	direccion :cadena
	telefono : cadena
	medico : vector [PP] cadena
	ems : cadena
}


ServicioMedico : registro
{
	
	pediatria : cadena
	traumatologia : cadena
	oncologia : cadena
}
	medicos : vector [PP] cadena
Medico : registro
{
	nombre : cadena
	honorario : numerico
	tratados : numerico
	honorariostotal : numerico
}
inicio
	cls()
	i=1

	pacientes[i]= Paciente
	i= i + 1

	Paciente.pacientesid [1] = 1 
	Paciente.pacientesid [2] = 22
	Paciente.pacientesid [3] = 23
	Paciente.pacientesid [4] = 55
	Paciente.pacientesid [5] = 32
	Paciente.pacientesid [6] = 57
	Paciente.pacientesnombre[1] = "pedro selc"
	Paciente.pacientesnombre[2] = "juan garc"
	Paciente.pacientesnombre[3] = "ivan sult"
	Paciente.pacientesnombre[4] = "ramona schweits"
	Paciente.pacientesnombre[5] = "pablo rema"
	Paciente.pacientesnombre[6] = "sabrina polsk"
	OrdenarBurbujaMejorada (Paciente.pacientesid)
	imprimir (Paciente.pacientesid[i])
	imprimir("ya estuvo en nuestro hospital? \n")
	leer(siono)
	si (siono == TRUE)
	{
		imprimir("introduzca su id \n")
		leer (Paciente.id)
		busqueda(pacientes[i])
		mientras siono == TRUE
		{
			si  siono == TRUE
			{
				i = 1
				imprimir("estuvo mas veces en el hospital?\n")
				leer(siono)
				imprimir("indique su ultima consulta\n")
				leer (Paciente.Fduc)
				imprimir("quien fue su medico tratante?\n")
				leer (Medico.nombre)
				Paciente.medico [i] = Medico.nombre
				i = i + 1
			}
			
		}
		sino
			imprimir("introduzca su nombre \n")
				leer(Paciente.nombre)
		nuevoid = NuevoID()
		indiceespaciovacio = BuscarEspacioVacio()
	}
	si (indiceespaciovacio == -1)
	{
		Paciente.pacientesnombre[indiceespaciovacio] = Paciente.nombre
		Paciente.pacientesid[indiceespaciovacio] = nuevoid
	}
	i = 1
	medicos[i] = Medico
	i = i + 1
	Medico.honorarios[1] = 420
	Medico.honorarios[2] = 400
	Medico.honorarios[3] = 325
	Medico.honorarios[4] = 450
	Medico.honorarios[5] = 555
	Medico.medicos[1] = "valentin bakker"
	Medico.medicos[2] = "agustin carrocera"
	Medico.medicos[3] = "ginna galli"
	Medico.medicos[4] = "leandro sanz"
	Medico.medicos[5] = "silvia calan"
	Medico.ServicioMedico[1] = "neurologia"
	Medico.ServicioMedico[2] = "neurologia"
	Medico.ServicioMedico[3] = "traumatologia"
	Medico.ServicioMedico[4] =	"neurologia"
	Medico.ServicioMedico[5] = "oftalmologia"
	
	
	Medico.medicosid[1] = 1
	Medico.medicosid[2] = 2
	Medico.medicosid[3] = 3
	Medico.medicosid[4] = 4
	Medico.medicosid[5] = 5


	imprimir("introduzca su id: ")
	leer(Medico.medicoid)
	busqueda(Medico.medicoid)
	imprimir("introduzca la cantidad de pacientes tratados este mes: ")
	leer(Medico.tratados)
	Medico.honorariostotal = (Medico.honorarios[i]*Medico.tratados)
	imprimir ("\nsus honorarios de este mes son:", Medico.honorariostotal, "$")

	//buscar indice y tomarlo para calcular honorarios mensuales

fin

subrutina BuscarEspacioVacio () retorna numerico
var
indiceespaciovacio : numerico
inicio
desde i = 1 hasta PP + 1
{
	si(Paciente.pacientesid[i] == 0)
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
//busca un numero dividiendo en dos el vector sucesivamente hasta encontrarlo
subrutina busqueda (ref arreglo : vector [PP] numerico; DatoBuscado : numerico) retorna numerico
var
	der, izq,indiceCentral, indiceElemento : numerico
	encontrado : logico
inicio
	izq = 1
	der = PP
	encontrado = FALSE
	indiceElemento = 0

	OrdenarBurbujaMejorada(arreglo)

	mientras (izq <= der and not(encontrado))
	{
		indiceCentral = int((der + izq)/2)
		si(arreglo[indiceCentral] == DatoBuscado)
		{
			encontrado = TRUE
			indiceElemento = indiceCentral
		sino
			si(DatoBuscado <= arreglo[indiceCentral])
			{
				der = indiceCentral - 1
			sino
				izq = indiceCentral + 1
			}
		}
	}
	retorna(indiceElemento)
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