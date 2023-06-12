instanceVariableNames: 'nombre apellido documento'
classVariableNames: ''

cargarStaff
	nombre := Prompter prompt: 'Ingrese el nombre de la persona'.
	apellido := Prompter prompt: 'Ingrese el apellido de la persona'.
	documento := (Prompter prompt: 'Ingrese el documento de identidad') asNumber
