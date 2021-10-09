const
PP = 50

var
idPacienteBuscador :numerico
i : numerico
nuevoid, indiceespaciovacio, honorario, indiceAreaConsulta : numerico
siono : logico
pacientes : vector [PP] Paciente
ConsultasMedicas : vector [PP] Ems

Ems : registro 
{
	indiceServicioMedico : numerico
	idPaciente : numerico
	idMedico : numerico
	FdC : cadena 
}
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
ServiciosMedicos : vector [10] cadena 

medicos : vector [PP] Medico
Medico : registro
{
	id : numerico
	nombre : cadena
	honorario : numerico
	tratados : numerico
	honorariostotal : numerico
	especialidades : [3] cadena // medico, pediatra, neurologo
}
inicio
	ServiciosMedicos[1] = "Pediatria"
	ServiciosMedicos[2] = "Traumatologia"
	ServiciosMedicos[3] = "Oncologia"

	cls()
	i=1
//	primerPAciente = pacientes[i]

//	elPacieespecialidadesnte.nombre = "juan" 
//	i= i + 1

	//OrdenarBurbujaMejorada (Paciente.pacientesid)
	//imprimir (Paciente.pacientesid[i])
	imprimir("ya estuvo en nuestro hospital? \n")
	leer(siono)
	si (siono == TRUE)
	{
		imprimir("introduzca su id \n")
		
		leer (idPacienteBuscador)
		buscarPaciente(idPacienteBuscador)
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
			
			indiceespaciovacio = BuscarEspacioVacio()

			pacientes[indiceespaciovacio].id = NuevoID()
			
			imprimir("introduzca su nombre \n")
			leer(pacientes[indiceespaciovacio].nombre)
			
			imprimir("introduzca su direccion\n")
			leer(pacientes[indiceespaciovacio].direccion)
			
			imprimir("introduzca un numero de telefono\n")
			leer(pacientes[indiceespaciovacio].telefono)
			
			imprimir("Seleccione el area de consulta\n")
			listaAreasConsultas() //imprime por pantalla las opciones
			leer(indiceAreaConsulta)
			imprimir("Seleccione el Medico\n")
			listaMedicos(indiceAreaConsulta) //imprime por pantalla las opciones
			leer(indiceAreaConsulta)


	}
	si (indiceespaciovacio == -1)
	{
		Paciente.pacientesnombre[indiceespaciovacio] = Paciente.nombre
		Paciente.pacientesid[indiceespaciovacio] = nuevoid
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

subrutina BuscarEspacioVacio (arreglo:vector[PP]) retorna numerico
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

subrutina buscarPaciente (idPacienteBuscador : numerico) retorna Paciente
var
	der, izq,indiceCentral, indiceElemento : numerico
	encontrado : logico
inicio
	izq = 1
	der = PP
	encontrado = FALSE
	indiceElemento = 0

	//OrdenarBurbujaMejorada(arreglo)

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