package com.example.comicfinal;

import org.springframework.data.repository.CrudRepository;

/**
 * A repository interface for managing Comic entities.
 * Extends the Spring Data CrudRepository for basic CRUD operations.
 *
 * @see Comic
 * @see org.springframework.data.repository.CrudRepository
 */
public interface ComicRepository extends CrudRepository<Comic, Integer> {
}
