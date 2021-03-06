<?php
namespace Gee;

class DataAccess
{
	private $pdo;
	private $error;

	public function __construct($pdo) {
		$this->pdo = $pdo;
	}

	public function getError() {
		return $this->error;
	}

	public function getPonentes() {
		$statement = $this->pdo->query("SELECT id, nombre, apellidos, institucion, foto FROM ponente");

		return $statement->fetchAll();
	}

	public function getPonente($id) {
		$statement = $this->pdo->prepare("SELECT * FROM ponente WHERE id = :id");
		$statement->bindValue(':id', $id);
		$statement->execute();

		return $statement->fetch();
	}

	public function getTrabajos() {
		$sql = <<<eoq
SELECT
	trabajo.id, trabajo.titulo, catModalidad.modalidad,
	concat(ponente.nombre, ' ', ponente.apellidos) nombrePonente,
	fecha, hora, lugar
FROM trabajo, ponente, catModalidad
WHERE ponenteId = ponente.id and modalidadId = catModalidad.id
LIMIT 3
eoq;
		$statement = $this->pdo->query($sql);

		return $statement->fetchAll();
	}

	public function getTotalTrabajos() {
		$statement = $this->pdo->query("select count(id) from trabajo");
		return $statement->fetchColumn();
	}

	public function getTrabajosPaginados($numeroPagina = 1, $longitudPagina = 20) {
		$sqlFmt = <<<eoq
SELECT
	trabajo.id, trabajo.titulo, catModalidad.modalidad,
	concat(ponente.nombre, ' ', ponente.apellidos) nombrePonente,
	fecha, hora, lugar
FROM trabajo, ponente, catModalidad
WHERE ponenteId = ponente.id and modalidadId = catModalidad.id
LIMIT %d,%d
eoq;

		$inicio = ($numeroPagina - 1) * $longitudPagina;
		$sql = sprintf($sqlFmt, $inicio, $longitudPagina);
		$statement = $this->pdo->query($sql);

		return $statement->fetchAll();
	}

	public function getTrabajo($id) {
		$sql = <<<eoq
SELECT
	trabajo.id, trabajo.titulo, sinopsis, catModalidad.modalidad,
	trabajo.ponenteId, concat(ponente.nombre, ' ', ponente.apellidos) nombrePonente,
	fecha, hora, lugar
FROM trabajo, ponente, catModalidad
WHERE ponenteId = ponente.id and modalidadId = catModalidad.id and trabajo.id = :id
eoq;
		$statement = $this->pdo->prepare($sql);
		$statement->bindValue(':id', $id);
		$statement->execute();

		return $statement->fetch();
	}

	public function getAsistentes() {
		$statement = $this->pdo->query("SELECT id, nombre, apellidos FROM asistente");

		return $statement->fetchAll();
	}

	public function getAsistente($id) {
		$statement = $this->pdo->prepare("SELECT id, nombre, apellidos, 'Oculto por seguridad' correo FROM asistente WHERE id = :id");
		$statement->bindValue(':id', $id);
		$statement->execute();

		return $statement->fetch();
	}

	public function buscarAsistente($correo) {
		$statement = $this->pdo->prepare("SELECT id, nombre, apellidos, correo, password FROM asistente WHERE correo = :correo");
		$statement->bindValue(':correo', $correo);
		$statement->execute();

		return $statement->fetch();
	}

	public function getBitacora($asistenteId) {
		$statement = $this->pdo->prepare("SELECT dia FROM bitacora WHERE asistenteId = :id");
		$statement->bindValue(':id', $asistenteId);
		$statement->execute();

		return $statement->fetchAll(\PDO::FETCH_COLUMN);
	}

	public function setAsistencia($asistenteId, $dia) {
		// Buscar registro de asistencia para este día
		$statement = $this->pdo->prepare("SELECT * FROM bitacora WHERE asistenteId = :asistenteId AND dia = :dia");
		$statement->bindValue(':asistenteId', $asistenteId, \PDO::PARAM_INT);
		$statement->bindValue(':dia', $dia);
		$statement->execute();

		// Si no hay registro, insertarlo ahora
		if (!$statement->fetch()) {
			$statement = $this->pdo->prepare("INSERT INTO bitacora (id, asistenteId, dia) VALUES(NULL, :asistenteId, :dia)");
			$statement->bindValue(':asistenteId', $asistenteId, \PDO::PARAM_INT);
			$statement->bindValue(':dia', $dia);
			$statement->execute();
		}

		return $this->pdo->lastInsertId();
	}

	public function setCalificacion($asistenteId, $trabajoId, $ponencia, $ponente, $relevancia) {
		$sql = <<<eoq
			INSERT INTO retroalimentacion (id, asistenteId, trabajoId, ponencia, ponente, relevancia)
			VALUES (NULL, :asistenteId, :trabajoId, :ponencia, :ponente, :relevancia)
			ON DUPLICATE KEY UPDATE
				ponencia = VALUES(ponencia),
				ponente = VALUES(ponente),
				relevancia = VALUES(relevancia)
eoq;

		$statement = $this->pdo->prepare($sql);
		$statement->bindValue(':asistenteId', $asistenteId, \PDO::PARAM_INT);
		$statement->bindValue(':trabajoId', $trabajoId, \PDO::PARAM_INT);
		$statement->bindValue(':ponencia', $ponencia);
		$statement->bindValue(':ponente', $ponente);
		$statement->bindValue(':relevancia', $relevancia);
		$statement->execute();
	}

	public function getRetroalimentacionAsistente($asistenteId) {
		$sql = <<<eoq
			SELECT trabajo.titulo, retroalimentacion.calificacion
			FROM retroalimentacion, trabajo
			WHERE retroalimentacion.trabajoId = trabajo.id AND retroalimentacion.asistenteId = :asistenteId
eoq;

		$statement = $this->pdo->prepare($sql);
		$statement->bindValue(':asistenteId', $asistenteId);
		$statement->execute();

		return $statement->fetchAll();
	}

	public function removeRetroalimentacion($asistenteId, $trabajoId) {
		$statement = $this->pdo->prepare("DELETE FROM retroalimentacion WHERE asistenteId = :asistenteId AND trabajoId = :trabajoId");

		$statement->bindValue(':asistenteId', $asistenteId, \PDO::PARAM_INT);
		$statement->bindValue(':trabajoId', $trabajoId, \PDO::PARAM_INT);
		$statement->execute();
	}

	public function getServicios(){
		$body = "<h3>Referencias wsgee</h3>";
		$servicios = [	'Ponentes del evento' => \Gee\Config::BASE_URL . '/ponentes/',
					'Detalles de ponente' => \Gee\Config::BASE_URL . '/ponentes/{ponenteId}',
					'Trabajos de ponente' => \Gee\Config::BASE_URL . '/ponentes/{ponenteId}/trabajos',
					'Asistentes registrados' => \Gee\Config::BASE_URL . '/asistentes',
					'Detalles de asistente' => \Gee\Config::BASE_URL . '/asistentes/{asistenteId}',
					'Bitacora de asistentencia de asistente' => \Gee\Config::BASE_URL . '/asistentes/{asistenteId}/bitacora',
					'Registrar asistencia de usuario (POST)' => \Gee\Config::BASE_URL . '/asistentes/{asistenteId}/registro',
					'Bitacora de las ponencias evaluadas por un asistente' => \Gee\Config::BASE_URL . '/asistentes/{asistenteId}/retroalimentacion',
					'Registrar evaluación del asistente a una ponencia (POST [\'calificacion\']=[1-5])' => \Gee\Config::BASE_URL . '/asistentes/{asistenteId}/retroalimentacion/{trabajoId}',
					'Eliminar evaluación del asistente a una ponencia' => \Gee\Config::BASE_URL . '/asistentes/{asistenteId}/retroalimentacion/{trabajoId}'
					];
		$lista = '<ul>';
		foreach ($servicios as $key => $value) {
			$lista .= '<li>'.$key.': <i>'.$value.'</i></li>';
		}
		$lista .= '</ul>..';
		$body.=$lista;
		return $body;
	}
}