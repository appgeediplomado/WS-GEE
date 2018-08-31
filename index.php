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

	$data = [
		'total_resultados' => count($resultados),
		'ponente_datos' => 'http://roman.cele.unam.mx/wsgee/ponentes/:ponenteId',
		'ponentes' => $resultados
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
	$data['error'] = 'Función no implementada';
	return $response->withJson($data, 501);
});

$app->get('/trabajos', function(Request $request, Response $response) {
	$resultados = $this->dataAccess->getTrabajos();

	$data = [
		'total_resultados' => count($resultados),
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

$app->get('/asistentes/{asistenteId}/bitacora', function(Request $request, Response $response, $args) {
	$id = filter_var($args['asistenteId'], FILTER_VALIDATE_INT);

	if (!$id) {
		$data = ['error' => 'Parámetro incorrecto'];
		return $response->withJson($data, 400);
	}

	$resultado = $this->dataAccess->getBitacora($id);

	$data = [
		'asistencias' => $resultado
	];

	return $response->withJson($data);
});

$app->post('/asistentes/{id}/registro', function(Request $request, Response $response, $args) {
	$data['error'] = 'Función no implementada';
	return $response->withJson($data, 501);

/*	$asistenteId = $args['id'];
	$fecha = date('Y-m-d');

	// Valido IP

	$data = $this->dataAccess->setAsistencia($asistenteId, $fecha);

	return $response->withJson($data);
*/});

// Ejecutar la aplicación
$app->run();