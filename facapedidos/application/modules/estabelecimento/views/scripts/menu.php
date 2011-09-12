<?php

foreach ($this->container as $page)
{

    //echo $this->navigation()->menu()->htmlify($page), PHP_EOL;

    if ($this->navigation()->accept($page))//verifica se tem permissao de acordo com a ACL
    {

        echo '<li><a href="' . $page->module . $page->controller . '"><img src="' . $page->image . '" border="0" />' . $page->label . '</a></li>', PHP_EOL;
    }
}
?>    