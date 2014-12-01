package com.forgetpwd.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.model.CompanyVO;
import com.forgetpwd.model.ForgetPwdService;
import com.member.model.MemService;
import com.member.model.MemVO;

public class LinkServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
	              throws ServletException,IOException{
		doGet(req, res);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	              throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		
		Map<String, String> errMsgs = new HashMap<String, String>();
		req.setAttribute("errMsgs", errMsgs);
		MemVO memVO=null;
		CompanyVO comVO = null;
		boolean error = false;
		HttpSession session = req.getSession();
		
			/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
/*			String userAccount = req.getParameter("user_account");
			if(userAccount == null || userAccount.trim().length() == 0){
				errMsgs.put("errorAccount", "帳號欄請勿空白");
			}
			String accountReg = "^\\S+@\\S+\\.\\S{2,3}$";
			if(!userAccount.trim().matches(accountReg)){
				errMsgs.put("errorAccount", "帳號格式有誤，請輸入Email");
			}
*/			
		    try{
		    	String mem_qq = req.getParameter("qq");
		    	String com_hash = req.getParameter("hash");
		    	if(com_hash == null){
		    		    if (mem_qq == null || mem_qq.trim().length() == 0) {
			    		errMsgs.put("errorQQ","無此帳號");
					    }
		    		    
				        ForgetPwdService fgtService = new ForgetPwdService();
				        memVO = fgtService.findMemByQQ(mem_qq);
				        req.setAttribute("memVO", memVO);
		    	}else if(mem_qq == null){
		    		if (com_hash == null || com_hash.trim().length() == 0) {
			    		errMsgs.put("errorHash","無此帳號");
					}
		    	}
		    	
		    	if (!errMsgs.isEmpty()) {
		        	RequestDispatcher failureView = req.getRequestDispatcher("/_01_login/resetPwd.jsp");
					failureView.forward(req, res);
					return;	
				}
		    	
		    	if(com_hash == null){
		    		 ForgetPwdService fgtService = new ForgetPwdService();
				     memVO = fgtService.findMemByQQ(mem_qq);
				     req.setAttribute("memVO", memVO);
		    	}else if(mem_qq == null){
		    		 ForgetPwdService fgtService = new ForgetPwdService();
		    		 comVO = fgtService.findComByHash(com_hash);
		    		 req.setAttribute("comVO", comVO);
		    	}
		        
		       
		       
				String url = "/_01_login/reset.jsp"; 
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);
		        
		        
		        }catch (Exception e) {
					System.out.println("出現Exception");
					errMsgs.put("errorException",e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/index.jsp");
					failureView.forward(req, res);
				}//end of catch
			// Send the use back to the form, if there were errors
/*			if(!errMsgs.isEmpty()){
				RequestDispatcher failureView = req.getRequestDispatcher("/_01_login/resetPwd.jsp");
				failureView.forward(req, res);
			}
*/
			/***************************2.開始查詢資料*****************************************/
/*				
		    try{
		    Integer userId = null;
			MemVO memVO = null;
			CompanyVO comVO = null;
			
		    ForgetPwdService forgetPwdSvc = new ForgetPwdService();
			userId = forgetPwdSvc.findId(userAccount, userIdentity);
			System.out.println("userId: " + userId);
			if("Mem".equals(userIdentity)){
				MemService memSvc = new MemService();
				memVO = memSvc.getOneMem(userId);
				session.setAttribute("checkMemOK", memVO);
				System.out.println("session內的mem_account: "+memVO.getMem_account());
				forgetPwdSvc.updateUser(userIdentity,userAccount,newPwd);
				System.out.println("修改mem_pwd完成!");
				}else if("Com".equals(userIdentity)){
					CompanyService comSvc = new CompanyService();
					comVO = comSvc.getOneCom(userId);
					session.setAttribute("checkComOK", comVO);
					System.out.println("session內的com_account: "+comVO.getComAccount());
					forgetPwdSvc.updateUser(userIdentity,userAccount,newPwd);
					System.out.println("修改com_pwd完成!");
				}
			
		}catch(Exception e){
			System.out.println("出現exception!");
			errMsgs.put("errorException", e.getMessage());
			session.setAttribute("checkAccountError", "該帳號不存在");
			session.setAttribute("noExistAccount", userAccount);
			error = true;
			RequestDispatcher failureView = req.getRequestDispatcher("/_01_login/resetPwd.jsp");
			failureView.forward(req, res);
			
		}//end of catch
*/			
			/***************************3.修改完成,準備轉交(Send the Success view)*************/
/*			if(!error){
				session.removeAttribute("checkAccountError");
				session.removeAttribute("noExistAccount");
				String url = "/_01_login/resetPwdSuccess.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				}//end of if(!error)
			
*/			
		}//end of doPost

}//end of class{


