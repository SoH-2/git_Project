package mc.employee.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import mc.employee.Dto.EmployeeDto;
import mc.employee.Service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	// 사원 정보 조회
		@PostMapping("/sltEmp.do")
		public String sltEmp(Model model, @ModelAttribute EmployeeDto dto) throws Exception {

			List<Map<String, EmployeeDto>> list = employeeService.sltbxDno();
			List<Object> vDto = employeeService.sltEmp(dto);
			model.addAttribute("employee", vDto);
			model.addAttribute("department", list);
			return "sltEmp";
		}

	// 사원 정보 조회 - 필터
	@ResponseBody
	@PostMapping("/sltFtEmp")
	public Map<String, Object> sltFtEmp(Model model, @ModelAttribute EmployeeDto dto) throws Exception {
			System.out.println(dto.getDept_no());
			System.out.println(dto.getPosition());
		List<Map<String, EmployeeDto>> list = employeeService.sltbxDno();
		List<Object> vDto = employeeService.sltEmp(dto);
		
		Map<String, Object> map = new HashMap<>();
		map.put("department", list);
		map.put("employee",vDto);
		
		return map;
	}


	
	
	// 사원정보 상세 조회
	@PostMapping("/sltDtlEmp.do")
	public Object sltDtlEmp(Model model, @ModelAttribute EmployeeDto dto) throws Exception {
		List<Map<String, EmployeeDto>> list = employeeService.sltbxDno();
		EmployeeDto vDto = employeeService.sltDtlEmp(dto);
		model.addAttribute("employee", vDto);
		model.addAttribute("department", list);

		return "sltDtlEmp";
	}

	// 사원 정보 수정
	@PostMapping("/udtEmp.do")
	public String udtEmp(Model model, MultipartHttpServletRequest request, @ModelAttribute EmployeeDto dto)
			throws Exception {

		employeeService.udtEmp(dto, request);

		List<Map<String, EmployeeDto>> list = employeeService.sltbxDno();
		EmployeeDto vDto = employeeService.sltDtlEmp(dto);
		model.addAttribute("employee", vDto);
		model.addAttribute("department", list);

		return "sltDtlEmp";
	}

	// 사원 삭제
	@ResponseBody // ajax쓸 때 써줘야 값 jsp로 가져감..
	@PostMapping("/dltEmp.do")
	public Map<String, Object> dltEmp(Model model, HttpSession hs, @ModelAttribute EmployeeDto dto) throws Exception {

		hs.setAttribute("employee_no", 15200110);
		hs.setAttribute("authority", 2);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		String errMsg = "";
		String errCode = "";
		System.out.println("#### 컨트롤러");
		int cntatrt = employeeService.cntatrt(hs);
		if (cntatrt == 1) {
			employeeService.dltEmp(dto);
			errMsg = "정상적으로 변경되었습니다.";
			errCode = "1";
		} else {
			errMsg = "권한이 없습니다.";
			errCode = "0";
		}
		resultMap.put("errMsg", errMsg);
		resultMap.put("errCode", errCode);
		// model.addAttribute("map", resultMap);
		return resultMap;
	}

	// 사원 등록
	@PostMapping("/istEmp.do")
	public String istEmp(Model model, MultipartHttpServletRequest request, @ModelAttribute EmployeeDto dto) throws Exception {

		// 사원등록페이지로 가서 작성하게끔 처리하는것 필요.
		
		employeeService.istEmp(dto);
		employeeService.istEmpPt(dto, request);

		// 사원 정보 리스트 조회해서 뿌려주기
		
		List<Map<String, EmployeeDto>> list = employeeService.sltbxDno();
		List<Object> vDto = employeeService.sltEmp(dto);
		model.addAttribute("employee", vDto);
		model.addAttribute("department", list);
		return "sltEmp";
	}
	
	@PostMapping("/empInsert.do")
	public Object insertForm(Model model) throws Exception {
		List<Map<String, EmployeeDto>> map = employeeService.sltbxDno();
		model.addAttribute("department", map);
		return "empInsert";
	}
	
	
	@RequestMapping(value = "/deptInfo.do", produces = "text/plain;charset=UTF-8") 
	@ResponseBody
	public String deptInfo(@ModelAttribute EmployeeDto dto) {
		 
		EmployeeDto vDto = employeeService.deptInfo(dto);
		
		Gson gson = new Gson();
		return gson.toJson(vDto);
	}
}
