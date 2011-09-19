<?php

class Estabelecimento_ErrorController extends Zend_Controller_Action
{

    public function errorAction()
    {
        $errors = $this->_getParam('error_handler');

        //Se chega aqui já com uma msg de erro, exibe a msg.
        if ($this->_getParam('msg') != null)
        {
            $this->view->message = $this->_getParam('msg');
            return;
        }
        //Trata a excecao de acesso invalido
        else if ($errors->exception->getMessage() === 'Access denied')
        {
            $this->_setParam('error_handler', $errors);
            $this->_setParam('msg', 'Voce nao tem permissao para acessar essa pagina!');
            $this->_forward('error', 'error', 'estabelecimento');
            return;
            //$this->_helper->redirector->gotoUrl('error/error/msg/Voce nao tem permissao para acessar essa pagina!');
        }

        //Trata excecoes especificas do banco postgre
        switch ($errors->exception->getCode())
        {
          /*  case 23505: //Unique violation
                $this->_setParam('msg', 'Voce nao tem permissao para acessar essa pagina!');
                //$this->_setParam('id', $this->getRequest()->getParam("funcionarioId"));
                $this->_setParam('error_handler', null);
                $this->_forward($this->getRequest()->getParam("action"), $this->getRequest()->getParam("controller"), $this->getRequest()->getParam("module"));//encaminha para a mesma tela e exibe a msg de erro
                
                return;*/
        }


        //Trata alguns tipos de excecao
        switch ($errors->type)
        {
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ROUTE:
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_CONTROLLER:
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ACTION:

                // 404 error -- controller or action not found
                $this->getResponse()->setHttpResponseCode(404);
                $this->view->message = 'Page not found';
                break;

            default:
                // application error
                $this->getResponse()->setHttpResponseCode(500);
                $this->view->message = 'Application error';
                break;
        }

        // Log exception, if logger available
        if ($log = $this->getLog())
        {
            $log->crit($this->view->message, $errors->exception);
        }

        // conditionally display exceptions
        if ($this->getInvokeArg('displayExceptions') == true)
        {
            $this->view->exception = $errors->exception;
        }

        $this->view->request = $errors->request;
    }

    public function getLog()
    {
        $bootstrap = $this->getInvokeArg('bootstrap');
        if (!$bootstrap->hasPluginResource('Log'))
        {
            return false;
        }
        $log = $bootstrap->getResource('Log');
        return $log;
    }

}

