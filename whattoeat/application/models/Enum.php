<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Enum
 *
 * @author masdeval
 */
abstract class Enum{

    static $BINARY_FLAG = 1;
    /**
     * This function must be called to initialize the enumeration!
     *
     * @param bool $flags If the USE_BINARY flag is provided, the enum values will be binary flag values. Default: no flags set.
     */
    public static function init($flags = 0){
        //First, we want to get a list of all static properties of the enum class. We'll use the ReflectionClass for this.
        $enum = get_called_class();
        $ref = new ReflectionClass($enum);
        $items = $ref->getStaticProperties();
        //Now we can start assigning values to the items.
        if ($flags & self::$BINARY_FLAG){
            //If we want binary flag values, our first value should be 1.
            $value = 1;
            //Now we can set the values for all items.
            foreach ($items as $key=>$item){
                if (!isset($item)){
                    //If no value is set manually, we should set it.
                    $enum::$$key = $value;
                    //And we need to calculate the new value
                    $value *= 2;
                } else {
                    //If there was already a value set, we will continue starting from that value, but only if that was a valid binary flag value.
                    //Otherwise, we will just skip this item.
                    if ($key != 0 && ($key & ($key - 1) == 0))
                        $value = 2 * $item;
                }
            }
        } else {
            //If we want to use regular indices, we'll start with index 0.
            $value = 0;
            //Now we can set the values for all items.
            foreach ($items as $key=>$item){
                if (!isset($item)){
                    //If no value is set manually, we should set it, and increment the value for the next item.
                    $enum::$$key = $value;
                    $value++;
                } else {
                    //If a value was already set, we'll continue from that value.
                    $value = $item+1;
                }
            }
        }
    }
}
?>
