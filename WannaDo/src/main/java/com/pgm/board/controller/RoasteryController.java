package com.pgm.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pgm.board.model.Roastery;
import com.pgm.board.service.RoasteryService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/roastery/*")
public class RoasteryController {

	@Autowired
	private RoasteryService roasteryService;

	@GetMapping("all")
	public String listPage(Model model,
			@PageableDefault(size = 12, sort = "rid", direction = Sort.Direction.ASC) Pageable pageable) {

		Page<Roastery> lists = roasteryService.findAll(pageable);

		long pageSize = pageable.getPageSize();
		long rowNm = roasteryService.count();
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

		return "roastery/all";
	}

	/*
	 * @GetMapping("detail") public String detail(@RequestParam("bno") Long id,
	 * Model model) { model.addAttribute("roastery", roasteryService.findById(id));
	 * return "/roastery/detail"; }
	 */

	@GetMapping({ "{rid}" })
	public String view(@PathVariable("rid") Long rid, Model model) {
		model.addAttribute("roastery", roasteryService.findByRid(rid));
		return "roastery/detail";
	}
}
