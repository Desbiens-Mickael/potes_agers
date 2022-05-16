<?php

namespace App\Model;

class UserManager extends AbstractManager
{
    public const TABLE = 'user';

    public function add($user): int
    {
        $statement = $this->pdo->prepare("INSERT INTO " . self::TABLE .
            " (`name`, `address`, `email`, `password`)
        VALUES ('default', 'default', 'default', :user)");

        $statement->bindValue(':user', $user, \PDO::PARAM_STR);

        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    public function selectOneByName(string $name): array|false
    {
        // prepared request
        $statement = $this->pdo->prepare("SELECT id FROM " . static::TABLE . " WHERE name=:name");
        $statement->bindValue(':name', $name, \PDO::PARAM_STR);
        $statement->execute();

        return $statement->fetch(\PDO::FETCH_NUM);
    }
    public function selectByAddress($address): array|false
    {
        $statement = $this->pdo->prepare("SELECT * FROM " . static::TABLE . " WHERE address=:address");
        $statement->bindValue('address', $address, \PDO::PARAM_STR);
        $statement->execute();

        return $statement->fetch();
    }
    public function selectByEmail($email): array|false
    {
        $statement = $this->pdo->prepare("SELECT * FROM " . static::TABLE . " WHERE email=:email");
        $statement->bindValue('email', $email, \PDO::PARAM_STR);
        $statement->execute();

        return $statement->fetch();
    }

    public function insert(array $credentials): int
    {
        $statement = $this->pdo->prepare("INSERT INTO " . static::TABLE .
            " (name, address, email, password, postal_code)
        VALUES (:name, :address, :email, :password, :postal_code)");
        $statement->bindValue(':name', $credentials['name']);
        $statement->bindValue(':address', $credentials['address']);
        $statement->bindValue(':email', $credentials['email']);
        $statement->bindValue(':password', password_hash($credentials['password'], PASSWORD_DEFAULT));
        $statement->bindValue(':postal_code', $credentials['address']);
        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }
}
