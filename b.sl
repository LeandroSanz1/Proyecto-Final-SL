const
PP = 50

var

i : numerico
nuevoid, indiceespaciovacio, honorario : numerico
siono : logico
pacientes : vector [PP] Paciente
Paciente : registro
{
	nombre : cadena
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
	id : numerico
	nombre : cadena
	honorario : numerico
	tratados : numerico
	honorariostotal : numerico
}
inicio
	cls()
	i=1

	pacientes[i] = Paciente
	i= i + 1

	imprimir("ya estuvo en nuestro hospital? \n")
	leer(siono)
	si (siono == TRUE)
	{
		imprimir("introduzca su id \n")
		leer (Paciente.id)
		busqueda(pacientes[i])
		imprimir(pacientes[i] "\n")
		mientras siono == TRUE
		{
			si  siono == TRUE
			{
				i = 1
				imprimir("estuvo mas veces en el hospital?\n")
				leer(siono)
				imprimir("quien fue su medico tratante?\n")
				leer (Medico.nombre)
				Paciente.medico [i] = Medico.nombre
				i = i + 1
			}
			i=1
		}
		sino
			nuevoid = NuevoID()
			indiceespaciovacio = BuscarEspacioVacio()
				si (indiceespaciovacio == -1)
				{
					Paciente.pacientesnombre[indiceespaciovacio] = Paciente.nombre
					Paciente.pacientesid[indiceespaciovacio] = nuevoid
				}
			imprimir("introduzca su nombre \n")
			leer(Paciente.nombre)
			BuscarEspacioVacio(pacientes[i])
			pacientes[indiceespaciovacio] = Paciente.nombre
			imprimir("introduzca su direccion\n")
			leer(Paciente.direccion)
			imprimir("introduzca un numero de telefono\n")
			leer(Paciente.telefono)
			imprimir("introduzca el area de consulta\n")
			leer(Paciente.ems)
		
	}
	i = 1
	medicos[i] = Medico
	i = i + 1


	i = 1
	medicos[i] = Medico 
	imprimir("introduzca su id: ")
	leer(Medico.id)
	busqueda(medicos[i])
	imprimir("introduzca la cantidad de pacientes tratados este mes: ")
	leer(Medico.tratados)
	Medico.honorariostotal = (Medico.honorarios[i]*Medico.tratados)
	imprimir ("\nsus honorarios de este mes son:", Medico.honorariostotal, "$")

	//buscar indice y tomarlo para calcular honorarios mensuales

fin

subrutina BuscarEspacioVacio (arreglo : vector [PP] numerico) retorna numerico
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