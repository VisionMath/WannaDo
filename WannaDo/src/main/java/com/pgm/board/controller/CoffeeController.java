package com.pgm.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pgm.board.model.Coffee;
import com.pgm.board.service.CoffeeService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/coffee/*")
public class CoffeeController {

    List<Coffee> coffeeList = new ArrayList<>();
    List<String> selectList = new ArrayList<>();

    @Autowired
    private CoffeeService coffeeService;

    @GetMapping("all")
    public String listPage(Model model,
	    @PageableDefault(size = 15, sort = "id", direction = Sort.Direction.ASC) Pageable pageable) {

	Page<Coffee> lists = coffeeService.findAll(pageable);

	long pageSize = pageable.getPageSize();
	long rowNm = coffeeService.count();
	long totPage = (long) Math.ceil((double) rowNm / pageSize);
	long currPage = pageable.getPageNumber();
	System.out.println("CurrPag==============" + currPage);

	long startPage = ((currPage) / pageSize) * pageSize;
	long endPage = startPage + pageSize;
	if (endPage > totPage)
	    endPage = totPage;

	boolean prev = startPage > 0 ? true : false;
	boolean next = endPage < totPage ? true : false;

	model.addAttribute("pageSize", pageSize);
	model.addAttribute("startPage", startPage);
	model.addAttribute("endPage", endPage - 1);
	model.addAttribute("prev", prev);
	model.addAttribute("next", next);
	model.addAttribute("count", rowNm);
	model.addAttribute("lists", lists);
	model.addAttribute("totPage", totPage);
	model.addAttribute("cp", currPage);

	return "coffee/all";
    }

    @GetMapping("single")
    public String listSingle(Model model,
	    @PageableDefault(size = 15, sort = "id", direction = Sort.Direction.ASC) Pageable pageable) {

	Page<Coffee> lists = coffeeService.findByType("싱글 오리진", pageable);

	long pageSize = pageable.getPageSize();
	long rowNm = lists.getTotalElements();
	long totPage = (long) Math.ceil((double) rowNm / pageSize);
	long currPage = pageable.getPageNumber();
	System.out.println("CurrPag==============" + currPage);

	long startPage = ((currPage) / pageSize) * pageSize;
	long endPage = startPage + pageSize;
	if (endPage > totPage)
	    endPage = totPage;

	boolean prev = startPage > 0 ? true : false;
	boolean next = endPage < totPage ? true : false;

	model.addAttribute("pageSize", pageSize);
	model.addAttribute("startPage", startPage);
	model.addAttribute("endPage", endPage - 1);
	model.addAttribute("prev", prev);
	model.addAttribute("next", next);
	model.addAttribute("count", rowNm);
	model.addAttribute("lists", lists);
	model.addAttribute("totPage", totPage);
	model.addAttribute("cp", currPage);

	return "coffee/all";
    }

    @GetMapping("blend")
    public String listBlend(Model model,
	    @PageableDefault(size = 15, sort = "id", direction = Sort.Direction.ASC) Pageable pageable) {

	Page<Coffee> lists = coffeeService.findByType("블렌드", pageable);

	long pageSize = pageable.getPageSize();
	long rowNm = lists.getTotalElements();
	long totPage = (long) Math.ceil((double) rowNm / pageSize);
	long currPage = pageable.getPageNumber();
	System.out.println("CurrPag==============" + currPage);

	long startPage = ((currPage) / pageSize) * pageSize;
	long endPage = startPage + pageSize;
	if (endPage > totPage)
	    endPage = totPage;

	boolean prev = startPage > 0 ? true : false;
	boolean next = endPage < totPage ? true : false;

	model.addAttribute("pageSize", pageSize);
	model.addAttribute("startPage", startPage);
	model.addAttribute("endPage", endPage - 1);
	model.addAttribute("prev", prev);
	model.addAttribute("next", next);
	model.addAttribute("count", rowNm);
	model.addAttribute("lists", lists);
	model.addAttribute("totPage", totPage);
	model.addAttribute("cp", currPage);

	return "coffee/all";
    }

    @GetMapping("decaffeine")
    public String listDeCaffeine(Model model,
	    @PageableDefault(size = 15, sort = "id", direction = Sort.Direction.ASC) Pageable pageable) {

	Page<Coffee> lists = coffeeService.findByType("디카페인", pageable);

	long pageSize = pageable.getPageSize();
	long rowNm = lists.getTotalElements();
	long totPage = (long) Math.ceil((double) rowNm / pageSize);
	long currPage = pageable.getPageNumber();
	System.out.println("CurrPag==============" + currPage);

	long startPage = ((currPage) / pageSize) * pageSize;
	long endPage = startPage + pageSize;
	if (endPage > totPage)
	    endPage = totPage;

	boolean prev = startPage > 0 ? true : false;
	boolean next = endPage < totPage ? true : false;

	model.addAttribute("pageSize", pageSize);
	model.addAttribute("startPage", startPage);
	model.addAttribute("endPage", endPage - 1);
	model.addAttribute("prev", prev);
	model.addAttribute("next", next);
	model.addAttribute("count", rowNm);
	model.addAttribute("lists", lists);
	model.addAttribute("totPage", totPage);
	model.addAttribute("cp", currPage);

	return "coffee/all";
    }

    @PostMapping("select")
    public String active(@RequestParam(value = "active") String active, Model model,
	    @PageableDefault(size = 15, sort = "id", direction = Sort.Direction.ASC) Pageable pageable) {

	if (selectList.contains(active)) {
	    selectList.remove(active);

	    for (int i = (coffeeList.size() - 1); i > -1; i--) {
		boolean inval = false;
		Coffee coffee = coffeeList.get(i);
		if (coffee.getTaste().contains(active)) {
		    for (String s : selectList) {
			if (coffee.getTaste().contains(s)) {
			    inval = true;
			    break;
			}
		    }
		    if (!inval) {
			coffeeList.remove(coffee);
		    }
		}
	    }
	} else {
	    selectList.add(active);
	    List<Coffee> getList = coffeeService.findByTaste(active);
	    for (Coffee coffee : getList) {
		if (!coffeeList.contains(coffee)) {
		    coffeeList.add(coffee);
		}
	    }
	}

	Page<Coffee> lists = new PageImpl<>(coffeeList, pageable, coffeeList.size());

	long pageSize = pageable.getPageSize();
	long rowNm = lists.getTotalElements();
	long totPage = (long) Math.ceil((double) rowNm / pageSize);
	long currPage = pageable.getPageNumber();
	System.out.println("CurrPag==============" + currPage);

	long startPage = ((currPage) / pageSize) * pageSize;
	long endPage = startPage + pageSize;
	if (endPage > totPage)
	    endPage = totPage;

	boolean prev = startPage > 0 ? true : false;
	boolean next = endPage < totPage ? true : false;

	model.addAttribute("pageSize", pageSize);
	model.addAttribute("startPage", startPage);
	model.addAttribute("endPage", endPage - 1);
	model.addAttribute("prev", prev);
	model.addAttribute("next", next);
	model.addAttribute("count", rowNm);
	model.addAttribute("lists", lists);
	model.addAttribute("totPage", totPage);
	model.addAttribute("cp", currPage);

	return "coffee/select";
    }

    /*
     * @GetMapping("detail") public String detail(@RequestParam("bno") Long id,
     * Model model) { model.addAttribute("coffee", coffeeService.findById(id));
     * return "/coffee/detail"; }
     */

    @GetMapping({ "{id}" })
    public String view(@PathVariable("id") Long id, Model model) {
	System.out.println(id);
	model.addAttribute("coffee", coffeeService.findById(id));
	return "coffee/detail";
    }

    /*
     * @GetMapping("orderVO") public String orderVOForm(@RequestParam("orderVO_id")
     * Long coffee_id, Model model) { Coffee coffee =
     * coffeeService.findById(coffee_id);
     * 
     * model.addAttribute("coffee", coffee); return "orderVO/orderVOForm"; }
     */
}
