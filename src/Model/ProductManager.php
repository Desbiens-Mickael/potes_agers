<?php

namespace App\Model;

class ProductManager extends AbstractManager
{
    public const TABLE = 'product';

    public function selectAll(string $orderBy = '', string $direction = 'ASC'): array
    {
        $query = 'SELECT *, p.id, p.name AS productName FROM ' . static::TABLE
            . ' AS p JOIN ' . CategoryManager::TABLE . ' AS c ON p.category_id=c.id ';
        if ($orderBy) {
            $query .= ' ORDER BY ' . $orderBy . ' ' . $direction;
        }

        return $this->pdo->query($query)->fetchAll();
    }

    /**
     * Insert new item in database
     */
    public function insert(array $product): int
    {
        $statement = $this->pdo->prepare("INSERT INTO " . self::TABLE .
        " (`name`, `message`, `image`, `category_id`, `user_id`) 
        VALUES (:name, :message, :image, :category_id, :user_id)");
        $statement->bindValue('name', $product['name'], \PDO::PARAM_STR);
        $statement->bindValue('message', $product['message'], \PDO::PARAM_STR);
        $statement->bindValue('image', $product['image'], \PDO::PARAM_STR);
        $statement->bindValue('category_id', $product['category'], \PDO::PARAM_INT);
        $statement->bindValue('user_id', $product['user_id'], \PDO::PARAM_INT);

        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }
}
