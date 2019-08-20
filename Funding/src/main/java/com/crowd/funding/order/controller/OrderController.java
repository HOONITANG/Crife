package com.crowd.funding.order.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.crowd.funding.member.model.MemberDTO;
import com.crowd.funding.myorder.domain.MyorderDTO;
import com.crowd.funding.order.domain.OrderDTO;
import com.crowd.funding.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Inject
	OrderService orderService;
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@RequestMapping(value="/reservation/{pro_id}", method = RequestMethod.POST)
	public String orderInsert(Model model, OrderDTO orderDTO, @PathVariable("pro_id") int pro_id, 
			MyorderDTO myorderDTO, RedirectAttributes redirectAttributes, HttpSession session) throws Exception {
		System.out.println("reservation 동작체크");
		System.out.println("orderDTO phone value:"+"'"+orderDTO.getOrder_phone()+"'");
		MemberDTO memDTO = (MemberDTO) session.getAttribute("login");
		int memIdx = memDTO.getMem_idx();
		orderDTO.setMem_idx(memIdx);
		orderService.insert(orderDTO);
		int orderId = orderDTO.getOrder_id();
		
		System.out.println("memIdx:"+memIdx);
		//int memIdx = myorderDTO.getMem_idx();
	
		/*
		 * System.out.println("myoderDATA"+myoderDATA.getList());
		 * System.out.println("myorderDTO"+myorderDTO.getList());
		 * System.out.println("orderId"+orderId);
		 */
		for(int i = 0 ; i < myorderDTO.getOrderList().size(); i++) {
			myorderDTO.getOrderList().get(i).setOrder_id(orderId);
			myorderDTO.getOrderList().get(i).setMem_idx(memIdx);
			myorderDTO.getOrderList().get(i).setPro_id(pro_id);
			/*
			 * myorderDTO.getOrderList().get(i).setOrder_id(orderId);
			 * myorderDTO.getOrderList().get(i).setOrder_id(orderId);
			 */
		}
		orderService.myOrderInsert(myorderDTO.getOrderList());
		redirectAttributes.addAttribute("order_id", orderId);
		return "redirect:/order/orderbill";
	}
	
	@RequestMapping(value="/orderbill", method = RequestMethod.GET)
	public String orderBill(Model model,  @RequestParam("order_id") int order_id) throws Exception {
		model.addAttribute("order_id", order_id);
		return "/order/orderbill";	
	}

}
