<%
/**
 * OpenCPS is the open source Core Public Services software
 * Copyright (C) 2016-present OpenCPS community
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Affero General Public License for more details.
 * You should have received a copy of the GNU Affero General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>
 */
%>
<%@page import="org.opencps.datamgt.model.DictCollection"%>
<%@page import="org.opencps.util.PortletPropsValues"%>
<%@page import="org.opencps.datamgt.service.DictItemLocalServiceUtil"%>
<%@page import="org.opencps.datamgt.service.DictCollectionLocalServiceUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.opencps.datamgt.model.DictItem"%>
<%@page import="org.opencps.accountmgt.OutOfLengthBusinessRepresentativeRoleException"%>
<%@page import="org.opencps.accountmgt.OutOfLengthBusinessRepresentativeNameException"%>
<%@page import="org.opencps.accountmgt.OutOfLengthBusinessShortNameException"%>
<%@page import="org.opencps.accountmgt.OutOfLengthBusinessEnNameException"%>
<%@page import="org.opencps.accountmgt.OutOfLengthBusinessEmailException"%>
<%@page import="org.opencps.accountmgt.DuplicateBusinessEmailException"%>
<%@page import="org.opencps.accountmgt.OutOfLengthBusinessNameException"%>
<%@page import="org.opencps.util.WebKeys"%>
<%@page import="org.opencps.util.MessageKeys"%>
<%@page import="com.liferay.portal.kernel.language.LanguageUtil"%>
<%@page import="org.opencps.accountmgt.search.BusinessDisplayTerms"%>
<%@page import="org.opencps.accountmgt.model.Business"%>
<%@page import="org.opencps.accountmgt.FileTypeFailException"%>
<%@page import="org.opencps.accountmgt.OutOfSizeFileUploadException"%>
<%@page import="org.opencps.accountmgt.InvalidFileUploadException"%>
<%@page import="org.opencps.accountmgt.InvalidWardCodeException"%>
<%@page import="org.opencps.accountmgt.InvalidDistricCodeException"%>
<%@page import="org.opencps.accountmgt.InvalidCityCodeException"%>
<%@ include file="../init.jsp" %>

<%

	if(request.getAttribute(WebKeys.BUSINESS_ENTRY) != null){
		business = (Business) request.getAttribute(WebKeys.BUSINESS_ENTRY);
	}

	long businessId = business!=null ? business.getBusinessId() : 0L;
	
	DictCollection dictCollectionDomain = null;
	
	List<DictItem> dictItemDomains = new ArrayList<DictItem>();
	
	try {
		dictCollectionDomain = DictCollectionLocalServiceUtil
						.getDictCollection(scopeGroupId, 
							PortletPropsValues.DATAMGT_MASTERDATA_BUSINESS_DOMAIN);
		if(dictCollectionDomain!=null) {
			dictItemDomains = DictItemLocalServiceUtil
							.getDictItemsByDictCollectionId(dictCollectionDomain.getDictCollectionId());	
			}
	} catch (Exception e) {
		
	}
%>

<liferay-ui:error 
	exception="<%= OutOfLengthBusinessNameException.class %>" 
	message="<%= OutOfLengthBusinessNameException.class.getName() %>" 
/>

<liferay-ui:error 
	exception="<%= DuplicateBusinessEmailException.class %>" 
	message="<%= DuplicateBusinessEmailException.class.getName() %>" 
/>

<liferay-ui:error 
	exception="<%= OutOfLengthBusinessEmailException.class %>" 
	message="<%= OutOfLengthBusinessEmailException.class.getName() %>" 
/>

<liferay-ui:error 
	exception="<%= DuplicateBusinessEmailException.class %>" 
	message="<%= DuplicateBusinessEmailException.class.getName() %>" 
/>

<liferay-ui:error 
	exception="<%= OutOfLengthBusinessShortNameException.class %>" 
	message="<%= OutOfLengthBusinessShortNameException.class.getName() %>" 
/>

<liferay-ui:error 
	exception="<%= OutOfLengthBusinessRepresentativeNameException.class %>" 
	message="<%= OutOfLengthBusinessRepresentativeNameException.class.getName() %>" 
/>

<liferay-ui:error 
	exception="<%= OutOfLengthBusinessRepresentativeRoleException.class %>" 
	message="<%= OutOfLengthBusinessRepresentativeRoleException.class.getName() %>" 
/>

<liferay-ui:error 
	key="<%=MessageKeys.ACCOUNT_SYSTEM_EXCEPTION_OCCURRED %>" 
	message="system.exception.occured" 
/>

<liferay-ui:error 
	exception="<%= InvalidCityCodeException.class %>" 
	message="<%= InvalidCityCodeException.class.getName() %>" 
/>
<liferay-ui:error 
	exception="<%= InvalidDistricCodeException.class %>" 
	message="<%= InvalidDistricCodeException.class.getName() %>" 
/>
<liferay-ui:error 
	exception="<%= InvalidWardCodeException.class %>" 
	message="<%= InvalidWardCodeException.class.getName() %>" 
/>
<liferay-ui:error 
	exception="<%= InvalidFileUploadException.class %>" 
	message="<%= InvalidFileUploadException.class.getName() %>" 
/>
<liferay-ui:error 
	exception="<%= FileTypeFailException.class %>" 
	message="<%= FileTypeFailException.class.getName() %>" 
/>
<liferay-ui:error 
	exception="<%= OutOfSizeFileUploadException.class %>" 
	message="<%= OutOfSizeFileUploadException.class.getName() %>" 
/>

<portlet:renderURL var="switcherCitizenRegisterURL">
	<portlet:param name="mvcPath" value='<%= templatePath + "citizenregistration-ux.jsp" %>'/>
</portlet:renderURL>
<div class="ocps-register">
	<div class="opencps accountmgt fm-registration header">
		<%-- <div class="register-label">
			<liferay-ui:message key="register-business"/>
		</div> --%>
		<div>
			<%-- <aui:button name="citizen" value="citizen" type="button" href="<%=switcherCitizenRegisterURL.toString() %>"/> --%>
			<aui:row>
				<aui:col width="30" cssClass="opcs-register-label">
					<label ><liferay-ui:message key="register"></liferay-ui:message></label>
				</aui:col>
				<aui:col width="30">
					<aui:row>
						<aui:col width="50">
							<aui:input type="radio" name="typeOfRegister" value="citizen" inlineLabel="right" label="citizen"/>
						</aui:col>
						<aui:col width="50">
							<aui:input type="radio" name="typeOfRegister" value="business" inlineLabel="right" label="business" checked="true"/>
						</aui:col>
					</aui:row>
				</aui:col>
				<aui:col width="30" cssClass="opcs-register-login">
					<a href='<%=themeDisplay.getURLSignIn() %>'><liferay-ui:message key="login" /></a>
				</aui:col>
			</aui:row>
		</div>
	</div>
	
	<div class="bottom-horizontal-line"></div>
	
	<portlet:actionURL var="updateBusinessURL" name="updateBusiness">
		<portlet:param 
			name="<%=BusinessDisplayTerms.BUSINESS_BUSINESSID %>" 
			value="<%=String.valueOf(businessId) %>"
		/>	
		<portlet:param name="currentURL" value="<%=currentURL %>"/>
	</portlet:actionURL>
	
	<aui:form 
		action="<%=updateBusinessURL.toString() %>"
		name="fm"	
		method="post"
		enctype="multipart/form-data"
		onSubmit='<%= "event.preventDefault(); " + renderResponse.getNamespace() + "registerAccount();" %>'
	>
		
		<aui:input name="businessRegStep_cfg" value="<%=businessRegStep_cfg %>" type="hidden"></aui:input>
		
		<%-- <liferay-util:include 
			page="/html/portlets/accountmgt/registration/business/contact-ux.jsp" 
			servletContext="<%=application %>" 
		/> 
		
		<liferay-util:include 
			page="/html/portlets/accountmgt/registration/business/general_info-ux.jsp" 
			servletContext="<%=application %>" 
		/>  --%>
		
		
		<div class = "ocps-bound-left-right">
			<div class = "ocps-res-left">
				<aui:row>
					<aui:input 
						name="<%=BusinessDisplayTerms.BUSINESS_NAME %>" 
						cssClass="input100" 
						placeholder="<%=BusinessDisplayTerms.BUSINESS_NAME %>"
						>
						<aui:validator name="required" />
						<aui:validator name="maxLength">255</aui:validator>
					</aui:input>
				</aui:row>
				
				<aui:row>
					<aui:input 
						name="<%=BusinessDisplayTerms.BUSINESS_IDNUMBER %>" 
						cssClass="input100"
						placeholder="<%=BusinessDisplayTerms.BUSINESS_IDNUMBER %>"	
						>
						<aui:validator name="required" />
						<aui:validator name="maxLength">100</aui:validator>
					</aui:input>
				</aui:row>
				
				<aui:row>
					<aui:input 
						name="<%= BusinessDisplayTerms.BUSINESS_ENNAME %>" 
						cssClass="input100"
						placeholder="<%=BusinessDisplayTerms.BUSINESS_ENNAME %>"
						>
						<aui:validator name="maxLength">255</aui:validator>
					</aui:input>
				</aui:row>
				
				<aui:row>
					<aui:input 
						name="<%=BusinessDisplayTerms.BUSINESS_SHORTNAME %>" 
						cssClass="input100"
						placeholder="<%=BusinessDisplayTerms.BUSINESS_SHORTNAME %>"
						>
						<aui:validator name="maxLength">100</aui:validator>
					</aui:input>
				</aui:row>
				
				<aui:row>
					<aui:input 
						name="<%=BusinessDisplayTerms.BUSINESS_ADDRESS %>" 
						cssClass="input100"
						placeholder="<%=BusinessDisplayTerms.BUSINESS_ADDRESS %>"
						>
						<aui:validator name="maxLength">500</aui:validator>
					</aui:input>
				</aui:row>
				
				<aui:row>
					<aui:input 
						cssClass="input100"
						name="<%=BusinessDisplayTerms.BUSINESS_EMAIL %>"
						placeholder="<%=BusinessDisplayTerms.BUSINESS_EMAIL %>"
					>
						<aui:validator name="required" />
						<aui:validator name="email" />
						<aui:validator name="maxLength">255</aui:validator>
					</aui:input>
				</aui:row>
				
				<aui:row>
					<aui:input 
						name="<%=BusinessDisplayTerms.BUSINESS_TELNO %>" 
						cssClass="input100"
						placeholder="<%=BusinessDisplayTerms.BUSINESS_TELNO %>"
						>
						<aui:validator name="maxLength">20</aui:validator>
					</aui:input>
				</aui:row>
				
				<aui:row cssClass="ocps-fake_textarea-bound">
					<label><liferay-ui:message key ="businessDomain" /></label>
					<div class="fake_textarea">
					<%
						for(DictItem dictItemDomain : dictItemDomains) {
							%>
								<aui:input
									name="businessDomain"
									id='<%= "businessDomain" + dictItemDomain.getDictItemId()%>'
									value="<%=dictItemDomain.getItemCode() %>"
									type="checkbox" 
								    label="<%=dictItemDomain.getItemName(locale, true)%>"
								/>
							<%
						}
					%>
					</div>
				</aui:row>
			</div>
		
		<div class = "ocps-res-right">
			<aui:row>
				<datamgt:ddr 
					cssClass="input100"
					depthLevel="3" 
					dictCollectionCode="ADMINISTRATIVE_REGION"
					itemNames="cityId,districtId,wardId"
					itemsEmptyOption="true,true,true"	
					displayStyle="vertical"
				/>	
			</aui:row>
			
			<aui:row>
				<datamgt:ddr
					cssClass="input100"
					depthLevel="1" 
					dictCollectionCode="<%=PortletPropsValues.DATAMGT_MASTERDATA_BUSINESS_TYPE %>"
					itemNames="businessType"
					itemsEmptyOption="true"	
				/>
			</aui:row>
			
			<aui:row>
				<aui:input 
					name="<%=BusinessDisplayTerms.BUSINESS_REPRESENTATIVENAME %>" 
					cssClass="input100"
					placeholder="<%=BusinessDisplayTerms.BUSINESS_REPRESENTATIVENAME %>"
					>
					<aui:validator name="maxLength">255</aui:validator>
				</aui:input>
			</aui:row>
			
			<aui:row>
				<aui:input 
					name="<%=BusinessDisplayTerms.BUSINESS_REPRESENTATIVEROLE %>" 
					cssClass="input100"
					placeholder="<%=BusinessDisplayTerms.BUSINESS_REPRESENTATIVEROLE %>"
					>
					<aui:validator name="maxLength">100</aui:validator>
				</aui:input>
			</aui:row>
			
			<aui:row cssClass="ocps-file-attach" >
				<aui:input 
					type="file" 
					name="attachFile" 
					label="business-attach-file"
					>
					<aui:validator name="acceptFiles">
						'<%= StringUtil.merge(PortletPropsValues.ACCOUNTMGT_FILE_TYPE) %>'
					</aui:validator>
				</aui:input>
			</aui:row>
			
			<aui:row>
				<aui:input 
					name="termsOfUse"
					type="checkbox" 
					label="terms-of-use"
				/>
			</aui:row>
		</div>
		</div>
		<div class = ""></div>
		<aui:row cssClass="ocps-register-button">
			<aui:button name="register" type="submit" value="register" disabled="true"/>
<%-- 			<aui:button name="back" type="button" value="back" onClick="window.history.back();"/>
 --%>	</aui:row>
	</aui:form>
</div>


<aui:script>
	AUI().ready(function(A) {
		var termsOfUseCheckbox = A.one('#<portlet:namespace />termsOfUseCheckbox');
		
		var allRadios = A.all( "input[type='radio']" );
		
		var typeValue =  A.one("input[name=<portlet:namespace/>typeOfRegister]:checked").get("value");
				
		allRadios.on('change', function(e) {
			var selectedRadioButtonValue = e.currentTarget.get('value');
			var url = Liferay.PortletURL.createRenderURL(); 
			url.setPortletId("<%= themeDisplay.getPortletDisplay().getId() %>");
			url.setWindowState('normal');
			url.setParameter("mvcPath", "/html/portlets/accountmgt/registration/registration.jsp");
			url.setParameter("type", selectedRadioButtonValue);
			
			window.location.href = url.toString();
		}); 
		
		
		if(termsOfUseCheckbox) {
			termsOfUseCheckbox.on('click',function() {
				
				var termsOfUse = A.one('#<portlet:namespace />termsOfUse');
				
				var register = A.one('#<portlet:namespace />register');
				
				if(termsOfUse.val() == 'true'){
					register.removeClass('disabled');
					register.removeAttribute('disabled');
				}else{
					register.addClass('disabled');
					register.setAttribute('disabled' , 'true');
				}
			});
		}
	});

	Liferay.provide(window, '<portlet:namespace />registerAccount', function() {
		A = AUI();
		var register = A.one('#<portlet:namespace />register');
		var termsOfUse = A.one('#<portlet:namespace />termsOfUse');
		if(termsOfUse.val() == 'true'){
			submitForm(document.<portlet:namespace />fm);
		}else{
			return;
		}
	});
	
</aui:script>
