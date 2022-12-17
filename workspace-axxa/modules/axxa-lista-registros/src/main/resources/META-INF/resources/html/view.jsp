<%@ include file="../init.jsp" %>

<% String listCustomer = (String) request.getAttribute("listCustomer"); %>

<section id="usuarios_consulta">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="grilla grilla-full">
						<div class="table-responsive">
							<table class="table table-striped" id="tablas_axxa">
								<thead>
		                           <tr>
		                              <th scope="col"><button type="button" class="ordenar"><liferay-ui:message key="text.axxa.name"/><i class="fas fa-sort"></i></button></th>
		                              <th scope="col"><button type="button" class="ordenar"><liferay-ui:message key="text.axxa.age"/><i class="fas fa-sort"></i></button></th>
		                              <th scope="col"><button type="button" class="ordenar"><liferay-ui:message key="text.axxa.phonenumber"/><i class="fas fa-sort"></i></button></th>
		                              <th scope="col"><button type="button" class="ordenar"><liferay-ui:message key="text.axxa.address"/><i class="fas fa-sort"></i></button></th>
		                           </tr>
		                        </thead>
								<tbody id="tbodyCustomerId">
								</tbody>
							</table>
							
						</div>
				</div>
			</div>
		</div>
	</div>
</section>



<p>
  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
    <liferay-ui:message key="text.axxa.new.customer"/>
  </button>
</p>
<div class="collapse" id="collapseExample">
 


<div class="container bg-white pd-t-20 pd-b-20 mg-t-50 mg-b-50">
    <div class="container-contact-transv">
        <div class="container-fluid">
            <div class="row no-gutters margin-b-40 margin-t-40 justify-content-center">
                <div class="col-md-5 col-12">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 ">
                            <div class="title-content_fp"></div>
                            <form class="row form_fp" action="#" 
                                name="<portlet:namespace/>axxaCustomerForm" id="<portlet:namespace/>axxaCustomerForm">
                                <div class="col-12">
                                    <div class="form-group ">
                                        <input type="text" value="" class="form-control" id="<portlet:namespace/>name"
                                            name="<portlet:namespace/>name" placeholder='<liferay-ui:message key="text.axxa.name"/>'>
                                        <small></small>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group ">
                                        <input type="text" value="" class="form-control" id="<portlet:namespace/>age"
                                            name="<portlet:namespace/>age" placeholder='<liferay-ui:message key="text.axxa.age"/>'>
                                        <small></small>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group ">
                                        <input type="text" value="" class="form-control" id="<portlet:namespace/>phoneNumber"
                                            name="<portlet:namespace/>phoneNumber" placeholder='<liferay-ui:message key="text.axxa.phonenumber"/>'>
                                        <small></small>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group ">
                                        <input type="text" value="" class="form-control" id="<portlet:namespace/>address"
                                            name="<portlet:namespace/>address" placeholder='<liferay-ui:message key="text.axxa.address"/>'>
                                        <small></small>
                                    </div>
                                </div>
                                <div class="col-12 text-center margin-t-20">
                                    <button type="submit" id="btnEnviarCustomer" class="btn btn-primary">
                                        <span><liferay-ui:message key="text.axxa.send"/></span>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
	

</div>





<%@ include file="../include/functionJS.jsp" %>


