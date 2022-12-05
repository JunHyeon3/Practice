package himedia.seventhspring.controller;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import himedia.seventhspring.domain.Item;
import himedia.seventhspring.repository.ItemRepository;
import lombok.RequiredArgsConstructor;

// @RequiredArgsConstructor : lombok에 있는 어노테이션으로, 의존성 주입을 하기 위한 생성자를 자동으로 만들어 처리해준다.
@RequestMapping("/store/items")
@RequiredArgsConstructor
@Controller
public class ItemController {

	private final ItemRepository itemRepository;
//	@Autowired
//	public ItemController(ItemRepository itemRepository) {
//		this.itemRepository = itemRepository;
//	}
	
	// @PostConstruct : 의존성 주입 이후에 초기 설정을 하고 싶을 때 사용하는 어노테이션.
	// 의존성 주입이 끝나면 아래 메서드가 자동으로 실행됨
	@PostConstruct
	public void testData() {
		itemRepository.save(new Item("사과", 2000, 200));
		itemRepository.save(new Item("포도", 12000, 100));
		itemRepository.save(new Item("바나나", 1500, 300));
	}
	
	/**
	 * [상품 목록] ==========================
	 */
	@GetMapping
	public String items(Model model) {
		List<Item> itemList = itemRepository.findAll();
		model.addAttribute("itemList", itemList);
		return "store/items";
	}
	
	/**
	 * [상품 상세 페이지] ==========================
	 */
	@GetMapping("/{itemId}")
	public String item(@PathVariable Long itemId, Model model) {
		Item findItem = itemRepository.findById(itemId);
		model.addAttribute("findItem", findItem);
		return "store/item";
	}
	
	/**
	 * [상품 수정 페이지] ==========================
	 */
	@GetMapping("/{itemId}/edit")
	public String update() {
		return "store/editForm";
	}
	
}
