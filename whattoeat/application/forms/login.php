<?php

class Form_login extends Zend_Form
{

    public function init()
    {

        $this->setMethod("post");

        $email = $this->createElement("text", "cpf", array("label" => "CPF", "class" => "input-g"))
                        ->setRequired(true)
                        ->addValidator('NotEmpty')
                        ->setErrorMessages(array("Digite um login válido."));

        $this->addElement($email);

        $senha = $this->createElement("password", "senha", array("label" => "Senha", "class" => "input-g"))
                        ->setRequired(true)
                        ->addValidator('NotEmpty')
                        ->setErrorMessages(array("Digite uma senha válida."));

        $this->addElement($senha);


        $submit = $this->createElement("submit", "submit", array("label" => "Login", "class" => "input-t"))
                        ->setRequired(true);

        $this->addElement($submit);
    }

}

