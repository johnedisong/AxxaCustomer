
<portlet:resourceURL id="baseResourceUrl" var="baseResourceUrl" />

<script type="text/javascript">
	
	let listCustomer = JSON.parse('<%=listCustomer%>');
	

	var templateRow = '';
	templateRow = 	'<tr>';
	templateRow +=     '<td>{1}</td>';
	templateRow +=     '<td>{2}</td>';
	templateRow +=     '<td>{3}</td>';
	templateRow +=     '<td>{4}</td>';
	templateRow +=  '</tr>';

	var JQAxxa = {
		    onReady: function() {
		    

		    	JQAxxa.inicializar();
		        	    	
		    },
	
			inicializar: function(e) {
		    	$('#tablas_axxa thead tr:eq(1) th').each(function () {
		            var title = $(this).text();
		            if(($(this).text()) != "Ver m&aacute; s"){
			            $(this).html('<input type="text" placeholder="Buscar" class="column_search" />');
		            } else {
		            	$(this).html('<label></label>');
		            }
		        });
		     
		        table = $('#tablas_axxa').DataTable({
		        	order: [[3, 'desc']],
		          orderCellsTop: true,
		          iDisplayLength: 12,
		          bLengthChange: false
		        });
		     
		        $( '#tablas_axxa thead').on('keyup', ".column_search",function () {
		            table.column($(this).parent().index() ).search( this.value ).draw();
		        } );
		        $('.dataTables_empty').text("Sin datos");
		        
				
		    },
		    
		    

	}
	

	$.validator.addMethod('onlyAddress', function (value, element) {
	    return this.optional(element) || /^[a-zA-ZÀ-ÿ]{4}\s[0-9]{2}\s[#]{1}\s[0-9]{2}[a-zA-ZÀ-ÿ]{3}\s[-]\s[0-9]{2}[a-zA-ZÀ-ÿ]{3}/.test(value);
	}, '<liferay-ui:message key="texto.error.validation.address"/>');


    $("#<portlet:namespace/>axxaCustomerForm").validate({
	ignore: ".ignore",
	rules: {
        "<portlet:namespace/>name": {
            required: true,
            maxlength: 50
        },
        '<portlet:namespace/>age': {
            required: true, 
            number: true,
            maxlength: 2,
        },
        "<portlet:namespace/>phoneNumber": {
            required: true, 
            number: true,
            maxlength: 10,
        },
        "<portlet:namespace/>address": {
            required: true,
            maxlength: 50,
            onlyAddress: true,
        }
    },
    messages: {
        "<portlet:namespace/>name": {
            required: "<liferay-ui:message key='texto.error.validacion.requerido' />",
            maxlength: "<liferay-ui:message key='texto.error.validacion.numero.maximo.50' />",
        },
        '<portlet:namespace/>age': {
            required: "<liferay-ui:message key='texto.error.validacion.requerido' />",
            email: "<liferay-ui:message key='texto.error.validacion.email' />",
            maxlength: "<liferay-ui:message key='texto.error.validacion.numero.maximo.2' />",
        },
        "<portlet:namespace/>phoneNumber": {
            required: "<liferay-ui:message key='texto.error.validacion.requerido' />",
            maxlength: "<liferay-ui:message key='texto.error.validacion.numero.maximo.10' />",
        },
        "<portlet:namespace/>address": {
            required: "<liferay-ui:message key='texto.error.validacion.requerido' />",
            maxlength: "<liferay-ui:message key='texto.error.validacion.numero.maximo.50' />",
        },
    },
		submitHandler: function(){
        $('#btnEnviarCustomer').attr('disabled', true);
			form = new FormData($('#<portlet:namespace/>axxaCustomerForm')[0]);
        form.append("<portlet:namespace/>cmd", "saveData");
        $.ajax({
            url: ''+CreateUrlContactForm()+'',
            type: "POST",
            data: form,
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                var jsonResponseSend = data;
                alert("Codigo : " + jsonResponseSend.codigo + "\n" + "Estado : " + jsonResponseSend.estado);
                location.reload();
            	
            },
            error: function(data, status, e) {	

                console.log("error:::: " + data);

            }
        });
			  				
	}
});
	
	
	function CreateUrlContactForm(){	
		var urla = window.location.pathname;
		var s1 = "<portlet:namespace/>";
		var resource_id = "baseResourceUrl";
		var s2 = s1.substring(1);
		s2 = s2.substring(0,s2.length-1);
		return ''+urla+'?p_p_id='+s2+'&p_p_lifecycle=2&p_p_state=normal&p_p_mode=view&p_p_resource_id='+resource_id+'&p_p_cacheability=cacheLevelPage'	
	}
	
	var temp2 = "";
    for(x=0; x<listCustomer.length; x++){
	    var temp = "";
	    temp = templateRow
	    .replace("{1}",listCustomer[x].name)
	    .replace("{2}",listCustomer[x].age)
	    .replace("{3}",listCustomer[x].phoneNumber)
	    .replace("{4}",listCustomer[x].address);
	    temp2 += temp;
		$('#tbodyCustomerId').html("").append(temp2);
    }
    
    
    
    
    
    
    
    
	$(document).ready(JQAxxa.onReady);
</script>