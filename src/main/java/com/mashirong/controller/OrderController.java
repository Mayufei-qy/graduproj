package com.mashirong.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mashirong.IDao.DishMapper;
import com.mashirong.IDao.ShopMapper;
import com.mashirong.domain.Dish;
import com.mashirong.domain.Order;
import com.mashirong.domain.OrderCon;
import com.mashirong.domain.Shop;
import com.mashirong.domain.TmpDish;
import com.mashirong.domain.TmpOrder;
import com.mashirong.domain.User;
import com.mashirong.service.OrderConService;
import com.mashirong.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired(required=true)
	private ShopMapper sm;
	
	@Autowired(required=true)
	private DishMapper dm;
	
	@Autowired
	private OrderService os;
	
	@Autowired
	private OrderConService ocs;
	
	@RequestMapping("/toOrderPage")
	public String toOrderPage(int shopId, int dishId, Model model){
		/*model.addAttribute("shopId", shopId);
		model.addAttribute("dishId", dishId);*/
		Shop shop = sm.selectByPrimaryKey(shopId);
		List<Dish> dishList = dm.selectAllDishInTheShop(shopId);
		model.addAttribute("shopinfo", shop);
		model.addAttribute("dish_of_shop", dishList);
		return "/shoppage.jsp";
	}

	@RequestMapping("/toConfigOrderPage")
	public String toConfigOrderPage(String shopId, Model model){
		model.addAttribute("shopid", shopId);
		return "/configorderpage.jsp";
	}
	
	@RequestMapping("/orderManage")
	@ResponseBody
	public Map orderManage(@RequestBody List<TmpDish> list, HttpSession hSession){
		TmpDish td = null;
		User user = (User) hSession.getAttribute("user");
		Order order = new Order();
		OrderCon orderCon = new OrderCon();
		if (null != list && list.size() > 0) {
			td = list.get(0);
			order.setShopid(td.getShopId());
			order.setOrdernote(td.getOrderNote());
			order.setUserid(user.getUserid());
		}
		os.GenerateOrder(order);
		
		System.out.println(list.size());
		System.out.println(order);
		for(TmpDish td1:list){
			orderCon.setOrderid(order.getOrderid());
			orderCon.setDishid(td1.getDishId());
			orderCon.setDishnum(td1.getDishNum());
			ocs.GenerateOrderCon(orderCon);
//			System.out.println(td1.toString());
		}
		Map<String,String> map = new HashMap<>();
		map.put("ordermsg", "true");
		return map;
	}
	
	@RequestMapping("/toUserOrderListPage")
	public String toUserOrderListPage(HttpSession hSession, Model model){
		User user = (User) hSession.getAttribute("user");
		if(user != null){
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			List<TmpOrder> orderList = new ArrayList<>();
			List<Order> list = os.getOrdersOfUser(user.getUserid());
			for(Order order : list){
				int packingBox = 0;
				float totalPrice = 0;
				TmpOrder tmpOrder = new TmpOrder();
				tmpOrder.setFlowNum(order.getFlownum());
				tmpOrder.setOrderTime(df.format(order.getOrdertime()));
				List<OrderCon> tmpList = ocs.getOrderConsOfOrder(order.getOrderid());
				Iterator it = tmpList.iterator();
				while(it.hasNext()){
				    OrderCon oc = (OrderCon) it.next();
				    totalPrice += (oc.getDishPrice() * oc.getDishnum() + oc.getDishnum()) ;
				    packingBox += oc.getDishnum();
				}
				tmpOrder.setTotalPrice(totalPrice);
				tmpOrder.setPackingBox(packingBox);
				tmpOrder.setDishList(tmpList);
				orderList.add(tmpOrder);
			}
			/*System.out.println(user);
			System.out.println(orderList.size());*/
			String flagStr = "false";
			if(orderList.size() >= 1){
				flagStr = "true";
			}
			model.addAttribute("orderlist", orderList);
			model.addAttribute("haveorders", flagStr);
			return "/userorderlist.jsp";
		}else{
			return "redirect:/";
		}
	}
}
