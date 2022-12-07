package himedia.seventhspring.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import himedia.seventhspring.domain.Item;
import himedia.seventhspring.repository.SpringDataJpaItemRepository;
import lombok.RequiredArgsConstructor;

// @RequiredArgsConstructor : lombok에 있는 어노테이션으로, 의존성 주입을 하기 위한 생성자를 자동으로 만들어 처리해준다.
@RequestMapping("/store/items")
@RequiredArgsConstructor
@Controller
public class ItemController {

	private final SpringDataJpaItemRepository itemRepository;
//	private final JpaItemRepository itemRepository;
//	private final JdbcItemRepository itemRepository;
//	private final ItemRepository itemRepository;
	
//	@Autowired
//	public ItemController(ItemRepository itemRepository) {
//		this.itemRepository = itemRepository;
//	}
	
	// @PostConstruct : 의존성 주입 이후에 초기 설정을 하고 싶을 때 사용하는 어노테이션.
	// 의존성 주입이 끝나면 아래 메서드가 자동으로 실행됨
//	@PostConstruct
//	public void testData() {
//		itemRepository.save(new Item("사과", 2000, 200));
//		itemRepository.save(new Item("포도", 12000, 100));
//		itemRepository.save(new Item("바나나", 1500, 300));
//	}
	
	/**
	 * [상품 목록] 
	 */
	@GetMapping
	public String items(Model model) {
		List<Item> itemList = itemRepository.findAll();
		model.addAttribute("itemList", itemList);
		return "store/items";
	}
	
	/**
	 * [상품 상세 페이지] 
	 */
	@GetMapping("/search")
	public String itemSearch(@RequestParam String itemName, Model model) {
		Optional<Item> findItem = itemRepository.findByItemName(itemName);
		if(findItem.isPresent())
			model.addAttribute("findItem", findItem.get());
		return "store/item";
	}
	@GetMapping("/{itemId}")
	public String item(@PathVariable Long itemId, Model model) {
		Item findItem = itemRepository.findById(itemId).get();
		model.addAttribute("findItem", findItem);
		return "store/item";
	}
	
	/**
	 * [상품 수정 페이지] 
	 */
	@GetMapping("/{itemId}/edit")
	public String edit(@PathVariable Long itemId, Model model) {
		Item findItem = itemRepository.findById(itemId).get();
		model.addAttribute("findItem", findItem);
		return "store/editForm";
	}
	
	/**
	 * [상품 수정]
	 * [Post방식에서 redirect를 사용해야 하는 이유1]
	 * - "/store/items" 요청이 들어오면, 상품 목록을 model에 담아 view에 전달하여 
	 * 	 저장되어 있는 상품 목록들을 보여주는 items.html view를 응답해주는 컨트롤러가 구현되어있다.
	 * - 하지만, Post 방식으로 상품을 수정한 후 상품 목록으로 이동하려고 할 때,
	 *   "/store/items"를 return 하면 저장되어 있는 상품 목록이 보여지지 않는다.
	 *   Why? 단지 물리적인 view를 찾아서 보여주기 때문이다.
	 *   따라서, "redirect:/store/items"를 return 하면 사용자가 요청한 것처럼 재요청하여, 
	 *   "/store/items"와 매핑되는 컨트롤러를 실행시켜 view에 데이터를 담아 보여줄 수 있게 된다. 
	 *   
	 * - redirect 되어 들어오는 요청은 GET 방식이다.
	 * - GET 방식이지만, POST 방식처럼 URI는 보이지 않는다.
	 */
	@PostMapping("/{itemId}/edit")
	public String editSave(@PathVariable Long itemId, @ModelAttribute Item item) {
		itemRepository.update(itemId, item);
		
		return "redirect:/store/items/{itemId}";
	}
	
	/**
	 * [상품 등록 페이지]
	 */
	@GetMapping("/add")
	public String add() {
		return "store/addForm";
	}
	
	/**
	 * [상품 등록]
	 * <방법1> 
	 * - 사용자가 새로고침(F5)을 누르면, POST 요청을 계속해서 재요청한다.
	 * - 문제점 : 같은 데이터가 계속 등록(저장)된다.
	 * - 원인 	: F5를 하면, 마지막 작업(POST)이 반복된다.
	 */
//	@PostMapping("/add")
//	public String addSave(@ModelAttribute Item item) {
//		itemRepository.save(item);
//		return "/store/item";
//	}
	
	/**
	 * [상품 등록]
	 * <방법2> 
	 * - 사용자가 새로고침(F5)을 누르면, GET 요청한다.
	 * - redirect를 해주면 새로고침을 해도 GET으로 요청되기 때문에 계속해서 등록되지 않는다.
	 * - PRG 패턴 : Post -> Redirect -> Get
	 * 
	 * - 문제점 : 재요청하면, encoding이 안된다.
	 */
//	@PostMapping("/add")
//	public String addSave(@ModelAttribute Item item) {
//		itemRepository.save(item);
//		return "redirect:/store/items/" + item.getItemName();
//	}
	
	/**
	 * [상품 등록]
	 * <방법3> 
	 * - RedirectAttributes interface를 사용한다.
	 * - RedirectAttributes의 addAttribute를 사용하면, 응답 URI에 변수를 사용할 수 있다.
	 * - 응답 URI에 사용하지 않은 addAttribute한 변수는 Query string으로 추가된다. 
	 */
	@PostMapping("/add")
	public String addSave(@ModelAttribute Item item, RedirectAttributes redirectAttributes) {
		Item savedItem = itemRepository.save(item);
		redirectAttributes.addAttribute("itemId", savedItem.getId());
		redirectAttributes.addAttribute("itemName", savedItem.getItemName());
		return "redirect:/store/items/{itemId}";
	}
}
