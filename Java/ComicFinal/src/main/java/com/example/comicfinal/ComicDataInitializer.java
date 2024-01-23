package com.example.comicfinal;

import com.example.comicfinal.Comic;
import com.example.comicfinal.ComicRepository;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

/**
 * Configuration class responsible for initializing the comic database with initial data.
 */
@Configuration
public class ComicDataInitializer {

    /**
     * Initializes the comic database with initial data.
     *
     * @param comicRepository The repository for accessing and managing Comic entities.
     * @return A CommandLineRunner instance for executing the database initialization logic.
     */
    @Bean
    public CommandLineRunner initializeComicDatabase(ComicRepository comicRepository) {
        return args -> {
            if (comicRepository.count() == 0) {
                Gson gson = new Gson();
                Type wrapperType = new TypeToken<ComicDataWrapper>() {}.getType();
                try (InputStreamReader reader = new InputStreamReader(new ClassPathResource("comic.json").getInputStream())) {
                    ComicDataWrapper wrapper = gson.fromJson(reader, wrapperType);
                    List<Comic> comics = wrapper.getComics().getRecords();
                    comicRepository.saveAll(comics);
                    System.out.println("Database seeded with comic data.");
                } catch (IOException e) {
                    System.err.println("Error reading comic.json: " + e.getMessage());
                }
            }
        };
    }

    /**
     * Wrapper class for deserializing JSON data into ComicsData.
     */
    private static class ComicDataWrapper {
        private ComicsData Comics;

        public ComicsData getComics() {
            return Comics;
        }
    }

    /**
     * Represents the data structure for deserializing comics data from JSON.
     */
    private static class ComicsData {
        private ArrayList<Comic> Records;

        public ArrayList<Comic> getRecords() {
            return Records;
        }
    }
}
