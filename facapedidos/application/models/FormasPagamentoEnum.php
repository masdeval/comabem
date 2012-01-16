
<?php

abstract class FormasPagamentoEnum extends Enum
{    
    static $PagSeguro = 1;
    static $MercadoPago   = 2;
    static $PayPal    = 3;
    static $GoogleCheckout = 4;
    static $Visa  = 5;
    static $Mastercard  = 6;
    static $VisaVale  = 7;
    static $Sodex    = 8;

}

FormasPagamentoEnum::init();
?>

