package com.pgm.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pgm.board.model.Coffee;
import com.pgm.board.model.OrderVO;
import com.pgm.board.model.User;
import com.pgm.board.service.CoffeeService;
import com.pgm.board.service.OrderVOService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/*")
public class OrderVOController {

    @Autowired
    private CoffeeService coffeeService;

    @Autowired
    private OrderVOService orderVOService;

    @GetMapping("order")
    public String orderVOForm(@RequestParam("order_id") Long coffee_id, Model model) {

	Coffee coffee = coffeeService.findById(coffee_id);
	model.addAttribute("coffee", coffee);
	return "order/orderForm";
    }

    @PostMapping("orderConfirm")
    @ResponseBody
    public String insert(@RequestBody OrderVO orderVO) {
	orderVOService.insert(orderVO);
	return "success";
    }

    @GetMapping(value = { "orderResult", "mypage" })
    public String orderResult(Model model, HttpSession session) {

	User sUser = (User) session.getAttribute("sUser");
	String userid = sUser.getUserid();

	List<OrderVO> orderList = orderVOService.findByUserid(userid);
	for (OrderVO order: orderList) {
	    Coffee coffee = coffeeService.findById(order.getCoffeeid());
	    order.setCoffeeImage(coffee.getImage());
	    order.setTaste(coffee.getTaste());
	    order.setBlend(coffee.getBlend());
	}
	
	model.addAttribute("orderList", orderList);
	return "order/orderResult";
    }

}
