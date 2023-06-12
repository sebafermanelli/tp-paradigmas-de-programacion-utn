instanceVariableNames: 'codigo titulo presAsig presRem listadoStaff'
classVariableNames: 'Codigo'

agregarActor: actor
	presRem := presRem - actor obtenerCachet.
	listadoStaff add: actor

agregarDirector: director
	presRem := presRem - director obtenerPagoDirector.
	listadoStaff add: director

agregarPersonal: personal
	presRem := presRem - PersonalPermanente obtenerSueldoBasico.
	listadoStaff add: personal

calcularPlus: personal
	| pago |
	pago := presRem * personal obtenerPlus / 100.
	^pago

cargarPelicula
	codigo := Codigo.
	Pelicula actualizarCodigo.
	titulo := Prompter prompt: 'Ingrese el titulo de la pelicula ' , codigo printString.
	presAsig := (Prompter prompt: 'Ingrese el presupuesto de la pelicula ' , titulo) asNumber.
	presRem := presAsig.
	listadoStaff := OrderedCollection new

mostrarPelicula
	Transcript
		cr;
		show: codigo printString;
		tab;
		tab;
		show: titulo asUppercase;
		tab;
		tab;
		show: presAsig printString;
		tab;
		tab;
		show: presRem printString;
		cr

obtenerPresAsig
	^presAsig

obtenerPresRem
	^presRem

obtenerTituloPelicula
	^titulo

actualizarCodigo
	Codigo := Codigo + 1

inicializarCodigo
	Codigo := 1
