package himedia.examproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import himedia.examproject.domain.Item;
import himedia.examproject.domain.ItemForm;
import himedia.examproject.repository.ItemRepository;

@Controller
@RequestMapping("/store/items")
public class ItemController {

	private final ItemRepository itemRepository;
	
	@Autowired
	public ItemController(ItemRepository itemRepository) {
		this.itemRepository = itemRepository;
	}
	
	@GetMapping
	public String items(Model model) {
		List<Item> items = itemRepository.findAll();
		model.addAttribute("items", items);
		return "store/items";
	}
	
	@GetMapping("/{itemId}")
	public String search(@PathVariable("itemId") Long itemId, Model model) {
		Item findItem = itemRepository.findById(itemId);
		model.addAttribute("findItem", findItem);
		
		return "store/item";
	}
	
	@GetMapping("/add")
	public String add() {
		return "store/addForm";
	}
	
	@PostMapping("/add")
	public String add2(ItemForm itemForm) {
		Item item = new Item();
		item.setItemName(itemForm.getItemName());
		item.setPrice(itemForm.getPrice());
		item.setQuantity(itemForm.getQuantity());
		
		itemRepository.save(item);
		
		return "redirect:/store/items";
	}
	
	@GetMapping("/edit/{itemId}")
	public String update(@PathVariable("itemId") Long itemId, Model model) {
		Item findItem = itemRepository.findById(itemId);
		model.addAttribute("findItem", findItem);
		return "store/editForm";
	}
	
	@PostMapping("/edit/{itemId}")
	public String update2(@PathVariable("itemId") Long itemId, ItemForm itemForm) {
		Item item = new Item();
		item.setItemName(itemForm.getItemName());
		item.setPrice(itemForm.getPrice());
		item.setQuantity(itemForm.getQuantity());
		
		itemRepository.update(itemId, item);
		return "redirect:/store/items";
	}
	
}
