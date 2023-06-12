instanceVariableNames: 'plus especialidad'
classVariableNames: 'Sueldo'

cargarStaff
	super cargarStaff.
	plus := (Prompter prompt: 'Ingrese el porcentaje a cobrar por el empleado') asNumber asFloat.
	especialidad := (Prompter
				prompt: 'Ingrese la especialidad del empleado. S(Sonidista) | I(Iluminador) | C(Camarografo)')
					asUppercase

mostrarPersonal
	Transcript
		cr;
		show: nombre asUppercase;
		tab;
		tab;
		show: apellido asUppercase;
		tab;
		tab;
		show: documento printString;
		tab;
		tab;
		show: plus printString;
		tab;
		tab;
		show: especialidad asUppercase;
		cr

obtenerEspecialidad
	^especialidad

obtenerNombrePersonal
	^nombre

obtenerPlus
	^plus

cargarSueldoBasico
	Sueldo := (Prompter prompt: 'Ingrese el sueldo basico de los empleados del estudio') asNumber

obtenerSueldoBasico
	^Sueldo
