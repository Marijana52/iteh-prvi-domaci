<?php

$types[] = 'Membership Gym';
$types[] = '24 Hour Access Gym';
$types[] = 'Crossfit';
$types[] = 'Bootcamp';
$types[] = 'Personal Training Gym';
$types[] = 'Rockclimbing Gym';
$types[] = 'Powerlifting Gym';
$types[] = 'Big box Gym';
$types[] = 'Boutique Gym';
$types[] = 'Aerobic Gym';
$types[] = 'Training Gym';


$query = $_REQUEST['query'];
$suggestion = "";  // responseText

if ($query !== "") {
    $query = strtolower($query);
    $length = strlen($query);

    foreach ($types as $type) {
        if (stristr($query, substr($type, 0, $length))) {
            if ($suggestion == "") {
                $suggestion = $type;
            } else {
                $suggestion .= ", $type";
            }
        }
    }
}
if ($suggestion == "") {
    echo 'No suggestions';
} else {
    echo $suggestion;
}
