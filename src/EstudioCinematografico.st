instanceVariableNames: 'listadoPeliculas listadoPersonal'
classVariableNames: ''

buscarPelicula
	| pelicula objeto |
	listadoPeliculas isEmpty
		ifTrue: [MessageBox notify: 'No hay peliculas cargadas']
		ifFalse: 
			[[objeto isNil] whileTrue: 
					[pelicula := Prompter prompt: 'Ingrese el nombre de la pelicula'.
					objeto := listadoPeliculas detect: [:i | pelicula = i obtenerTituloPelicula]
								ifNone: 
									[objeto := nil.
									MessageBox notify: 'No hay ninguna pelicula con ese titulo']]].
	^objeto

buscarPersonal
	| personal objeto |
	listadoPersonal isEmpty
		ifTrue: [MessageBox notify: 'No hay ningun empleado cargado']
		ifFalse: 
			[[objeto isNil] whileTrue: 
					[personal := Prompter prompt: 'Ingrese el nombre del personal'.
					objeto := listadoPersonal detect: [:i | personal = i obtenerNombrePersonal]
								ifNone: 
									[objeto := nil.
									MessageBox notify: 'El personal no existe']]].
	^objeto

busquedaEspecialidad
	| colec especialidad |
	especialidad := Prompter
				prompt: 'Ingrese la especialidad a buscar. S(Sonidista) | I(Iluminador) | C(Camarografo)'.
	colec := listadoPersonal select: [:i | i obtenerEspecialidad = especialidad].
	colec isEmpty
		ifTrue: [MessageBox notify: 'No hay ningun empleado con esa especialidad']
		ifFalse: [self listarPersonal: colec]

cargarEstudio
	listadoPeliculas := OrderedCollection new.
	listadoPersonal := OrderedCollection new.
	Pelicula inicializarCodigo.
	MessageBox notify: 'Estudio Cinematografico CINEMA'.
	PersonalPermanente cargarSueldoBasico.
	self cargarPersonalEstudio

cargarPersonalEstudio
	| nuevo personal |
	MessageBox notify: 'Cargar los empleados del estudio'.
	nuevo := true.
	[nuevo] whileTrue: 
			[personal := PersonalPermanente new.
			personal cargarStaff.
			listadoPersonal add: personal.
			nuevo := MessageBox confirm: '¿Desea agregar otro empleado?']

listarPeliculas: lista
	Transcript
		clear;
		cr;
		show: 'COD';
		tab;
		tab;
		show: 'TITULO';
		tab;
		tab;
		show: 'PRES ASIG';
		tab;
		tab;
		show: 'PRES REM';
		cr.
	lista do: [:i | i mostrarPelicula]

listarPersonal: lista
	Transcript
		clear;
		cr;
		show: 'NOMBRE';
		tab;
		tab;
		show: 'APELLIDO';
		tab;
		tab;
		show: 'DOC';
		tab;
		tab;
		show: 'PLUS';
		tab;
		tab;
		show: 'ESP';
		cr.
	lista do: [:i | i mostrarPersonal]

mostrarMenu
	| opcion |
	self cargarEstudio.
	opcion := nil.
	[opcion = '0'] whileFalse: 
			[MessageBox
				notify: '1- Cargar una pelicula. 2- Cargar un actor/director. 3- Calcular plus de un empleado. 4-Ver listado de peliculas. 5- Ver listado de empleados. 0- Salir'.
			opcion := Prompter prompt: 'Elija una opcion'.
			opcion = '1' ifTrue: [self opcionCargarPelicula].
			opcion = '2' ifTrue: [self opcionCargarStaff].
			opcion = '3' ifTrue: [self opcionCalcularPlus].
			opcion = '4' ifTrue: [self opcionListaPeliculas].
			opcion = '5' ifTrue: [self opcionListaPersonal]]

opcionCalcularPlus
	| pelicula personal pago |
	pelicula := self buscarPelicula.
	pelicula isNil
		ifFalse: 
			[personal := self buscarPersonal.
			personal isNil
				ifFalse: 
					[pago := pelicula calcularPlus: personal.
					MessageBox
						notify: 'En la pelicula ' , pelicula obtenerTituloPelicula , ' el empleado '
								, personal obtenerNombrePersonal , ' obtendra un plus de $'
								, pago printString]]

opcionCargarActor
	| actor pelicula |
	pelicula := self buscarPelicula.
	pelicula isNil
		ifFalse: 
			[actor := Actor new.
			actor cargarStaff.
			pelicula agregarActor: actor]

opcionCargarDirector
	| director pelicula pago |
	pelicula := self buscarPelicula.
	pelicula isNil
		ifFalse: 
			[director := EquipoDireccion new.
			director cargarStaff.
			pago := pelicula obtenerPresAsig * director obtenerPorcentaje / 100.
			director agregarPago: pago.
			pelicula agregarDirector: director]

opcionCargarPelicula
	| pelicula nuevo personal |
	pelicula := Pelicula new.
	pelicula cargarPelicula.
	MessageBox notify: 'Ingrese el personal del estudio que trabajara en la pelicula'.
	nuevo := true.
	[nuevo] whileTrue: 
			[personal := self buscarPersonal.
			personal isNil ifFalse: [pelicula agregarPersonal: personal].
			nuevo := MessageBox confirm: '¿Desea agregar otro personal?'].
	listadoPeliculas add: pelicula

opcionCargarStaff
	| opcion |
	opcion := nil.
	[opcion = '0'] whileFalse: 
			[MessageBox notify: '1- Cargar un actor. 2- Cargar un director. 0- Salir'.
			opcion := Prompter prompt: 'Elija una opcion'.
			opcion = '1' ifTrue: [self opcionCargarActor].
			opcion = '2' ifTrue: [self opcionCargarDirector]]

opcionListaPeliculas
	self listarPeliculas: listadoPeliculas

opcionListaPersonal
	self busquedaEspecialidad
