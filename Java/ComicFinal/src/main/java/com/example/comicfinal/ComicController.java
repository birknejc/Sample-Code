package com.example.comicfinal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import jakarta.validation.Valid;

/**
 * Controller class for managing comic-related operations.
 */
@Controller
@RequestMapping("/comics")
public class ComicController {

    private final ComicRepository comicRepository;

    @Autowired
    public ComicController(ComicRepository comicRepository) {
        this.comicRepository = comicRepository;
    }

    /**
     * Retrieves a list of comics and displays them in the index page.
     *
     * @param model The model to add the list of comics to.
     * @return The name of the Thymeleaf template to render.
     */
    @GetMapping
    public String listComics(Model model) {
        Iterable<Comic> comics = comicRepository.findAll();
        model.addAttribute("comics", comics);
        return "index"; // Use the index.html template for the home page
    }

    /**
     * Displays the index page.
     *
     * @param model The model to be passed to the template.
     * @return The name of the Thymeleaf template to render.
     */
    @GetMapping("/index")
    public String showIndex(Model model) {
        return "index"; // Return the index.html template
    }

    /**
     * Displays the index page when accessing the root URL ("/").
     *
     * @param model The model to be passed to the template.
     * @return The name of the Thymeleaf template to render.
     */
    @GetMapping("/")
    public String root(Model model) {
        return listComics(model);
    }

    /**
     * Displays the view comic form with a list of comics.
     *
     * @param model The model to add the list of comics and selected comic to.
     * @return The name of the Thymeleaf template to render.
     */
    @GetMapping("/view")
    public String showViewForm(Model model) {
        Iterable<Comic> comics = comicRepository.findAll();
        model.addAttribute("comics", comics);
        model.addAttribute("selectedComic", new Comic()); // Initialize selectedComic
        return "view_comic"; // Thymeleaf template name
    }

    /**
     * Displays details of a selected comic.
     *
     * @param comicId The ID of the comic to be displayed.
     * @param model   The model to add the selected comic to.
     * @return The name of the Thymeleaf template to render.
     */
    @PostMapping("/view")
    public String viewComic(@RequestParam("comicId") int comicId, Model model) {
        Comic comic = comicRepository.findById(comicId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid comic Id: " + comicId));
        model.addAttribute("comic", comic);
        return "view_comic"; // Thymeleaf template for displaying comic details
    }

    /**
     * Displays the form for adding a new comic.
     *
     * @param model The model to add an empty comic to.
     * @return The name of the Thymeleaf template to render.
     */
    @GetMapping("/new")
    public String showComicForm(Model model) {
        model.addAttribute("comic", new Comic());
        return "create_comic"; // Thymeleaf template name for creating a new comic
    }

    /**
     * Handles the submission of the new comic form.
     *
     * @param comic  The comic object with form data.
     * @param result The validation result.
     * @return A redirection to the comics list page or the form page if there are errors.
     */
    @PostMapping
    public String createComic(@ModelAttribute @Valid Comic comic, BindingResult result) {
        if (result.hasErrors()) {
            return "create_comic"; // Return back to the form if there are validation errors
        }

        comicRepository.save(comic);
        return "redirect:/comics";
    }

    /**
     * Displays the edit comic form with a list of comics.
     *
     * @param model The model to add the list of comics and selected comic to.
     * @return The name of the Thymeleaf template to render.
     */
    @GetMapping("/edit")
    public String showEditForm(Model model) {
        Iterable<Comic> comics = comicRepository.findAll();
        model.addAttribute("comics", comics);
        model.addAttribute("selectedComic", new Comic()); // Initialize selectedComic
        return "edit_comic"; // Thymeleaf template name
    }

    /**
     * Handles the submission of the edit comic form.
     *
     * @param selectedComic The comic object with updated data.
     * @param result        The validation result.
     * @return A redirection to the comics list page or the form page if there are errors.
     */
    @PostMapping("/edit")
    public String updateComic(@ModelAttribute @Valid Comic selectedComic, BindingResult result) {
        if (result.hasErrors()) {
            return "edit_comic"; // Return back to the form if there are validation errors
        }

        Comic comic = comicRepository.findById(selectedComic.getComicId())
                .orElseThrow(() -> new IllegalArgumentException("Invalid comic Id: " + selectedComic.getComicId()));

        // Update the comic properties
        comic.setPublisher(selectedComic.getPublisher());
        comic.setSeries(selectedComic.getSeries());
        comic.setVolume(selectedComic.getVolume());
        comic.setIssue(selectedComic.getIssue());
        comic.setPrice(selectedComic.getPrice());
        comic.setGrade(selectedComic.getGrade());
        comic.setRarity(selectedComic.getRarity());
        comic.setFirstAppearance(selectedComic.isFirstAppearance());

        comicRepository.save(comic);
        return "redirect:/comics";
    }

    /**
     * Deletes a comic based on its ID.
     *
     * @param comicId The ID of the comic to be deleted.
     * @return A redirection to the comics list page.
     */
    @PostMapping("/delete")
    public String deleteComic(@RequestParam("comicId") int comicId) {
        comicRepository.deleteById(comicId);
        return "redirect:/comics";
    }

}
