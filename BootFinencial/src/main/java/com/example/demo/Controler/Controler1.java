package com.example.demo.Controler;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.example.demo.model.Admin;
import com.example.demo.model.Invoice1;
import com.example.demo.model.Login;
import com.example.demo.model.Product1;
import com.example.demo.service.AdminService;
import com.example.demo.service.InvoiceService;
import com.example.demo.service.LoginService;
import com.example.demo.service.expencesesservices;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller
public class Controler1 {
	@Autowired
	private  AdminService adminservice;
	@Autowired
	private  InvoiceService invoiceservice;

	@Autowired
	private  LoginService loginservice;

	@Autowired
	private  expencesesservices expenceservice;

	@RequestMapping("/")
	public String home() {

		return "login";
	}

	@RequestMapping("/FinencialReport")
	public String fr() {

		return "FinencialReport";
	}

	@RequestMapping("/AddAdmin")
	public String addad() {

		return "AddAdmin";
	}

	@RequestMapping("/addexpenceform")
	public String addeform( HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
			//m.addAttribute("succes", succes);
			return "Add-Expences-form";
		}
		m.addAttribute("error", "Session out Please Login");
		return "login";
	}

	@RequestMapping("/addadminform")
	public String addadminform(HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
			return "AddAdmin";
		}
		m.addAttribute("error", "Session out Please Login");
		return "login";
	}

	@RequestMapping("/addinvoiceform")
	public String addiform(HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
			return "Create-Invoice-form";
		}
		m.addAttribute("error", "Session out Please Login");
		return "login";
	}

	@RequestMapping("/showreportform")
	public String showreport(HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username == null) {
			return "FinencialReport";
		}
		m.addAttribute("error", "Session out Please Login");
		return "login";
	}

	@RequestMapping("/dashboard")
	public String home1(HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
			return "dashboard";
		}
		m.addAttribute("error", "Session out Please Login");
		return "login";
	}

// logout Admin
	@RequestMapping("/logout")
	public String logOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		session.invalidate();
		return "login";
	}
//Add Expences

//-------------------------------------------------------------

	@PostMapping("/addexpences")
	public ModelAndView insert(@ModelAttribute Product1 product, Model m, HttpServletRequest request,
			RedirectAttributes ra) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
			product.setTotalamount((product.getPrice()) * (product.getQunatity()));
			boolean flag = expenceservice.insertExpences(product);

			// System.out.print(flag);
			if (flag) {

				ra.addFlashAttribute("succes", "<div>Add Expenses Succesfully</div>");
				return new ModelAndView(new RedirectView("addexpenceform"));
			}
			m.addAttribute("succes", "Expenses not Add");

		}
		m.addAttribute("error", "Session out Please Login");
		return new ModelAndView("login");

	}
//Invoice  AddAnd Generate 

//-------------------------------------------------------------

	
	@PostMapping("/addinvoice")
	public String insert(@ModelAttribute Invoice1 invoice, Model m, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
			invoice.setTotalamount((invoice.getPrice()) * (invoice.getQunatity()));
			boolean flag = invoiceservice.insertInvoice(invoice);
			m.addAttribute("l1", invoice);
			return "printinvoice";
		}
		m.addAttribute("error", "Session out Please Login");
		return "login";

	}
//Admin Registrion 

//-------------------------------------------------------------

	@PostMapping("/addadmin")
	public ModelAndView insert(@ModelAttribute Admin adminreg, HttpServletRequest request, Model m,
			RedirectAttributes ra) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
			if (adminservice.existsByUsername(adminreg.getEmail())) {

				ra.addFlashAttribute("succes", "<div>Username already exists</div>");
				return new ModelAndView(new RedirectView("AddAdmin"));
			} else {
				boolean flag = true;
				adminservice.insertAdmin(adminreg);
				// System.out.print(flag);
				if (flag) {

					ra.addFlashAttribute("succes", "<div> Add Succesfully Admin </div>");
					return new ModelAndView(new RedirectView("AddAdmin"));
				}
			}
			// m.addAttribute("succes", " Admin Not Add");
			// return "AddAdmin";
		}
		m.addAttribute("error", "Session out Please Login");
		return new ModelAndView("login");
		// return null;
	}
	// login Admin

	// -------------------------------------------------------------


	@PostMapping("/loginverify")
	public ModelAndView loginVerify(HttpServletRequest request,@ModelAttribute Login log,Model ra) {
		boolean e = loginservice.loginVerify(log.getEmail(),log.getPass());
		System.out.println("hhgghgh" + e);
		
		String username = log.getEmail();
		if (!e) {
			HttpSession session = request.getSession();
			//session.setAttribute("username", username);
		
			// Successful login, perform necessary actions //return
			return new ModelAndView("dashboard"); // Redirect to dashboard or desired page
		} else {
			ra.addAttribute("error", "Invalid username or password. Please try again.");

			return new ModelAndView("login"); // Return to login page with
		}

	}

	// Show Invoice

	// -------------------------------------------------------------

	@GetMapping("/showinvoice")
	public String showinvoice( Model m,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
			List<Invoice1> l1 = invoiceservice.showInvoice();
			//m.addAttribute("success", msg);
			m.addAttribute("l1", l1);

			return "updateinvoice";
		}
		m.addAttribute("error", "Session out Please Login");
		return "login";
	}

	// Delete Invoice
	// -------------------------------------------------------------
	
	@GetMapping("/deleteinvoice")
	public String deleteinvoic(@RequestParam int inid, Model m, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
		     invoiceservice.deleteInvoice(inid);
			m.addAttribute("msg", "");
			return "redirect:/showinvoice";
		}
		m.addAttribute("error", "Session out Please Login");
		return "login";

	}
	// update Invoice

	// -------------------------------------------------------------

	@PostMapping("/updateinvoice")
	public ModelAndView updateinvoic(@ModelAttribute Invoice1 invoice, Model m, HttpServletRequest request,
			RedirectAttributes ra) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
			invoice.setTotalamount((invoice.getPrice()) * (invoice.getQunatity()));
			boolean l1 = invoiceservice.updateinvoice(invoice,invoice.getInid());
			if (l1) {
               System.out.print("jjhvcjghmrygh");
				ra.addFlashAttribute("success", "<div>Update Successfully</div>");
				return new ModelAndView(new RedirectView("showinvoice"));
			} else {
				//m.addAttribute("msg", "");
				return new ModelAndView("showinvoice");
			}
		}
		m.addAttribute("error", "Session out Please Login");
		return new ModelAndView("login");

	}

	@RequestMapping("/returninvoiceform")
	public String returnform() {

		return "Create-Invoice-form";
	}
	// View Expences

	// -------------------------------------------------------------


	@GetMapping("/showexpences")
	public String showexpences(Model m,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
			List<Product1> l1 =expenceservice.showExpences();
			m.addAttribute("l1", l1);
			//m.addAttribute("success", msg);
			return "updateexpences";
		}
		m.addAttribute("error", "Session out Please Login");
		return "login";
	}
	// Delete Expences

	// -------------------------------------------------------------------
	
	@GetMapping("/deleteexpences")
	public String deleteexpences(@RequestParam int eid, Model m, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
		      expenceservice.deleteExpences(eid);
			m.addAttribute("msg", "");
			return "redirect:/showexpences?=msg";
		}

		m.addAttribute("error", "Session out Please Login");
		return "login";
	}
	// update Expences

	// -------------------------------------------------------------

	@PostMapping("/updateexpences")
	public ModelAndView updateexpences(@ModelAttribute Product1 product, Model m, HttpServletRequest request,
			RedirectAttributes ra) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
			product.setTotalamount((product.getPrice()) * (product.getQunatity()));
			boolean l1 = expenceservice.updateexpences(product,product.getEid());
			if (l1) {
				ra.addFlashAttribute("success", "<div>Update Successfully</div>");
				return new ModelAndView(new RedirectView("showexpences"));
			} else {
				ra.addFlashAttribute("success", "<div>Not Update Successfully</div>");
				return new ModelAndView(new RedirectView("showexpences"));
			}
		}
		m.addAttribute("error", "Session out Please Login");
		return new ModelAndView("login");
	}

	@GetMapping("/showfinencial")
	public ResponseEntity<Map<String,Double>> sowfinencial(@RequestParam String start, @RequestParam String end, Model m,
			HttpServletRequest request, RedirectAttributes ra) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username == null) {
			Map<String,Double> d1=new HashMap<String,Double>();
			Double l1 = invoiceservice.findTotalAmountInDateRange(start,end);
			Double l2 = expenceservice.findTotalAmountInDateRange(start, end);
			System.out.println("print date" + l1);
			if (l1.equals(null) && l2.equals(null)){

				ra.addFlashAttribute("msg", "Data Not Found");
				//return new ModelAndView(new RedirectView("FinencialReport"));
			} else {
				if (l1 == null){
					l1=0.0;
				}
				if (l2 == null) {
					l1=0.0;
				}
				System.out.print("null" + l1);
				/*
				 * m.addAttribute("profit", (l1- l2)); m.addAttribute("invoice", l1);
				 * m.addAttribute("expences", l2);
				 */
				d1.put("invoice",l1);
				d1.put("expences",l2);
				d1.put("profit",l1-l2);
				//return new ModelAndView("FinencialReport");
				return ResponseEntity.ok(d1);

			}
			// m.addAttribute("msg", "*Finencial Data Not Found");

		}
		m.addAttribute("error", "Session out Please Login");
		//return new ModelAndView("login");
		return null;

	}

	@RequestMapping("/exportInvoice")
	public ModelAndView exportinvoices(@RequestParam String start, @RequestParam String end, RedirectAttributes ra,
			HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
			List<Invoice1> l1 = invoiceservice.exportInvoicesByDateRange(start, end);

			System.out.println(start + "    " + end);
			if (l1.isEmpty()) {
				ra.addFlashAttribute("msg1", "<div>**Invoice Data Not Found</div>");
				// m.addAttribute("msg", "**Invoice Data Not Found");
				return new ModelAndView(new RedirectView("FinencialReport"));
				// return new ModelAndView("FinencialReport");
			}

			ra.addFlashAttribute("start", start);
			m.addAttribute("end", end);
			System.out.println("nvchgefbv trgxfbc ");
			m.addAttribute("l1", l1);

			return new ModelAndView("FinencialReport");
			// return "FinencialReport";
		}
		ra.addFlashAttribute("error", "Session out Please Login");
		// return "login";
		return new ModelAndView("login");
	}

	@RequestMapping("/exportexpencess")
	public ModelAndView exportexpencess(@RequestParam String start, @RequestParam String end, Model m,
			HttpServletRequest request, RedirectAttributes ra) throws IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
			List<Product1> l2 = expenceservice. exportExpencesByDateRange(start, end);

			System.out.println(start + "    " + end);
			if (l2.isEmpty()) {
				ra.addFlashAttribute("msg", "**Expencess Data Not Found");
				return new ModelAndView(new RedirectView("FinencialReport"));
			}
			m.addAttribute("start", start);
			m.addAttribute("end", end);
			m.addAttribute("l2", l2);
			return new ModelAndView("FinencialReport");
		}
		m.addAttribute("error", "Session out Please Login");

		return new ModelAndView("login");
	}


	@PostMapping("/export-invoice")
	public void exportInvoicesToExcel(@RequestParam String start, @RequestParam String end,
			HttpServletResponse response, Model m) throws IOException {
		/*
		 * HttpSession session = request.getSession(); String username = (String)
		 * session.getAttribute("username"); if (username != null) {
		 */
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=\"invoices.xlsx\"");
		System.out.println("export" + start + "    " + end);
		List<Invoice1> l1 = invoiceservice.exportInvoicesByDateRange(start, end);

		try (XSSFWorkbook workbook = new XSSFWorkbook()) {
			XSSFSheet sheet = workbook.createSheet("Invoices");

			// Create header row
			XSSFRow headerRow = sheet.createRow(0);
			headerRow.createCell(0).setCellValue("Invoice Id");
			headerRow.createCell(1).setCellValue("Customer Name");
			headerRow.createCell(2).setCellValue("Desciption");
			headerRow.createCell(3).setCellValue("Invoice Date");
			headerRow.createCell(4).setCellValue("Price");
			headerRow.createCell(5).setCellValue("Qunatity");
			headerRow.createCell(6).setCellValue("TotalAmount");

			int rowNum = 1;
			for (Invoice1 invoice : l1) {
				XSSFRow dataRow = sheet.createRow(rowNum++);
				dataRow.createCell(0).setCellValue(invoice.getInid());
				dataRow.createCell(1).setCellValue(invoice.getName1());
				dataRow.createCell(2).setCellValue(invoice.getDesc1());
				dataRow.createCell(3).setCellValue(invoice.getDate());
				dataRow.createCell(4).setCellValue(invoice.getPrice());
				dataRow.createCell(5).setCellValue(invoice.getQunatity());
				dataRow.createCell(6).setCellValue(invoice.getTotalamount());
				// Populate other cells...
			}

			// Write the Excel data to the response stream
			workbook.write(response.getOutputStream());
		}
	}

	/*
	 * m.addAttribute("error", "Session out Please Login"); return "login"; }
	 * 
	 */
	@PostMapping("/export-expensess")
	public void exportExpensessToExcel(@RequestParam String start, @RequestParam String end,
			HttpServletResponse response, HttpServletRequest request, Model m, RedirectAttributes redirectAttributes)
			throws IOException {
		/*
		 * HttpSession session = request.getSession(); String username = (String)
		 * session.getAttribute("username"); if (username == null) {
		 * //m.addAttribute("error", "Session out Please Login");
		 * redirectAttributes.addFlashAttribute("error", "Session out Please Login");
		 * response.sendRedirect("login");
		 * 
		 * }
		 */
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=\"Expensess.xlsx\"");
		System.out.println("export" + start + "    " + end);
		List<Product1> l1 = expenceservice.exportExpencesByDateRange(start, end);

		try (XSSFWorkbook workbook = new XSSFWorkbook()) {
			XSSFSheet sheet = workbook.createSheet("Expencess");

			// Create header row
			XSSFRow headerRow = sheet.createRow(0);
			headerRow.createCell(0).setCellValue("Expenses Id");
			headerRow.createCell(1).setCellValue("Expenses Name");
			headerRow.createCell(2).setCellValue("Desciption");
			headerRow.createCell(3).setCellValue("Expenses Date");
			headerRow.createCell(4).setCellValue("Price");
			headerRow.createCell(5).setCellValue("Qunatity");
			headerRow.createCell(6).setCellValue("TotalAmount");

			int rowNum = 1;
			for (Product1 invoice : l1) {
				XSSFRow dataRow = sheet.createRow(rowNum++);
				dataRow.createCell(0).setCellValue(invoice.getEid());
				dataRow.createCell(1).setCellValue(invoice.getName1());
				dataRow.createCell(2).setCellValue(invoice.getDesc1());
				dataRow.createCell(3).setCellValue(invoice.getDate());
				dataRow.createCell(4).setCellValue(invoice.getPrice());
				dataRow.createCell(5).setCellValue(invoice.getQunatity());
				dataRow.createCell(6).setCellValue(invoice.getTotalamount());
				// Populate other cells...
			}

			// Write the Excel data to the response stream
			workbook.write(response.getOutputStream());
		}
	}

	/*
	 * m.addAttribute("error", "Session out Please Login"); return "login";
	 * 
	 * }
	 */


	@PostMapping("/import-invoices")
	public ModelAndView importInvoicesToExcel(@RequestParam("excelfile") MultipartFile excelfile, Model m,
			RedirectAttributes ra) throws IOException {
		
		String pattern = "yyyy-MM-dd"; // Define your date format pattern
		SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);

		double price = 0, qunati = 0;
		boolean flag = false;
		try (XSSFWorkbook workbook = new XSSFWorkbook(excelfile.getInputStream())) {
			XSSFSheet sheet = workbook.getSheetAt(0);

			int numberOfSheets = workbook.getNumberOfSheets();
			System.out.println("Number of sheets in the workbook: " + numberOfSheets);

			for (Row row : sheet) {
				Invoice1 in = new Invoice1();
				int currentRowIndex = row.getRowNum(); // Get the row index for the current row

				if (currentRowIndex == 0) {
					// Skip the first row
					continue;
				}
				if (row.getCell(4).getCellType() == CellType.NUMERIC) {
					in.setPrice(row.getCell(4).getNumericCellValue());
					price = row.getCell(4).getNumericCellValue();
					// Process the numeric value
				} else if (row.getCell(4).getCellType() == CellType.STRING) {
					// String stringValue = cell.getStringCellValue();
					System.out.println("price " + row.getCell(4).getStringCellValue());
				}
				if (row.getCell(5).getCellType() == CellType.NUMERIC) {
					in.setQunatity(row.getCell(5).getNumericCellValue());
					qunati = row.getCell(5).getNumericCellValue();
					// Process the numeric value
				} else if (row.getCell(5).getCellType() == CellType.STRING) {
					// String stringValue = cell.getStringCellValue();
					System.out.println("price " + row.getCell(5).getStringCellValue());
				}
				if (price != 0.0 && qunati != 0.0) {
					in.setTotalamount(price * qunati);
				}
				// System.out.println("qunatity "+row.getCell(5).getNumericCellValue());
				in.setName1(row.getCell(1).getStringCellValue());
				in.setDesc1(row.getCell(2).getStringCellValue());
				String dates = dateFormat.format(row.getCell(3).getDateCellValue());
				in.setDate(dates);
				flag=invoiceservice.insertInvoice(in);
				// in.setDate((row.getCell(3).getDateCellValue()).toString());
			
				System.out.println("invoice import data"+(row.getCell(2).getStringCellValue()));
			
				
			}

			// Write the Excel data to the response stream
		}
		if (flag) {

			ra.addFlashAttribute("msg1", "<div>Upload Invoice Data Successfully</div>");
			return new ModelAndView(new RedirectView("FinencialReport"));
		} else {
			ra.addFlashAttribute("msg", "<div>Upload Invoice Not  Data Successfully</div>");
			return new ModelAndView(new RedirectView("FinencialReport"));
		}
	}

	
	@PostMapping("/import-expenses")
	public ModelAndView importExpencessToExcel(@RequestParam("excelfile") MultipartFile excelfile, Model m,
			RedirectAttributes ra) throws IOException {
		
		String pattern = "yyyy-MM-dd"; // Define your date format pattern
		SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);

		double price = 0, qunati = 0;
		boolean flag = false;
		try (XSSFWorkbook workbook = new XSSFWorkbook(excelfile.getInputStream())) {
			XSSFSheet sheet = workbook.getSheetAt(0);

			int numberOfSheets = workbook.getNumberOfSheets();
			for (Row row : sheet) {
				Product1 in = new Product1();
				int currentRowIndex = row.getRowNum(); // Get the row index for the current row

				if (currentRowIndex == 0) {
					// Skip the first row
					continue;
				}
				if (row.getCell(5).getCellType() == CellType.NUMERIC) {
					in.setPrice(row.getCell(5).getNumericCellValue());
					price = row.getCell(5).getNumericCellValue();
					// Process the numeric value
				} else if (row.getCell(5).getCellType() == CellType.STRING) {
					// String stringValue = cell.getStringCellValue();
					System.out.println("price " + row.getCell(5).getStringCellValue());
				}
				if (row.getCell(4).getCellType() == CellType.NUMERIC) {
					in.setQunatity(row.getCell(4).getNumericCellValue());
					qunati = row.getCell(4).getNumericCellValue();
					// Process the numeric value
				} else if (row.getCell(4).getCellType() == CellType.STRING) {
					// String stringValue = cell.getStringCellValue();
					System.out.println("price " + row.getCell(4).getStringCellValue());
				}
				if (price != 0.0 && qunati != 0.0) {
					in.setTotalamount(price * qunati);
				}

				// System.out.println("qunatity "+row.getCell(5).getNumericCellValue());
				in.setName1(row.getCell(1).getStringCellValue());
				in.setDesc1(row.getCell(2).getStringCellValue());
				String dates = dateFormat.format(row.getCell(3).getDateCellValue());
				in.setDate(dates);
				System.out.println((row.getCell(1).getStringCellValue()));
				System.out.println((row.getCell(2).getStringCellValue()));
				System.out.println(dates);
				flag = expenceservice.insertExpences(in);
			}

			// Write the Excel data to the response stream
		}
		if (flag) {

			ra.addFlashAttribute("msg1", "<div>Upload Expencess Data Successfully</div>");
			return new ModelAndView(new RedirectView("FinencialReport"));
		} else {
			ra.addFlashAttribute("msg", "Upload Expencess Not  Data Successfully");
			return new ModelAndView(new RedirectView("FinencialReport"));
		}
	}
}