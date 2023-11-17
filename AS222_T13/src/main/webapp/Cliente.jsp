<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="icon" type="image/x-icon" href="Image/FaviconClaro.png">
<title>CLARO</title>

<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="navbar.jsp"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="BarraLateral.jsp"></jsp:include>
		<div id="layoutSidenav_content">

			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">CLIENTE ACTIVOS</h1>
					<div class="card-body">
						<form method="post" action="#">
							<div class="mb-2 row">
								<div class="col-sm d-none">
									<button type="button" class="btn d-none" id="btnActualizar"
										name="btnActualizar">Actualizar</button>
								</div>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="names" name="names"
										placeholder="Ingrese nombre">
								</div>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="last_name"
										name="last_name" placeholder="Ingrese apellido">
								</div>
								<div class="col-sm-2">
									<button type="button" class="btn btn-primary mb-2"
										id="btnBuscar" name="btnBuscar">Buscar</button>
								</div>
								<div class="col-sm-2">
									<button type="button" class="btn btn-success float-end mb-2"
										id="btnNuevo" name="btnNuevo">Nuevo</button>
								</div>
							</div>
						</form>
					</div>
					<div class="card mb-4" id="divResultado">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> Registros
						</div>
						<div class="card-body">
							<button onclick="exportToCSV()">Exportar a CSV</button>
							<button onclick="exportToExcel()">Exportar a Excel</button>
							<button type="button" class="cancel-button"
							 onclick="window.location.href='export-pdf.jsp'"
							 style="background-color: #FF4136; border: none;
							  color: white; text-align: center; text-decoration:
							   none; display: inline-block; font-size: 14px;
							    margin-right: 6px; cursor: pointer; border-radius:
							     4px;">Exportar a PDF</button>

						
							
							<table class="table caption-top" id="tblEstudiante">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Nombre</th>
										<th scope="col">Apellido</th>
										<th scope="col">Tipo Documento</th>
										<th scope="col">N� Documento</th>
										<th scope="col">Correo Electr�nico</th>
										<th scope="col">N� Celular</th>
										<th scope="col">Puntos</th>
										<th scope="col">Tipo de cliente</th>
										<th scope="col">Accion</th>
									</tr>
								</thead>
								<tbody id="detalleTabla">
								</tbody>
							</table>
						</div>
					</div>
					<div class="card" id="divRegistro" style="display: none;">
						<div class="card-header">
							<i class="fa-sharp fa-light fa-book-open-reader"></i> Formulario
						</div>
						<div class="card-body">
							<form class="row g-3 needs-validation" novalidate>

								<input type="hidden" id="accion" name="accion">

								<div class="col-md-4 d-none">
									<label for="frmId" class="form-label">ID</label> <input
										type="text" class="form-control" id="frmId" required>
								</div>


								<div class="col-md-4">
									<label for="frmNames" class="form-label">Nombre</label> <input
										type="text" class="form-control" id="frmNames" value=""
										required>
									<div class="valid-feedback">�Se ve bien!</div>
									<div class="invalid-feedback">Por favor, coloque algo
										v�lido.</div>
								</div>

								<div class="col-md-4">
									<label for="frmLast_name" class="form-label">Apellido</label> <input
										type="text" class="form-control" id="frmLast_name" required>
									<div class="valid-feedback">�Se ve bien!</div>
									<div class="invalid-feedback">Por favor, coloque algo
										v�lido.</div>
								</div>
								<div class="col-md-3">
									<label for="frmType_document" class="form-label">Tipo
										Documento</label> <select class="form-select" id="frmType_document"
										required>
										<option selected disabled value="">Elige...</option>
										<option value="DNI">DNI</option>
										<option value="CNE">CNE</option>
									</select>
									<div class="invalid-feedback">Seleccione un tipo de
										documento.</div>
								</div>
								<div class="col-md-3">
									<label for="frmNumber_document" class="form-label">N�
										Documento</label> <input type="number" class="form-control"
										id="frmNumber_document" required>
									<div class="valid-feedback">�Se ve bien!</div>
									<div class="invalid-feedback">Por favor, coloque algo
										v�lido.</div>
								</div>
								<div class="col-md-4">
									<label for="frmEmail" class="form-label">Correo
										Electronico</label>
									<div class="input-group has-validation">
										<input type="text" class="form-control" id="frmEmail"
											aria-describedby="inputGroupPrepend" required>
										<div class="valid-feedback">�Se ve bien!</div>
										<div class="invalid-feedback">Por favor, coloque algo
											v�lido.</div>
									</div>
								</div>
								<div class="col-md-4">
									<label for="frmCellphone" class="form-label">N� Celular</label>
									<input type="number" class="form-control" id="frmCellphone"
										required>
									<div class="valid-feedback">�Se ve bien!</div>
									<div class="invalid-feedback">Por favor, coloque algo
										v�lido.</div>
								</div>
								<div class="col-md-4">
									<label for="frmGrade" class="form-label">Puntos</label> <select
										class="form-select" id="frmGrade" required>
										<option selected disabled value="">Elige...</option>
										<option value="10">10</option>
										<option value="20">20</option>
										<option value="30">30</option>
										<option value="40">40</option>
										<option value="50">50</option>
									</select>
									<div class="invalid-feedback">Seleccione Los puntos.</div>
								</div>
								<div class="col-md-4">
									<label for="frmSection" class="form-label">Tipo de Cliente</label> <select
										class="form-select" id="frmSection" required>
										<option selected disabled value="">Elige...</option>
										<option value="Cliente Nuevo">Cliente Nuevo</option>
										<option value="Cliente Existente">Cliente Existente</option>
									</select>
									<div class="invalid-feedback">Seleccione una Secci�n.</div>
								</div>

								<div class="col-12">
									<button class="btn btn-primary" id="btnProcesar" type="submit">Enviar
										formulario</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
	<script src = "https://unpkg.com/jspdf-autotable"></script>
	<script src = "https://unpkg.com/jspdf "></script>
	<script>
	
	
	
	// Constantes del CRUD
	const ACCION_NUEVO = "NUEVO";
	const ACCION_EDITAR = "EDITAR";
	const ACCION_ELIMINAR = "ELIMINAR";

	// Arreglo de registros
	let arreglo = [];
	
	// Acceder a los controles
	let btnBuscar = document.getElementById("btnBuscar");
	let btnNuevo = document.getElementById("btnNuevo");
	let btnProcesar = document.getElementById("btnProcesar");
	let btnActualizar = document.getElementById("btnActualizar");
	
	// Campos del formulario
	let accion = document.getElementById('accion');
	let frmId = document.getElementById('frmId');
	let frmNames = document.getElementById('frmNames');
	let frmLast_name = document.getElementById('frmLast_name');
	let frmType_document = document.getElementById('frmType_document');
	let frmNumber_document = document.getElementById('frmNumber_document');
	let frmEmail = document.getElementById('frmEmail');
	let frmCellphone = document.getElementById('frmCellphone');
	let frmGrade = document.getElementById('frmGrade');
	let frmSection = document.getElementById('frmSection');

	// Programar los controles
	btnBuscar.addEventListener("click", fnBtnBuscar);
	btnNuevo.addEventListener("click", fnBtnNuevo);
	btnProcesar.addEventListener("click", fnBtnProcesar);
	btnActualizar.addEventListener("click", fnBtnActualizar);

	// Funcion fnEditar
	function fnEditar(id) {
		document.getElementById("accion").value = ACCION_EDITAR;
		fnCargarForm(id);
		fnEstadoFormulario(ACCION_EDITAR);
		document.getElementById("divResultado").style.display = "none";
		document.getElementById("divRegistro").style.display = "block";
	}

	// Funcion fnEliminar
	function fnEliminar(id) {
		Swal.fire({
		  title: 'Are you sure?',
		  text: "You won't be able to revert this!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		    )
			document.getElementById("accion").value = ACCION_ELIMINAR;
			fnCargarForm(id);
			fnBtnProcesar();
			setTimeout(fnBtnActualizar, 1000);
		  }
		})
	}

	// Funcion fnBtnProcesar
	function fnBtnProcesar() {
		if(!fnValidar()){
			return;
		}
		let datos = "accion=" + document.getElementById("accion").value;
		datos += "&id=" + document.getElementById("frmId").value;
		datos += "&names=" + document.getElementById("frmNames").value;
		datos += "&last_name=" + document.getElementById("frmLast_name").value;
		datos += "&type_document=" + document.getElementById("frmType_document").value;
		datos += "&number_document=" + document.getElementById("frmNumber_document").value;
		datos += "&email=" + document.getElementById("frmEmail").value;
		datos += "&cellphone=" + document.getElementById("frmCellphone").value;
		datos += "&grade=" + document.getElementById("frmGrade").value;
		datos += "&section=" + document.getElementById("frmSection").value;
		let xhr = new XMLHttpRequest();
		xhr.open("POST", "StudentProcesar", true);
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				console.log(xhr.responseText);
			}
		};
		xhr.send(datos);
	}

	function fnBtnNuevo() {
		document.getElementById("accion").value = ACCION_NUEVO;
		fnEstadoFormulario(ACCION_NUEVO);
		document.getElementById("divResultado").style.display = "none";
		document.getElementById("divRegistro").style.display = "block";
	}

	function fnBtnBuscar() {
		let names = document.getElementById("names").value;
		let last_name = document.getElementById("last_name").value;
		let url = "StudentBuscar?names=" + names + "&last_name=" + last_name;
		let xhttp = new XMLHttpRequest();
		xhttp.open("GET", url, true);
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let respuesta = xhttp.responseText;
				arreglo = JSON.parse(respuesta);
				let detalleTabla = "";
				arreglo.forEach(function(item) {
							detalleTabla += "<tr>";
							detalleTabla += "<td>" + item.id + "</td>";
							detalleTabla += "<td>" + item.names + "</td>";
							detalleTabla += "<td>" + item.last_name + "</td>";
							detalleTabla += "<td>" + item.type_document + "</td>";
							detalleTabla += "<td>" + item.number_document + "</td>";
							detalleTabla += "<td>" + item.email + "</td>";
							detalleTabla += "<td>" + item.cellphone + "</td>";
							detalleTabla += "<td>" + item.grade + "</td>";
							detalleTabla += "<td>" + item.section + "</td>";
							detalleTabla += "<td>";
							detalleTabla += "<a class='btn btn-success' href='javascript:fnEditar(" + item.id + ");'><i class='fa-solid fa-pen'></i></a> ";
							detalleTabla += "<a class='btn btn-danger' href='javascript:fnEliminar(" + item.id + ");'><i class='fa-solid fa-trash'></i></a>";
							detalleTabla += "</td>";
							detalleTabla += "</tr>";
						});
				document.getElementById("detalleTabla").innerHTML = detalleTabla;
				document.getElementById("divResultado").style.display = "block";
				document.getElementById("divRegistro").style.display = "none";
			}
		};
		xhttp.send();
	}
	
	function fnBtnActualizar() {
		let xhttp = new XMLHttpRequest();
		xhttp.open("GET", "StudentActualizar", true);
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let respuesta = xhttp.responseText;
				arreglo = JSON.parse(respuesta);
				let detalleTabla = "";
				arreglo.forEach(function(item) {
							detalleTabla += "<tr>";
							detalleTabla += "<td>" + item.id + "</td>";
							detalleTabla += "<td>" + item.names + "</td>";
							detalleTabla += "<td>" + item.last_name + "</td>";
							detalleTabla += "<td>" + item.type_document + "</td>";
							detalleTabla += "<td>" + item.number_document + "</td>";
							detalleTabla += "<td>" + item.email + "</td>";
							detalleTabla += "<td>" + item.cellphone + "</td>";
							detalleTabla += "<td>" + item.grade + "</td>";
							detalleTabla += "<td>" + item.section + "</td>";
							detalleTabla += "<td>";
							detalleTabla += "<a class='btn btn-success' href='javascript:fnEditar(" + item.id + ");'><i class='fa-solid fa-pen'></i></a> ";
							detalleTabla += "<a class='btn btn-danger' href='javascript:fnEliminar(" + item.id + ");'><i class='fa-solid fa-trash'></i></a>";
							detalleTabla += "</td>";
							detalleTabla += "</tr>";
						});
				document.getElementById("detalleTabla").innerHTML = detalleTabla;
				document.getElementById("divResultado").style.display = "block";
				document.getElementById("divRegistro").style.display = "none";
			}
		};
		xhttp.send();
	}
	
	fnBtnActualizar();
	
	function fnCargarForm(id){
		arreglo.forEach(function(item) {
			if(item.id == id){
				frmId.value = item.id;
				frmNames.value = item.names;
				frmLast_name.value = item.last_name;
				frmType_document.value = item.type_document;
				frmNumber_document.value = item.number_document;
				frmEmail.value = item.email;
				frmCellphone.value = item.cellphone;
				frmGrade.value = item.grade;
				frmSection.value = item.section;
				return true;
			}
		});
	}
	
	function fnEstadoFormulario(estado){
		frmNames.disabled = (estado==ACCION_ELIMINAR)
		frmLast_name.disabled = (estado==ACCION_ELIMINAR)
		frmType_document.disabled = (estado==ACCION_ELIMINAR)
		frmNumber_document.disabled = (estado==ACCION_ELIMINAR)
		frmEmail.disabled = (estado==ACCION_ELIMINAR)
		frmCellphone.disabled = (estado==ACCION_ELIMINAR)
		frmGrade.disabled = (estado==ACCION_ELIMINAR)
		frmSection.disabled = (estado==ACCION_ELIMINAR)
		if(estado==ACCION_NUEVO){
			frmId.value = "0";
			frmNames.value = "";
			frmLast_name.value = "";
			frmType_document.value = "";
			frmNumber_document.value = "";
			frmEmail.value = "";
			frmCellphone.value = "";
			frmGrade.value = "";
			frmSection.value = "";
		}
	}
	
	$('#exportBtn').click(function() {
		  var doc = document.getElementById("tblEstudiante");
		  newWin= window.open("");
	      newWin.document.write(doc.outerHTML);
	      newWin.print();
	 });
	function fnValidar(){
		
		return true;
	}
	</script>
	<!-- VALIDACION CAMPO NOMBRE -->
	<script>
    // Obtener el campo de entrada de nombres
    var frmNamesInput = document.getElementById('frmNames');

    // Agregar un event listener para el evento 'input'
    frmNamesInput.addEventListener('input', function(event) {
        // Obtener el valor actual del campo de nombres
        var name = event.target.value;

        // Expresi�n regular para validar solo letras y espacios, incluyendo � y di�resis
        var regex = /^[A-Za-z��\u00C0-\u017F\s]+$/;

        // Validar el valor ingresado
        if (name === '') {
            // El campo est� vac�o
            frmNamesInput.classList.remove('is-valid');
            frmNamesInput.classList.remove('is-invalid');
        } else if (regex.test(name)) {
            // El valor es v�lido
            frmNamesInput.classList.remove('is-invalid');
            frmNamesInput.classList.add('is-valid');
        } else {
            // El valor es inv�lido
            frmNamesInput.classList.remove('is-valid');
            frmNamesInput.classList.add('is-invalid');
        }
    });
</script>



	<!-- VALIDACION CAMPO APELLIDO -->
	<script>
    // Obtener el campo de entrada de apellido
    var frmLastNameInput = document.getElementById('frmLast_name');

    // Agregar un event listener para el evento 'input'
    frmLastNameInput.addEventListener('input', function(event) {
        // Obtener el valor actual del campo de apellido
        var lastName = event.target.value;

        // Expresi�n regular para validar solo letras y espacios, incluyendo � y di�resis
        var regex = /^[A-Za-z��\u00C0-\u017F\s]+$/;

        // Validar el valor ingresado
        if (lastName === '') {
            // El campo est� vac�o
            frmLastNameInput.classList.remove('is-valid');
            frmLastNameInput.classList.remove('is-invalid');
        } else if (regex.test(lastName)) {
            // El valor es v�lido
            frmLastNameInput.classList.remove('is-invalid');
            frmLastNameInput.classList.add('is-valid');
        } else {
            // El valor es inv�lido
            frmLastNameInput.classList.remove('is-valid');
            frmLastNameInput.classList.add('is-invalid');
        }
    });
</script>


	<!-- VALIDACION CAMPO TIPO Y NUMERO DE DOCUMENTO -->
	<script>
    // Obtener los campos de selecci�n y entrada
    var frmTypeDocumentSelect = document.getElementById('frmType_document');
    var frmNumberDocumentInput = document.getElementById('frmNumber_document');
    var numberDocument = '';

    // Agregar event listener para el evento 'change' en el campo de tipo de documento
    frmTypeDocumentSelect.addEventListener('change', function(event) {
        // Restablecer las clases de validaci�n
        frmNumberDocumentInput.classList.remove('is-valid');
        frmNumberDocumentInput.classList.remove('is-invalid');
        frmTypeDocumentSelect.classList.remove('is-invalid');

        // Obtener el valor actual del campo de tipo de documento seleccionado
        var selectedType = event.target.value;
        numberDocument = frmNumberDocumentInput.value.trim();

        // Validar el valor ingresado solo si se ha seleccionado un tipo de documento y se ha ingresado un n�mero de documento
        if (selectedType !== '' && numberDocument !== '') {
            if (selectedType === 'DNI' && numberDocument.length === 8) {
                frmNumberDocumentInput.classList.remove('is-invalid');
                frmNumberDocumentInput.classList.add('is-valid');
            } else if (selectedType === 'CNE' && numberDocument.length === 9) {
                frmNumberDocumentInput.classList.remove('is-invalid');
                frmNumberDocumentInput.classList.add('is-valid');
            } else {
                frmNumberDocumentInput.classList.remove('is-valid');
                frmNumberDocumentInput.classList.add('is-invalid');
            }
        }
    });

    // Agregar event listener para el evento 'input' en el campo de n�mero de documento
    frmNumberDocumentInput.addEventListener('input', function(event) {
        // Obtener el valor actual del campo de n�mero de documento
        numberDocument = event.target.value.trim();
        var selectedType = frmTypeDocumentSelect.value;

        // Validar el valor ingresado solo si se ha seleccionado un tipo de documento y se ha ingresado un n�mero de documento
        if (selectedType !== '' && numberDocument !== '') {
            if (selectedType === 'DNI' && numberDocument.length === 8) {
                frmNumberDocumentInput.classList.remove('is-invalid');
                frmNumberDocumentInput.classList.add('is-valid');
            } else if (selectedType === 'CNE' && numberDocument.length === 9) {
                frmNumberDocumentInput.classList.remove('is-invalid');
                frmNumberDocumentInput.classList.add('is-valid');
            } else {
                frmNumberDocumentInput.classList.remove('is-valid');
                frmNumberDocumentInput.classList.add('is-invalid');
            }
        } else {
            frmNumberDocumentInput.classList.remove('is-valid');
            frmNumberDocumentInput.classList.remove('is-invalid');
        }
    });
</script>

	<!-- VALIDACION CAMPO TIPO DE DOCUMENTO -->
	<script>
		// Obtener el campo de entrada de Tipo de Documento
		var tipoDocumentoInput = document.getElementById('frmType_document');

		// Obtener el elemento del check
		var tipoDocumentoIcon = document.getElementById('frmType_document');

		// Agregar un event listener para el evento 'input'
		tipoDocumentoInput.addEventListener('input', function(event) {
			// Obtener el valor actual del campo de Tipo de Documento y eliminar los espacios en blanco
			var tipoDocumento = event.target.value.trim();

			// Validar el valor ingresado
			if (tipoDocumento === '') {
				// El campo est� vac�o
				tipoDocumentoInput.classList.remove('is-valid');
				tipoDocumentoInput.classList.remove('is-invalid');
				tipoDocumentoIcon.style.display = 'none';
			} else if (/^[A-Z]+$/.test(tipoDocumento)) {
				// El valor es v�lido: solo letras en may�scula
				tipoDocumentoInput.classList.remove('is-invalid');
				tipoDocumentoInput.classList.add('is-valid');
				tipoDocumentoIcon.style.display = 'inline-block';
			} else {
				// El valor es inv�lido
				tipoDocumentoInput.classList.remove('is-valid');
				tipoDocumentoInput.classList.add('is-invalid');
				tipoDocumentoIcon.style.display = 'none';
			}
		});
	</script>


	<!-- VALIDACION CAMPO EMAIL -->

	<script>
    // Obtener el campo de entrada de Email
    var emailInput = document.getElementById('frmEmail');

    // Agregar un event listener para el evento 'input'
    emailInput.addEventListener('input', function(event) {
        // Obtener el valor actual del campo de Email
        var email = event.target.value.trim();

        // Validar el valor ingresado
        if (email === '') {
            // El campo est� vac�o
            emailInput.classList.remove('is-valid');
            emailInput.classList.remove('is-invalid');
        } else if (/^.+@.+\..+$/.test(email)) {
            // El valor es v�lido (contiene el car�cter "@" y ".")
            emailInput.classList.remove('is-invalid');
            emailInput.classList.add('is-valid');
        } else {
            // El valor es inv�lido
            emailInput.classList.remove('is-valid');
            emailInput.classList.add('is-invalid');
        }
    });
</script>

	<!-- VALIDACION CAMPO CELULAR -->
	<script>
    // Obtener el campo de entrada de Celular
    var celularInput = document.getElementById('frmCellphone');

    // Agregar un event listener para el evento 'input'
    celularInput.addEventListener('input', function(event) {
        // Obtener el valor actual del campo de Celular
        var celular = event.target.value.trim();

        // Validar el valor ingresado
        if (/^9\d{0,8}$/.test(celular) && celular.length === 9) {
            // El valor es v�lido
            celularInput.classList.remove('is-invalid');
            celularInput.classList.add('is-valid');
        } else {
            // El valor es inv�lido
            celularInput.classList.remove('is-valid');
            celularInput.classList.add('is-invalid');
        }
    });
</script>

	<!-- VALIDACION CAMPO GRADO -->
<script>
    // Obtener el campo de selecci�n de puntos
    var frmGradeSelect = document.getElementById('frmGrade');

    // Agregar un event listener para el evento 'change' ya que estamos trabajando con un select
    frmGradeSelect.addEventListener('change', function(event) {
        // Obtener el valor actual del campo de puntos
        var points = event.target.value;

        // Validar el valor ingresado
        if (points === '') {
            // El campo est� vac�o
            frmGradeSelect.classList.remove('is-valid');
            frmGradeSelect.classList.add('is-invalid');
        } else {
            // El valor es v�lido
            frmGradeSelect.classList.remove('is-invalid');
            frmGradeSelect.classList.add('is-valid');
        }
    });	
</script>



	<script>
    // Obtener el campo de entrada de secci�n
    var frmSectionInput = document.getElementById('frmSection');

    // Agregar un event listener para el evento 'input'
    frmSectionInput.addEventListener('input', function(event) {
        // Obtener el valor actual del campo de secci�n
        var section = event.target.value.toLowerCase(); // Convertir a min�sculas para hacer la comparaci�n sin distinci�n de may�sculas/min�sculas

        // Validar el valor ingresado
        if (section === 'cliente nuevo' || section === 'cliente existente') {
            // El valor es v�lido
            frmSectionInput.classList.remove('is-invalid');
            frmSectionInput.classList.add('is-valid');
        } else {
            // El valor es inv�lido
            frmSectionInput.classList.remove('is-valid');
            frmSectionInput.classList.add('is-invalid');
        }
    });
</script>

	<script>
function exportToExcel() {
	  // Obtener la referencia a la tabla
	  var table = document.querySelector('.table');

	  // Obtener todas las filas de la tabla
	  var rows = Array.from(table.querySelectorAll('tbody tr'));

	  // Crear una matriz para almacenar los datos del archivo de Excel
	  var excelData = [];

	  // Iterar sobre cada fila y obtener los datos de las celdas
	  rows.forEach(function(row) {
	    var rowData = [];
	    var cells = Array.from(row.querySelectorAll('td'));

	    // Obtener el texto de cada celda y agregarlo a la matriz de datos
	    cells.forEach(function(cell) {
	      rowData.push(cell.textContent.trim());
	    });

	    // Agregar la fila de datos a la matriz del archivo de Excel
	    excelData.push(rowData);
	  });

	  // Crear una nueva hoja de c�lculo de Excel
	  var workbook = XLSX.utils.book_new();

	  // Crear una hoja de trabajo
	  var worksheet = XLSX.utils.aoa_to_sheet(excelData);

	  // Agregar la hoja de trabajo al libro de Excel
	  XLSX.utils.book_append_sheet(workbook, worksheet, 'Tabla');

	  // Generar un archivo de Excel binario
	  var excelBuffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });

	  // Convertir el buffer de Excel a un blob
	  var blob = new Blob([excelBuffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });

	  // Crear un enlace temporal para descargar el archivo de Excel
	  var link = document.createElement('a');
	  link.href = window.URL.createObjectURL(blob);
	  link.download = 'Activos.xlsx';

	  // Simular el clic en el enlace para descargar el archivo de Excel
	  link.click();
	}
</script>
	<script>
function exportToCSV() {
	  // Obtener la referencia a la tabla
	  var table = document.querySelector('.table');

	  // Obtener todas las filas de la tabla
	  var rows = Array.from(table.querySelectorAll('tbody tr'));

	  // Crear una matriz para almacenar los datos del CSV
	  var csvData = [];

	  // Iterar sobre cada fila y obtener los datos de las celdas
	  rows.forEach(function(row) {
	    var rowData = [];
	    var cells = Array.from(row.querySelectorAll('td'));

	    // Obtener el texto de cada celda y agregarlo a la matriz de datos
	    cells.forEach(function(cell) {
	      rowData.push(cell.textContent.trim());
	    });

	    // Agregar la fila de datos al CSV
	    csvData.push(rowData.join(','));
	  });

	  // Crear el contenido del archivo CSV
	  var csvContent = csvData.join('\n');

	  // Crear un enlace temporal para descargar el archivo CSV
	  var link = document.createElement('a');
	  link.href = 'data:text/csv;charset=utf-8,' + encodeURI(csvContent);
	  link.target = '_blank';
	  link.download = 'Activos.csv';

	  // Simular el clic en el enlace para descargar el archivo CSV
	  link.click();
}
</script>
</body>
</html>