package com.developer.SpringMySQL.controllers;

import com.developer.SpringMySQL.models.AppUsers;
import com.developer.SpringMySQL.models.AppUsersRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    AppUsersRepo appRepo;


    private static int counter = 0;

    //Переходим на главную страницу
//    @RequestMapping("/")
//    public ModelAndView goHomePage() {
//        ModelAndView mv = new ModelAndView("index");
//        mv.addObject("lists", appRepo.findAll());
//        return mv;
//    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView listUsers(@RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView("index");

        List<AppUsers> users = new ArrayList<AppUsers>();
        for (int i = 0; i < appRepo.count()+500; i++) {
            if (appRepo.findOne(i) != null)
            users.add(appRepo.findOne(i));
        }
        PagedListHolder<AppUsers> pagedListHolder = new PagedListHolder<AppUsers>(users);
        pagedListHolder.setPageSize(10);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if(page==null || page < 1 || page > pagedListHolder.getPageCount())
            page=1;

        modelAndView.addObject("page", page);

        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("listUsers", pagedListHolder.getPageList());
            pagedListHolder.getPageList();
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            modelAndView.addObject("listUsers", pagedListHolder.getPageList());
        }

        modelAndView.addObject("user", new AppUsers());

        return modelAndView;
    }

    //Переходим на страницу добавления книг
    @RequestMapping("/add")
    public ModelAndView goAddPage() {
        ModelAndView mv = new ModelAndView("add");
        mv.addObject("lists", appRepo.findAll());
        return mv;
    }

    //Сохраняем результат добавления или редактирования
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView doSave(@RequestParam("id") String id, @RequestParam("title") String title,
                               @RequestParam("description") String description, @RequestParam("author") String author,
                               @RequestParam("isbn") String isbn, @RequestParam("printyear") String printYear,
                               @RequestParam("readalready") String readAlready) {
        ModelAndView mv = new ModelAndView("redirect:/");
        AppUsers users;
        if (!id.isEmpty()) {
            users = /*(AppUsers)*/appRepo.findOne(Integer.valueOf(id));
            users.setReadAlready(false);
        } else {
            users = new AppUsers();
        }
        users.setTitle(title);
        users.setDescription(description);
        users.setAuthor(author);
        users.setIsbn(isbn);
        users.setPrintYear(Integer.valueOf(printYear));
        appRepo.save(users);
        return mv;
    }

    //Если использовать не POST, а GET, то аналогичный код будет работать со ссылками:
    // Пр: <a href="/view/${list.id}">View</a>
    @RequestMapping(value = "/view/{id}", method = RequestMethod.POST)
    public ModelAndView doView(@PathVariable("id") int id) {
        ModelAndView mv = new ModelAndView("view");
        mv.addObject("lists", appRepo.findOne(id));
        if (!appRepo.findOne(id).readAlready) {
            AppUsers appUsers = (AppUsers)appRepo.findOne(id);
            appUsers.readAlready = true;
            appRepo.save(appUsers);
        }
        return mv;
    }

    //Запрос с поля поиска на главной странице
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public ModelAndView doSearch(@RequestParam("printyear") String printYear) {
        ModelAndView mv = new ModelAndView("search");
        List<AppUsers> users = new ArrayList<AppUsers>();
        for (int i = 0; i < appRepo.count()+500; i++) {
            if (appRepo.findOne(i) != null && appRepo.findOne(i).printYear == Integer.parseInt(printYear)) {
                users.add(appRepo.findOne(i));
            }
        }
        mv.addObject("search", users);
        mv.addObject("user", new AppUsers());
        return mv;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    public ModelAndView doDelete(@PathVariable("id") int id) {
        ModelAndView mv = new ModelAndView("redirect:/");
        appRepo.delete(id);
        return mv;
    }

    @RequestMapping(value = "/editor/{id}", method = RequestMethod.POST)
    public ModelAndView doEdit2(@PathVariable("id") int id) {
        ModelAndView mv = new ModelAndView("edit");
        mv.addObject("lists", appRepo.findOne(id));
        return mv;
    }
}
