instanceVariableNames: 'nacionalidad porcentaje pagoDirector'
classVariableNames: ''

agregarPago: pago
	pagoDirector := pago

cargarStaff
	super cargarStaff.
	nacionalidad := Prompter prompt: 'Ingrese la nacionalidad del director'.
	porcentaje := (Prompter prompt: 'Ingrese el porcentaje a cobrar por el director') asNumber asFloat

obtenerPagoDirector
	^pagoDirector

obtenerPorcentaje
	^porcentaje
