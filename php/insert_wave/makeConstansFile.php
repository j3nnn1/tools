<?php 
    
$han = fopen("Wave2501Real.csv", "r");
$i = 0;
$finalMerge = [];
$beforeIndexName = '';
$configArray = [];

while ($line = fgetcsv($han, 0, ',', '"')) {
    $i++;
    $stringLine = $line[0];
    print_r($stringLine, true);
}

#var_export($configArray);
