instanceVariableNames: 'nacionalidad cachet'
classVariableNames: ''

cargarStaff
	super cargarStaff.
	nacionalidad := Prompter prompt: 'Ingrese la nacionalidad del actor'.
	cachet := (Prompter prompt: 'Ingrese el cachet a cobrar por el actor') asNumber

obtenerCachet
	^cachet
