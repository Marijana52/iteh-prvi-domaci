<?php

class Gym
{
    public $id;
    public $userid;
    public $name;
    public $city;
    public $type;
    public $address;

    public function __construct(
        $id,
        $userid,
        $name,
        $city,
        $type,
        $address
    ) {
        $this->id = $id;
        $this->userid = $userid;
        $this->name = $name;
        $this->city = $city;
        $this->type = $type;
        $this->address = $address;
    }

    public function createGym()
    {
        $host = 'localhost';
        $user = 'admin';
        $password = 'admin';
        $database = 'gymspot';
        $conn = mysqli_connect($host, $user, $password, $database);

        $query = "INSERT INTO gym(userid, name, city, type, address)
            VALUES('$this->userid', '$this->name', '$this->city', '$this->type', '$this->address')";

        if (mysqli_query($conn, $query)) {
            header('Location: index.php');
        } else {
            echo 'Error: ' . mysqli_error($conn);
        }
    }
}
