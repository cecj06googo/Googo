<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <div class="row">
        <div class="col-md-8">
            <form name="sentMessage" id="contactForm" novalidate action="<%=request.getContextPath()%>/ContactUs.do" method="post">
                <div class="control-group form-group">
                    <div class="controls">
                        <label>貴姓大名:</label>
                        <input type="text" class="form-control" name="ContactName" id="name" required data-validation-required-message="Please enter your name.">
                        <p class="help-block"></p>
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>手機號碼:</label>
                        <input type="tel" class="form-control" name="ContactPhone" id="phone" required data-validation-required-message="Please enter your phone number.">
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Email:</label>
                        <input type="email" class="form-control" name="ContactEmail" id="email" required data-validation-required-message="Please enter your email address.">
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>信息:</label>
                        <textarea rows="10" cols="100" class="form-control" name="ContactMessage" id="message" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
                    </div>
                </div>
                <div id="success"></div>
                <!-- For success/fail messages -->
                <button type="submit" class="btn btn-primary">寄出</button>
                <Font color="red">${Msg}</Font>
            </form>
        </div>

    </div>
    <!-- /.row -->