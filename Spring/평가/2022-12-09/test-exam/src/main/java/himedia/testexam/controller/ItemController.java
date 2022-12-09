package himedia.testexam.controller;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import himedia.testexam.domain.Item;
import himedia.testexam.service.ItemService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/store/items")
public class ItemController {
	private final ItemService itemService;
	
	@PostConstruct
	public void testData() {
		itemService.saveItem(new Item("사과", 2000, 200));
		itemService.saveItem(new Item("포도", 1500, 300));
		itemService.saveItem(new Item("귤", 500, 500));
	}
	
	@GetMapping
	public String item(Model model) {
		List<Item> itemList = itemService.findAllItems();
		model.addAttribute("itemList", itemList);
		return "store/items";
	}
	
	@GetMapping("/{itemId}")
	public String item(@PathVariable("itemId") Long itemId, Model model) {
		model.addAttribute("findItem", itemService.findByIdItem(itemId).get());
		return "store/item";
	}
	
	@GetMapping("/add")
	public String add() {
		return "store/addForm";
	}
	
	@GetMapping("/{itemId}/edit")
	public String edit(@PathVariable("itemId") Long itemId, Model model) {
		model.addAttribute("findItem", itemService.findByIdItem(itemId).get());
		return "store/editForm";
	}
}
