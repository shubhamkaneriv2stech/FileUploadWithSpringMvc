package com.shubham.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.shubham.entity.Employee;
import com.shubham.entity.FileBucket;
import com.shubham.entity.Showroom;
import com.shubham.service.ShowRoomService;

@Controller
@RequestMapping("/showRoom")
@EnableWebMvc
public class ShowRoomController {

	private static final Logger LOG = LoggerFactory.getLogger(ShowRoomController.class);

	@Autowired
	private ShowRoomService showRoomService;

	@GetMapping("/dataTable")
	public String products(Model model) throws JsonGenerationException, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		model.addAttribute("showRoomList", mapper.writeValueAsString(showRoomService.getShowRooms(null)));
		return "dataTable";
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchCustomers(@RequestParam("theSearchName") String theSearchName, Model model)
			throws JsonGenerationException, JsonMappingException, IOException {

		System.out.println(theSearchName);
		ObjectMapper mapper = new ObjectMapper();
		model.addAttribute("showRoomList", mapper.writeValueAsString(showRoomService.getShowRooms(theSearchName)));
		
		
		System.out.println(showRoomService.getShowRooms(theSearchName));

		return "dataTable";
	}

	@GetMapping("/showForm")
	public String showFormForAdd(Model theModel) {
		LOG.debug("inside show showRoom-form handler method");
		Showroom theShowRoom = new Showroom();
		theModel.addAttribute("showRooms", theShowRoom);

		return "showroom-form";
	}

	@GetMapping("/showEmployeeForm")
	public String showEmployeeFormForAdd(Model theModel) {
		LOG.debug("inside show showRoom-form handler method");

		Employee employee = new Employee();

		theModel.addAttribute("employee", employee);
		return "employee-form";
	}

	@PostMapping("/saveShowRoom")
	public String saveShowRoom(@ModelAttribute Showroom showRooms, BindingResult bindingResult) throws IOException {

		System.out.println(showRooms.getId());

		MultipartFile multipartFile = showRooms.getFile();
		System.out.println(multipartFile);

		showRooms.setImages(multipartFile.getBytes());

		String fileName = multipartFile.getOriginalFilename();
		showRooms.setName(fileName);

		File imageFile = new File("/home/v2stech/eclipse-workspace/FinalAssignment/src/main/webapp/resources/files", fileName);
		try {
			multipartFile.transferTo(imageFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		

		showRoomService.saveShowRoom(showRooms);
		return "redirect:/showRoom/dataTable";
	}

	/*
	 * @PostMapping("/saveShowRoom") public String
	 * saveShowRoom(@ModelAttribute("showRooms") Showroom theShowRoom) {
	 * 
	 * 
	 * 
	 * 
	 * MultipartFile multipartFile = theShowRoom.getContent();
	 * 
	 * document.setName(multipartFile.getOriginalFilename());
	 * document.setDescription(fileBucket.getDescription());
	 * document.setType(multipartFile.getContentType());
	 * document.setContent(multipartFile.getBytes()); document.setUser(user);
	 * userDocumentService.saveDocument(document);
	 * 
	 * 
	 * 
	 * String fileName = multipartFile.getOriginalFilename();
	 * 
	 * File imageFile = new File(
	 * "E:\\V2stech\\Spring4MVCFileUploadDownloadWithHibernate\\src\\main\\webapp\\static\\files",
	 * fileName); try { multipartFile.transferTo(imageFile); } catch (IOException e)
	 * { e.printStackTrace(); }
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * showRoomService.saveShowRoom(theShowRoom); return
	 * "redirect:/showRoom/dataTable"; }
	 */

	@PostMapping("/saveEmployee")
	public String saveEmployee(@ModelAttribute("employee") Employee employee) {
		showRoomService.saveEmployee(employee);
		return "redirect:/showRoom/dataTableEmployee";
	}

	@GetMapping("/updateForm")
	public String showFormForUpdate(@RequestParam("id") int id, Model theModel) {
		System.out.println(id + " update for id is");
		Showroom theShowRoom = showRoomService.getShowRoom(id);

		String file = theShowRoom.getName();
		
		System.out.println(file);

		theModel.addAttribute("showRooms", theShowRoom);
		return "showroom-form";
	}

	@ModelAttribute("list")
	public Map<Integer, String> getEngineerList() {
		return showRoomService.engineerList();

	}

	@GetMapping("/dataTableEmployee")
	public String Employee(Model model) throws JsonGenerationException, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();

		model.addAttribute("employeeList", mapper.writeValueAsString(showRoomService.getEmployee()));

		return "dataTableEmployee";
	}

	/*
	 * @RequestMapping(value = "/saveCar", method = RequestMethod.POST, consumes =
	 * MediaType.APPLICATION_JSON_VALUE , produces =
	 * MediaType.APPLICATION_JSON_VALUE)
	 * 
	 * @ResponseBody public StatusModel saveEquipmentsToUser(@RequestBody Employee
	 * employee, Model model) {
	 * 
	 * 
	 * try {
	 * 
	 * System.out.println(employee.getEmailId());
	 * System.out.println(employee.getFirstName());
	 * System.out.println(employee.getLastName());
	 * 
	 * showRoomService.saveEmployee(employee); return new StatusModel("Sucess");
	 * 
	 * } catch (Exception ex) { return new StatusModel("FAIL"); } }
	 */

	/*
	 * @GetMapping("/delete") public String
	 * deleteShowRoom(@RequestParam("showRoomId") int theId) {
	 * showRoomService.deleteShowRoom(theId); return "redirect:/showRoom/list"; }
	 * 
	 */

	/*
	 * @GetMapping("/list") public String listShowRooms(Model theModel) {
	 * List<Showroom> theShowRooms = showRoomService.getShowRooms();
	 * theModel.addAttribute("showRooms", theShowRooms); return "list-showRooms"; }
	 */
	/*
	 * @PostMapping(value = "/saveEquipmentsToUser", produces = "application/json")
	 * public @ResponseBody StatusModel saveEquipmentsToUser(@RequestBody Employee
	 * employee) { try { System.out.println(employee.getEmailId());
	 * System.out.println(employee.getFirstName());
	 * System.out.println(employee.getLastName());
	 * //showRoomService.saveEmployee(employee); return new StatusModel("Sucess");
	 * 
	 * } catch (Exception ex) { return new StatusModel("FAIL"); } }
	 * 
	 * 
	 * @PostMapping(value = "/saveShowRoom", produces = "application/json")
	 * public @ResponseBody StatusModel saveShowroomToUser(@RequestBody Showroom
	 * showroom) { try { System.out.println(showroom.getAddress1());
	 * System.out.println(showroom.getOwnerName());
	 * System.out.println(showroom.getOwnerName());
	 * //showRoomService.saveEmployee(employee); return new StatusModel("Sucess");
	 * 
	 * } catch (Exception ex) { return new StatusModel("FAIL"); } }
	 */

}