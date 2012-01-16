<?php

abstract class StatusPagamentoEnum extends Enum
{
   static $RECEM_CRIADO = 0;
   static $EM_ANALISE;
   static $CONCLUIDO;
   static $RECUSADO;
 
}

StatusPagamentoEnum::init();

/*
final class StatusPagamentoEnum {

    static $AGUARDANDO = null;
    static $EM_ANALISE = null;
    static $EFETUADO = null;
    static $FALHA = null;



    private $value = null;
    private $codigo = null;

    public static $valueMap;
    public static $codigoMap;

    public function __construct($codigo, $value) {
        $this->value = $value;
	$this->codigo = $codigo;
    }

    public static function init () {
        self::$AGUARDANDO  = new StatusPagamentoEnum("1","Aguardando");
        self::$EM_ANALISE  = new StatusPagamentoEnum("2","Em analise");
	self::$EFETUADO  = new StatusPagamentoEnum("3","Efetuado");
	self::$FALHA  = new StatusPagamentoEnum("4","Falhou");

        //static map to get object by name - example Enum::get("INIT") - returns Enum::$INIT object;
        self::$valueMap = array (
            "Aguardando" => self::$AGUARDANDO,
            "Em analise" => self::$EM_ANALISE,
	    "Efetuado" => self::$EFETUADO,
	    "Falhou" => self::$FALHA
        );

        self::$codigoMap = array (
            "Apple" => self::$APPLE,
            "Orange" => self::$ORANGE
        );


    }

    public static function get($element) {
        if($element == null)
            return null;
        return self::$map[$element];
    }

    public function getValue() {
        return $this->value;
    }

    public function equals(FruitsEnum $element) {
        return $element->getValue() == $this->getValue();
    }

    public function __toString () {
        return $this->value;
    }
}
*/
?>

