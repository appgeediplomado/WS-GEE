<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require "vendor/autoload.php";

// Configuración para la aplicación
$config['displayErrorDetails'] = \Gee\Config::DEBUG;

// Crear la aplicación con la configuración dada
$app = new \Slim\App(['settings' => $config]);

// Obtener una referencia al contenedor de dependencias
$container = $app->getContainer();

// Agregar la dependencia para acceso de datos
$container['dataAccess'] = function($c) {
	$settings = $c['settings']['db'];
	$dns = sprintf("mysql:host=%s;dbname=%s", \Gee\Config::DB_HOST, \Gee\Config::DB_NAME);

	$pdo = new PDO($dns, \Gee\Config::DB_USER, \Gee\Config::DB_PASSWORD);
	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
	$pdo->query("SET NAMES " . \Gee\Config::CHARSET);

	return new \Gee\DataAccess($pdo);
};

// Rutas de la aplicación

$app->get('/ponentes', function(Request $request, Response $response) {
	$resultados = $this->dataAccess->getPonentes();
	$ponentes = [];

	foreach ($resultados as  $resultado) {
		$ponente = [
			'id' => $resultado['id'],
			'nombre'  => $resultado['nombre'],
			'apellidos' => $resultado['apellidos'],
			'institucion' => $resultado['institucion'],
			'foto' => $resultado['foto'],
		];

		$ponentes[] = $ponente;
	}

	$data = [
		'total_resultados' => count($ponentes),
		'ponente_datos' => 'http://roman.cele.unam.mx/wsgee/ponentes/:ponenteId',
		'ponentes' => $ponentes
	];

	return $response->withJson($data);
});

$app->get('/ponentes/{ponenteId}', function(Request $request, Response $response, $args) {
	$id = filter_var($args['ponenteId'], FILTER_VALIDATE_INT);

	if (!$id) {
		$data = ['error' => 'Parámetro incorrecto'];
		return $response->withJson($data, 400);
	}

	$resultado = $this->dataAccess->getPonente($id);

	if (!$resultado) {
		$data = ['error' => 'Ponente no encontrado'];
		return $response->withJson($data, 404);
	}

	$data = [
		'ponente_trabajos' => \Gee\Config::BASE_URL . '/ponentes/' . $resultado['id'] . '/trabajos',
		'datos' => $resultado
	];

	return $response->withJson($data);
});

$app->get('/ponentes/{ponenteId}/trabajos', function(Request $request, Response $response) {
	$data['error'] = 'Función aún no implementada';
	return $response->withJson($data, 501);
});

$app->get('/trabajos', function(Request $request, Response $response) {
	// $headers = $request->getHeaders();
	// $header = $request->getHeader('GEE_TIMESTAMP');

	$resultados = $this->dataAccess->getTrabajos();

	$data = [
		'total_resultados' => count($resultados),
		'trabajo_detalle' => \Gee\Config::BASE_URL . '/trabajos/:trabajoId',
		'trabajos' => $resultados
	];

	return $response->withJson($data);
});

$app->get('/trabajos/pagina/{noPagina}', function(Request $request, Response $response, $args) {
	$numeroPagina = $args["noPagina"];
	$resultados = $this->dataAccess->getTrabajosPaginados($numeroPagina, \Gee\Config::LONGITUD_PAGINA);

	if (count($resultados) == 0) {
		$data = ['error' => 'Página no encontrado'];
		return $response->withJson($data, 404);
	}

	$totalResultados = $this->dataAccess->getTotalTrabajos();

	$data = [
		'pagina' => $numeroPagina,
		'longitud_pagina' => \Gee\Config::LONGITUD_PAGINA,
		'numero_paginas' => ceil($totalResultados / \Gee\Config::LONGITUD_PAGINA),
		'trabajo_detalle' => \Gee\Config::BASE_URL . '/trabajos/:trabajoId',
		'trabajos' => $resultados
	];

	return $response->withJson($data);
});

$app->get('/trabajos/{trabajoId}', function(Request $request, Response $response, $args) {
	$id = filter_var($args['trabajoId'], FILTER_VALIDATE_INT);

	if (!$id) {
		$data = ['error' => 'Parámetro incorrecto'];
		return $response->withJson($data, 400);
	}

	$resultado = $this->dataAccess->getTrabajo($id);

	if (!$resultado) {
		$data = ['error' => 'Trabajo no encontrado'];
		return $response->withJson($data, 404);
	}

	$ponenteId = $resultado['ponenteId'];
	unset($resultado['ponenteId']);

	$data = [
		'ponente_detalle' => \Gee\Config::BASE_URL . '/ponentes/' . $ponenteId,
		'datos'  => $resultado
	];

	return $response->withJson($data);
});

$app->get('/asistentes', function(Request $request, Response $response) {
	$resultados = $this->dataAccess->getAsistentes();

	$data = [
		'total_resultados' => count($resultados),
		'asistente_detalle' => \Gee\Config::BASE_URL . '/asistentes/:asistenteId',
		'asistente_bitacora' => Gee\Config::BASE_URL . '/asistentes/:asistenteId/bitacora',
		'asistente_registro' => Gee\Config::BASE_URL . '/asistentes/:asistenteId/registro',
		'asistentes' => $resultados
	];

	return $response->withJson($data);
});

$app->get('/asistentes/{asistenteId}', function(Request $request, Response $response, $args) {
	$id = filter_var($args['asistenteId'], FILTER_VALIDATE_INT);

	if (!$id) {
		$data = ['error' => 'Parámetro incorrecto'];
		return $response->withJson($data, 400);
	}

	$resultado = $this->dataAccess->getAsistente($id);

	if (!$resultado) {
		$data = ['error' => 'Asistente no encontrado'];
		return $response->withJson($data, 404);
	}

	$data = [
		'bitacora' => \Gee\Config::BASE_URL . '/asistentes/' . $resultado['id'] . '/bitacora',
		'asistente' => $resultado
	];

	return $response->withJson($data);
});

$app->get('/asistentes/sesion/{correo}', function(Request $request, Response $response, $args) {
	$resultado = $this->dataAccess->buscarAsistente($args['correo']);

	if (!$resultado) {
		$data = ['error' => 'Asistente no encontrado'];
		return $response->withJson($data, 404);
	}

	$data = [
		'bitacora' => \Gee\Config::BASE_URL . '/asistentes/' . $resultado['id'] . '/bitacora',
		'asistente' => $resultado
	];

	return $response->withJson($data);
});

$app->get('/asistentes/{asistenteId}/bitacora', function(Request $request, Response $response, $args) {
	$id = filter_var($args['asistenteId'], FILTER_VALIDATE_INT);

	if (!$id) {
		$data = ['error' => 'Parámetro incorrecto'];
		return $response->withJson($data, 400);
	}

	$asistente = $this->dataAccess->getAsistente($id);

	if (!$asistente) {
		$data = [
			'error' => 'Asistente no encontrado'
		];

		return $response->withJson($data, 404);
	}

	$resultado = $this->dataAccess->getBitacora($id);

	$data = [
		'asistencias' => $resultado
	];

	return $response->withJson($data);
});

$app->post('/asistentes/{asistenteId}/registro', function(Request $request, Response $response, $args) {
	$asistenteId = $args['asistenteId'];
	$fecha = date('Y-m-d');

	// Valido IP

	$asistente = $this->dataAccess->getAsistente($asistenteId);

	if (!$asistente) {
		$data = [
			'error' => 'Asistente no encontrado'
		];

		return $response->withJson($data, 404);
	}

	$this->dataAccess->setAsistencia($asistenteId, $fecha);

	$data = [
		'bitacora' => \Gee\Config::BASE_URL . '/asistentes/' . $asistenteId . '/bitacora'
	];

	return $response->withJson($data, 201);
});

$app->get('/asistentes/{asistenteId}/retroalimentacion', function(Request $request, Response $response, $args) {
	$asistenteId = $args['asistenteId'];
	$resultados = $this->dataAccess->getRetroalimentacionAsistente($asistenteId);
	$data = [
		'retroalimentacion' =>  $resultados
	];

	return $response->withJson($data);
});

$app->post('/asistentes/{asistenteId}/retroalimentacion/{trabajoId}', function(Request $request, Response $response, $args) {
	$asistenteId = $args['asistenteId'];
	$trabajoId = $args['trabajoId'];

	$body = $request->getParsedBody();
	$ponencia = $body['ponencia'];
	$ponente = $body['ponente'];
	$relevancia = $body['relevancia'];

	try {
		$this->dataAccess->setCalificacion($asistenteId, $trabajoId, $ponencia, $ponente, $relevancia);
	} catch (Exception $e) {
		return $e->getMessage();
	}

	$data = [
		'retroalimentacion' => \Gee\Config::BASE_URL . 'asistentes/' . $asistenteId . '/retroalimentacion/' . $trabajoId
	];

	return $response->withJson($data, 201);
});

$app->delete('/asistentes/{asistenteId}/retroalimentacion/{trabajoId}', function(Request $request, Response $response, $args) {
	$asistenteId = $args['asistenteId'];
	$trabajoId = $args['trabajoId'];

	$this->dataAccess->removeRetroalimentacion($asistenteId, $trabajoId);
});

$app->get('/', function(Request $request, Response $response, $args) {
	$body = $this->dataAccess->getServicios();
	$response->getBody()->write($body);
	return $response;
});


// Ejecutar la aplicación
$app->run();